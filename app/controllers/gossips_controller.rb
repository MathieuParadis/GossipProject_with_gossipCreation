class GossipsController < ApplicationController
  
  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
  end

  def show
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    puts "#" * 60
    puts "Inside gossips controller:"
    puts  @gossip_id = params[:id]
    puts "#" * 60

    @gossips = Gossip.all
    
  end

  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

  def create
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
    puts "$" * 60
    puts "ceci est le contenu de params :"
    puts params
    puts "$" * 60

    u = User.find(1)
    @gossip = Gossip.new(title: params[:gossip_title], content: params[:gossip_content], user: u) # avec xxx qui sont les données obtenues à partir du formulaire

    if @gossip.save # essaie de sauvegarder en base @gossip
      # si ça marche, il redirige vers la page d'index du site
      flash[:Notice] = "Potin créé avec succès"
      redirect_to :root
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      flash.now[:notice] = @gossip.errors.full_messages

      render :new
      puts "ZZ" * 60
      puts "Probleme:"
      puts params
      puts "ZZ" * 60
      p @gossip.errors.full_messages.class
      p @gossip.errors.full_messages.length
    end
  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end
end

