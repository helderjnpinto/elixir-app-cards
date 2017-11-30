defmodule Cards do
  @moduledoc """
  Documentation for Cards.
  """

  @doc """
  create_deck

  ## Example
      iex> Cards.create_deck
      ["Ace of Spades", "Two of Spades", "Three of Spades",
            "Four of Spades", "Five of Spades", "Ace of Clubs", "Two of Clubs",
            "Three of Clubs", "Four of Clubs", "Five of Clubs", "Ace of Hearts",
            "Two of Hearts", "Three of Hearts", "Four of Hearts",
            "Five of Hearts", "Ace of Diamonts", "Two of Diamonts",
            "Three of Diamonts", "Four of Diamonts", "Five of Diamonts"]

  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
  
    suits = [ "Spades", "Clubs", "Hearts", "Diamonts"]

    for suit <- suits, value <- values  do
       "#{value} of #{suit}"
    end

  end

  def shuffle(deck)  do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end


  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` arg indicates how many cards should be in the hand

  ## Examples
      iex> {hand, _} = Cards.deal(Cards.create_deck(), 3)
      iex> hand
      ["Ace of Spades", "Two of Spades", "Three of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck) do
    bin = :erlang.term_to_binary deck
    File.write("my_deck", bin)
  end

  def load() do
    case File.read("my_deck") do
       {:ok, bin } -> :erlang.binary_to_term bin
       {:error, _ } -> "That file not exist"
    end
  end

  def loads(filename) do
    case File.read(filename) do
       {:ok, bin } -> :erlang.binary_to_term bin
       {:error, _ } -> "That file not exist"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

  
end
