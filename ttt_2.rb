
#================================================ BOARD =============================================================
class Board
	attr_accessor :boardcase

# On initialise un ensemble de cases qui ont par défaut un numéro, qui sera affiché
  def initialize
    @boardcase = [
    BoardCase.new("1"),
    BoardCase.new("2"),
    BoardCase.new("3"), 
    BoardCase.new("4"),
    BoardCase.new("5"),
    BoardCase.new("6"),
    BoardCase.new("7"),
    BoardCase.new("8"),
    BoardCase.new("9"),
    ]
# Lors de l'initalisation, on veut voir ce qu'il y a dans les cases, donc on appelle la méthode en dessous    
    print_case_value
  end

# Méthode qui affiche pour chaque case la valeur (pour la forme : on a fait au mieux !)
  def print_case_value
    puts
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

# Méthode qui change la valeur d'un pion donné, en fonction de la réponse du joueur
  def change_value(choice,pion)
    @boardcase[choice-1].value = pion # Le -1 permet de repérer la position de la réponse dans le tableau
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

# Méthode qui met une erreur si la case indiquée par l'utilisateur a déjà été remplie
  def error_letter(choice)
    if @boardcase[choice-1].value == "X" || @boardcase[choice-1].value == "O"
    puts "Cette case a déjà été choisie !"
    true 
    
    else false
    end
  end


# Méthode qui arrête le jeu : on identifie les combinaisons gagnantes !
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

#================================================ BOARDCASE =========================================================

class BoardCase
  attr_accessor :value

  def initialize(value)
    @value = value
  end

# Pour une case, renvoie la valeur
  def print_value
  	puts "la valeur de #{@id} est #{@value}"
  end

end

#============================================= PLAYER =======================================================

class Player 
	attr_accessor :firstname, :symbol

# On attribue au joueur un prénom et un symbole avec lequel il jouera (X ou O !)  
  def initialize(firstname,symbol)
  	@firstname = firstname
    @symbol = symbol
    puts "#{@firstname}, vous jouerez avec les #{symbol} ! Soyez attentif ;)"
  end

end

#=============================================== GAME =====================================================

class Game
	attr_accessor :players, :board

  def initialize
    puts "Chers joueurs, bienvenue dans cette partie inédite de Tic Tac Toe"
    puts "Aussi connue sous le nom de... Morpion !"
    puts

# On demande les noms des joueurs et on crée de nouvelles instances de la class Player
    puts "Quel est le nom du premier joueur ?"
    player1_firstname = gets.chomp
    player1 = Player.new(player1_firstname, "X")
    puts
    puts "Quel est le nom du deuxième joueur ?"
    player2_firstname = gets.chomp  
    player2 = Player.new(player2_firstname, "O")

# On attribut à la partie les nouveaux joueurs
    @players = [player1, player2]  

# On attribut à la partie un nouveau Board
    @myboard = Board.new #ça initialise un nouveau board
  
# ============================ Let the game begin !==================================================
    9.times do |n|

# On fait appel à la fonction play qui lance les instructions      
      play(n)

# On met une condition pour savoir si un des joueurs a gagné ou pas
      if is_over == true 
        puts "FÉLICITATIONS !!! #{@players[n%2].firstname} a gagné !"
        break
      end

# Si n = 8, c'est en fait le 9ème tour ! Cela veut dire qu'aucun joueur n'a gagné    
      if n == 8
        puts "Match nul ! Bien joué #{player1.firstname} et #{player2.firstname} !"
      end
    end

# On appelle la méthode qui crée une nouvelle partie    
  new_party

end

# Parce qu'une seule partie de Morpion, c'est triste :)
  def new_party
  puts "Voulez-vous refaire une partie ? Y/N"
    if gets.chomp == "Y"
      mynewgame = Game.new
    else
      puts "Tant pis, à la prochaine :)"
    end
  end 

# On définit le contenu d'une partie
  def play(n)

# Le modulo nous permet de savoir si c'est le joueur 0 ou 1 qui joue    
    i = n%2   
    puts "#{@players[i].firstname}, sur quelle case souhaitez-vous jouer votre #{@players[i].symbol} ?"    
    choice = gets.chomp.to_i

# On vérifie que le chiffre du joueur n'a pas été déjà été choisi, ou qu'il n'est pas une lettre      
    while @myboard.error_number(choice) == true || @myboard.error_letter(choice) == true
      puts "#{@players[i].firstname} sur quelle case souhaitez vous jouer?" 
      choice = gets.chomp.to_i
    end

# On change la valeur des cases du morpion en fonction de la réponse du joueur    
    @myboard.change_value(choice,@players[i].symbol)

# On affiche le board, histoire de suivre un peu quelque chose au jeu ;)
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

#====================== Initialization d'une nouvelle partie ===================================

mygame = Game.new




