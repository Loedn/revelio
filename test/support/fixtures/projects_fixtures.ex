defmodule Revelio.ProjectsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Revelio.Projects` context.
  """

  @doc """
  Generate a project.
  """
  def project_fixture(attrs \\ %{}) do
    {:ok, project} =
      attrs
      |> Enum.into(%{
        emergency_email: "some emergency_email",
        identifier: "some identifier",
        name: "some name",
        verified: true
      })
      |> Revelio.Projects.create_project()

    project
  end
end
