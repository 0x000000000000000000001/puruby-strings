$Data_String_Common__localeCompare = ->(lt) { ->(eq) { ->(gt) { ->(s1) { ->(s2) {
  result = s1 <=> s2
  result < 0 ? lt : (result > 0 ? gt : eq)
} } } } }

$Data_String_Common_replace = ->(s1) { ->(s2) { ->(s3) {
  s3.sub(s1, s2)
} } }

$Data_String_Common_replaceAll = ->(s1) { ->(s2) { ->(s3) {
  s3.gsub(s1, s2)
} } }

$Data_String_Common_split = ->(sep) { ->(s) {
  if s == ""
    sep == "" ? [] : [""]
  elsif sep == ""
    s.chars
  else
    s.split(sep, -1)
  end
} }

$Data_String_Common_toLower = ->(s) { s.downcase }
$Data_String_Common_toUpper = ->(s) { s.upcase }
$Data_String_Common_trim = ->(s) { s.strip }
$Data_String_Common_joinWith = ->(s) { ->(xs) { xs.join(s) } }
