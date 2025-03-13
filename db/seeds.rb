# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"

puts "Cleaning database..."

Booking.destroy_all
Lesson.destroy_all
User.destroy_all

CATEGORIES = ["Martial Arts", "Bodybuilding", "Sprinting", "Boxing", "Endurance", "Combat Training", "Tactical Combat", "Dance"]
DURATION = [30, 60, 90]
PRICE = [50, 75, 100, 150]
CAPACITY = [4, 6 , 8, 10]

CATEGORIESIMAGES = {
  "Martial Arts" => "bruce-lee",
  "Bodybuilding" => "arnold",
  "Sprinting" => "sprinting",
  "Boxing" => "boxing",
  "Endurance" => "gokuss",
  "Combat Training" => "chun-lee",
  "Tactical Combat" => "martial",
  "Dance" => "dancing"
}
puts "Creating trainers..."

trainers = [
  {
    name: "Goku",
    email: "goku@hero.com",
    password: "123123",
    bio: "A Saiyan warrior who constantly pushes his limits, Goku is the embodiment of endurance, strength, and relentless training.",
    experience: "A lifetime of intense training under the strongest masters in the universe.",
    specialties: "Endurance, Strength, Combat",
    category: "Endurance",
    address: "日本, 〒150-0002 東京都渋谷区渋谷２丁目１９番１２号",
    image: "https://static1.srcdn.com/wordpress/wp-content/uploads/2018/05/goku-mastered-ultra-instinct-6s.jpg"
  },
  {
    name: "Vegeta",
    email: "vegeta@hero.com",
    password: "123123",
    bio: "The proud Saiyan prince, Vegeta's ruthless training methods push his students to their absolute limits.",
    experience: "Years of intense Saiyan warrior training under extreme gravity and rigorous combat.",
    specialties: "Power, Combat Strategy, Mental Toughness",
    category: "Martial Arts",
    address: "日本, 〒150-0043 東京都渋谷区道玄坂２丁目１０番１２号",
    image: "https://c4.wallpaperflare.com/wallpaper/179/968/44/dragon-ball-super-dragon-ball-vegeta-super-saiyajin-blue-wallpaper-preview.jpg"
  },
  {
    name: "Luffy",
    email: "luffy@hero.com",
    password: "123123",
    bio: "The future Pirate King, Luffy's unconventional training style focuses on endurance, adaptability, and raw power.",
    experience: "Years of adventure and training with legendary pirates like Rayleigh and Garp.",
    specialties: "Agility, Stamina, Unconventional Fighting",
    category: "Endurance",
    address: "日本, 〒150-0043 東京都渋谷区道玄坂１丁目１６番１３号",
    image: "https://images4.alphacoders.com/135/1352902.jpeg"
  },
  {
    name: "Baki",
    email: "baki@hero.com",
    password: "123123",
    bio: "An underground fighter with extreme combat conditioning, Baki trains to surpass his legendary father, Yujiro Hanma.",
    experience: "Over 10 years of brutal combat training against the world's strongest fighters.",
    specialties: "Grappling, Striking, Combat Durability",
    category: "Combat Training",
    address: "日本, 〒150-0031 東京都渋谷区桜丘町９番１２号",
    image: "https://cdn-images.dzcdn.net/images/cover/6768854919cfa55d221df590873579bc/0x1900-000000-80-0-0.jpg"
  },
  {
    name: "All Might",
    email: "allmight@hero.com",
    password: "123123",
    bio: "The Symbol of Peace, All Might teaches what it means to be a true hero—both physically and mentally.",
    experience: "Decades of hero work and strength-based combat training.",
    specialties: "Strength, Willpower, Heroic Mindset",
    category: "Bodybuilding",
    address: "日本, 〒150-0036 東京都渋谷区南平台町１３番１０号",
    image: "https://i.pinimg.com/736x/e1/d0/ae/e1d0ae9e56018a2fda25b8bc90256092.jpg"
  },
  {
    name: "Mikey",
    email: "mikey@hero.com",
    password: "123123",
    bio: "The Invincible Mikey, leader of the Tokyo Manji Gang, is a master of high-speed, high-impact martial arts.",
    experience: "Years of street fighting experience, leading one of the most feared gangs in Tokyo.",
    specialties: "Kick Techniques, Speed, Combat Awareness",
    category: "Martial Arts",
    address: "日本, 〒150-0002 東京都渋谷区渋谷１丁目２３番２１号",
    image: "https://i.pinimg.com/736x/4e/d4/54/4ed4549ef232a8ba92ef89eae04d5777.jpg"
  },
  {
    name: "Naruto",
    email: "naruto@hero.com",
    password: "123123",
    bio: "From a mischievous outcast to the Hokage, Naruto's never-give-up attitude makes him a perfect mentor.",
    experience: "Years of ninja training under Jiraiya, Kakashi, and the Toad Sage techniques.",
    specialties: "Endurance, Chakra Control, Shadow Clone Training",
    category: "Martial Arts",
    address: "日本, 〒150-0036 東京都渋谷区南平台町１３番４号",
    image: "https://c4.wallpaperflare.com/wallpaper/580/180/49/anime-naruto-naruto-uzumaki-ninja-wallpaper-preview.jpg"
  },
  {
    name: "Rengoku",
    email: "rengoku@hero.com",
    password: "123123",
    bio: "The Flame Hashira, Rengoku's burning passion and discipline make him an exceptional trainer.",
    experience: "Rigorous Hashira training, specializing in swordsmanship and breathing techniques.",
    specialties: "Swordsmanship, Stamina, Flame Breathing Techniques",
    category: "Combat Training",
    address: "日本, 〒150-0043 東京都渋谷区道玄坂２丁目２９番５号",
    image: "https://w0.peakpx.com/wallpaper/554/825/HD-wallpaper-rengoku-demon-slayer.jpg"

  },
  {
    name: "Saitama",
    email: "saitama@hero.com",
    password: "123123",
    bio: "A hero for fun, Saitama's training routine made him the most powerful being, capable of defeating any opponent with a single punch.",
    experience: "Three years of the legendary '100 Pushups, 100 Situps, 100 Squats' routine.",
    specialties: "Power, Speed, Stamina",
    category: "Endurance",
    address: "日本, 〒150-0043 東京都渋谷区道玄坂２丁目２０番９号",
    image: "https://i.pinimg.com/736x/35/fb/66/35fb669fd3d93d70cea64b8a8f15e6e7.jpg"
  },
  {
    name: "Levi Ackerman",
    email: "levi@hero.com",
    password: "123123",
    bio: "The strongest soldier in humanity, Levi's combat skills, precision, and discipline make him a master of battlefield tactics.",
    experience: "A lifetime of elite soldier training and ODM mastery.",
    specialties: "Agility, Tactical Combat, Precision Strikes",
    category: "Tactical Combat",
    address: "日本, 〒150-0002 東京都渋谷区渋谷３丁目８番１２号",
    image: "https://www.chromethemer.com/download/hd-wallpapers/levi-ackerman-3840x2160.jpg"
  },
  {
    name: "Zoro",
    email: "zoro@hero.com",
    password: "123123",
    bio: "A master swordsman dedicated to becoming the strongest, Zoro trains with unmatched intensity.",
    experience: "Years of sword training under Mihawk and relentless self-discipline.",
    specialties: "Swordsmanship, Strength, Endurance",
    category: "Combat Training",
    address: "日本, 〒150-0043 東京都渋谷区道玄坂２丁目１６番７号",
    image: "https://4kwallpapers.com/images/walls/thumbs_3t/19795.jpg"
  },
  {
    name: "Ai",
    email: "ai@hero.com",
    password: "123123",
    bio: "A legendary idol, Ai specializes in performance training, charisma, and mental resilience.",
    experience: "Years of idol training and handling extreme pressure under public scrutiny.",
    specialties: "Charisma, Performance Training, Mental Strength",
    category: "Dance",
    address: "日本, 〒150-0044 東京都渋谷区円山町２番９号",
    image: "https://static.zerochan.net/Oshi.no.Ko.1024.3944919.webp"
  },
  {
    name: "Lisa",
    email: "lisa@hero.com",
    password: "123123",
    bio: "A world-famous K-pop idol and dancer, Lisa is known for her precision, fluidity, and stage presence in high-energy choreography.",
    experience: "Over a decade of professional dance training and performances.",
    specialties: "Hip-Hop Dance, Flexibility, Rhythm",
    category: "Dance",
    address: "日本, 〒150-0002 東京都渋谷区渋谷１丁目１０番３号",
    image: 'https://upload.wikimedia.org/wikipedia/commons/4/49/Blackpink%27s_Lisa_Manoban_05.jpg'
  },
  {
    name: "Martin",
    email: "martin@hero.com",
    password: "123123",
    bio: "Martin is a social and outgoing person who loves the nightlife scene. He enjoys going to nightclubs, meeting new people, and having a great time with friends.",
    experience: "Experienced in nightlife, socializing, partying, dating, and making new connections.",
    specialties: "Nightlife Navigation, Social Charisma, Dating Expertise",
    category: "Bodybuilding",
    address: "日本, 〒150-0043 東京都渋谷区道玄坂１丁目２番",
    image: "https://ca.slack-edge.com/T02NE0241-U08796W87GV-53fdd2ece44a-512"
  }
]

trainers.each_with_index do |trainer, index|
  user = User.new(
    name: trainer[:name],
    email: trainer[:email],
    password: trainer[:password],
    bio: trainer[:bio],
    experience: trainer[:experience],
    specialties: trainer[:specialties]
  )

  file = URI.parse(trainer[:image]).open

  user.photo.attach(io: file, filename: "#{trainer[:name]}.png", content_type: "image/png")
  user.save

  lesson = Lesson.new(
    user: user,
    title: "#{trainer[:name]}'s #{trainer[:category]} Class",
    description: "Train with #{trainer[:name]} to master #{trainer[:specialties].downcase}.",
    duration: DURATION.sample,
    price: PRICE.sample,
    capacity: CAPACITY.sample,
    category: trainer[:category],
    address: trainer[:address]
  )
  file = File.open(Rails.root.join("app/assets/images/#{CATEGORIESIMAGES[trainer[:category]]}.png"), "rb")
  lesson.photos.attach(io: file, filename: "#{CATEGORIESIMAGES[trainer[:category]]}.png", content_type: "image/png")
  lesson.save
end


puts "Created #{User.count} trainers with lessons in Shibuya, Tokyo!"
