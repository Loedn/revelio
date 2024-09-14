defmodule RevelioWeb.CreateProjectLive do
  use RevelioWeb, :live_view
  alias Revelio.{Projects, Projects.Project}

  def mount(_params, _session, socket) do
    socket =
      assign(
        socket,
        form: to_form(Projects.change_project(%Project{}))
      )

    {:ok, socket}
  end

  def handle_event("validate", %{"project" => params}, socket) do
    changeset =
      %Project{}
      |> Projects.change_project(params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :form, to_form(changeset))}
  end

  def handle_event("create", %{"project" => params}, socket) do
    case Projects.create_project(socket.assigns.current_user, params) do
      {:ok, project} ->
        changeset = Projects.change_project(%Project{})
        socket = assign(socket, :form, to_form(changeset))
        {:noreply, push_navigate(socket, to: ~p"/project?#{[id: project]}")}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :form, to_form(changeset))}
    end
  end
end
