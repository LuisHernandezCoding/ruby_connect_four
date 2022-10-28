require_relative '../lib/game'

describe Game do
  subject(:game) { Game.new }

  describe '#initialize' do
    it 'should return the game' do
      expect(game).to be_an_instance_of(Game)
    end
  end

  describe '#next_turn' do
    describe 'when the turn is 1' do
      it 'the turn variable should return 1' do
        expect(game.turn).to eql(1)
      end
      it 'should return 2' do
        game.next_turn
        expect(game.turn).to eql(2)
      end
    end
    describe 'when the turn is 2' do
      it 'the turn variable should return 2' do
        game.next_turn
        expect(game.turn).to eql(2)
      end
      it 'should return 1 after executing next_turn' do
        game.next_turn
        expect(game.next_turn).to eql(1)
      end
    end
  end
end
