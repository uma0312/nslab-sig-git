class VendingMachine
  @@permitted_money = [10, 50, 100, 500, 1000]

  attr_accessor :items, :inserted_money

  def initialize()
    @items = Hash.new{|h, k| h[k] = []}
    @inserted_money = 0

    5.times{self.add(Drink.new("コーラ", 120))}
  end

  def permitted_money
    return @@permitted_money
  end

  def add(item)
    @items[item.name].push(item)
  end

  def insert_money(money)
    if @@permitted_money.include?(money)
      @inserted_money += money
    else
      puts "Returned: #{money}"
    end
  end

  def return_change(money)
    puts "Returned: #{@inserted_money}"
  end

  def purchase(name)
    if @inserted_money >= @items[name][0].price
      @inserted_money -= @items[name][0].price
      @items[name].delete_at(0) # Delete a purchased item
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