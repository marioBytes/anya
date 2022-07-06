defmodule Anya.Repo do
  use Ecto.Repo,
    otp_app: :anya,
    adapter: Ecto.Adapters.Postgres
end
