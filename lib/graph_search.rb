class GraphSearch
  #      ------- one-way graph -------

  # ----------- Breadth-first search -----------
  # graph = {"A" => ["B", "C"], "B" => ["G"], ..."H"=>[]}
  def self.breadth_search(graph, start, finish)
    return true if start == finish
    queue = []                                       # Queue.new in 1.11x slower
    queue.push(start)
    while queue.size > 0
      current = queue.shift
      graph[current] ||= []                          # error below if graph[current] => nil
      return true if graph[current].include?(finish)
      queue += graph[current]
    end
    false
  end

  # ----------- Dijkstra’s algorithm -----------
  # graph = {"A" => {"B" => 2, "C" => 1}, "B" => {"G" => 6}, ... "G" => {"H" => 2}, "H"=> {}}
  def self.dijkstra_search(graph, start, finish)
    result, used = Hash.new(Float::INFINITY), []
    result[start], current_peak = 0, start
    while current_peak
      (graph[current_peak] || {}).each do |peak, cost|
        new_cost = result[current_peak] + cost
        result[peak] = new_cost if new_cost < result[peak]
      end
      used << current_peak
      min_not_used = result.reject { |k, _| used.include?(k) }.min { |a, b| a <=> b } # => ['peak', cost]
      current_peak = min_not_used.nil? || result[finish] < min_not_used[1] ? nil : min_not_used[0]
    end
    result[finish]
  end
end
