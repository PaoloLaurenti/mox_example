defmodule Bound do

  def init(weather) do
    fn city ->
      weather.get_weather(city)
    end
  end

  def get_weather(city) do
    weather().get_weather(city)
  end

  defp weather() do
    Application.get_env(:bound, :weather, WeatherImpl)
  end
end
