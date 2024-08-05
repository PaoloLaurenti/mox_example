Mox.defmock(WeatherBehaviourMock, for: WeatherBehaviour) # <- Add this
Application.put_env(:bound, :weather, WeatherBehaviourMock) # <- Add this

ExUnit.start()
