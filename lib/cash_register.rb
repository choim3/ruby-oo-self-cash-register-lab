class CashRegister

    attr_accessor :discount, :total, :items, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = []
    end

    # def total=(total)
    #     @total = total
    # end

    def add_item(name, price, quantity = 1)
        if quantity > 1
            i = 0
            while i < quantity
                @items << name
                i += 1
            end
        else
            @items << name
        end
        @total += price * quantity
        @last_transaction << (price * quantity)
    end

    def apply_discount
        #discount also can be used with @discount and is most likely more reliable.
        if discount > 0
            @total = @total - @total * discount / 100.0
            return "After the discount, the total comes to $#{@total.to_i}."
        else 
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total -= @last_transaction.pop
    end


end
