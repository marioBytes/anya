defmodule AnyaWeb.InvoiceLive.Index do
  use AnyaWeb, :live_view

  alias Anya.Invoices
  alias Anya.Invoices.{Invoice, SenderAddress, ClientAddress, Item}
  alias Anya.IdGenerator

  @impl true
  def mount(_params, _session, %{assigns: %{current_user: current_user}} = socket) do
    {:ok, assign(socket, :invoice_collection, list_invoices(current_user.id))}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Invoice")
    |> assign(:invoice, Invoices.get_invoice!(id))
  end

  defp apply_action(socket, :new, _params) do
    invoice = %Invoice{
      client_address: %ClientAddress{},
      items: [%Item{temp_id: IdGenerator.generate_temp_id()}],
      sender_address: %SenderAddress{},
      invoice_date: set_default_date()
    }

    socket
    |> assign(:page_title, "New Invoice")
    |> assign(:invoice, invoice)
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Invoice")
    |> assign(:invoice, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, %{assigns: %{current_user: current_user}} = socket) do
    invoice = Invoices.get_invoice!(id)
    {:ok, _} = Invoices.delete_invoice(invoice)

    {:noreply, assign(socket, :invoice_collection, list_invoices(current_user.id))}
  end

  defp list_invoices(user_id) do
    Invoices.list_user_invoices(user_id)
  end

  defp set_default_date() do
    now = DateTime.utc_now()

    Enum.join([now.month, now.day, now.year], "/")
  end
end
