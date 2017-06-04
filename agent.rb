require "capybara"

class Agent
  HALOOGLASI = "https://www.halooglasi.com/nekretnine/izdavanje-stanova/novi-sad?cena_d_to=200&cena_d_unit=4&kvadratura_d_to=45&kvadratura_d_unit=1&broj_soba_order_i_to=5"

  HALO_OGLAS = ".product-item"

  def self.do_you_have_something_for_me?
    agent = new

    agent.say_hello
    agent.retrieve_latest
    agent.check_for_new
    agent.send_status_on_slack
  end

  def say_hello
    puts "Hey, I am Zlatan! The biggest shit on planet Earth."
    puts "I'll do my best to take you 40% of your monthly rent!"
    puts "Checking..."
  end

  def retrieve_latest
    oglasirs
    halooglasi
  end

  def check_for_new

  end

  def send_status_on_slack

  end

  private

  def initialize
    @db = Sequel.connect(ENV.fetch("HOMELESS_POSTGRES_URL"))
    @browser = Capybara.current_session
  end

  def oglasirs

  end

  def halooglasi
    @browser.visit HALOOGLASI

    puts @browser.all(HALO_OGLAS).count
    @browser.all(HALO_OGLAS).each do |oglas|
      @browser.within(oglas) do
        href = @browser.find(".ad-title > a")["href"]
        @browser.visit(href)
      end
    end
  end
end
