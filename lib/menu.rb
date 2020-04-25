class Menu

  attr_accessor :menu_list

  def initialize
    @menu_list = { 'Fish & Chips' => 4, 'Burger' => 3, 'Shawarma' => 5 }
  end

  def print_menu
    menu_list.collect { |dish, price| p [dish, '£' + price.to_s].join(' ') }
        .join(', ')
  end

  def add_dish_to_menu(dish, price)
    menu_list[dish] = price
  end

end