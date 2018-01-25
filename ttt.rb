require 'pry'

#================================== BOARD =============================================
class Board
	attr_accessor :boardcase

# Méthode qui affiche pour chaque case la valeur (forme à revoir ;))
  def print_case_value
    puts "Voici l'état du jeu"
    puts boardcase[0].value + "|" + boardcase[1].value + "|" + boardcase[2].value
    puts "- - -"
    puts boardcase[3].value + "|" + boardcase[4].value + "|" + boardcase[5].value
    puts "- - -"
    puts boardcase[6].value + "|" + boardcase[7].value + "|" + boardcase[8].value
  end

# Méthode qui change la valeur d'un pion donné
  def change_value(choice,pion)
    boardcase[choice-1].value = pion
  end

# Méthode qui met une erreur si la valeur indiquée par l'utilisateur n'est pas un chiffre
  def error_number(choice)
    choice = choice.to_s      
    if choice.start_with?("1","2","3","4","5","6","7","8","9")
      false
    else 
      puts "Votre réponse doit être un nombre entre 1 et 9 !"
      true
    end
  end

# Méthode qui met une erreur si la valeur indiquée par l'utilisateur a déjà été remplie
  def error_letter(choice)
    if boardcase[choice-1].value == "X" || boardcase[choice-1].value == "O"
    puts "Cette case a déjà été choisie !"
    true 
    
    else false
    end
  end


# Méthode qui arrête le jeu
  def game_stops
    if boardcase[0].value == boardcase[1].value && boardcase[1].value == boardcase[2].value 
      stop = true
    elsif boardcase[3].value == boardcase[4].value && boardcase[4].value == boardcase[5].value
      stop = true  
    elsif boardcase[6].value == boardcase[7].value && boardcase[7].value == boardcase[8].value 
      stop = true
    elsif boardcase[0].value == boardcase[3].value && boardcase[3].value == boardcase[6].value
      stop = true
    elsif boardcase[1].value == boardcase[4].value && boardcase[4].value == boardcase[7].value
      stop = true
    elsif boardcase[2].value == boardcase[5].value && boardcase[5].value == boardcase[8].value
      stop = true
    elsif boardcase[0].value == boardcase[4].value && boardcase[4].value == boardcase[8].value
      stop = true
    elsif boardcase[2].value == boardcase[4].value && boardcase[4].value == boardcase[6].value
      stop = true
    else  stop = false
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

end

#===================================== PLAYER =========================================
class Player 
	attr_accessor :firstname
  
  def initialize(firstname)
  	@firstname = firstname
  end

end

#=========================== GAME =========================================
class Game
	attr_accessor :players, :board

# Méthode qui arrête le jeu si les lignes ou diagonales comportent le même caractère
  def is_over
    if board.game_stops == true
      puts "Game Over"
      true
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

9.times do |round|

  if (round +1) % 2 != 0

  puts "#{player1_firstname} sur quelle case souhaitez vous jouer?"

  choice = gets.chomp.to_i
  #puts choice.class

# Si le choix a déjà été choisi, on refait un get_chomps
  while myboard.error_number(choice) == true || myboard.error_letter(choice) == true
    puts "#{player1_firstname} sur quelle case souhaitez vous jouer?" 
    choice = gets.chomp.to_i
  end

# On récupère le choix de l'utilisateur pour modifier la valeur la case correspondant
  myboard.change_value(choice, "X")
  myboard.print_case_value
  myboard.game_stops

# On définit les mêmes fonctions pour le deuxième utilisateur
  else

  puts "#{player2_firstname} sur quelle case souhaitez vous jouer?"
  choice = gets.chomp.to_i


  while myboard.error_number(choice) == true || myboard.error_letter(choice) == true
  puts "#{player2_firstname} sur quelle case souhaitez vous jouer?"
  choice = gets.chomp.to_i
  end

  myboard.change_value(choice, "O")
  myboard.print_case_value
  myboard.game_stops
  end

# On arrête le jeu quand notre condition est vraie  
  break if mygame.is_over == true
  end

end