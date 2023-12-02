defmodule TrebuchetTest do
  use ExUnit.Case

  describe "Trebuchet.calibration_value/1" do
    test "returns the sum of the values for given input" do
      input = """
      1abc2
      pqr3stu8vwx
      a1b2c3d4e5f
      treb7uchet
      """

      assert Trebuchet.calibration_value(input) == 142

      another_input = """
      two1nine
      eightwothree
      abcone2threexyz
      xtwone3four
      4nineeightseven2
      zoneight234
      7pqrstsixteen
      """

      assert Trebuchet.calibration_value(another_input) == 281
    end
  end
end
