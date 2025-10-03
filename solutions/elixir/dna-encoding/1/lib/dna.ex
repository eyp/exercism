defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?\s -> 0b0000
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
    end  
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0000 -> ?\s
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
    end  
  end

  def encode(dna), do: do_encode(dna, <<>>)

  defp do_encode(~c"", encoded_dna), do: encoded_dna

  defp do_encode([head | tail], encoded_dna) do
    do_encode(tail, <<encoded_dna::bitstring, encode_nucleotide(head)::4>>)
  end

  def decode(dna), do: do_decode(dna, ~c"")

  defp do_decode(<<>>, decoded_dna), do: decoded_dna

  defp do_decode(dna, decoded_dna) do
    <<head::4, tail::bitstring>> = dna
    do_decode(tail, decoded_dna ++ [decode_nucleotide(head)])
  end

end
