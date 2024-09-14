defmodule Revelio.ContractsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Revelio.Contracts` context.
  """

  @doc """
  Generate a contract.
  """
  def contract_fixture(attrs \\ %{}) do
    {:ok, contract} =
      attrs
      |> Enum.into(%{
        app_id: 42,
        arc56: "some arc56",
        arc_32: "some arc_32",
        name: "some name",
        valid_from: 42,
        version: 120.5
      })
      |> Revelio.Contracts.create_contract()

    contract
  end
end
