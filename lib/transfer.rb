require 'pry'

class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver 
    @status = 'pending'
    @amount = amount
  end 

  def valid?
    if sender.valid? && receiver.valid?
      return true 
    else 
      return false 
    end
  end 

  def execute_transaction 
    if self.status == "pending" && valid? && sender.balance > amount
      receiver.balance += amount
      sender.balance -= amount
      self.status = "complete"
    else 
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end 
  end

    def reverse_transfer
      if self.status == "complete" && valid? && receiver.balance > amount
        sender.balance += amount 
        receiver.balance -= amount 
        self.status = "reversed"
      else 
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    end  

end 