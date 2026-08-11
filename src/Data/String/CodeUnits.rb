$Data_String_CodeUnits_fromCharArray = ->(a) { a.join("") }
$Data_String_CodeUnits_toCharArray = ->(s) { s.chars }
$Data_String_CodeUnits_singleton = ->(c) { c }

$Data_String_CodeUnits__charAt = ->(just) { ->(nothing) { ->(i) { ->(s) {
  (i >= 0 && i < s.length) ? just.call(s[i]) : nothing
} } } }

$Data_String_CodeUnits__toChar = ->(just) { ->(nothing) { ->(s) {
  s.length == 1 ? just.call(s) : nothing
} } }

$Data_String_CodeUnits_length = ->(s) { s.length }

$Data_String_CodeUnits_countPrefix = ->(p) { ->(s) {
  i = 0
  while i < s.length && p.call(s[i])
    i += 1
  end
  i
} }

$Data_String_CodeUnits__indexOf = ->(just) { ->(nothing) { ->(x) { ->(s) {
  i = s.index(x)
  i.nil? ? nothing : just.call(i)
} } } }

$Data_String_CodeUnits__indexOfStartingAt = ->(just) { ->(nothing) { ->(x) { ->(startAt) { ->(s) {
  return nothing if startAt < 0 || startAt > s.length
  i = s.index(x, startAt)
  i.nil? ? nothing : just.call(i)
} } } } }

$Data_String_CodeUnits__lastIndexOf = ->(just) { ->(nothing) { ->(x) { ->(s) {
  i = s.rindex(x)
  i.nil? ? nothing : just.call(i)
} } } }

$Data_String_CodeUnits__lastIndexOfStartingAt = ->(just) { ->(nothing) { ->(x) { ->(startAt) { ->(s) {
  i = s.rindex(x, startAt)
  i.nil? ? nothing : just.call(i)
} } } } }

$Data_String_CodeUnits_take = ->(n) { ->(s) {
  n < 0 ? "" : s[0, n].to_s
} }

$Data_String_CodeUnits_drop = ->(n) { ->(s) {
  n < 0 ? s : s[n..-1].to_s
} }

$Data_String_CodeUnits_slice = ->(b) { ->(e) { ->(s) {
  b = [b, 0].max
  e = [e, s.length].min
  (b >= e) ? "" : s[b...e].to_s
} } }

$Data_String_CodeUnits_splitAt = ->(i) { ->(s) {
  if i < 0
    { "before" => "", "after" => s }
  elsif i >= s.length
    { "before" => s, "after" => "" }
  else
    { "before" => s[0...i], "after" => s[i..-1] }
  end
} }
