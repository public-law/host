# Host

Provides DNS querying via the ubiquitous [host](http://manpages.ubuntu.com/manpages/bionic/man1/host.1.html) utility. 
Currently only supports only reverse lookups:

```elixir
iex(1)> Host.reverse_lookup(ip: "172.217.5.206")
{:ok, "lax28s10-in-f14.1e100.net"}
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