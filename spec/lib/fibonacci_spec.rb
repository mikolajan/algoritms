RSpec.describe Fibonacci do
  FIB_HASH = {
    0 => 0,
    2 => 1,
    5 => 5,
    70 => 190392490709135,
    71 => 308061521170129,
    99 => 218922995834555169026
  }

  let(:ex) { described_class.new }

  describe '#main' do
    FIB_HASH.each do |k, v|
      it "return #{v} for num #{k}" do
        expect(ex.main(k)).to eq v
      end
    end
  end

  describe '#array' do
    FIB_HASH.each do |k, v|
      it "return #{v} for num #{k}" do
        expect(ex.array(k)).to eq v
      end
    end
  end

  describe '#hash' do
    FIB_HASH.each do |k, v|
      it "return #{v} for num #{k}" do
        expect(ex.hash(k)).to eq v
      end
    end
  end

  describe '#recursion' do
    FIB_HASH.select { |k, _| k < 40 }.each do |k, v|
      it "return #{v} for num #{k}" do
        expect(ex.recursion(k)).to eq v
      end
    end
  end

  describe '#recursion_with_cache' do
    FIB_HASH.each do |k, v|
      it "return #{v} for num #{k}" do
        expect(ex.recursion_with_cache(k)).to eq v
      end
    end
  end

  describe '#binets_formula' do
    FIB_HASH.select { |k, _| k < 71 }.each do |k, v|
      it "return #{v} for num #{k}" do
        expect(ex.binets_formula(k)).to eq v
      end
    end
  end
end
