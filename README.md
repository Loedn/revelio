# Revelio

Revelio is a platform that aims to solve blockchain readability issues.
Starting with Algorand

## How we want to solve it
Flow:
- Developer uploads arc32 / arc56
- Revelio verifies truthfulness of the upload (manual verification atm, come say hi!)
- Integrators (explorers, wallets) consume Revelio's API and serve users clear text instead of hashes
- Happiness!

## Contributing
Contributions are not only welcome, but encouraged!

Revelio is built using:
- [Elixir](https://elixir-lang.org/)
- [Phoenix](https://hexdocs.pm/phoenix/overview.html)
- [Postgresql](https://www.postgresql.org/)
So be sure to have those installed before starting.


### Project Setup
* Clone this repo and `cd` into it.
* Run `mix setup` to install and setup dependencies
* Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`
* Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Useful Links

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
