defmodule Anya.Repo.Migrations.CreateSenderAddresses do
  use Ecto.Migration

  def change do
    create table(:sender_addresses) do
      add :street, :string
      add :city, :string
      add :post_code, :string
      add :country, :string

      references :invoice_id, on_delete: :delete_all

      timestamps()
    end
  end
end
