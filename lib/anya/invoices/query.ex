defmodule Anya.Invoices.Query do
  import Ecto.Query

  alias Anya.Accounts.User
  alias Anya.Invoices.{ClientAddress, Invoice, Item, SenderAddress}

  def base() do
    Invoice
  end

  def with_meta_data() do
    base
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
    query |> preload(:items)
  end
end
