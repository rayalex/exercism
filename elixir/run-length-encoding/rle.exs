defmodule RunLengthEncoder do

  @rle_encode ~r/(\w)\1*/
  @rle_decode ~r/(\d+)(\w)/

  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    Regex.replace(@rle_encode, string, &reduce/2)
  end

  defp reduce(capture, symbol) do
    length = String.length(capture)
    case length do
      1 -> symbol
      _ -> "#{length}#{symbol}"
    end
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    render = fn (_, repeat, symbol) -> String.duplicate(symbol, String.to_integer(repeat)) end
    Regex.replace(@rle_decode, string, render)
  end
end
