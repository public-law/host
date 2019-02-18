defmodule IPv4 do
  @enforce_keys [:octets]
  defstruct [:octets]

  defguard is_octet(number) when is_integer(number) and number >= 0 and number <= 255
  defguard are_octets(a, b, c, d) when is_octet(a) and is_octet(b) and is_octet(c) and is_octet(d)

  def new_from_string(ip) when is_binary(ip) do
    [a, b, c, d] =
      ip
      |> String.split(".")
      |> Enum.map(&String.to_integer/1)

    new(a, b, c, d)
  end

  def new(a, b, c, d) when are_octets(a, b, c, d) do
    %IPv4{octets: {a, b, c, d}}
  end

  def ptr_domain(%{octets: {a, b, c, d}}) when are_octets(a, b, c, d) do
    reverse_addr_string = %IPv4{octets: {a, b, c, d}} |> reverse |> IPv4.to_string()
    "#{reverse_addr_string}.in-addr.arpa"
  end

  def reverse(%IPv4{octets: {a, b, c, d}}), do: %IPv4{octets: {d, c, b, a}}

  def to_string(%IPv4{octets: {a, b, c, d}}), do: "#{a}.#{b}.#{c}.#{d}"
end
