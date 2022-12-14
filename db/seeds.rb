# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Blog seeds based on the series "House of the Dragon"

user_1 = User.create( name: 'King Viserys I Targaryen',
photo: 'https://raw.githubusercontent.com/PraisesPJMT/Data/main/profiles/King_Viserys_I_Targaryen.png',
bio: 'Remembered as Viserys the Peaceful, was the fifth king of the Targaryen dynasty to rule the Seven Kingdoms. Viserys I was the grandson of Jaehaerys I Targaryen, and father of Rhaenyra. He briefly rode Balerion the Black Dread in his youth before the dragon\'s death of old age.' )

user_2 = User.create( name: 'Prince Daemon Targaryen',
photo: 'https://raw.githubusercontent.com/PraisesPJMT/Data/main/profiles/Prince_Daemon_Targaryen.png',
bio: 'Prince of the Targaryen dynasty, and the younger brother of King Viserys I Targaryen. He is the uncle of Queen Rhaenyra Targaryen, and later becomes her second husband and king consort.' )

user_3 = User.create( name: 'Queen Rhaenyra Targaryen',
photo: 'https://raw.githubusercontent.com/PraisesPJMT/Data/main/profiles/Queen_Rhaenyra_Targaryen.png',
bio: 'Queen Rhaenyra Targaryen is the daughter and only surviving child of King Viserys I Targaryen and his first wife, Queen Aemma Arryn. She disputes the claim of her younger half-brother Aegon II, using the style Queen of the Andals and the Rhoynar and the First Men, Lady of the Seven Kingdoms, and Protector of the Realm. A dragonrider, her mount is the she-dragon Syrax.',
email: 'queenr_haenyra@email',
password: 'queenr_haenyra@password',
password_confirmation: 'queenr_haenyra@password' )

user_4 = User.create( name: 'Queen Alicent Hightower',
photo: 'https://raw.githubusercontent.com/PraisesPJMT/Data/main/profiles/Queen_Alicent_Hightower.png',
bio: 'Second wife of King Viserys I Targaryen and daughter of Ser Otto Hightower, the Hand of the King. ',
                      email: 'queenr_alicent@email',
                      password: 'queenr_alicent@password',
                      password_confirmation: 'queenr_alicent@password' )

user_5 = User.create( name: 'Ser Otto Hightower',
photo: 'https://raw.githubusercontent.com/PraisesPJMT/Data/main/profiles/Ser_Otto_Hightower.png',
bio: 'Knight of House Hightower and the Hand of the King to Kings Jaehaerys I, Viserys I, and Aegon II.',
                      email: 'ser_otto@email',
                      password: 'ser_otto@password',
                      password_confirmation: 'ser_otto@password' )

user_6 = User.create( name: 'Prince Aemond Targaryen',
photo: 'https://raw.githubusercontent.com/PraisesPJMT/Data/main/profiles/Prince_Aemond_Targaryen.png',
bio: 'Prince of the Targaryen dynasty and the third child of King Viserys I Targaryen and Queen Alicent Hightower. He is the rider of the dragon Vhagar.',
                      email: 'prince_aemond@email',
                      password: 'prince_aemond@password',
                      password_confirmation: 'prince_aemond@password' )

user_7 = User.create( name: 'King Aegon II Targaryen',
photo: 'https://raw.githubusercontent.com/PraisesPJMT/Data/main/profiles/King_Aegon_II_Targaryen.png',
bio: 'Sixth King of the Andals and the Rhoynar and the First Men and Lord of the Seven Kingdoms. His rule is currently disputed by his older half-sister, Rhaenyra Targaryen. He is the firstborn son of King Viserys I Targaryen and his second wife, Queen Alicent Hightower. He is the rider of the dragon Sunfyre.',
                      email: 'king_aegon@email',
                      password: 'king_aegon@password',
                      password_confirmation: 'king_aegon@password' )

user_8 = User.create( name: 'Queen Daenerys I Targaryen',
photo: 'https://raw.githubusercontent.com/PraisesPJMT/Data/main/profiles/Queen_Daenerys_I_Targaryen.png',
bio: 'The First of Her Name, Queen of the Andals and the First Men, Protector of the Seven Kingdoms, the Mother of Dragons, the Khaleesi of the Great Grass Sea, the Unburnt, the Breaker of Chains, though the style was occasionally shortened to Daenerys of the House Targaryen, the First of Her Name, Breaker of Chains and Mother of Dragons.',
                      email: 'queen_daenerys@email',
                      password: 'queen_daenerys@password',
                      password_confirmation: 'queen_daenerys@password' )

