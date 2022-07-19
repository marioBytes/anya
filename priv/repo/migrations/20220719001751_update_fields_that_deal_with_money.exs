defmodule Anya.Repo.Migrations.UpdateFieldsThatDealWithMoney do
  use Ecto.Migration

  def change do
    alter table "items" do
      remove :price
      remove :total

      add :price, :money_with_currency
      add :total, :money_with_currency
    end

    alter table "invoices" do
      remove :total

      add :total, :money_with_currency
    end
  end
end
