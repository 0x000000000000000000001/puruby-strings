$Data_String_CodePoints__unsafeCodePointAt0 = ->(fallback) {
  ->(str) { str.ord }
}

$Data_String_CodePoints__codePointAt = ->(fallback) { ->(just) { ->(nothing) { ->(unsafeCodePointAt0) { ->(index) { ->(str) {
  return nothing if index < 0 || index >= str.length
  just.call(unsafeCodePointAt0.call(str[index]))
} } } } } }

$Data_String_CodePoints__countPrefix = ->(fallback) { ->(unsafeCodePointAt0) { ->(pred) { ->(str) {
  cpCount = 0
  str.each_char do |c|
    break unless pred.call(unsafeCodePointAt0.call(c))
    cpCount += 1
  end
  cpCount
} } } }

$Data_String_CodePoints__fromCodePointArray = ->(singleton) { ->(cps) {
  cps.map { |cp| cp.chr(Encoding::UTF_8) }.join("")
} }

$Data_String_CodePoints__singleton = ->(fallback) { ->(cp) {
  cp.chr(Encoding::UTF_8)
} }

$Data_String_CodePoints__take = ->(fallback) { ->(n) { ->(str) {
  n < 0 ? "" : str[0, n].to_s
} } }

$Data_String_CodePoints__toCodePointArray = ->(fallback) { ->(unsafeCodePointAt0) { ->(str) {
  str.chars.map { |c| unsafeCodePointAt0.call(c) }
} } }
