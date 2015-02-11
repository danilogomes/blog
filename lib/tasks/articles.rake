namespace :articles do
	desc "Populate database with random articles"
	task :populate => [:environment] do
		puts "Carregando articles..."

		file = File.expand_path('../../assets/articles.json', __FILE__)
    articles = JSON.parse(File.read(file))

    cont = 0

    articles.each do |article|
    	new_article = Article.new
    	attrs = JSON.parse(article["attributes"])
    	new_article.title = attrs["title"]
    	new_article.body = article["body"]
    	new_article.save!

    	puts "Article '#{new_article.title}' foi adicionado."
    	puts ""
    	cont += 1
    end

    puts "Ufa, acabamos! Foram adicionados #{cont.to_s} articles."
	end
end