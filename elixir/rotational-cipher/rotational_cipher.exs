defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: pos_integer) :: String.t()
  def rotate(text, shift) do
    String.to_charlist(text)
    |> Enum.map(&transform(&1, shift))
    |> List.to_string
  end

  @spec transform(char :: Char.t(), shift :: pos_integer) :: Char.t()
  defp transform(char, 0), do: char
  defp transform(char, shift) when char in ?a..?z, do: rotate_char(?a, char, shift)
  defp transform(char, shift) when char in ?A..?Z, do: rotate_char(?A, char, shift)
  defp transform(char, _), do: char

  @spec rotate_char(base :: Char.t(), char :: Char.t(), shift :: pos_integer) :: Char.t()
  defp rotate_char(base, char, shift) do
    rem(char - base + shift, 26) + base
  end
end

