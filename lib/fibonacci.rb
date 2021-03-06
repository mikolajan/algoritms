class Fibonacci
  def main(n)
    return n if n < 2
    first, second = 0, 1
    (n - 1).times { first, second = second, first + second }
    second
  end

  def array(n)
    return n if n < 2
    (n - 1).times.each_with_object([0,1]) { |num, obj| obj << obj[-2] + obj[-1] }[-1]
  end

  def hash(n)
    Hash.new { |h, k| h[k] = k < 2 ? k : h[k-1] + h[k-2] }[n]
  end

  # for n = 40 execution time > 10s
  def recursion(n)
    n < 2 ? n : recursion(n - 1) + recursion(n - 2)
  end

  @@cache = [0, 1]
  def recursion_with_cache(n)
    @@cache[n] ||= recursion_with_cache(n - 1) + recursion_with_cache(n - 2)
  end

  # using Binet's Formula: http://mathworld.wolfram.com/BinetsFibonacciNumberFormula.html
  # for number < 71
  PHI = (1 + Math.sqrt(5)) / 2
  def binets_formula(n)
    (PHI**(n) / Math.sqrt(5)).round
  end
end
