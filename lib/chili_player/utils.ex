# Utils functions to treat data in requests
defmodule Utils do
  @moduledoc """
    ...
    Utils module will help in the treating of returned data requested
  """
  defmacro __using__(_) do
    quote do

      def content_type({ok, body, headers}) do
        {ok, body, content_type(headers)}
      end

      def content_type([]), do: "application/json"

      def content_type([{"Content-Type", val} | _]) do
        val
        |> String.split(";")
        |> List.first
      end

      def content_type([_| t]), do: content_type(t)
    end
  end
end