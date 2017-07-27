require 'account' #creating test file without the actual class first
require "statistics"
describe Account do
   describe '#initalize' do
       it 'should create a new checking account with zero balance' do
           a =Account.new(:checking)
           #exepect = assertions - -verifications/ validations
           expect(a.type).to eql(:checking)
           expect(a.amount).to eql(0)
           expect(a.transactions.size).to eql (0)
       end
   end 
   
   describe '#deposit' do
       it 'should add 75$ to a new savings account' do
           a = Account.new(:savings)
           a.deposit(75)
           expect(a.balance).to eql(75)
           expect(a.transactions.size).to eql(1)
           t = a.transactions.first #check if the first txn record
           expect(t.type).to eql(:deposit)
    end
   end
   
   
      describe '#withdraw' do
       it 'should withdraw when funds are available' do
           a = Account.new(:checking)
           a.deposit(100)
           a.withdraw(25)
          expect(a.balance).to eql(75)            
           expect(a.transactions.size).to eql(2)
           t1 = a.transactions.first
           expect(t1.type).to eql(:deposit)
           expect(t1.amount).to eql(100)
           t2 = a.transactions[1]
           expect(t2.type).to eql(:withdraw)
           expect(t2.amount).to eql(25)
       end
       it 'should not withdraw when funds are insufficient' do
           a = Account.new(:checking)
           a.withdraw(25)
           expect(a.balance).to eql(-50)            
           expect(a.transactions.size).to eql(1)
           t1 = a.transactions.first
           expect(t1.type).to eql(:fee)
           expect(t1.amount).to eql(50)           
        end
   end
   
   
   
      describe '#filter_transactions' do
      it 'show all transactions' do
          a = Account.new(:savings)
          a.deposit(75)
          a.deposit(75)
          a.withdraw(25)
          trx = a.filter_transactions(:deposit)
          expect(trx.size).to eql(2)   
        end
        
         it 'returns deposit transactions checking account' do
          a = Account.new(:checking)
          a.withdraw(25)
          a.deposit(100)
          a.withdraw(25)
          expect(a.transactions.size).to eql(3)
          expect(a.filter_transactions(:deposit).size).to eql(1)
      end
      it 'return withdraw transactions in checking account' do
          a = Account.new(:checking)
          a.withdraw(25)
          a.deposit(100)
          a.withdraw(25)
          expect(a.transactions.size).to eql(3)
          expect(a.filter_transactions(:withdraw).size).to eql(1)
      end

      it 'return fee transactions in checking account' do
          a = Account.new(:checking)
          a.withdraw(25)
          a.deposit(100)
          a.withdraw(25)
          expect(a.transactions.size).to eql(3)
          expect(a.filter_transactions(:fee).size).to eql(1)
      end
  end


end 