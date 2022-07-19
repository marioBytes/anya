defmodule Anya.Invoices.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :name, :string
    field :price, Money.Ecto.Composite.Type
    field :quantity, :integer
    field :total, Money.Ecto.Composite.Type

    field :price_for_form, :float, virtual: true
    field :temp_id, :string, virtual: true
    field :delete, :boolean, virtual: true

    belongs_to :invoice, Anya.Invoices.Invoice

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> Map.put(:temp_id, item.temp_id || attrs["temp_id"])
    |> cast(attrs, [:name, :quantity, :total, :delete, :price_for_form])
    |> validate_required([:name, :quantity, :total, :price_for_form])
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

  defp maybe_calculate_total(
         %{
           changes: %{
             price_for_form: price_for_form,
             quantity: qty
           },
           data: %{total: %{currency: currency}}
         } = changeset
       ) do
    price_for_form = price_for_form |> convert_to_cents() |> convert_float_to_int()
    total = (price_for_form * qty) |> Money.new(currency)

    changeset =
      changeset
      |> put_change(:price, Money.new(price_for_form, currency))
      |> put_change(:total, total)

    changeset
  end

  defp maybe_calculate_total(changeset) do
    changeset
  end

  defp convert_to_cents(dollars_and_cents), do: dollars_and_cents * 100

  defp convert_float_to_int(float), do: float |> trunc()
end
