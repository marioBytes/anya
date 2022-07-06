defmodule Anya.Invoices.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :name, :string
    field :price, :integer
    field :quantity, :integer
    field :total, :integer

    belongs_to :invoice, Anya.Invoices.Invoice

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:name, :quantity, :price, :total, :invoice_id])
    |> validate_required([:name, :quantity, :price, :total, :invoice_id])
  end
end
