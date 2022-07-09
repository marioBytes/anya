defmodule Anya.Invoices.ClientAddress do
  use Ecto.Schema
  import Ecto.Changeset

  schema "client_addresses" do
    field :city, :string
    field :country, :string
    field :post_code, :string
    field :street, :string

    belongs_to :invoice, Anya.Invoices.Invoice

    timestamps()
  end

  @doc false
  def changeset(client_address, attrs) do
    client_address
    |> cast(attrs, [:street, :city, :post_code, :country])
    |> validate_required([:street, :city, :post_code, :country])
  end
end