user_9 = User.create( name: 'Jon Snow',
photo: 'https://raw.githubusercontent.com/PraisesPJMT/Data/main/profiles/Jon_Snow.png',
bio: 'Son of Lyanna Stark and Rhaegar Targaryen, the late Prince of Dragonstone. From infancy, Jon is presented as the bastard son of Lord Eddard Stark, Lyanna\'s brother, and raised alongside Eddard\'s lawful children at Winterfell. Jon\'s true parentage is kept secret from everyone, including Jon himself, in order to protect him from those that sought the complete annihilation of House Targaryen.',
                      email: 'jon_snow@email',
                      password: 'jon_snow@password',
                      password_confirmation: 'jon_snow@password' )

user_10 = User.create( name: 'Queen Cersei I Lannister',
photo: 'https://raw.githubusercontent.com/PraisesPJMT/Data/main/profiles/Queen_Cersei_I_Lannister.png',
bio: 'The twentieth ruler of the Seven Kingdoms and the widow of King Robert Baratheon. She was the daughter of Lord Tywin Lannister, twin sister of Jaime Lannister and elder sister of Tyrion Lannister. She was involved in an incestuous relationship with Jaime, who was secretly the father of her three bastard children, Joffrey, Myrcella and Tommen.',
                       email: 'queen_cersei@email',
                       password: 'queen_cersei@password',
                       password_confirmation: 'queen_cersei@password' )

post_1 = Post.create(author: user_1, title: 'My Reign',
text: 'Viserys inherited the realm after an unprecedented fifty years of peace and prosperity under his grandfather, a golden age that Viserys strives not to disrupt.[2] A full century after the Targaryen Conquest, their dynasty\'s rule is unchallenged - save for still-independent Dorne, though relations with them have also been calm and stable for decades.' )
Comment.create(post: post_1, author: user_2, text: 'I am your brother! I know all these' )
Comment.create(post: post_1, author: user_3, text: 'Dad, You could have passed this to me without a fight' )
Comment.create(post: post_1, author: user_4, text: 'Husband! Your dying wish will be honoured' )
Comment.create(post: post_1, author: user_5, text: 'My close friend! Great legacy' )
Like.create([{post: post_1, author: user_3}, {post: post_1, author: user_4}, {post: post_1, author: user_2}])

post_2 = Post.create(author: user_1, title: 'I Love My Models',
text: 'Later, while a disconsolate Viserys works on a large model of Old Valyria, he is visited by Otto\'s daughter, Alicent Hightower. She brings him a history book to distract him, knowing his love for the subject, and offers her condolences for his loss, relating her experience of losing her mother, which Viserys appreciates' )
Comment.create(post: post_2, author: user_2, text: 'Amazing work' )
Comment.create(post: post_2, author: user_3, text: 'Looks beautiful Dad' )
Comment.create(post: post_2, author: user_4, text: 'I did most of the work' )
Comment.create(post: post_2, author: user_9, text: 'I wish this Kings Landing stayed to our time' )
Like.create([{post: post_2, author: user_10}, {post: post_2, author: user_8}])

post_3 = Post.create(author: user_2, title: 'The Great Worrior I Am',
text: 'Later, while a disconsolate Viserys works on a large model of Old Valyria, he is visited by Otto\'s daughter, Alicent Hightower. She brings him a history book to distract him, knowing his love for the subject, and offers her condolences for his loss, relating her experience of losing her mother, which Viserys appreciates' )
Comment.create(post: post_3, author: user_3, text: 'I loved Sir Christien' )
Comment.create(post: post_3, author: user_4, text: 'I think He is handsome too' )
Comment.create(post: post_3, author: user_2, text: 'This should be about me' )
Like.create([{post: post_3, author: user_10}, {post: post_2, author: user_8}])

post_4 = Post.create(author: user_3, title: 'The Greatest Queen Ever',
text: 'Rhaenyra took the capital and sat in the throne for roughly half a year. Upon taking the city, Rhaenyra insisted on claiming her father\'s seat, and so she climbed the Iron Throne and accepted pleas of forgiveness and loyalty from those in the Red Keep all throughout the night. Although Rhaenyra was dressed in armor, Septon Eustace claimed that those present witnessed the throne leaving several cuts on her legs and left hand.' )
Comment.create(post: post_4, author: user_1, text: 'Thats my daughter' )
Comment.create(post: post_4, author: user_4, text: 'I am the greatest queen ever' )
Comment.create(post: post_4, author: user_8, text: 'All of you cant stand my wrath' )
Comment.create(post: post_4, author: user_10, text: 'Check my bio for my titles and rename your title' )
Like.create([{post: post_4, author: user_1}, {post: post_4, author: user_2}, {post: post_4, author: user_10}, {post: post_4, author: user_8}])

