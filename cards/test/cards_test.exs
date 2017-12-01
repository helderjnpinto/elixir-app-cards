defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "the thruth" do
    assert 1 + 1 == 2
  end

  test "Create_deck length 20 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 20
  end


  test "Shuffling a deck randomizes it" do
    deck = Cards.create_deck
    assert deck != Cards.shuffle(deck)
  end


end
