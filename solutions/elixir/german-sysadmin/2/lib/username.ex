defmodule Username do

  def sanitize(~c""), do: ~c""
  
  def sanitize([unicode_value | tail]) do
    sanitized_char =   
    case unicode_value do
      ?ä -> ~c"ae"
      ?ö -> ~c"oe"
      ?ü -> ~c"ue"
      ?ß -> ~c"ss"
      ?_ -> ~c"_"
      unicode_value when unicode_value >= ?a and unicode_value <= ?z -> [unicode_value]
      _ -> ~c""
    end

    sanitized_char ++ sanitize(tail)
  end
end
