$Data_String_Unsafe_charAt = ->(i) { ->(s) {
  return s[i] if i >= 0 && i < s.length
  raise "Data.String.Unsafe.charAt: Invalid index."
} }

$Data_String_Unsafe_char = ->(s) {
  return s[0] if s.length == 1
  raise "Data.String.Unsafe.char: Expected string of length 1."
}

$Data_String_Unsafe__char = $Data_String_Unsafe_char
