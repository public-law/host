# Reverse DNS

Provides reverse DNS name lookup. I.e., given an IP address, `1.2.3.4`, it
tries to find its domain name, `happy.town.com`.

```elixir
iex(1)> Host.reverse_lookup(ip: "172.217.5.206")
{:ok, "lax28s10-in-f14.1e100.net"}

iex(2)> Host.reverse_lookup(ip: {172,217,5,206})
{:ok, "lax28s10-in-f14.1e100.net"}
```

This is useful e.g. in Phoenix, to get the vistor's domain name if it exists:

```elixir
domain = Host.reverse_lookup(ip: conn.remote_ip)
```

## Installation

The package can be installed by adding `host` to your list of
dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:host, "~> 0.1.0"}
  ]
end
```
