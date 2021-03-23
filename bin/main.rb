#!/usr/bin/env ruby
puts "Welcome to Ruby's Tic-Tac-Toe!"

puts "\nEnter Player 1 name:"
player1 = gets.chomp.capitalize

puts "\nEnter Player 2 name:"
player2 = gets.chomp.capitalize

puts "\n#{player1} will play with X and #{player2} will play with O"

puts "\nLets Start!"
puts '[press ENTER to start]'
gets

player_turn = player1
cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
i = 0

(0..cells.length - 1).each do |_i|
  system('clear')
  system('cls')

  puts "+---+---+---+\n| #{cells[0]} | #{cells[1]} | #{cells[2]} |"
  puts '+---+---+---+'
  puts "| #{cells[3]} | #{cells[4]} | #{cells[5]} |"
  puts '+---+---+---+'
  puts "| #{cells[6]} | #{cells[7]} | #{cells[8]} |\n+---+---+---+"

  puts "\n"

  puts "It's #{player_turn}'s turn!"

  puts "\nPlease select an available cell from the board:"
  cell = gets.chomp

  while (cell =~ /\D/) || cell.empty? || cells[cell.to_i - 1] =~ /\D/
    puts "\nInvalid move. please enter a number from 1-9"
    cell = gets.chomp
  end

  if player_turn == player1
    cells[cell.to_i - 1] = 'X'
    player_turn = player2
  else
    cells[cell.to_i - 1] = 'O'
    player_turn = player1
  end

  if i == 3
    system('clear')
    system('cls')

    puts "\nIt's a DRAW!"

    puts "\n#{player1}, #{player2}, that was a great game!"
    gets
  end
  i += 1
end

result = player1

system('clear')
system('cls')

puts '+---+---+---+'
puts "| #{cells[0]} | #{cells[1]} | #{cells[2]} |"
puts '+---+---+---+'
puts "| #{cells[3]} | #{cells[4]} | #{cells[5]} |"
puts '+---+---+---+'
puts "| #{cells[6]} | #{cells[7]} | #{cells[8]} |"
puts '+---+---+---+'

if result == player1 || result == player2
  puts "\nCONGRATULATIONS!"
  puts "\n#{result} you WIN the game!"

else
  puts "\nIt's a DRAW!"
  puts "\n#{player1}, #{player2}, that was a great game!"

end