post_5 = Post.create(author: user_3, title: 'Friends Like Snakes',
text: 'Rhaenyra, and her friend, Lady Alicent Hightower spend time in the godswood, where Rhaenyra hopes that her unborn sibling is a boy, for the sake of her father, Viserys I\'s happiness, ignoring Alicent\'s remarks that a son would overshadow her in the line of succession.' )
Comment.create(post: post_5, author: user_1, text: 'Thats my daughter' )
Comment.create(post: post_5, author: user_4, text: 'I am not a snake freak' )
Like.create([{post: post_5, author: user_10}, {post: post_5, author: user_8}])

post_6 = Post.create(author: user_3, title: 'Vengance for My Beloved Son',
text: 'To gain more support to take the throne from her brother, Rhaenyra sent her son Jace on his dragon to treat with the Arryns, Manderlys, and Starks, and her son Luke to treat with Lord Borros Baratheon at Storm\'s End. Luke\'s mission was thought to be the safer journey, but he arrived at Storm\'s End to find Queen Alicent\'s younger son Aemond already there. Aemond, riding Vhagar, killed Luke over Shipbreaker Bay as he attempted to leave after failing to gain Lord Borros\' allegiance. The news of Luke\'s death devastated his mother.' )
Comment.create(post: post_6, author: user_6, text: 'I killed him freak' )

post_7 = Post.create(author: user_3, title: 'My Grief',
text: 'Rhaenyra\'s three eldest sons all died fighting during the Dance of the Dragons, but her two youngest sons, the sons by her second husband, Prince Daemon, survived the civil war. The war ended when Aegon II died in 131 AC with no male issue, and was succeeded by Rhaenyra\'s and Daemon\'s elder son, the boy Aegon III, who had seen his mother\'s death by dragon. Rhaenyra\'s second son with Prince Daemon would also later rule as King Viserys II Targaryen, as both sons of his brother Aegon III, Daeron I and Baelor I, later died without issue.' )
Like.create([{post: post_7, author: user_1}, {post: post_7, author: user_2}, {post: post_7, author: user_10}, {post: post_7, author: user_9}])

post_8 = Post.create(author: user_4, title: 'Friends Like Snakes',
text: 'Prince Daemon Targaryen was opposed to Alicent and her sons, and after his return to King\'s Landing, he made fun of Alicent, Aegon and Aemond, and the other greens, to entertain Princess Rhaenyra. It is said he acted cool towards the princes Aegon and Aemond, because they had pushed him even lower in the line of succession.' )
Comment.create(post: post_8, author: user_7, text: 'Yes Mom! Vipers around' )
Comment.create(post: post_8, author: user_6, text: 'I wish I was never King' )
Like.create([{post: post_8, author: user_7}, {post: post_8, author: user_6}])

post_9 = Post.create(author: user_4, title: 'Nothing Stronger Than Family',
text: 'Alicent unsuccessfully defended her father, Ser Otto Hightower, when Aegon II replaced him as Hand of the King with Ser Criston Cole.[8] Alicent barred the gates of King\'s Landing when thousands of smallfolk began fleeing the capital after the battle at Rook\'s Rest.' )
Comment.create(post: post_9, author: user_5, text: 'Thats my daugther' )
Comment.create(post: post_9, author: user_1, text: 'I never trusted him' )
Like.create([{post: post_9, author: user_9}])

post_10 = Post.create(author: user_8, title: 'My Faith Like No Other',
text: 'I spent my life in foreign lands. So many men have tried to kill me, I don\'t remember all their names. I have been sold like a broodmare. I\'ve been chained and betrayed, raped and defiled. Do you know what kept me standing through all those years in exile? Faith. Not in any gods. Not in myths and legends. In myself. In Daenerys Targaryen. The world hadn\'t seen a dragon in centuries until my children were born. The Dothraki hadn\'t crossed the sea. Any sea. They did for me. I was born to rule the Seven Kingdoms, and I will.' )
Comment.create(post: post_10, author: user_9, text: 'I love you so much' )
Like.create([{post: post_10, author: user_6}, {post: post_10, author: user_7}, {post: post_10, author: user_3}, {post: post_10, author: user_2}, {post: post_10, author: user_1}])
