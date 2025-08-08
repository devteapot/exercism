defmodule NameBadge do
  def print(id, name, department) do
    if id == nil, do: "", else: "[#{id}] - "
      |> Kernel.<>("#{name} - ")
      |> Kernel.<>(if department == nil, do: "OWNER", else: String.upcase(department))
  end
end
