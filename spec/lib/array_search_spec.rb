RSpec.describe Array do
  [:linear_search, :binary_search, :binary_search_nz, :interpolation_search].each do |method|
    describe "##{method}" do
      {
        11 => [*1..10],
        90 => [*1..100],
        91 => [*1..100],
        80 => [*1..99],
        81 => [*1..99],
      }.each do |element, array|
        it "should return #{array.index(element) || 'nil'}" do
          expect(array.send(method, element)).to eq array.index(element)
        end
      end
    end
  end
end
