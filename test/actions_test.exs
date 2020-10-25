defmodule ExMonGameActionsTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  alias ExMon.{Player, Game.Actions}
  @error_move :invalid

  describe "fetch_move/1" do
    setup do
      player = Player.build("Fulano", :chute, :soco, :cura)

      capture_io(fn ->
        ExMon.start_game(player)
      end)

      :ok
    end

    test "return the move if exists" do
      expected_response = {:ok, :move_heal}

      assert expected_response == Actions.fetch_move(:cura)
    end

    test "return an error if the move does not exist" do
      expected_response = {:error, @error_move}
      assert expected_response == Actions.fetch_move(@error_move)
    end
  end

  describe "attack/1" do
    test "performs the attack action" do
      player = Player.build("Fulano", :chute, :soco, :cura)

      message =
        capture_io(fn ->
          ExMon.start_game(player)
          Actions.attack(:move_avg)
        end)

      assert message =~ "The player attack cumputer dealing:"
    end
  end

  describe "heal/0" do
    test "performs to heal" do
      player = Player.build("Fulano", :chute, :soco, :cura)

      message =
        capture_io(fn ->
          ExMon.start_game(player)
          Actions.heal()
        end)
        assert message =~ "The player healed itself to"
        assert message =~ "life points"
    end
  end
end
