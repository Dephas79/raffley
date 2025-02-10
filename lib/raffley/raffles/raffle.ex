defmodule Raffley.Raffles.Raffle do
  use Ecto.Schema
  import Ecto.Changeset

  schema "raffles" do
    field :description, :string
    field :image_path, :string, default: "/images/placeholder.jpg"
    field :prize, :string
    field :status, Ecto.Enum, values: [:upcoming, :open, :closed], default: :upcoming
    field :ticket_price, :integer, default: 1

    belongs_to :charity, Raffley.Charities.Charity

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(raffle, attrs) do
    raffle
    |> cast(attrs, [:prize, :description, :ticket_price, :status, :image_path, :charity_id])
    |> validate_required([:prize, :description, :ticket_price, :status, :image_path, :charity_id])
    |> validate_length(:description, min: 10)
    |> validate_number(:ticket_price, greater_than_or_equal_to: 1)
    |> assoc_constraint(:charity)
  end
end
