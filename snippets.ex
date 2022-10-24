# Dynamically call module attributes
def Mymodule do
  @source_workday "workday"
  @source_zoom "zoom"

  Enum.each([:workday, :zoom], fn method ->
    Module.eval_quoted(
      __MODULE__,
      Code.string_to_quoted("def tid(:#{method}) do
        @source_#{method}
      end
      ")
    )
  end)
end

# Datetime
DateTime.from_naive!(~N[2016-05-24 13:26:08.003], "Etc/UTC")
