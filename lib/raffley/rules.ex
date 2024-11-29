defmodule Raffley.Rules do
  def list_rules do
    [
      %{
        id: 1,
        text: "Participants must have a high tolerance for pans and dead jokes. 😃"
      },
      %{
        id: 2,
        text: "Winner must dance when collecting their prize, 💃"
      },
      %{
        id: 3,
        text: "Have fun! 🇼🇫"
      }
    ]
  end

  def get_rule(id) when is_integer(id) do
    Enum.find(list_rules(), fn r -> r.id == id end)
  end

  def get_rule(id) when is_binary(id) do
    id |> String.to_integer() |> get_rule()
  end
end
