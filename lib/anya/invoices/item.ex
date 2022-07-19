defmodule Anya.Invoices.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :name, :string
    field :price, Money.Ecto.Composite.Type
    field :quantity, :integer
    field :total, Money.Ecto.Composite.Type

    field :temp_id, :string, virtual: true
    field :delete, :boolean, virtual: true

    belongs_to :invoice, Anya.Invoices.Invoice

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> Map.put(:temp_id, item.temp_id || attrs["temp_id"])
    |> cast(attrs, [:name, :quantity, :price, :total, :delete])
    |> validate_required([:name, :quantity, :price, :total])
    |> maybe_mark_for_deletion()
    |> maybe_calculate_total()
  end

  defp maybe_mark_for_deletion(%{data: %{id: nil}} = changeset), do: changeset

  defp maybe_mark_for_deletion(changeset) do
    if get_change(changeset, :delete) do
      %{changeset | action: :delete}
    else
      changeset
    end
  end

  defp maybe_calculate_total(%{changes: %{price: price, quantity: qty}} = changeset) do
    total = qty * price
    changeset = put_change(changeset, :total, total)

    changeset
  end

  defp maybe_calculate_total(changeset) do
    changeset
  end
end
