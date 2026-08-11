$Data_Array_NonEmpty_Internal_foldr1Impl = ->(f, xs) {
  acc = xs[-1]
  (xs.length - 2).downto(0) do |i|
    acc = f.call(xs[i]).call(acc)
  end
  acc
}

$Data_Array_NonEmpty_Internal_foldl1Impl = ->(f, xs) {
  acc = xs[0]
  (1...xs.length).each do |i|
    acc = f.call(acc).call(xs[i])
  end
  acc
}

$Data_Array_NonEmpty_Internal_traverse1Impl = ->(apply, map, f) {
  buildFrom = ->(x, ys) {
    apply.call(map.call(->(a) { ->(b) { [a] + b } }).call(f.call(x))).call(ys)
  }
  
  go = nil
  go = ->(acc, currentLen, xs) {
    if currentLen == 0
      acc
    else
      last = xs[currentLen - 1]
      ->() { go.call(buildFrom.call(last, acc), currentLen - 1, xs) }
    end
  }
  
  ->(array) {
    acc = map.call(->(a) { [a] }).call(f.call(array[-1]))
    result = go.call(acc, array.length - 1, array)
    while result.is_a?(Proc)
      result = result.call()
    end
    result
  }
}
