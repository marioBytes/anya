defmodule Anya.Repo.Migrations.CreateClientAddresses do
  use Ecto.Migration

  def change do
    create table(:client_addresses) do
      add :street, :string
      add :city, :string
      add :post_code, :string
      add :country, :string

      add :invoice_id, references(:invoices, on_delete: :delete_all)

      timestamps()
    end
  end
end
