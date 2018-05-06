defmodule Fastimage.Dimensions do
  @moduledoc false
  alias __MODULE__

  defstruct width: nil,
            height: nil,
            channels: nil,
            bits_per_pixel: nil

  @type t :: %Dimensions{
          width: integer() | nil,
          height: integer() | nil,
          channels: integer() | nil,
          bits_per_pixel: integer() | nil
        }
end
