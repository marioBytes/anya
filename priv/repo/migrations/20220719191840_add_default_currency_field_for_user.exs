defmodule Anya.Repo.Migrations.AddDefaultCurrencyFieldForUser do
  use Ecto.Migration

  def change do
    alter table "users" do
      add :default_currency, :string, default: "USD"
    end
  end
end
