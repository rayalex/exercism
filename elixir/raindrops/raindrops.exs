defmodule Raindrops do

  @drops %{3 => "Pling", 5 => "Plang", 7 => "Plong"}

  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    case prime_raindrops(number) do
      [] -> to_string(number)
      drops -> to_string(drops)
    end
  end

  @doc """
  Returns only 3, 5, 7 factors, if any.

  Note: This function is intentionally not generalized over all primes.
  """
  @spec prime_raindrops(pos_integer) :: list(pos_integer)
  defp prime_raindrops(number) do
    factors = for n <- 1..number, rem(number, n) == 0, do: n
    Enum.filter(factors, &(Enum.member?([3, 5, 7], &1)))
    |> Enum.map(&(@drops[&1]))
  end
end
