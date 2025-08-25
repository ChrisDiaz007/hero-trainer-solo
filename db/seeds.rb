require "open-uri"

puts "Cleaning database..."

Booking.destroy_all
Lesson.destroy_all
User.destroy_all

CATEGORIES = ["Martial Arts", "Bodybuilding", "Tactical Combat", "Boxing"]
DURATION = [30, 45, 60]
PRICE = [50, 100, 150]
CAPACITY = [4, 6, 10]

CATEGORIESIMAGES = {
  "Martial Arts" => "1martial-arts",
  "Bodybuilding" => "1bodybuilding",
  "Tactical Combat" => "1tactical-combat",
  "Boxing" => "1boxing",
}

TRAINERSIMAGES = {
  "Goku" => "igoku.png",
  # "Vegeta" => "ivegeta.png",
  # "Luffy" => "iluffy.png",
  "Baki" => "ibaki.png",
  "Toshinori" => "iallmight.png",
  # "Mikey" => "imikey.png",
  # "Naruto" => "inaruto.png",
  # "Rengoku" => "irengoku.png",
  # "Saitama" => "isaitama.png",
  "Levi" => "ilevi.png",
  # "Zoro" => "izoro.png",
  # "Ai" => "iai.png",
  "Bruce" => "ibruce.png",
  "Muhammad" => "imuhammad.png",
  "Mike" => "imike.png",
  "Arnold" => "iarnold.png",
  "Ronnie" => "ironnie.png",
}

puts "Creating trainers..."

