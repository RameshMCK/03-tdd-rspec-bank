require "customer"

class Transfer
attr_reader :xferamount, :fromaccount, :toaccount
    def initialize()
        @xferamount = xferamount
        @fromaccount = fromaccount
        @toaccount = toaccount
    end
    
    def transfer(xferamount,fromaccount,toaccount)
        
        toaccount.deposit(xferamount)
        fromaccount.withdraw(xferamount)
    end
    
end