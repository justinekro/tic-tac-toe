require 'pry'


#================================== BOARD =============================================
class Board
	attr_accessor :boardcase
  
#  def initialize
#  end

	def print_case_value
		boardcase.each do |board|
		puts board.value
		end
	end

end


#================================== BOARDCASE =========================================
class BoardCase
  attr_accessor :id, :value
	
  def initialize(id)
    @id = id
    @value = "vide"
  end

  def value
  	puts "la valeur de #{@id} est #{@value}"
  end

end

#===================================== PLAYER =========================================
class Player 
	attr_accessor :firstname
  
  def initialize(firstname)
  	@firstname = firstname
  end

  def has_won
  end

end

#=========================== GAME =========================================
class Game
	attr_accessor :players, :board
end

#====================== Initialization ===================================

# On initialise une NOUVELLE PARTIE
mygame = Game.new

# On attribut à mygame un nouveau board
myboard = mygame.board = Board.new

# On demande les noms des joueurs
puts "Quel est le nom du premier joueur ?"
player1_firstname = gets.chomp

puts "Quel est le nom du deuxième joueur ?"
player2_firstname = gets.chomp

# On attribut à mygame de nouveaux joueurs et on utilise leur nom
player1 = Player.new(player1_firstname)
player2 = Player.new(player2_firstname)

# On attribut à BOARD des nouvelles instances de Boardcase

myboard.boardcase = [
a1 = BoardCase.new("A1"),
a2 = BoardCase.new("A2"),
a3 = BoardCase.new("A3"),
b1 = BoardCase.new("B1"),
b2 = BoardCase.new("B2"),
b3 = BoardCase.new("B3"),
c1 = BoardCase.new("C1"),
c2 = BoardCase.new("C2"),
c3 = BoardCase.new("C3"),
]


