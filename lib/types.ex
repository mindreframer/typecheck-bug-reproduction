### succeeds typecheck
defmodule Types.Ad do
  use TypeCheck
  defstruct id: nil, consumer_price: nil

  @type! t :: %Types.Ad{
           id: number(),
           consumer_price: number()
         }

  @spec! from_db(any) :: t()
  def from_db(row) do
    %Types.Ad{
      id: Map.get(row, "id")
    }
  end
end

### Fails typecheck
defmodule Types.Ad3 do
  use TypeCheck
  defstruct id: nil

  @type! t :: %Types.Ad3{
           id: number()
         }

  @spec! from_db(map) :: t()
  def from_db(row) do
    %Types.Ad3{}
  end
end
