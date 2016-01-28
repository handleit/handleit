module ApplicationHelper
  class TeamMember
    def initialize nick:, name:, extension:"jpg", github:true
      @nick, @name, @extension, @github = nick, name, extension, github
    end

    attr_reader :nick, :name

    def github?
      !!@github
    end

    def avatar; "team/#{nick}.#{@extension}"; end
    def url; "https://github.com/#{nick}"; end
  end

  class Client
    def initialize image:, name:, url:
      @image, @name, @url = image, name, url
    end

    attr_reader :name, :url

    def image_uri
      @image.match(%r{\Ahttps?://}) ? @image : "clients/#{@image}"
    end
  end

  def team_members
    [
      TeamMember.new( nick:"acook",      name:"Anthony Cook"                          ),
      TeamMember.new( nick:"dannyg",     name:"Danny Govea",          github:false    ),
      TeamMember.new( nick:"davidvii",   name:"David Becerra",        extension:"png" ),
      TeamMember.new( nick:"epochwolf",  name:"Brad Majewski"                         ),
      TeamMember.new( nick:"firedev",    name:"Nick Ostrovsky"                        ),
      TeamMember.new( nick:"mrbongiolo", name:"Ralf Schmitz Bongiolo"                 ),
      TeamMember.new( nick:"rhizome",    name:"Eric Hill"                             ),
      TeamMember.new( nick:"rthbound",   name:"Ryan T. Hosford"                       ),
      TeamMember.new( nick:"rubenrails", name:"Ruben Ascencio"                        ),
      TeamMember.new( nick:"smathy",     name:"Jason King"                            ),
      TeamMember.new( nick:"solnic",     name:"Piotr Solnica"                         ),
      TeamMember.new( nick:"tubbo",      name:"Tom Scott"                             ),
      TeamMember.new( nick:"waseem",     name:"Waseem Ahmad"                          ),
    ].shuffle
  end

  def clients
    [
      Client.new( image: "westpac.png", name: "Westpac Banking Corporation", url: "http://www.westpac.com.au/" ),
      Client.new( image: "hcf.png", name: "HCF Insurance", url: "http://www.hcf.com.au/" ),
      Client.new( image: "amco.svg", name: "Amco", url: "http://www.amco.me/" ),
      Client.new( image: "telstra.svg", name: "Telstra", url: "https://www.telstra.com.au/" ),
      Client.new( image: "optus.jpg", name: "Optus", url: "http://www.optus.com.au/" ),
      Client.new( image: "news digital media.jpg", name: "News Digital Media", url: "http://www.newscorpaustralia.com/" ),
      Client.new( image: "vividwireless.png", name: "VividWireless", url: "http://www.vividwireless.com.au/" ),
      Client.new( image: "peerstreet.png", name: "PeerStreet", url: "https://www.peerstreet.com/" ),
      Client.new( image: "curious minds.png", name: "Curious Minds", url: "http://www.curiousminds.com/" ),
      Client.new( image: "1800 flowers.png", name: "1800-Flowers", url: "http://www.1800flowers.com/" ),
      Client.new( image: "kelley blue book.png", name: "Kelley Blue Book", url: "http://www.kbb.com/" ),
      Client.new( image: "barnes & noble.png", name: "Barnes & Noble", url: "http://www.barnesandnoble.com/" ),
      Client.new( image: "cox communications.svg", name: "Cox Communications", url: "https://www.cox.com/" ),
      Client.new( image: "ideel.jpg", name: "Ideel", url: "https://www.ideel.com/" ),
      Client.new( image: "mtv.png", name: "MTV", url: "http://www.mtv.com/" ),
      Client.new( image: "vh-1.png", name: "VH-1", url: "http://www.vh1.com/" ),
      Client.new( image: "miss limpeza.png", name: "Miss Limpeza", url: "https://www.misslimpeza.com.br/" ),
    ].shuffle
  end

  def contact_us
    link_to "Contact Us", contact_us_uri
  end

  def contact_us_uri
    "mailto:sales@handle.it?subject=Help+me+obewan!"
  end

  def title
    return content_for :title if content_for? :title

    defaults = []
    defaults << :"pages.#{controller_name}.#{action_name}.title"
    defaults << :"pages.#{controller_name}.title"
    defaults << [ controller_name.titleize, action_name.titleize ].join(": ")

    I18n.t defaults.shift, default: defaults, key: content_for(:title_key)
  end

  def back_to_top
    content_tag :div, class: "row medium-12" do
      link_to content_tag(:div, '⌃', class: "back-to-top"), "#top", title: "Back to top"
    end
  end
end
