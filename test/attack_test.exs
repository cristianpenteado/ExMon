defmodule ExMonGameActionsAttackTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  alias ExMon.{Player, Game.Actions.Attack}

  describe "attack_oponent/2" do
    test "perform the attack and update the opponent life" do
      player = Player.build("Fulano", :chute, :soco, :cura)

      message =
        capture_io(fn ->
          ExMon.start_game(player)
          Attack.attack_opponent(:computer, :move_avg)
        end)

      assert message =~ "The player attack cumputer dealing"
    end
  end
end
