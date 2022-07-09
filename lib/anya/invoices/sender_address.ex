defmodule Anya.Invoices.SenderAddress do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sender_addresses" do
    field :city, :string
    field :country, :string
    field :post_code, :string
    field :street, :string

    belongs_to :invoice, Anya.Invoices.Invoice

    timestamps()
  end

  @doc false
  def changeset(sender_address, attrs) do
    sender_address
    |> cast(attrs, [:street, :city, :post_code, :country])
    |> validate_required([:street, :city, :post_code, :country])
  end
end
