class Transaction
    #kind of enumerstor to have constants that can be read and not modified
    #create getters using attr_reader. this is to avoid multiple getter and setters
    #attr_reaer creates instance methods
    attr_reader :type, :amount, :date
    def initialize(type, amount)
        @type =  type
        @amount= amount
        @date = Time.now    
    
    end
end
