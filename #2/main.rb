require "./drink"
require "./vending_machine"

vending_machine = VendingMachine.new
5.times do 
  vending_machine.add(Drink.new("レッドブル", 200))
  vending_machine.add(Drink.new("水", 100))
end

vending_machine.insert_money(100)
vending_machine.insert_money(10)
vending_machine.insert_money(10)
puts vending_machine.purchasable_items
vending_machine.purchase("水")