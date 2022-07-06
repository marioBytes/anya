defmodule Anya.Repo.Migrations.CreateInvoices do
  use Ecto.Migration

  def change do
    create table(:invoices) do
      add :description, :string
      add :client_name, :string
      add :client_email, :string
      add :status, :string
      add :uuid, :string
      add :total, :float
      add :payment_due, :integer
      add :payment_terms, :string
      add :user_id, references(:users)

      timestamps()
    end
  end
end
