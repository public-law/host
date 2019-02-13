defmodule HostTest do
  use ExUnit.Case, async: true
  doctest Host

  describe "reverse_lookup/1" do
    test "can identify localhost" do
      assert Host.reverse_lookup(ip: "127.0.0.1") == {:ok, "localhost"}
    end

    test "malformed ip produces an error" do
      assert {:error, _message} = Host.reverse_lookup(ip: "1.2.3.4.5")
    end

    test "works with standard ip structure" do
      assert Host.reverse_lookup(ip: {127, 0, 0, 1}) == {:ok, "localhost"}
    end
  end

  describe "ext_reverse_lookup/1" do
    test "functions like reverse_lookup() when host is found" do
      assert Host.ext_reverse_lookup(ip: "127.0.0.1") == {:ok, "localhost"}
    end

    test "malformed ip produces an error here too" do
      assert {:error, _message} = Host.ext_reverse_lookup(ip: "1.2.3.4.5")
    end
  end

  describe "ptr_domain/1" do
    test "it creates a properly formatted ptr domain" do
      assert Host.ptr_domain("1.2.3.4") == "4.3.2.1.in-addr.arpa"
    end
  end

  describe "parent_ptr_domain" do
    test "it creates a properly formatted ptr domain" do
      assert Host.parent_ptr_domain("1.2.3.4") == "3.2.1.in-addr.arpa"
    end
  end

  describe "email_domain/1" do
    test "returns just the domain portion of an SOA email" do
      assert Host.email_domain("bob.snafu.com") == "snafu.com"
    end
  end

  describe "soa_email_domain/1" do
    test "returns the domain from an IP's SOA result." do
      # DNS.resolve("4.3.2.in-addr.arpa", :soa)
      answer =
        {:ok,
         [
           {"happy.crazy.town.com", "dns.crazy.town.com", 23, 900, 600, 86400, 3600}
         ]}

      assert Host.soa_email_domain(answer) == "crazy.town.com"
    end
  end
end
