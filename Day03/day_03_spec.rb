require 'rspec'
require './day_03.rb'

RSpec.describe Day03 do
  include Day03

  let(:filename) { 'example.txt' }

  context 'part1' do
    subject { part1(filename) }

    it 'returns the expected solution' do
      expect(subject).to eq(4361)
    end

    context 'with puzzle input' do
      let(:filename) { 'input_day_03.txt' }

      it 'returns the expected solution' do
        expect(subject).to eq(25)
      end
    end
  end

  context 'part2' do
    subject { part2(filename) }

    it 'returns the expected solution' do
      expect(subject).to eq(2286)
    end

    context 'with puzzle input' do
      let(:filename) { 'input_day_03.txt' }

      it 'returns the expected solution' do
        expect(subject).to eq(537732)
      end
    end
  end
end