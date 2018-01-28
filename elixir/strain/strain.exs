defmodule Strain do


  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def keep([], fun), do: []
  def keep(list, fun) do
    # Used Enum.reduce/2 as if was not disallowed.
    Enum.reduce(list, [], fn (v, acc) ->
      if(fun.(v), do: [v | acc], else: acc)
    end) |> Enum.reverse
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def discard([], fun), do: []
  def discard(list, fun) do
    # Used Enum.reduce/2 as if was not disallowed.
    Enum.reduce(list, [], fn (v, acc) ->
      if(fun.(v), do: acc, else: [v | acc])
    end) |> Enum.reverse
  end
end
