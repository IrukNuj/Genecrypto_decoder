require 'nkf'

letters_jp = ('ｱ'..'ﾝ').to_a.map { |chr| NKF.nkf('-h1w', NKF.nkf('-Xw', chr)) }

text = gets.split.map
decoded_text = ''

text.each do |a|
  is_downcase = a[0] == '（'
  is_dakuon = a.to_str.include?('"')
  puts "base_text: #{a}"
  puts "is_downcase?: #{is_downcase}"
  puts "is_dakuon?: #{is_dakuon}"
  # puts is_dakuon
	# if is_downcase

  # puts a.to_i - 1
  # puts is_downcase
  a.delete!('（').delete!('）') if is_downcase
  decoded_char = letters_jp[a.to_i - 1]
  decoded_char = (' ') if !decoded_char
  print is_downcase ? 'ぇ' : decoded_char
  is_downcase ? decoded_text<<('ぇ') : decoded_text<<(decoded_char)
  print '。' if a[-1] == '.'
  decoded_text<<('。') if a[-1] == '.'
  print '"' if is_dakuon
  decoded_text<<('"') if is_dakuon
  puts
  puts '-'*10
end

puts decoded_text
