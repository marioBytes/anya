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

  defp preload_client_address(query) do
    query |> join(:inner, [i], ca in ClientAddress, on: ca.invoice_id == i.id)
  end

  defp preload_sender_address(query) do
    query |> join(:inner, [i], sa in SenderAddress, on: sa.invoice_id == i.id)
  end

  defp preload_invoice_items(query) do
    query |> join(:inner, [i], it in Item, on: it.invoice_id == i.id)
  end
end
