 #!/usr/bin/env ruby
require 'open-uri'

argument = ARGV[0]
source = open(argument).read

def skroty(str)
    str = str.gsub(/\s(bm)\./," bieżącego miesiąca")
	str = str.gsub(/\s(ds)\./," do spraw")
	str = str.gsub(/\s(cdn)\./," ciąg dalszy nastąpi")
	str = str.gsub(/\s(itd)\./," i tak dalej")
	str = str.gsub(/\s(itp)\./," i tym podobne")
	str = str.gsub(/\s(jw)\./," jak wyżej")
	str = str.gsub(/\s(r)\./," rok")
	str = str.gsub(/\s(ok)\./," około")
	str = str.gsub(/\s(m)\.(in)\./," między innymi")
	str = str.gsub(/\s(g)\./," godzina")
	str = str.gsub(/\s(n)\./," nad")
	str = str.gsub(/\s(p)\./," pan")
	str = str.gsub(/\s(t)\./," tom")
    str = str.gsub(/\s(al)\./," aleja")
    str = str.gsub(/\s(np)\./," na przykład")
    str = str.gsub(/\s(bł)\./," błogosławiony")
	str = str.gsub(/\s(dyr)\./," dyrektor")
	str = str.gsub(/\s(godz)\./," godzina")
    str = str.gsub(/\s(lic)\./," licencjat")
    str = str.gsub(/\s(mies)\./," miesiąc")
	str = str.gsub(/\s(tzn)\./," tak zwane")
    str = str.gsub(/\s(pl)\./," plac")	
    str = str.gsub(/\s(ul)\./," ulica")
    str = str.gsub(/\s(zob)\./," zobacz")
	str = str.gsub(/\s(b)\.(u)\./," bez uwag")
    str = str.gsub(/\s(n)\.(e)\./," naszej ery")
	str = str.gsub(/\s(p)\.(n)\.(e)\./, "przed naszą era")
	str = str.gsub(/\s(ob)\./," obywatel")
	str = str.gsub(/\s(os)\./," osiedle")
	str = str.gsub(/\s(por)\./," porównaj")
	str = str.gsub(/\s(proj)\./," proj")
	str = str.gsub(/\s(prof)\./," profesor")
	str = str.gsub(/\s(p)\.(o)\./," pełniący obowiązki")
	str = str.gsub(/\s{1}(s\.)\s{1}/," strony ")
	str = str.gsub(/\s(o)\.(o)\./," ograniczona odpowiedzialność")
	str = str.gsub(/(\d{1,2})\.(\d{1,2})\.(\d{4})/, '\1-\2-\3')
	str = str.gsub(/(\d{4})\.(\d{1,2})\.(\d{1,2})/, '\1-\2-\3') 
	str = str.gsub(/([0-9]+)\.([0-9]+)/,'\1:\2')
	str = str.gsub(/\s([A-Z]{1})\./, '\1')
end	

def table(str)
     str = str.gsub(/<\/?th\>/," ")
	 str = str.gsub(/<\/?table\>/,"USLI")
	 str = str.gsub(/<\/?td\>/, " ")
	 str = str.gsub(/<\/?tr\>/, ".")
end

def usunWWW(str)
     str = str.gsub(/(http(s)?(:\/\/))?(www\.)?[a-z\.\/]*(\.pl|\.html|\.com|\.org){1}/,"")
end

def znacznikiFormatujace(str)
      str = str.gsub(/(<\/?b\>)/,"")
	  str = str.gsub(/(<\/?i\>)/,"")
	  str = str.gsub(/(<\/?sup\>)/,"")
	  str = str.gsub(/(<\/?u\>)/,"")
	  str = str.gsub(/(<span((?!<\/?span).)*>)|(<\/span\>)/,"")
end

def znacznikiPoczatkowe(str)
     str = str.gsub(/\n/,"")
	 str = str.gsub(/\t/,"")
	 str = str.gsub(/(&#160;)|(&nbsp;)/," ")
	 str = str.gsub(/\r/,"")
end

def znacznikiScript(str)
      str = str.gsub(/<noscript\>((?!<\/noscript\>).)*<\/noscript\>/, "USLI")
	  str = str.gsub(/<script\>((?!<\/script\>).)*<\/script\>/, "USLI")
	  str = str.gsub(/<script type="text\/javascript">((?!<\/script\>).)*<\/script\>/,"USLI")
	  str = str.gsub(/<script type="text\/css">((?!<\/script\>).)*<\/script\>/,"USLI")
	  str = str.gsub(/<style((?!<\/style\>).)*>((?!<\/style\>).)*<\/style\>/,"USLI")
end

def znacznikiNiepotrzebne(str)
      str = str.gsub(/<nav((?!<\/nav\>).)*>((?!<\/nav\>).)*(<\/nav\>)/,"")
	  str = str.gsub(/(<a((?!<\/a\>).)*>)|(<\/a\>)/,"")
	  str = str.gsub(/<footer((?!<\/footer\>).)*>((?!<\/footer\>).)*(<\/footer\>)/,"")
	  str = str.gsub(/(<form((?!<\/form\>).)*>)|(<\/form\>)/,"")
	  str = str.gsub(/(<li((?!<\/li\>).)*\>)/,"")
	  str = str.gsub(/(<\/li\>)/,",")
	  str = str.gsub(/<ul id=((?!ul).)*(footer){1}((?!ul).)*\>((?!ul).)*<\/ul\>/,"USLI")
	  str = str.gsub(/<ol id=((?!ol).)*(footer){1}((?!ol).)*\>((?!ol).)*<\/ol\>/,"USLI")
end

def przecinek(str)
    str = str.gsub(/,,/, "")
	str = str.gsub(/,,/, "")
	str = str.gsub(/,,/, "")
	str = str.gsub(/,,/, "")
	str = str.gsub(/,,/, "")

end

def spacje(str)
     str = str.gsub(/\s\s/, " ")
	 str = str.gsub(/\s\s/, " ")
	 str = str.gsub(/\s\s/, " ")
	 str = str.gsub(/\s\s/, " ")
	 str = str.gsub(/\s\s/, " ")
end

#usuwa \n \t itp
str = znacznikiPoczatkowe(source)
str = znacznikiScript(str)
str = znacznikiFormatujace(str)
str = znacznikiNiepotrzebne(str)
str = table(str)
str = str.gsub(/<\/?[^>]*>/, "USLI")
str = str.gsub(/\n/,"")
str = str.gsub(/\t/,"")
str = skroty(str)
str = usunWWW(str)
str = spacje(str)
str = przecinek(str)

tablica = []



#dzieli na zdania
str = str.gsub(/"/, "")
str.split('USLI').each do |m|
      kropki = m.split('.')
	  kropki.each do |k| 
	  if k[0] == ","
     	  zmienna = k
		  zmienna[0] = ""
		  tablica.push(zmienna)
		  else
		     tablica.push(k)
		  end
		  
	  end
   
end

tab2 = [""]
#wyciąga wszystkie elementy tablicy które sa wielokrotnością białych znaków
def gets(files)
  files.select{ |i| i[/^(\s)+$/] }
end

przecin = [",", ":", " "]
tab3 = gets(tablica)

zadanie =  tablica - tab2 - tab3 - przecin

zadanie = zadanie.uniq


#wypisanie tablicy zdań
p "ZDANIA:"
for el in zadanie do p el end



