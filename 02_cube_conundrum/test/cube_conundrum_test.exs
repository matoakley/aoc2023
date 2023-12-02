defmodule CubeConundrumTest do
  use ExUnit.Case

  describe "CubeConundrum.sum_of_possible_games/1" do
    test "returns the sum of game ids where game is possible" do
      input = """
      Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
      Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
      Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
      Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
      Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
      """

      assert CubeConundrum.sum_of_possible_games(input) == 8
    end
  end

  describe "CubeConundrum.sum_of_power_of_minimum_set/1" do
    test "returns the sum of the power of the minimum set of cubes for each game" do
      input = """
      Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
      Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
      Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
      Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
      Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
      """

      assert CubeConundrum.sum_of_power_of_minimum_set(input) == 2286
    end
  end
end
