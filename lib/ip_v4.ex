defmodule IPv4 do
  use Vex.Struct

  @enforce_keys [:a, :b, :c, :d]
  defstruct [:a, :b, :c, :d]

  validates(:a,
    presence: true,
    number: [greater_than_or_equal_to: 0, less_than_or_equal_to: 255]
  )

  validates(:b,
    presence: true,
    number: [greater_than_or_equal_to: 0, less_than_or_equal_to: 255]
  )

  validates(:c,
    presence: true,
    number: [greater_than_or_equal_to: 0, less_than_or_equal_to: 255]
  )

  validates(:d,
    presence: true,
    number: [greater_than_or_equal_to: 0, less_than_or_equal_to: 255]
  )
end
