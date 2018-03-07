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
    assert Host.reverse_lookup(ip: {127,0,0,1}) == {:ok, "localhost"}
  end
end
