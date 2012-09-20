require "./lib/web_warcards/version"
require 'sinatra'
require 'warcards'
require 'sinatra/reloader' if development?

set :protection, :except => :ip_spoofing

def newgame
  @@questions         = Querinator::Game.new.get_questions(File.expand_path(Dir.glob("public/*.txt").first))
  @@game              = Cardgame::Game.new
  @@gameplay_instance = @@game.gameplay(:ai => @@game.ai, :player => @@game.player, :deck => @@game.deck)
  @@game.deck.shuffle!
  @@gameplay_instance.deal
end

configure do
  enable :sessions
end

get "/" do
  erb :index
end

get "/about" do
  erb :about
end

#get "/warcards/favicon.ico" do
#  favicon.ico
#end

get "/warcards/setup" do
  newgame
  response.delete_cookie 'difficulty'
  erb :setup
end

post '/warcards/verify' do
  response.set_cookie("difficulty", :value => params['difficulty'], :path => '/warcards')
  @difficulty = params['difficulty']
  response.set_cookie("player_name", :value => params['player_name'], :path => '/warcards')
  question_file = File.expand_path(Dir.glob("public/*.txt").first)
  @@questions   = Querinator::Game.new.get_questions(question_file)
  @filename     = params['filename']

  erb :verify, {:layout => :layout_warcards}
end

post '/warcards/play' do
  @params = params
  @answer = params['answer']
  erb :play_answer, {:layout => :layout_warcards}
end

get '/warcards/play' do
  @@gameplay_instance.game_over?
  @@gameplay_instance.rearm?
  @@gameplay_instance.show_cards
  @war_stringio = StringIO.new("")
  @@gameplay_instance.war?(@war_stringio)
  session[:result] = @@gameplay_instance.contest

  erb :play, {:layout => :layout_warcards}
end
