defmodule ExMonGameActionsHealTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  alias ExMon.{Game.Actions.Heal, Player}

  describe "heal_life/1" do
    test "returns the opponent's heal life" do
      player = Player.build("Fulano", :chute, :soco, :cura)

      message =
        capture_io(fn ->
          ExMon.start_game(player)
          ExMon.make_move(:soco)
          Heal.heal_life(:player)
        end)

      assert message =~ "The player healed itself to"
      assert message =~ "life points"
    end
  end
end
