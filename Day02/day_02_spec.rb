require 'rspec'
require './day_02.rb'

RSpec.describe Day02 do
  include Day02

  let(:filename) { 'example.txt' }

  context 'part1' do
    subject { part1(filename) }

    it 'returns the expected solution' do
      expect(subject).to eq(8)
    end

    context 'with puzzle input' do
      let(:filename) { 'input_day_02.txt' }

      it 'returns the expected solution' do
        expect(subject).to eq(2449)
      end
    end
  end

  context 'part2' do
    subject { part2(filename) }

    it 'returns the expected solution' do
      expect(subject).to eq(2286)
    end

    context 'with puzzle input' do
      let(:filename) { 'input_day_02.txt' }

      it 'returns the expected solution' do
        expect(subject).to eq(nil)
      end
    end
  end
end