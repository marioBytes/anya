defmodule Anya.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :quantity, :integer
      add :price, :integer
      add :total, :integer

      references :invoice_id, on_delete: :delete_all

      timestamps()
    end
  end
end
