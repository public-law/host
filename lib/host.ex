defmodule Host do
  @moduledoc """
  Documentation for Host.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Host.hello
      :world

  """
  def hello do
    :world
  end

  def reverse_lookup(ip: ip) do
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
