defmodule AnyaWeb.InvoiceLive.Index do
  use AnyaWeb, :live_view

  alias Anya.Invoices

  def mount(_params, _session, socket) do
    socket = socket |> assign(:invoices, list_invoices(socket))
    {:ok, socket}
  end

  def list_invoices(%{assigns: %{current_user: current_user}}) do
    Invoices.list_user_invoices(current_user.id)
  end
end
