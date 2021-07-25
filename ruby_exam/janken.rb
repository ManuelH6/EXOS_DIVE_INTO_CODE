# プレイヤー(自分)に「0~2」を入力させるロジックを書きます。
class Player
  def hand
    # プレイヤーにじゃんけんの手を選択させる文章を表示させます。
    puts "Veuillez saisir un nombre."
    puts "0: Goo, 1: Choki , 2: Par"
    # 変数「input_hand」にプレイヤーの入力値を代入します。
    # ヒント：getsメソッドについて調べてみましょう。
    input_hand = gets.to_i;
    while true
      if ((input_hand == 0) || (input_hand == 1) || (input_hand == 2))
        return input_hand;
      else
        puts "Veuillez saisir un nombre compris dans l'intervalle [0-2]"
        puts "0: Goo, 1: Choki , 2: Par"
        input_hand = gets.to_i;
      end
    end
  end
end
# 相手が「0~2」の値をランダムに生成するロジックを書きます。
class Enemy
  def hand
    # Goo、Choki、Parの値をランダムに取得する。
    enemy_hand = Random.new;
    return enemy_hand.rand(0..2);
  end
end
# プレイヤー(自分)が入力した「0~2」と、敵がランダムで生成した「0~2」をじゃんけんをさせて、その結果をコンソール上に出力するロジックを書きます。
class Janken
  def pon(player_hand, enemy_hand)
    # Remplacez ["goo", "choki", "par"] la variable "janken".
    janken = ["Goo", "Choki", "Par"]
    #「相手の手は#{相手の手}です。」と出力させます。
    if (player_hand == enemy_hand)
      puts "La main de l'autre partie est #{janken[enemy_hand]}"
      puts "Votre main est #{janken[player_hand]}"
      puts "Egalité"
      return true
    elsif ((player_hand == 0 && enemy_hand == 1) || (player_hand == 1 && enemy_hand == 2) || (player_hand == 2 && enemy_hand == 0))
      puts "La main de l'autre partie est #{janken[enemy_hand]}"
      puts "Votre main est #{janken[player_hand]}"
      puts "Vous avez gagné"
      return false;
    else
      puts "La main de l'autre partie est #{janken[enemy_hand]}"
      puts "Votre main est #{janken[player_hand]}"
      puts "Vous etes entrain de perdre"
      return false;
    end
  end
end
# Écrivez la logique pour exécuter le jeu roche-papier-ciseaux.
class GameStart
  # selfを使用することで、GameStartをインスタンス化することなく、クラス名を使ってjankenponメソッドを呼び出せます。
  def self.jankenpon
    # Remplacez le Player instancié par la variable "player".

    player = Player.new
    #Assignez une instanciation d'Enemy à la variable "ennemi".

    enemy = Enemy.new
    #Assignez une instanciation de Janken à la variable "janken".

    janken = Janken.new
    # 変数「next_game」に「true」を代入しましょう。
    # 「next_game」が「false」だと繰り返し処理を終了し、「true」だと繰り返し処理を継続します。
    next_game = true;

    while next_game
      # J'utilise des roche papier ciseaux avec "janken.pon (player.hand, ennemi.hand)".
      #「janken.pon(player.hand, enemy.hand)」でじゃんけんを実行しています。
      next_game = janken.pon(player.hand, enemy.hand)
    end
  end
end
# Appelez la méthode jankenpon avec le nom de la classe.
GameStart.jankenpon
