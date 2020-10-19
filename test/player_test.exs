defmodule ExMon.PlayerTest do
  use ExUnit.Case
  @max_life 100
  describe "build/4" do
    test "returns a player" do

      expected_response = %ExMon.Player{
        life: @max_life,
        moves: %{
          move_avg: :kick,
          move_rnd: :punch,
          move_heal: :heal
        },
        name: "Fulano"
      }

      assert expected_response == ExMon.Player.build("Fulano", :kick, :punch, :heal)
    end
  end
end
