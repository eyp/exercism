defmodule PaintByNumber do

  defp palette_bit_size(color_count, bits) do
    if 2 ** bits >= color_count, do: bits, else: palette_bit_size(color_count, bits + 1)
  end

  def palette_bit_size(0), do: 0

  def palette_bit_size(color_count) do
    palette_bit_size(color_count, 0)
  end

  def empty_picture(), do: <<>>

  def test_picture() do
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    bits_size = palette_bit_size(color_count)
    <<pixel_color_index::size(bits_size), picture::bitstring>>
  end

  def get_first_pixel(<<>>, _), do: nil

  def get_first_pixel(picture, color_count) do
    bits_size = palette_bit_size(color_count)
    <<first_pixel::size(bits_size), _::bitstring>> = picture
    first_pixel
  end

  def drop_first_pixel(<<>>, _), do: <<>>

  def drop_first_pixel(picture, color_count) do
    bits_size = palette_bit_size(color_count)
    <<_::size(bits_size), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
