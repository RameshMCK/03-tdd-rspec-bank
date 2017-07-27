require 'transaction'

class Account

    attr_reader :type, :amount ,:transactions, :mean, :median, :stddev
    attr_accessor :balance

    
    def initialize(type)
        @type  = type
        @amount =0 
        @transactions=[]# # of tansacions to hold
        @balance =0 
        @mean =0
        @median=0
        @stddev=0
    end
    
    def deposit(amount)
        t = Transaction.new(:deposit,amount)
        @balance+= amount
        @transactions << t
    end

    def fee(amount)
        @balance -= amount
        t = Transaction.new(:fee, amount)
        @transactions << t
    end
 
    def withdraw(amount)
      type = nil
      if @balance >= amount
          @balance -=amount
          type = :withdraw
      else
          @balance -= 50
          type = :fee
          amount = 50
      end
      t = Transaction.new(type, amount)
        @transactions << t
  end    

 def filter_transactions(type=nil)
          if type==nil
              @transactions
          else
              @transactions.select{|txn| txn.type==type}
          end     
          #other way to filter using ternary operator
          #type ? @transactions.select {|t| t.type ==type} : @transactions
  end
  
#   def stats(type)
#       size = @transactions.size #get the #of items in the array
#       amtarry =@transactions.map{|t|t.amount}
#       totamout = amtarry.map{|v|v}.sum
#       @mean = totamout/size
      
#       i=0
#       sdiff=0
#         while  i <size do
#           ival = amtarry[i]
#           ival = (ival- @mean).abs ** 2
#           sdiff += ival
#           i +=1
#         end
    
#         @stddev = Math.sqrt(sdiff)
        
#         stat        = {}
#         stat[:mean]  = @mean
#         stat[:stddev] = @stddev

#         return stat
#   end
end    