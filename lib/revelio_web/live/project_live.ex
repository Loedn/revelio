defmodule RevelioWeb.ProjectLive do
  use RevelioWeb, :live_view
  alias Revelio.Projects

  def mount(%{"id" => id}, _session, socket) do
    project = Projects.get_project!(id)
    {:ok, assign(socket, project: project)}
  end
end
