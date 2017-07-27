require 'customer'

describe Transfer do

    describe "#transfer" do
        it 'should tansfer $30 from checking to savings and deduct 10% or 25$ mas fee' do
            sara = Customer.new("Sara Jones")
            sara.add_account(:checking)
            sara.add_account(:savings)
            sara.find_account(:checking).deposit(500)
            sara.find_account(:savings).deposit(100)
            expect(sara.find_account(:checking).balance).to eql(500)
            expect(sara.find_account(:savings).balance).to eql(100)

            chkact = sara.find_account(:checking)
            savact = sara.find_account(:savings)
            
            sara.transfer(30,:checking,:savings)
            expect(chkact.balance).to eql(470)
            expect(savact.balance).to eql(130)

       end 
    end
    
    
    
    
end