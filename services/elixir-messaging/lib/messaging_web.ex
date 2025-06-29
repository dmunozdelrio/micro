defmodule MessagingWeb do
  def controller do
    quote do
      use Phoenix.Controller, namespace: MessagingWeb
      import Plug.Conn
      alias MessagingWeb.Router.Helpers, as: Routes
    end
  end

  def router do
    quote do
      use Phoenix.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
