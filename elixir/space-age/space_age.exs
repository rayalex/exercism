defmodule SpaceAge do
  @earth_year 31557600

  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :uranus | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    ages = %{
      :mercury => @earth_year * 0.2408467,
      :venus => @earth_year * 0.61519726,
      :earth => @earth_year * 1,
      :mars => @earth_year * 1.8808158,
      :jupiter => @earth_year * 11.862615,
      :saturn => @earth_year * 29.447498,
      :uranus => @earth_year * 84.016846,
      :neptune => @earth_year * 164.79132 
    }

    {:ok, year} = Map.fetch(ages, planet)
    seconds / year
  end
end
