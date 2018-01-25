require 'pry'

#================================== BOARD =============================================
class Board
	attr_accessor :boardcase

  def initialize
    @boardcase = [
    BoardCase.new("A1","1"),
    BoardCase.new("A2","2"),
    BoardCase.new("A3","3"), 
    BoardCase.new("B1","4"),
    BoardCase.new("B2","5"),
    BoardCase.new("B3","6"),
    BoardCase.new("C1","7"),
    BoardCase.new("C2","8"),
    BoardCase.new("C3","9"),
    ]
    print_case_value
  end

# Méthode qui affiche pour chaque case la valeur (forme à revoir ;))
  def print_case_value
    puts "Voici où en est le jeu !"
    puts  
    puts "#############"   
    puts "# " + @boardcase[0].value + " # " + @boardcase[1].value + " # " + @boardcase[2].value + " #"
    puts "#############"
    puts "# " + @boardcase[3].value + " # " + @boardcase[4].value + " # " + @boardcase[5].value + " #"
    puts "#############"
    puts "# " + @boardcase[6].value + " # " + @boardcase[7].value + " # " + @boardcase[8].value + " #"
    puts "#############"
    puts

  end

# Méthode qui change la valeur d'un pion donné
  def change_value(choice,pion)
    @boardcase[choice-1].value = pion
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
    if @boardcase[choice-1].value == "X" || @boardcase[choice-1].value == "O"
    puts "Cette case a déjà été choisie !"
    true 
    
    else false
    end
  end


# Méthode qui arrête le jeu
  def game_stops
    if @boardcase[0].value == @boardcase[1].value && @boardcase[1].value == @boardcase[2].value 
      stop = true
    elsif @boardcase[3].value == @boardcase[4].value && @boardcase[4].value == @boardcase[5].value
      stop = true  
    elsif @boardcase[6].value == @boardcase[7].value && @boardcase[7].value == @boardcase[8].value 
      stop = true
    elsif @boardcase[0].value == @boardcase[3].value && @boardcase[3].value == @boardcase[6].value
      stop = true
    elsif @boardcase[1].value == @boardcase[4].value && @boardcase[4].value == @boardcase[7].value
      stop = true
    elsif @boardcase[2].value == @boardcase[5].value && @boardcase[5].value == @boardcase[8].value
      stop = true
    elsif @boardcase[0].value == @boardcase[4].value && @boardcase[4].value == @boardcase[8].value
      stop = true
    elsif @boardcase[2].value == @boardcase[4].value && @boardcase[4].value == @boardcase[6].value
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
	attr_accessor :firstname, :symbol
  
  def initialize(firstname,symbol)
  	@firstname = firstname
    @symbol = symbol
    puts "#{@firstname}, vous jouerez avec les #{symbol} ! Soyez attentif ;)"
  end

end

#=========================== GAME =====================================================
class Game
	attr_accessor :players, :board

  def initialize
    puts "Chers joueurs, bienvenue dans cette partie inédite de Tic Tac Toe"
    puts "Aussi connue sous le nom de... Morpion !"
    puts

# On attribut à mygame un nouveau board

# On demande les noms des joueurs
  puts "Quel est le nom du premier joueur ?"
  player1_firstname = gets.chomp
  player1 = Player.new(player1_firstname, "X")
  puts
  puts "Quel est le nom du deuxième joueur ?"
  player2_firstname = gets.chomp  
  player2 = Player.new(player2_firstname, "O")

# On attribut à mygame de nouveaux joueurs et on utilise leur nom
  @players = [player1, player2]  
  @myboard = Board.new #ça initialise un nouveau board
  
# On lance le jeu  
  9.times do |n|
    play(n)


    if is_over == true 
    puts "FÉLICITATIONS !!! #{@players[n%2].firstname} a gagné !"
    break
    end
    
    if n == 8
     puts "Match nul ! Bien joué #{player1.firstname} et #{player2.firstname} !"
    end
  end

  puts "Voulez-vous refaire une partie ? Y/N"
    if gets.chomp == "Y"
      mynewgame = Game.new
    else
      puts "Pas de souci, à la prochaine :)"
    end
  end 

# On définit le contenu d'une partie
  def play(n)
    i = n%2
    puts "#{@players[i].firstname}, sur quelle case souhaitez-vous jouer votre #{@players[i].symbol} ?"
    
    choice = gets.chomp.to_i
      
      while @myboard.error_number(choice) == true || @myboard.error_letter(choice) == true
      puts "#{@players[i].firstname} sur quelle case souhaitez vous jouer?" 
      choice = gets.chomp.to_i
      end
    
    @myboard.change_value(choice,@players[i].symbol)
    @myboard.print_case_value

  end

# Méthode qui arrête le jeu si les lignes ou diagonales comportent le même caractère
  def is_over
    if @myboard.game_stops == true
      puts "GAME OVER !"
      true
    end
  end

end

#====================== Initialization ===================================

# On initialise une NOUVELLE PARTIE
mygame = Game.new




