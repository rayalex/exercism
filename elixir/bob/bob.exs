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
    String.upcase(phrase) == phrase and Regex.match?(~r/\p{L}+/, phrase)
  end

  defp is_empty(phrase) do
    String.length(String.trim(phrase)) == 0
  end

  defp is_question(phrase) do
    String.ends_with?(phrase, "?")
  end
end
