RSpec.describe GraphSearch do
  #      ------- one-way graph -------
  #        ___                   ___
  #       |   |        6        |   |
  #       | B |-----------------| G |
  #       |___|                 |___|
  #     2/                   1 /  |  \ 2
  #  ___/        ___      ___ /   |   \___
  # |   |       |   | 2  |   |    |   |   |
  # | A |       | D |----| E |  3 /   | H |
  # |___|       |___|    |___|   /    |___|
  #     \ 1   1/                /
  #      \____/          ____  /
  #       |   |      2   |   |/
  #       | C |----------| F |
  #       |___|          |___|

  PEAKS = [*'A'..'H']
  GRAPH_MATRIX = [
    [0,2,1,0,0,0,0,0],
    [0,0,0,0,0,0,6,0],
    [0,0,0,1,0,2,0,0],
    [0,0,0,0,2,0,0,0],
    [0,0,0,0,0,0,1,0],
    [0,0,0,0,0,0,3,0],
    [0,0,0,0,0,0,0,2],
    [0,0,0,0,0,0,0,0]
  ]

  let(:ex) { described_class }

  describe '#breadth_search' do
    let(:graph_hash) { get_graph_for_breadth_search }

    it { expect(ex.breadth_search(graph_hash, 'A', 'B')).to be true }
    it { expect(ex.breadth_search(graph_hash, 'A', 'H')).to be true }
    it { expect(ex.breadth_search(graph_hash, 'C', 'E')).to be true }
    it { expect(ex.breadth_search(graph_hash, 'B', 'F')).to be false }
    it { expect(ex.breadth_search(graph_hash, 'H', 'A')).to be false }
    it { expect(ex.breadth_search(graph_hash, 'E', 'B')).to be false }
  end

  describe '#dijkstra_search' do
    let(:graph_hash) { get_graph_for_dijkstra_search }

    it { expect(ex.dijkstra_search(graph_hash, 'A', 'B')).to eq 2 }
    it { expect(ex.dijkstra_search(graph_hash, 'A', 'H')).to eq 7 }
    it { expect(ex.dijkstra_search(graph_hash, 'C', 'G')).to eq 4 }
    it { expect(ex.dijkstra_search(graph_hash, 'B', 'F')).to eq Float::INFINITY }
    it { expect(ex.dijkstra_search(graph_hash, 'H', 'A')).to eq Float::INFINITY }
  end

  private

  # {"A" => ["B", "C"], "B" => ["G"], ..."H"=>[]}
  def get_graph_for_breadth_search
    GRAPH_MATRIX.map.with_index do |arr, index|
      [
        PEAKS[index],
        arr.map.with_index { |item, i| PEAKS[i] if item != 0 }.compact
      ]
    end.to_h
  end

  # {"A" => {"B" => 2, "C" => 1}, "B" => {"G" => 6}, ... "G" => {"H" => 2}, "H"=> {}}
  def get_graph_for_dijkstra_search
    GRAPH_MATRIX.map.with_index do |arr, index|
      [
        PEAKS[index],
        arr.map.with_index { |item, i| [PEAKS[i], item] if item != 0 }.compact.to_h
      ]
    end.to_h
  end
end
