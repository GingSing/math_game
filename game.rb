require_relative "question.rb"

class Game
  def initialize (player1, player2)
    refresh_question
    @player1 = player1
    @player2 = player2
    #checks for player's turn
    @player1_turn = true
    self.start
  end

  def refresh_question
    @question_obj = Question.new
  end

  def player
    @player1_turn ? @player1 : @player2
  end

  def check_answer (integer_input)
    if integer_input != @question_obj.answer
      @player1_turn ? @player1.lose_life : @player2.lose_life
      puts "Player #{player.name}: Seriously? No!"
    else
      puts "Player #{player.name}: YES! You are correct."
    end
  end

  def game_over?
    if @player1.lives > 0 && @player2.lives > 0 
      puts "----- NEW TURN -----"
      false
    else
      #if someone's lives are gone, it's the turn's owner so the other person wins
      puts "Player #{player.name} wins with a score of #{player.lives}/3"
      puts "----- GAME OVER -----"
      puts "Good bye!"
      true
    end
  end

  def start
    while true
      puts "Player #{player.name}: #{@question_obj.question}"
      print "> "
      integer_input = gets.chomp.to_i
      check_answer(integer_input)
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
      refresh_question
      @player1_turn = !@player1_turn
      return if game_over?
    end
  end
end