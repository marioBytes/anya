defmodule Anya.InvoicesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Anya.Invoices` context.
  """

  @doc """
  Generate a invoice.
  """
  def invoice_fixture(attrs \\ %{}) do
    {:ok, invoice} =
      attrs
      |> Enum.into(%{
        client_email: "some client_email",
        client_name: "some client_name",
        description: "some description",
        payment_due: 42,
        payment_terms: "some payment_terms",
        status: "some status",
        total: 120.5,
        uuid: "some uuid"
      })
      |> Anya.Invoices.create_invoice()

    invoice
  end

  @doc """
  Generate a sender_address.
  """
  def sender_address_fixture(attrs \\ %{}) do
    {:ok, sender_address} =
      attrs
      |> Enum.into(%{
        city: "some city",
        country: "some country",
        post_code: "some post_code",
        street: "some street"
      })
      |> Anya.Invoices.create_sender_address()

    sender_address
  end

  @doc """
  Generate a client_address.
  """
  def client_address_fixture(attrs \\ %{}) do
    {:ok, client_address} =
      attrs
      |> Enum.into(%{
        city: "some city",
        country: "some country",
        post_code: "some post_code",
        street: "some street"
      })
      |> Anya.Invoices.create_client_address()

    client_address
  end

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        name: "some name",
        price: 42,
        quantity: 42,
        total: 42
      })
      |> Anya.Invoices.create_item()

    item
  end
end
