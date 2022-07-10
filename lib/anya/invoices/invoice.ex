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

    field :invoice_date, :string, virtual: true

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
    |> maybe_validate_required()
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
    |> cast_assoc(:client_address)
    |> cast_assoc(:sender_address)
    |> cast_assoc(:items)
  end

  defp maybe_validate_required(%{changes: %{status: "draft"}} = changeset) do
    changeset
  end

  defp maybe_validate_required(changeset) do
    validate_required(changeset, [
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
  end
end
