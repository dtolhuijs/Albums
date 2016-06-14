# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
artists = [
  ["Adele", "UK", "is an English singer and songwriter..."],
  ["Sia", "United States", "is an Australian singer and songwriter.
    She started her career as a singer in the local Adelaide acid jazz band Crisp in the mid-1990s..."],
  ["Coldplay", "UK", "are a British rock band formed in 1996 by lead vocalist and pianist Chris Martin and lead guitarist Jonny Buckland..."],
  ["Ellie Goulding", "UK", "Is an English singer and songwriter.
    Her career began when she met record producers Starsmith and Frankmusik,
    and she was later spotted by Jamie Lillywhite, who later became her manager and A&R..."]
]

artists.each do | name, country, bio |
   Artist.create( name: name, country: country, bio: bio )
end

#SONG
artist_songs = {}

artist_songs["Adele"] = [

        ["Hello", 2016,
        "https://www.fanduel.com/insider/wp-content/uploads/2015/10/Adele-1024x682.jpg",
        "Hello, it's me, I was wondering
        If after all these years you'd like to meet to go over everything
        They say that time's supposed to heal, yeah
        But I ain't done much healing..."],

        ["Rolling In The Deep", 2011,
        "https://s-media-cache-ak0.pinimg.com/originals/1a/24/31/1a243128067b112ba46d0a85d14a8640.jpg",
        "There's a fire starting in my heart
        Reaching a fever pitch
        And it's bringing me out the dark

        The scars of your love remind me of us
        They keep me thinking that we almost had it all
        The scars of your love, they leave me breathless
        I can't help feeling
        We could have had it all
        (You're gonna wish you never had met me)
        Rolling in the deep
        (Tears are gonna fall, rolling in the deep)
        You had my heart inside of your hand
        (You're gonna wish you never had met me)
        And you played it, to the beat
        (Tears are gonna fall, rolling in the deep)..."]
      ],

artist_songs["Sia"] = [

        ["Cheap Thrills", 2016,
        "http://www.huhmagazine.co.uk/images/uploaded/sia_cheapthrills_00.jpg",
        "Baby I don't need dollar bills to have fun tonight
        (I love cheap thrills)
        Baby I don't need dollar bills to have fun tonight
        (I love cheap thrills)..."]
      ],

artist_songs["Coldplay"] = [

        ["Hymn For The Weekend",2015,
        "http://www.djcruz.com/wp-content/uploads/2015/12/Coldplay_1-1024x1024.png",
        "life is a drink and love’s a drug
        oh now I think I must be miles up
        when I was a river dried up
        you came to rain a flood..."]
      ],

artist_songs["Ellie Goulding"] = [

          ["Dont Need Nobody", 2015,
          "http://i1.wp.com/a1.mzstatic.com/nz/r30/Music6/v4/db/37/df/db37df34-a161-a8ea-e458-072722c5d5f8/cover600x600.jpeg?w=648",
          "I've been too numb to understand
          I'm just a victim of the weapon in my hand
          So many casualties of love
          But I've been bulletproof, I'm staring at the sun

          I was the one you took home
          Never a flame to burn slow
          But I was hoping you'd see me a different way
          So many bodies I've touched
          Crushing around me like dust
          You are the realest thing I've never had to fake
          "]]

        artist_songs.each do | artist_name, songs |
        artist = Artist.find_by( name: artist_name )

        songs.each do | title, year, cover, lyrics |
        Song.create( title: title, artist: artist, year: year, cover: cover, lyrics: lyrics )
      end
    end
