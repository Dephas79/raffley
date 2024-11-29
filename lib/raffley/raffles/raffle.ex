defmodule Raffley.Raffles.Raffle do
  use Ecto.Schema
  import Ecto.Changeset

  schema "raffles" do
    field :description, :string
    field :image_path, :string, default: "/images/placeholder.jpg"
    field :prize, :string
    field :status, Ecto.Enum, values: [:upcoming, :open, :closed], default: :upcoming
    field :ticket_price, :integer, default: 1

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(raffle, attrs) do
    raffle
    |> cast(attrs, [:prize, :description, :ticket_price, :status, :image_path])
    |> validate_required([:prize, :description, :ticket_price, :status, :image_path])
  end
end
