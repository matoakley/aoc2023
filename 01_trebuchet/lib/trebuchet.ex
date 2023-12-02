defmodule Trebuchet do
  def calibration_value(input) do
    input
    |> String.split()
    |> Enum.map(&reduce_words_to_numbers/1)
    |> Enum.map(&parse_line/1)
    |> Enum.map(& List.first(&1) <> List.last(&1))
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum()
  end

  defp parse_line(line) do
    line |> String.graphemes() |> Enum.filter(&filter_integers/1)
  end

  defp reduce_words_to_numbers(line) do
    Enum.reduce(0..String.length(line), "", fn i, acc ->
      acc <> String.slice(line, i, 5) |> string_to_number()
    end)
  end

  defp string_to_number("one"), do: "1"
  defp string_to_number("two"), do: "2"
  defp string_to_number("three"), do: "3"
  defp string_to_number("four"), do: "4"
  defp string_to_number("five"), do: "5"
  defp string_to_number("six"), do: "6"
  defp string_to_number("seven"), do: "7"
  defp string_to_number("eight"), do: "8"
  defp string_to_number("nine"), do: "9"
  defp string_to_number(string) do
    String.replace(
      string,
      ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"],
      &string_to_number/1)
  end

  defp filter_integers("1"), do: 1
  defp filter_integers("2"), do: 2
  defp filter_integers("3"), do: 3
  defp filter_integers("4"), do: 4
  defp filter_integers("5"), do: 5
  defp filter_integers("6"), do: 6
  defp filter_integers("7"), do: 7
  defp filter_integers("8"), do: 8
  defp filter_integers("9"), do: 9
  defp filter_integers(_), do: nil
end
