defmodule Anya.Invoices.Query do
  import Ecto.Query

  alias Anya.Invoices.Invoice

  def base() do
    Invoice
  end

  def with_meta_data() do
    base()
    |> preload_client_address()
    |> preload_sender_address()
    |> preload_invoice_items()
  end

  def user_invoices(user_id) do
    with_meta_data() |> where([i], i.user_id == ^user_id)
  end

  defp preload_client_address(query) do
    query |> preload(:client_address)
  end

  defp preload_sender_address(query) do
    query |> preload(:sender_address)
  end

  defp preload_invoice_items(query) do
    query |> preload([items: ^order_invoice_items_by_id()])
  end

  defp order_invoice_items_by_id() do
    from(i in Items, order_by: i.id)
  end
end
