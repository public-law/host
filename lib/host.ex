defmodule Host do
  import String, only: [split: 2]
  import Enum, only: [join: 2, reverse: 1]

  @moduledoc """
  A small suite of DNS query functions which wrap the Unix host utility.
  """
  @doc """
  Extended Reverse DNS lookup.
  """
  def ext_reverse_lookup(ip: ip) when is_bitstring(ip) do
    reverse_lookup(ip: ip)
  end

  @doc """
  Reverse DNS lookup from an IP address as a tuple or bit

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
    case System.cmd("host", [ip]) do
      {output, 0} ->
        %{"domain" => domain} =
          Regex.named_captures(~r/domain name pointer (?<domain>.+)\.$/, output)

        {:ok, domain}

      {message, _} ->
        {:error, message}
    end
  end

  def parent_ptr_domain(ip) when is_bitstring(ip) do
    ip
    |> ptr_domain
    |> dot_tail
  end

  def ptr_domain(ip) when is_bitstring(ip) do
    reverse_ip = ip |> split(".") |> reverse |> join(".")
    "#{reverse_ip}.in-addr.arpa"
  end

  def email_domain(soa_email) when is_bitstring(soa_email) do
    dot_tail(soa_email)
  end

  def tail(a_list) when is_list(a_list) do
    [_x | xs] = a_list
    xs
  end

  # Treat the dotted string as a list, returning its
  # tail.
  def dot_tail(dotted_string) when is_binary(dotted_string) do
    dotted_string
    |> split(".")
    |> tail
    |> join(".")
  end
end
