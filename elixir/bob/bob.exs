defmodule Bob do
  def hey(input) do
    cond do
      is_question(input) -> "Sure."
      is_empty(input) -> "Fine. Be that way!"
      is_shouting(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp is_shouting(phrase) do
    # Can this be packed into a single RegEx?
    String.upcase(phrase) == phrase and Regex.match?(~r/\p{L}+/, phrase)
  end

  defp is_empty(phrase) do
    Regex.match?(~r/^\s*$/, phrase)
  end

  defp is_question(phrase) do
    Regex.match?(~r/\?$/, phrase)
  end
end
