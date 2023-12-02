defmodule CubeConundrum do
  @cubes_in_bag %{red: 12, green: 13, blue: 14}

  def sum_of_possible_games(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.reduce(0, &filter_possible_games/2)
  end

  defp filter_possible_games(line, acc) do
    ["Game " <> id, sets] = String.split(line, ":")

    sets
    |> String.split(";")
    |> Enum.map(&parse_set/1)
    |> Enum.all?(&set_is_possible?/1)
    |> if(do: acc + String.to_integer(id), else: acc)
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
