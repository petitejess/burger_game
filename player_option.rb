require_relative './selected_item'

class PlayerOption
  def initialize(options)
    @options = options
    @selected_items = []
  end

  def add_selected(item, quantity)
    selected_item = SelectedItem.new(item, quantity)
    @selected_items << selected_item
  end

  def get_quantity(item)
    selected = @selected_items.find { |selected_item| selected_item.item === item}
    selected.quantity
  end

  def display_options
    @options.to_s
  end
end