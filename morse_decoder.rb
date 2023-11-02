# Hash of the Morse symbols and their respective leters
MORSE_TO_LETTER = {
  '.-' => 'A', '-...' => 'B', '-.-.' => 'C', '-..' => 'D', '.' => 'E',
  '..-.' => 'F', '--.' => 'G', '....' => 'H', '..' => 'I', '.---' => 'J',
  '-.-' => 'K', '.-..' => 'L', '--' => 'M', '-.' => 'N', '---' => 'O',
  '.--.' => 'P', '--.-' => 'Q', '.-.' => 'R', '...' => 'S', '-' => 'T',
  '..-' => 'U', '...-' => 'V', '.--' => 'W', '-..-' => 'X', '-.--' => 'Y',
  '--..' => 'Z'
}.freeze

def decode_char(morse_char)
  yield MORSE_TO_LETTER[morse_char]
end

def decode_word(morse_word)
  morse_word.split(/\s{1}/).map { |char| decode_char(char) { |letter| letter } }.join
end

def decode(morse_message)
  morse_message.strip.split(/\s{3}/).map { |morse_word| decode_word(morse_word) }.join(' ')
end

decoded_message = decode('     .-   -... --- -..-   ..-. ..- .-.. .-..   --- ..-.   .-. ..- -... .. . ...')

puts "Decoded message: #{decoded_message}"
