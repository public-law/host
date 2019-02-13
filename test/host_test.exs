defmodule HostTest do
  use ExUnit.Case
  doctest Host

  test "can identify localhost" do
    assert Host.reverse_lookup(ip: "127.0.0.1") == {:ok, "localhost"}
  end

  test "malformed ip produces an error" do
    assert {:error, _message} = Host.reverse_lookup(ip: "1.2.3.4.5")
  end

  test "works with standard ip structure" do
    assert Host.reverse_lookup(ip: {127, 0, 0, 1}) == {:ok, "localhost"}
  end

  #
  # ext_reverse_lookup()
  #

  test "functions like reverse_lookup() when host is found" do
    assert Host.ext_reverse_lookup(ip: "127.0.0.1") == {:ok, "localhost"}
  end

  test "malformed ip produces an error here too" do
    assert {:error, _message} = Host.ext_reverse_lookup(ip: "1.2.3.4.5")
  end

  test "it creates a ptr domain" do
    assert Host.ptr_domain(ip: "1.2.3.4") == "4.3.2.1.in-addr.arpa"
  end
end
