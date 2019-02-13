defmodule IPv4Test do
  use ExUnit.Case, async: true

  describe "new/4" do
    test "creates a struct" do
      assert IPv4.new(127, 0, 0, 1) == %IPv4{octets: {127, 0, 0, 1}}
    end
  end

  describe "new_from_string/1" do
    test "handles a correctly formatted and valued string" do
      assert IPv4.new_from_string("4.5.6.7") == %IPv4{octets: {4, 5, 6, 7}}
    end
  end

  describe "to_string/1" do
    test "generates dotted String correctly" do
      address = IPv4.new(1, 2, 3, 4)
      assert IPv4.to_string(address) == "1.2.3.4"
    end
  end
end