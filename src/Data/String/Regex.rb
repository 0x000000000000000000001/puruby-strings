$Data_String_Regex_showRegexImpl = ->(r) { r["regexp"].inspect }

$Data_String_Regex_regexImpl = ->(left) { ->(right) { ->(s1) { ->(s2) {
  begin
    opts = 0
    opts |= Regexp::IGNORECASE if s2.include?("i")
    opts |= Regexp::MULTILINE if s2.include?("m")
    
    right.call({ "regexp" => Regexp.new(s1, opts), "flags" => s2, "source" => s1, "lastIndex" => 0 })
  rescue => e
    left.call(e.message)
  end
} } } }

$Data_String_Regex_source = ->(r) { r["source"] }

$Data_String_Regex_flagsImpl = ->(r) {
  {
    "multiline" => r["flags"].include?("m"),
    "ignoreCase" => r["flags"].include?("i"),
    "global" => r["flags"].include?("g"),
    "dotAll" => r["flags"].include?("s"),
    "sticky" => r["flags"].include?("y"),
    "unicode" => r["flags"].include?("u")
  }
}

$Data_String_Regex_test = ->(r) { ->(s) {
  !!r["regexp"].match(s)
} }

$Data_String_Regex__match = ->(just) { ->(nothing) { ->(r) { ->(s) {
  if r["flags"].include?("g")
    m = []
    s.scan(r["regexp"]) { m << Regexp.last_match(0) }
    if m.empty?
      nothing
    else
      just.call(m.map { |x| just.call(x) })
    end
  else
    m = r["regexp"].match(s)
    if m.nil?
      nothing
    else
      just.call(m.to_a.map { |x| x.nil? ? nothing : just.call(x) })
    end
  end
} } } }

$Data_String_Regex_replace = ->(r) { ->(s1) { ->(s2) {
  ruby_s1 = s1.gsub(/\$(\d+)/, '\\\\\1')
  if r["flags"].include?("g")
    s2.gsub(r["regexp"], ruby_s1)
  else
    s2.sub(r["regexp"], ruby_s1)
  end
} } }

$Data_String_Regex__replaceBy = ->(just) { ->(nothing) { ->(r) { ->(f) { ->(s) {
  if r["flags"].include?("g")
    s.gsub(r["regexp"]) do |match|
      m = Regexp.last_match
      groups = m.captures.map { |g| g.nil? ? nothing : just.call(g) }
      f.call(match).call(groups)
    end
  else
    s.sub(r["regexp"]) do |match|
      m = Regexp.last_match
      groups = m.captures.map { |g| g.nil? ? nothing : just.call(g) }
      f.call(match).call(groups)
    end
  end
} } } } }

$Data_String_Regex__search = ->(just) { ->(nothing) { ->(r) { ->(s) {
  i = s.index(r["regexp"])
  i.nil? ? nothing : just.call(i)
} } } }

$Data_String_Regex_split = ->(r) { ->(s) {
  s.split(r["regexp"], -1)
} }
