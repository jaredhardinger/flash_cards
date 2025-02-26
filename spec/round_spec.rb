require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


RSpec.describe Round do
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  deck = Deck.new([card_1, card_2, card_3])
  round = Round.new(deck)

  it 'exists' do
    expect(round).to be_instance_of Round
  end

  it 'has deck' do
    expect(round.deck).to eq(deck)
  end

  it 'initializes an empty array' do
    expect(round.turns).to eq([])
  end

  it 'has correct current card' do
    expect(round.current_card).to eq(card_1)
  end

  it 'takes turn' do
    new_turn = round.take_turn("Juneau")

    expect(new_turn.class).to eq(Turn)

    expect(new_turn.correct?).to eq(true)

    expect(round.turns[0]).to eq(new_turn)
  end

  it 'has number of correct answers' do

    expect(round.number_correct).to eq (1)
  end

  it 'has correct current card' do

    expect(round.current_card).to eq(card_2)
  end

  it 'takes turn' do
    new_turn = round.take_turn("Venus")

    expect(new_turn.correct?).to eq(false)

    expect(round.turns.count).to eq(2)

    expect(round.turns.last.feedback).to eq("Incorrect.")

    expect(round.number_correct).to eq(1)
  end

  it 'has number correct by category' do

    expect(round.number_correct_by_category(:Geography)).to eq(1)
  end

  it 'has number correct by category' do

    expect(round.number_correct_by_category(:STEM)).to eq(0)
  end

  it 'has percent correct' do

    expect(round.percent_correct).to eq(50.0)
  end

  it 'has percent correct by category' do

    expect(round.percent_correct_by_category(:Geography)).to eq (100.0)
  end


  it 'has correct current card' do

    expect(round.current_card).to eq(card_3)

    expect(round.deck_index).to eq(2)
  end
end
