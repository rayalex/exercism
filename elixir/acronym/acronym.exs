defmodule Acronym do

  @acronym_regex ~r/(?:\p{Lu}|(?<=\s)\w)/

  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    Regex.scan(@acronym_regex, string)
    |> List.flatten
    |> to_string
    |> String.upcase
  end
end
