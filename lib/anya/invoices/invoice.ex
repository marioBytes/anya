defmodule Anya.Invoices.Invoice do
  use Ecto.Schema
  import Ecto.Changeset

  schema "invoices" do
    field :client_email, :string
    field :client_name, :string
    field :description, :string
    field :payment_due, :integer
    field :payment_terms, :string
    field :status, :string
    field :total, :float
    field :uuid, :string

    belongs_to(:user, Anya.Accounts.User)

    has_one :client_address, Anya.Invoices.ClientAddress
    has_one :sender_address, Anya.Invoices.SenderAddress
    has_many :items, Anya.Invoices.Item

    timestamps()
  end

  @doc false
  def changeset(invoice, attrs) do
    invoice
    |> cast(attrs, [
      :description,
      :client_name,
      :client_email,
      :status,
      :uuid,
      :total,
      :payment_due,
      :payment_terms,
      :user_id
    ])
    |> validate_required([
      :description,
      :client_name,
      :client_email,
      :status,
      :uuid,
      :total,
      :payment_due,
      :payment_terms,
      :user_id
    ])
    |> validate_format(:client_email, ~r/^[^\s]+@[^\s]+$/,
      message: "must have the @ sign and no spaces"
    )
    |> validate_inclusion(:status, ["draft", "paid", "pending"])
    |> validate_inclusion(:payment_terms, [
      "net 30",
      "net 60",
      "net 90",
      "1%/10 net 30",
      "due on receipt"
    ])
  end
end
