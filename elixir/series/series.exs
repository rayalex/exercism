defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) do
    len = String.length(s)
    cond do
      len < 1 -> []
      size > len and <= 0 -> []
      true -> do_slice(s, size)
    end
  end

  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  defp do_slice(s, size) do
    range = 0..(String.length(s) - size)
    Enum.reduce(range, [], fn(x, acc) -> acc ++ [String.slice(s, x, size)] end)
  end
end
