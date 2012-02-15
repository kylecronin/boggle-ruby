class Trie
  def initialize()
    @tree = {}
    @word = false
  end
  
  def addword(word)
    if word == ''
      @word = true
      return
    end
      
    if not @tree.key? word[0]
      @tree[word[0]] = Trie.new()
    end
    
    @tree[word[0]].addword(word[1..-1])
  end
  
  def [](letter)
    @tree[letter]
  end
  
  def is_word?()
    return @word
  end
  
  def keys()
    @tree.keys
  end
end