defmodule IPv4 do
  @enforce_keys [:octets]
  defstruct [:octets]

  def new(a, b, c, d) when is_integer(a) and is_integer(b) and is_integer(c) and is_integer(d) do
    %IPv4{octets: {a, b, c, d}}
  end

  def to_string(%IPv4{octets: {a, b, c, d}}) do
    "#{a}.#{b}.#{c}.#{d}"
  end
end
