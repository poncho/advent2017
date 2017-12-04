defmodule Day01 do
  def captcha(input) when is_integer(input) do
    input = Integer.digits(input)

    input
    |> Enum.map_reduce(0, fn n, index ->
      next = index + 1 >= length(input) && 0 || index + 1
      result = n == Enum.at(input, next) && n || 0
      {result, next}
    end)
    |> elem(0)
    |> Enum.sum
  end

  def captcha(input) when is_binary(input) do
    case Integer.parse(input) do
      {number, _} ->
        captcha(number)
      _ ->
        "#{input} is not a valid number"
    end
  end
end