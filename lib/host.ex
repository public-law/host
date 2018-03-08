defmodule Host do
  @moduledoc """
  A small suite of DNS query functions which wrap the Unix host utility.
  """

  @doc """
  Reverse DNS lookup from an IP address as a tuple or bitstring.

  ## Examples

      iex> Host.reverse_lookup(ip: {127,0,0,1})
      {:ok, "localhost"}
      iex> Host.reverse_lookup(ip: "127.0.0.1")
      {:ok, "localhost"}

  """
  def reverse_lookup(ip: {a, b, c, d})
      when is_integer(a) and is_integer(b) and is_integer(c) and is_integer(d) do
    reverse_lookup(ip: "#{a}.#{b}.#{c}.#{d}")
  end

  def reverse_lookup(ip: ip) when is_bitstring(ip) do
    {output, status} = System.cmd("host", [ip])

    case status do
      0 ->
        %{"domain" => domain} =
          Regex.named_captures(~r/domain name pointer (?<domain>.+)\.$/, output)

        {:ok, domain}

      _ ->
        {:error, output}
    end
  end
end
