require 'pry'

#================================== BOARD =============================================
class Board
	attr_accessor :boardcase

# Méthode qui affiche pour chaque case la valeur (forme à revoir ;))
  def print_case_value
    puts boardcase[0].value + "|" + boardcase[1].value + "|" + boardcase[2].value
    puts "- - -"
    puts boardcase[3].value + "|" + boardcase[4].value + "|" + boardcase[5].value
    puts "- - -"
    puts boardcase[6].value + "|" + boardcase[7].value + "|" + boardcase[8].value
  end

# Méthode qui change la valeur d'un pion donné
  def change_value(choice,pion)
   #rajouter condition qui dit que si un pion est déjà sur une case ça va pas le faire 
    boardcase[choice-1].value = pion
  end

# Méthode qui arrête le jeu
  def games_stops
    if boardcase[0].value == boardcase[1].value && boardcase[1].value == boardcase[2].value
      puts "Game OVER" 
    elsif boardcase[3].value == boardcase[4].value && boardcase[4].value == boardcase[5].value
      puts "Game OVER" 
    elsif boardcase[6].value == boardcase[7].value && boardcase[7].value == boardcase[8].value 
      puts "Game OVER"
    elsif boardcase[0].value == boardcase[3].value && boardcase[3].value == boardcase[6].value
      puts "Game OVER"
    elsif boardcase[1].value == boardcase[4].value && boardcase[4].value == boardcase[7].value
      puts "Game OVER"
    elsif boardcase[2].value == boardcase[5].value && boardcase[5].value == boardcase[8].value
      puts "Game OVER"
    elsif boardcase[0].value == boardcase[4].value && boardcase[4].value == boardcase[8].value
      puts "Game OVER"
    elsif boardcase[2].value == boardcase[4].value && boardcase[4].value == boardcase[6].value
      puts "Game OVER"
    else puts "Game continues!"
    end
  end
end

#================================== BOARDCASE =========================================
class BoardCase
  attr_accessor :id, :value

  def initialize(id,value)
    @id = id
    @value = value
  end

# Pour une case, renvoie la valeur
  def print_value
  	puts "la valeur de #{@id} est #{@value}"
  end

  def change_value(pion)
  	@value = pion
  end

  def hash_change_value(id, pion)
    @my_hash = Hash.new
   
    @my_hash[@id] = pion
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

	def self.actions
# Si le tour est impair > joueur 1, si le tour est pair, joueur 2
		puts "Joueur 1, your turn! Sur quelle case voulez-voulez vous plasser votre pion ?"

# Un truc se passe sur boardcase		Board.

	end


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
a1 = BoardCase.new("A1","1"),
a2 = BoardCase.new("A2","2"),
a3 = BoardCase.new("A3","3"),
b1 = BoardCase.new("B1","4"),
b2 = BoardCase.new("B2","5"),
b3 = BoardCase.new("B3","6"),
c1 = BoardCase.new("C1","7"),
c2 = BoardCase.new("C2","8"),
c3 = BoardCase.new("C3","9"),
]

#====================== Début du jeu ===================================
myboard.print_case_value

puts "#{player1_firstname} sur quelle case souhaitez vous jouer?"
choice = gets.chomp.to_i

myboard.change_value(choice, "X")
myboard.print_case_value

myboard.games_stops

puts "#{player2_firstname} sur quelle case souhaitez vous jouer?"
choice = gets.chomp.to_i
myboard.print_case_value

myboard.change_value(choice, "O")
myboard.print_case_value

myboard.games_stops

puts "#{player1_firstname} sur quelle case souhaitez vous jouer?"
choice = gets.chomp.to_i

myboard.change_value(choice, "X")
myboard.print_case_value

myboard.games_stops

puts "#{player1_firstname} sur quelle case souhaitez vous jouer?"
choice = gets.chomp.to_i

myboard.change_value(choice, "X")
myboard.print_case_value

myboard.games_stops

puts "#{player2_firstname} sur quelle case souhaitez vous jouer?"
choice = gets.chomp.to_i
myboard.print_case_value

myboard.change_value(choice, "O")
myboard.print_case_value

myboard.games_stops

puts "#{player1_firstname} sur quelle case souhaitez vous jouer?"
choice = gets.chomp.to_i

myboard.change_value(choice, "X")
myboard.print_case_value

myboard.games_stops

