defmodule CubeConundrum do
  @cubes_in_bag %{red: 12, green: 13, blue: 14}

  def sum_of_possible_games(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.reduce([], &parse_game/2)
    |> Enum.filter(&filter_possible_games/1)
    |> Enum.reduce(0, fn {id, _sets}, acc -> acc + id end)
  end

  def sum_of_power_of_minimum_set(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.reduce([], &parse_game/2)
    |> Enum.map(&minimum_set_needed_for_game/1)
    |> Enum.map(&Map.values/1)
    |> Enum.map(&Enum.product/1)
    |> Enum.sum()
  end

  defp minimum_set_needed_for_game(game) do
    %{
      blue: minimum_colour_needed_for_game(game, :blue),
      green: minimum_colour_needed_for_game(game, :green),
      red: minimum_colour_needed_for_game(game, :red),
    }
  end

  defp minimum_colour_needed_for_game({_id, sets}, colour) do
    Enum.map(sets, & Map.get(&1, colour, 0)) |> Enum.max()
  end

  defp filter_possible_games({_id, sets}) do
    Enum.all?(sets, &set_is_possible?/1)
  end

  defp parse_game(string, acc) do
    ["Game " <> id, sets] = String.split(string, ":")

    sets_list =
      sets
      |> String.split(";")
      |> Enum.map(&parse_set/1)

    [{String.to_integer(id), sets_list} | acc]
  end

  defp parse_set(string) do
    string
    |> String.split(",")
    |> Enum.map(&String.trim/1)
    |> Enum.reduce(%{}, fn set, acc ->
      [number_of_blocks, colour] = String.split(set)

      Map.put(
        acc,
        String.to_existing_atom(colour),
        String.to_integer(number_of_blocks)
      )
    end)
  end

  defp set_is_possible?(set) do
    Map.get(set, :blue, 0) <= @cubes_in_bag.blue &&
    Map.get(set, :green, 0) <= @cubes_in_bag.green &&
    Map.get(set, :red, 0) <= @cubes_in_bag.red
  end
end