trainers = [
  {
    first_name: "Goku",
    last_name: "Son",
    email: "goku@hero.com",
    password: "password",
    bio: "A Saiyan warrior who constantly pushes his limits, Goku is the embodiment of endurance, strength, and relentless training.",
    experience: "A lifetime of intense training under the strongest masters in the universe.",
    specialties: "Endurance, Strength, Combat",
    category: "Martial Arts",
    address: "日本, 〒150-0002 東京都渋谷区渋谷２丁目１９番１２号",
  },
  # {
  #   first_name: "Vegeta",
  #   email: "vegeta@hero.com",
  #   password: "password",
  #   bio: "The proud Saiyan prince, Vegeta's ruthless training methods push his students to their absolute limits.",
  #   experience: "Years of intense Saiyan warrior training under extreme gravity and rigorous combat.",
  #   specialties: "Power, Combat Strategy, Mental Toughness",
  #   category: "Martial Arts",
  #   address: "日本, 〒150-0043 東京都渋谷区道玄坂２丁目１０番１２号",
  # },
  # {
  #   first_name: "Luffy",
  #   email: "luffy@hero.com",
  #   password: "password",
  #   bio: "The future Pirate King, Luffy's unconventional training style focuses on endurance, adaptability, and raw power.",
  #   experience: "Years of adventure and training with legendary pirates like Rayleigh and Garp.",
  #   specialties: "Agility, Stamina, Unconventional Fighting",
  #   category: "Endurance",
  #   address: "日本, 〒150-0043 東京都渋谷区道玄坂１丁目１６番１３号",
  # },
  {
    first_name: "Baki",
    last_name: "Hanma",
    email: "baki@hero.com",
    password: "password",
    bio: "An underground fighter with extreme combat conditioning, Baki trains to surpass his legendary father, Yujiro Hanma.",
    experience: "Over 10 years of brutal combat training against the world's strongest fighters.",
    specialties: "Grappling, Striking, Combat Durability",
    category: "Martial Arts",
    address: "日本, 〒150-0031 東京都渋谷区桜丘町９番１２号",
  },
  {
    first_name: "Toshinori",
    last_name: "Yagi",
    email: "allmight@hero.com",
    password: "password",
    bio: "The Symbol of Peace, All Might teaches what it means to be a true hero—both physically and mentally.",
    experience: "Decades of hero work and strength-based combat training.",
    specialties: "Strength, Willpower, Heroic Mindset",
    category: "Bodybuilding",
    address: "日本, 〒150-0036 東京都渋谷区南平台町１３番１０号",
  },
  # {
  #   first_name: "Mikey",
  #   email: "mikey@hero.com",
  #   password: "password",
  #   bio: "The Invincible Mikey, leader of the Tokyo Manji Gang, is a master of high-speed, high-impact martial arts.",
  #   experience: "Years of street fighting experience, leading one of the most feared gangs in Tokyo.",
  #   specialties: "Kick Techniques, Speed, Combat Awareness",
  #   category: "Martial Arts",
  #   address: "日本, 〒150-0002 東京都渋谷区渋谷１丁目２３番２１号",
  # },
  # {
  #   first_name: "Naruto",
  #   email: "naruto@hero.com",
  #   password: "password",
  #   bio: "From a mischievous outcast to the Hokage, Naruto's never-give-up attitude makes him a perfect mentor.",
  #   experience: "Years of ninja training under Jiraiya, Kakashi, and the Toad Sage techniques.",
  #   specialties: "Endurance, Chakra Control, Shadow Clone Training",
  #   category: "Martial Arts",
  #   address: "日本, 〒150-0036 東京都渋谷区南平台町１３番４号",
  # },
  # {
  #   first_name: "Rengoku",
  #   email: "rengoku@hero.com",
  #   password: "password",
  #   bio: "The Flame Hashira, Rengoku's burning passion and discipline make him an exceptional trainer.",
  #   experience: "Rigorous Hashira training, specializing in swordsmanship and breathing techniques.",
  #   specialties: "Swordsmanship, Stamina, Flame Breathing Techniques",
  #   category: "Combat Training",
  #   address: "日本, 〒150-0043 東京都渋谷区道玄坂２丁目２９番５号",
  # },
  # {
  #   first_name: "Saitama",
  #   email: "saitama@hero.com",
  #   password: "password",
  #   bio: "A hero for fun, Saitama's training routine made him the most powerful being, capable of defeating any opponent with a single punch.",
  #   experience: "Three years of the legendary '100 Pushups, 100 Situps, 100 Squats' routine.",
  #   specialties: "Power, Speed, Stamina",
  #   category: "Endurance",
  #   address: "日本, 〒150-0043 東京都渋谷区道玄坂２丁目２０番９号",
  # },
  {
    first_name: "Levi",
    last_name: "Ackerman",
    email: "levi@hero.com",
    password: "password",
    bio: "The strongest soldier in humanity, Levi's combat skills, precision, and discipline make him a master of battlefield tactics.",
    experience: "A lifetime of elite soldier training and ODM mastery.",
    specialties: "Agility, Tactical Combat, Precision Strikes",
    category: "Tactical Combat",
    address: "日本, 〒150-0002 東京都渋谷区渋谷３丁目８番１２号",
  },
  # {
  #   first_name: "Zoro",
  #   email: "zoro@hero.com",
  #   password: "password",
  #   bio: "A master swordsman dedicated to becoming the strongest, Zoro trains with unmatched intensity.",
  #   experience: "Years of sword training under Mihawk and relentless self-discipline.",
  #   specialties: "Swordsmanship, Strength, Endurance",
  #   category: "Combat Training",
  #   address: "日本, 〒150-0043 東京都渋谷区道玄坂２丁目１６番７号",
  # },
  # {
  #   first_name: "Ai",
  #   email: "ai@hero.com",
  #   password: "password",
  #   bio: "A legendary idol, Ai specializes in performance training, charisma, and mental resilience.",
  #   experience: "Years of idol training and handling extreme pressure under public scrutiny.",
  #   specialties: "Charisma, Performance Training, Mental Strength",
  #   category: "Dance",
  #   address: "日本, 〒150-0044 東京都渋谷区円山町２番９号",
  # },
  {
    first_name: "Bruce",
    last_name: "Lee",
    email: "bruce@hero.com",
    password: "password",
    bio: "A martial arts pioneer who redefined combat with his unmatched speed, philosophy, and discipline. Bruce Lee embodied the union of body and mind, inspiring generations of fighters.",
    experience: "Founder of Jeet Kune Do, decades of martial arts mastery blending Eastern and Western techniques.",
    specialties: "Speed, Agility, Philosophy, Martial Arts",
    category: "Martial Arts",
    address: "日本, 〒150-0036 東京都渋谷区南平台町１３番４号"
  },
  {
    first_name: "Muhammad",
    last_name: "Ali",
    email: "ali@hero.com",
    password: "password",
    bio: "The Greatest, Muhammad Ali combined dazzling footwork, lightning speed, and unmatched charisma. More than a fighter, he became a symbol of confidence, resilience, and justice.",
    experience: "3× Heavyweight Champion of the World, Olympic Gold Medalist.",
    specialties: "Footwork, Speed, Boxing, Mental Toughness",
    category: "Boxing",
    address: "日本, 〒150-0043 東京都渋谷区道玄坂２丁目２０番９号"
  },
  {
    first_name: "Mike",
    last_name: "Tyson",
    email: "tyson@hero.com",
    password: "password",
    bio: "One of the most feared boxers in history, Mike Tyson became the youngest heavyweight champion ever at 20. Known for his ferocity and knockout power.",
    experience: "Undisputed Heavyweight Champion, 50 career wins with 44 knockouts.",
    specialties: "Power, Aggression, Boxing",
    category: "Boxing",
    address: "日本, 〒150-0002 東京都渋谷区渋谷３丁目８番１２号"
  },
  {
    first_name: "Arnold",
    last_name: "Schwarzenegger",
    email: "arnold@hero.com",
    password: "password",
    bio: "The Austrian Oak who rose from humble beginnings to dominate bodybuilding, winning 7 Mr. Olympia titles. Arnold became a global icon of strength, discipline, and ambition.",
    experience: "7× Mr. Olympia champion, international bodybuilding and fitness legend.",
    specialties: "Strength, Hypertrophy, Discipline",
    category: "Bodybuilding",
    address: "日本, 〒150-0043 東京都渋谷区道玄坂２丁目１６番７号"
  },
  {
    first_name: "Ronnie",
    last_name: "Coleman",
    email: "ronnie@hero.com",
    password: "password",
    bio: "Known as 'The King,' Ronnie Coleman pushed human strength and size to new levels, securing 8 Mr. Olympia titles with a legendary work ethic.",
    experience: "8× Mr. Olympia champion, record-breaking lifts in bodybuilding and powerlifting.",
    specialties: "Power, Strength, Bodybuilding",
    category: "Bodybuilding",
    address: "日本, 〒150-0044 東京都渋谷区円山町２番９号"
}
]

trainers.each_with_index do |trainer, index|
  user = User.new(
    first_name: trainer[:first_name],
    email: trainer[:email],
    password: trainer[:password],
    bio: trainer[:bio],
    experience: trainer[:experience],
    specialties: trainer[:specialties]
  )

  file_path = Rails.root.join("app/assets/images/#{TRAINERSIMAGES[trainer[:first_name]]}")
  file = File.open(file_path, "rb")
  user.photo.attach(io: file, filename: TRAINERSIMAGES[trainer[:first_name]], content_type: "image/png")
  user.save!


  lesson = Lesson.new(
    user: user,
    title: "#{trainer[:first_name]}'s #{trainer[:category]} Class",
    description: "Train with #{trainer[:first_name]} to master #{trainer[:specialties].downcase}.",
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
