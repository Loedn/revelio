defmodule Revelio.Repo do
  use Ecto.Repo,
    otp_app: :revelio,
    adapter: Ecto.Adapters.Postgres
end
