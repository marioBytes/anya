defmodule Anya.InvoicesTest do
  use Anya.DataCase

  alias Anya.Invoices

  describe "invoices" do
    alias Anya.Invoices.Invoice

    import Anya.InvoicesFixtures

    @invalid_attrs %{client_email: nil, client_name: nil, description: nil, payment_due: nil, payment_terms: nil, status: nil, total: nil, uuid: nil}

    test "list_invoices/0 returns all invoices" do
      invoice = invoice_fixture()
      assert Invoices.list_invoices() == [invoice]
    end

    test "get_invoice!/1 returns the invoice with given id" do
      invoice = invoice_fixture()
      assert Invoices.get_invoice!(invoice.id) == invoice
    end

    test "create_invoice/1 with valid data creates a invoice" do
      valid_attrs = %{client_email: "some client_email", client_name: "some client_name", description: "some description", payment_due: 42, payment_terms: "some payment_terms", status: "some status", total: 120.5, uuid: "some uuid"}

      assert {:ok, %Invoice{} = invoice} = Invoices.create_invoice(valid_attrs)
      assert invoice.client_email == "some client_email"
      assert invoice.client_name == "some client_name"
      assert invoice.description == "some description"
      assert invoice.payment_due == 42
      assert invoice.payment_terms == "some payment_terms"
      assert invoice.status == "some status"
      assert invoice.total == 120.5
      assert invoice.uuid == "some uuid"
    end

    test "create_invoice/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Invoices.create_invoice(@invalid_attrs)
    end

    test "update_invoice/2 with valid data updates the invoice" do
      invoice = invoice_fixture()
      update_attrs = %{client_email: "some updated client_email", client_name: "some updated client_name", description: "some updated description", payment_due: 43, payment_terms: "some updated payment_terms", status: "some updated status", total: 456.7, uuid: "some updated uuid"}

      assert {:ok, %Invoice{} = invoice} = Invoices.update_invoice(invoice, update_attrs)
      assert invoice.client_email == "some updated client_email"
      assert invoice.client_name == "some updated client_name"
      assert invoice.description == "some updated description"
      assert invoice.payment_due == 43
      assert invoice.payment_terms == "some updated payment_terms"
      assert invoice.status == "some updated status"
      assert invoice.total == 456.7
      assert invoice.uuid == "some updated uuid"
    end

    test "update_invoice/2 with invalid data returns error changeset" do
      invoice = invoice_fixture()
      assert {:error, %Ecto.Changeset{}} = Invoices.update_invoice(invoice, @invalid_attrs)
      assert invoice == Invoices.get_invoice!(invoice.id)
    end

    test "delete_invoice/1 deletes the invoice" do
      invoice = invoice_fixture()
      assert {:ok, %Invoice{}} = Invoices.delete_invoice(invoice)
      assert_raise Ecto.NoResultsError, fn -> Invoices.get_invoice!(invoice.id) end
    end

    test "change_invoice/1 returns a invoice changeset" do
      invoice = invoice_fixture()
      assert %Ecto.Changeset{} = Invoices.change_invoice(invoice)
    end
  end

  describe "sender_addresses" do
    alias Anya.Invoices.SenderAddress

    import Anya.InvoicesFixtures

    @invalid_attrs %{city: nil, country: nil, post_code: nil, street: nil}

    test "list_sender_addresses/0 returns all sender_addresses" do
      sender_address = sender_address_fixture()
      assert Invoices.list_sender_addresses() == [sender_address]
    end

    test "get_sender_address!/1 returns the sender_address with given id" do
      sender_address = sender_address_fixture()
      assert Invoices.get_sender_address!(sender_address.id) == sender_address
    end

    test "create_sender_address/1 with valid data creates a sender_address" do
      valid_attrs = %{city: "some city", country: "some country", post_code: "some post_code", street: "some street"}

      assert {:ok, %SenderAddress{} = sender_address} = Invoices.create_sender_address(valid_attrs)
      assert sender_address.city == "some city"
      assert sender_address.country == "some country"
      assert sender_address.post_code == "some post_code"
      assert sender_address.street == "some street"
    end

    test "create_sender_address/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Invoices.create_sender_address(@invalid_attrs)
    end

    test "update_sender_address/2 with valid data updates the sender_address" do
      sender_address = sender_address_fixture()
      update_attrs = %{city: "some updated city", country: "some updated country", post_code: "some updated post_code", street: "some updated street"}

      assert {:ok, %SenderAddress{} = sender_address} = Invoices.update_sender_address(sender_address, update_attrs)
      assert sender_address.city == "some updated city"
      assert sender_address.country == "some updated country"
      assert sender_address.post_code == "some updated post_code"
      assert sender_address.street == "some updated street"
    end

    test "update_sender_address/2 with invalid data returns error changeset" do
      sender_address = sender_address_fixture()
      assert {:error, %Ecto.Changeset{}} = Invoices.update_sender_address(sender_address, @invalid_attrs)
      assert sender_address == Invoices.get_sender_address!(sender_address.id)
    end

    test "delete_sender_address/1 deletes the sender_address" do
      sender_address = sender_address_fixture()
      assert {:ok, %SenderAddress{}} = Invoices.delete_sender_address(sender_address)
      assert_raise Ecto.NoResultsError, fn -> Invoices.get_sender_address!(sender_address.id) end
    end

    test "change_sender_address/1 returns a sender_address changeset" do
      sender_address = sender_address_fixture()
      assert %Ecto.Changeset{} = Invoices.change_sender_address(sender_address)
    end
  end

  describe "client_addresses" do
    alias Anya.Invoices.ClientAddress

    import Anya.InvoicesFixtures

    @invalid_attrs %{city: nil, country: nil, post_code: nil, street: nil}

    test "list_client_addresses/0 returns all client_addresses" do
      client_address = client_address_fixture()
      assert Invoices.list_client_addresses() == [client_address]
    end

    test "get_client_address!/1 returns the client_address with given id" do
      client_address = client_address_fixture()
      assert Invoices.get_client_address!(client_address.id) == client_address
    end

    test "create_client_address/1 with valid data creates a client_address" do
      valid_attrs = %{city: "some city", country: "some country", post_code: "some post_code", street: "some street"}

      assert {:ok, %ClientAddress{} = client_address} = Invoices.create_client_address(valid_attrs)
      assert client_address.city == "some city"
      assert client_address.country == "some country"
      assert client_address.post_code == "some post_code"
      assert client_address.street == "some street"
    end

    test "create_client_address/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Invoices.create_client_address(@invalid_attrs)
    end

    test "update_client_address/2 with valid data updates the client_address" do
      client_address = client_address_fixture()
      update_attrs = %{city: "some updated city", country: "some updated country", post_code: "some updated post_code", street: "some updated street"}

      assert {:ok, %ClientAddress{} = client_address} = Invoices.update_client_address(client_address, update_attrs)
      assert client_address.city == "some updated city"
      assert client_address.country == "some updated country"
      assert client_address.post_code == "some updated post_code"
      assert client_address.street == "some updated street"
    end

    test "update_client_address/2 with invalid data returns error changeset" do
      client_address = client_address_fixture()
      assert {:error, %Ecto.Changeset{}} = Invoices.update_client_address(client_address, @invalid_attrs)
      assert client_address == Invoices.get_client_address!(client_address.id)
    end

    test "delete_client_address/1 deletes the client_address" do
      client_address = client_address_fixture()
      assert {:ok, %ClientAddress{}} = Invoices.delete_client_address(client_address)
      assert_raise Ecto.NoResultsError, fn -> Invoices.get_client_address!(client_address.id) end
    end

    test "change_client_address/1 returns a client_address changeset" do
      client_address = client_address_fixture()
      assert %Ecto.Changeset{} = Invoices.change_client_address(client_address)
    end
  end

  describe "items" do
    alias Anya.Invoices.Item

    import Anya.InvoicesFixtures

    @invalid_attrs %{name: nil, price: nil, quantity: nil, total: nil}

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Invoices.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Invoices.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      valid_attrs = %{name: "some name", price: 42, quantity: 42, total: 42}

      assert {:ok, %Item{} = item} = Invoices.create_item(valid_attrs)
      assert item.name == "some name"
      assert item.price == 42
      assert item.quantity == 42
      assert item.total == 42
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Invoices.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      update_attrs = %{name: "some updated name", price: 43, quantity: 43, total: 43}

      assert {:ok, %Item{} = item} = Invoices.update_item(item, update_attrs)
      assert item.name == "some updated name"
      assert item.price == 43
      assert item.quantity == 43
      assert item.total == 43
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Invoices.update_item(item, @invalid_attrs)
      assert item == Invoices.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Invoices.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Invoices.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Invoices.change_item(item)
    end
  end
end
