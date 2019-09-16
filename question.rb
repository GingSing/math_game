class Question

  attr_reader :question, :answer

  def initialize
    @numbers = []
    @question = self.generate_question(self.generate_random_number, self.generate_random_number)
    @answer = self.generate_answer
  end

  def generate_random_number
    rand(1..20)
  end

  def generate_answer
    @numbers[0] + @numbers[1]
  end

  def generate_question(number1, number2)
    @numbers.push(number1, number2)
    "What's does #{number1} plus #{number2} equal?"
  end

end  