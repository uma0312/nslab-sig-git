class VendingMachine
  attr_accessor :items, :permitted_money, :inserted_money
  attr_reader :sales

  def initialize()
    @items = Hash.new{|h, k| h[k] = []}
    @permitted_money = [10, 50, 100, 500, 1000]
    @inserted_money = 0
    @sales = 0

    5.times{self.add(Drink.new("コーラ", 120))}
  end

  def add(item)
    @items[item.name].push(item)
  end

  def insert_money(money)
    if @permitted_money.include?(money)
      @inserted_money += money
    else
      puts "#{money} returned."
    end
  end

  def purchase(name)
    price = @items[name][0].price
    if @inserted_money >= price
      @inserted_money -= price
      @items[name].delete_at(0) # Delete a purchased item
      @sales += price
      self.return_change
    else
      puts "#{name} is not purchasable!"
    end

  end

  def purchasable_items
    tmp = []
    @items.each do |name, items|
      if @inserted_money >= items[0].price
        tmp.push(items[0].to_s)
      end
    end
    return tmp
  end

  def return_change
    puts "#{@inserted_money} returned."
    @inserted_money = 0
  end
end