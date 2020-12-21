class DynamicPageController < ApplicationController
  def welcome
#Affichage d'un user(le premier) (qui a été créer grâce au fichier seeds.rb et a la BDD) ou alors recréer un User.new dans la console en supprimer tout les ancien users avec User.destroy_all
    #@user = User.first
    
#Comment sauvegarder en bdd et afficher le first_name de la personnes ex/alhost:3000/dynamic_page/Benoit
    puts "hello depuis le server"
    puts params[:first_name]
    puts "c'est fini"
    @user = User.new
    @user.first_name = params[:first_name]
    @user.save 
    puts @user
    
#Stocker tout les potins dans une variable @gossip
    @gossip = Gossip.all
  end
end
