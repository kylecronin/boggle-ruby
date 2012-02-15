require './trie.rb'
require './board.rb'

def search(board, pos, dict, prefix)
  words = []
  
  if dict.is_word?
    words << prefix 
  end
  
  board.neighbor_iter(*pos) do |x, y|
    if dict.keys.member? board[x, y]
      recur = search(board, [x, y], dict[board[x, y]], prefix+board[x, y])
      words.concat(recur)
    end
  end

  words
end


board = Board.new($stdin.readlines.map {|line| line.scan(/\w/)})

dict = Trie.new()
File.open('/usr/share/dict/words').each do |line|
  dict.addword(line.chomp.downcase)
end


results = []
board.each do |x, y|
  results.concat(search(board, [x, y], dict[board[x, y]], board[x, y]))
end

results.uniq!
results.sort! {|a, b| a.size - b.size}

puts results