defmodule Become.Repo do
  use Ecto.Repo,
    otp_app: :become,
    adapter: Ecto.Adapters.Postgres
end
