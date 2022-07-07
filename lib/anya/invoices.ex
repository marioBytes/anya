defmodule Anya.Invoices do
  import Ecto.Query, warn: false
  alias Anya.Repo

  alias Anya.Invoices
  alias Anya.Invoices.{Invoice, SenderAddress, ClientAddress, Item}
  alias Anya.Accounts

  def list_invoices do
    Repo.all(Invoice)
  end

  def list_user_invoices(user_id) do
    Invoices.Query.user_invoices(user_id) |> Repo.all()
  end

  def get_invoice!(id), do: Repo.get!(Invoice, id)

  def create_invoice(attrs \\ %{}) do
    %Invoice{}
    |> Invoice.changeset(attrs)
    |> Repo.insert()
  end

  def update_invoice(%Invoice{} = invoice, attrs) do
    invoice
    |> Invoice.changeset(attrs)
    |> Repo.update()
  end

  def delete_invoice(%Invoice{} = invoice) do
    Repo.delete(invoice)
  end

  def change_invoice(%Invoice{} = invoice, attrs \\ %{}) do
    Invoice.changeset(invoice, attrs)
  end

  def create_sender_address(attrs \\ %{}) do
    %SenderAddress{}
    |> SenderAddress.changeset(attrs)
    |> Repo.insert()
  end

  def update_sender_address(%SenderAddress{} = sender_address, attrs) do
    sender_address
    |> SenderAddress.changeset(attrs)
    |> Repo.update()
  end

  def delete_sender_address(%SenderAddress{} = sender_address) do
    Repo.delete(sender_address)
  end

  def change_sender_address(%SenderAddress{} = sender_address, attrs \\ %{}) do
    SenderAddress.changeset(sender_address, attrs)
  end

  def create_client_address(attrs \\ %{}) do
    %ClientAddress{}
    |> ClientAddress.changeset(attrs)
    |> Repo.insert()
  end

  def update_client_address(%ClientAddress{} = client_address, attrs) do
    client_address
    |> ClientAddress.changeset(attrs)
    |> Repo.update()
  end

  def delete_client_address(%ClientAddress{} = client_address) do
    Repo.delete(client_address)
  end

  def change_client_address(%ClientAddress{} = client_address, attrs \\ %{}) do
    ClientAddress.changeset(client_address, attrs)
  end

  def create_item(attrs \\ %{}) do
    %Item{}
    |> Item.changeset(attrs)
    |> Repo.insert()
  end

  def update_item(%Item{} = item, attrs) do
    item
    |> Item.changeset(attrs)
    |> Repo.update()
  end

  def delete_item(%Item{} = item) do
    Repo.delete(item)
  end

  def change_item(%Item{} = item, attrs \\ %{}) do
    Item.changeset(item, attrs)
  end
end
