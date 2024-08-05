defmodule MoxExampleTest do
  use ExUnit.Case
  import Mox

  setup :verify_on_exit!

  describe "fetches weather based on a location" do
    test "inject mock via application env" do
      expect(WeatherBehaviourMock, :get_weather, fn "Chicago" ->
        # here we decide what the mock returns
        {:ok, %{body: "Some html with weather data"}}
      end)

      assert {:ok, _} = Bound.get_weather("Chicago")
    end

    test "inject mock via partial application" do
      expect(WeatherBehaviourMock, :get_weather, fn "Chicago" ->
        # here we decide what the mock returns
        {:ok, %{body: "Some html with weather data"}}
      end)

      get_weather = Bound.init(WeatherBehaviourMock)
      assert {:ok, _} = get_weather.("Chicago")
    end
  end

end
