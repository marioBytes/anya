defmodule Anya.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :quantity, :integer
      add :price, :integer
      add :total, :integer

      add :invoice_id, references(:invoices, on_delete: :delete_all)

      timestamps()
    end
  end
end
