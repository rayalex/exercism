defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    matches = Regex.scan(~r/(*UTF)[\p{L}0-9\-]+/, sentence)
    |> List.flatten
    |> Enum.map(&(String.downcase(&1)))

    matches
    |> Enum.dedup()
    |> Enum.into(%{}, &({&1, Enum.count(matches, fn w -> w == &1 end)}))
  end
end
