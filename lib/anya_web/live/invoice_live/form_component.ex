defmodule AnyaWeb.InvoiceLive.FormComponent do
  use AnyaWeb, :live_component

  alias Anya.Invoices
  alias Anya.Invoices.{Invoice, SenderAddress, ClientAddress, Item}
  alias Anya.IdGenerator

  @impl true
  def update(%{invoice: invoice} = assigns, socket) do
    changeset = Invoices.change_invoice(invoice)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"invoice" => invoice_params}, socket) do
    changeset =
      socket.assigns.invoice
      |> Invoices.change_invoice(invoice_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"invoice" => invoice_params}, socket) do
    save_invoice(socket, socket.assigns.action, invoice_params)
  end

  def handle_event("remove-item", %{"remove" => temp_id}, socket) do
    items =
      socket.assigns.changeset.changes.items
      |> Enum.reject(fn %{data: item} -> item.temp_id == temp_id end)

    changeset =
      socket.assigns.changeset
      |> Ecto.Changeset.put_assoc(:items, items)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("add-item", _, socket) do
    existing_items = Map.get(socket.assigns.changeset.changes, :items, socket.assigns.invoice.items)

    items =
      existing_items
      |> Enum.concat([
        Invoices.change_item(%Invoices.Item{temp_id: IdGenerator.generate_temp_id()})
      ])

    changeset = socket.assigns.changeset |> Ecto.Changeset.put_assoc(:items, items)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  defp save_invoice(socket, :edit, invoice_params) do
    case Invoices.update_invoice(socket.assigns.invoice, invoice_params) do
      {:ok, _invoice} ->
        {:noreply,
         socket
         |> put_flash(:info, "Invoice updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_invoice(socket, :new, invoice_params) do
    case Invoices.create_invoice(invoice_params) do
      {:ok, invoice} ->
        IO.inspect(invoice)
        {:noreply,
         socket
         |> put_flash(:info, "Invoice created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        IO.inspect(changeset)
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
