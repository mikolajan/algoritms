RSpec.describe ArraySort do
  [:bubble_sort, :selection_sort, :quick_sort].each do |method|
    describe "##{method}" do
      [
        Array.new(998) { rand(1000) },
        Array.new(999) { rand(1000) },
        [101, *1..100],
        [*2..10, 1]
      ].each.with_index(1) do |array, index|
        it "should return sorting array_#{index}" do
          expect(described_class.send(method, array)).to eq array.sort
        end
      end
    end
  end
end
