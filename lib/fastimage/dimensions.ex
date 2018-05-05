defmodule Fastimage.Dimensions do
  @moduledoc false
  alias __MODULE__

  defstruct width: nil,
            height: nil,
            depth: nil

  @type t :: %Dimensions{
          width: integer() | nil,
          height: integer() | nil,
          depth: integer() | nil
        }
end
