defmodule Anya.Invoices do
  @moduledoc """
  The Invoices context.
  """

  import Ecto.Query, warn: false
  alias Anya.Repo

  alias Anya.Invoices.Invoice

  @doc """
  Returns the list of invoices.

  ## Examples

      iex> list_invoices()
      [%Invoice{}, ...]

  """
  def list_invoices do
    Repo.all(Invoice)
  end

  @doc """
  Gets a single invoice.

  Raises `Ecto.NoResultsError` if the Invoice does not exist.

  ## Examples

      iex> get_invoice!(123)
      %Invoice{}

      iex> get_invoice!(456)
      ** (Ecto.NoResultsError)

  """
  def get_invoice!(id), do: Repo.get!(Invoice, id)

  @doc """
  Creates a invoice.

  ## Examples

      iex> create_invoice(%{field: value})
      {:ok, %Invoice{}}

      iex> create_invoice(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_invoice(attrs \\ %{}) do
    %Invoice{}
    |> Invoice.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a invoice.

  ## Examples

      iex> update_invoice(invoice, %{field: new_value})
      {:ok, %Invoice{}}

      iex> update_invoice(invoice, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_invoice(%Invoice{} = invoice, attrs) do
    invoice
    |> Invoice.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a invoice.

  ## Examples

      iex> delete_invoice(invoice)
      {:ok, %Invoice{}}

      iex> delete_invoice(invoice)
      {:error, %Ecto.Changeset{}}

  """
  def delete_invoice(%Invoice{} = invoice) do
    Repo.delete(invoice)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking invoice changes.

  ## Examples

      iex> change_invoice(invoice)
      %Ecto.Changeset{data: %Invoice{}}

  """
  def change_invoice(%Invoice{} = invoice, attrs \\ %{}) do
    Invoice.changeset(invoice, attrs)
  end

  alias Anya.Invoices.SenderAddress

  @doc """
  Returns the list of sender_addresses.

  ## Examples

      iex> list_sender_addresses()
      [%SenderAddress{}, ...]

  """
  def list_sender_addresses do
    Repo.all(SenderAddress)
  end

  @doc """
  Gets a single sender_address.

  Raises `Ecto.NoResultsError` if the Sender address does not exist.

  ## Examples

      iex> get_sender_address!(123)
      %SenderAddress{}

      iex> get_sender_address!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sender_address!(id), do: Repo.get!(SenderAddress, id)

  @doc """
  Creates a sender_address.

  ## Examples

      iex> create_sender_address(%{field: value})
      {:ok, %SenderAddress{}}

      iex> create_sender_address(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sender_address(attrs \\ %{}) do
    %SenderAddress{}
    |> SenderAddress.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sender_address.

  ## Examples

      iex> update_sender_address(sender_address, %{field: new_value})
      {:ok, %SenderAddress{}}

      iex> update_sender_address(sender_address, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sender_address(%SenderAddress{} = sender_address, attrs) do
    sender_address
    |> SenderAddress.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a sender_address.

  ## Examples

      iex> delete_sender_address(sender_address)
      {:ok, %SenderAddress{}}

      iex> delete_sender_address(sender_address)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sender_address(%SenderAddress{} = sender_address) do
    Repo.delete(sender_address)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sender_address changes.

  ## Examples

      iex> change_sender_address(sender_address)
      %Ecto.Changeset{data: %SenderAddress{}}

  """
  def change_sender_address(%SenderAddress{} = sender_address, attrs \\ %{}) do
    SenderAddress.changeset(sender_address, attrs)
  end

  alias Anya.Invoices.ClientAddress

  @doc """
  Returns the list of client_addresses.

  ## Examples

      iex> list_client_addresses()
      [%ClientAddress{}, ...]

  """
  def list_client_addresses do
    Repo.all(ClientAddress)
  end

  @doc """
  Gets a single client_address.

  Raises `Ecto.NoResultsError` if the Client address does not exist.

  ## Examples

      iex> get_client_address!(123)
      %ClientAddress{}

      iex> get_client_address!(456)
      ** (Ecto.NoResultsError)

  """
  def get_client_address!(id), do: Repo.get!(ClientAddress, id)

  @doc """
  Creates a client_address.

  ## Examples

      iex> create_client_address(%{field: value})
      {:ok, %ClientAddress{}}

      iex> create_client_address(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_client_address(attrs \\ %{}) do
    %ClientAddress{}
    |> ClientAddress.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a client_address.

  ## Examples

      iex> update_client_address(client_address, %{field: new_value})
      {:ok, %ClientAddress{}}

      iex> update_client_address(client_address, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_client_address(%ClientAddress{} = client_address, attrs) do
    client_address
    |> ClientAddress.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a client_address.

  ## Examples

      iex> delete_client_address(client_address)
      {:ok, %ClientAddress{}}

      iex> delete_client_address(client_address)
      {:error, %Ecto.Changeset{}}

  """
  def delete_client_address(%ClientAddress{} = client_address) do
    Repo.delete(client_address)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking client_address changes.

  ## Examples

      iex> change_client_address(client_address)
      %Ecto.Changeset{data: %ClientAddress{}}

  """
  def change_client_address(%ClientAddress{} = client_address, attrs \\ %{}) do
    ClientAddress.changeset(client_address, attrs)
  end

  alias Anya.Invoices.Item

  @doc """
  Returns the list of items.

  ## Examples

      iex> list_items()
      [%Item{}, ...]

  """
  def list_items do
    Repo.all(Item)
  end

  @doc """
  Gets a single item.

  Raises `Ecto.NoResultsError` if the Item does not exist.

  ## Examples

      iex> get_item!(123)
      %Item{}

      iex> get_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_item!(id), do: Repo.get!(Item, id)

  @doc """
  Creates a item.

  ## Examples

      iex> create_item(%{field: value})
      {:ok, %Item{}}

      iex> create_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_item(attrs \\ %{}) do
    %Item{}
    |> Item.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a item.

  ## Examples

      iex> update_item(item, %{field: new_value})
      {:ok, %Item{}}

      iex> update_item(item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_item(%Item{} = item, attrs) do
    item
    |> Item.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a item.

  ## Examples

      iex> delete_item(item)
      {:ok, %Item{}}

      iex> delete_item(item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_item(%Item{} = item) do
    Repo.delete(item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking item changes.

  ## Examples

      iex> change_item(item)
      %Ecto.Changeset{data: %Item{}}

  """
  def change_item(%Item{} = item, attrs \\ %{}) do
    Item.changeset(item, attrs)
  end
end
