# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Blog seeds based on the series "House of the Dragon"

# admin
User.create( name: 'Blog Admin',
photo: 'https://github.com/PraisesPJMT/Data/blob/main/profiles/admin.png?raw=true',
bio: 'Coordinate activities in the Inkling Blorg including system maintenance, improving UI, handling user relations and more. Has access to all permissions, rights, and access.',
email: 'admin_user@email',
password: 'admin_user',
password_confirmation: 'admin_user',
role: 'admin' )

# user_2
User.create( name: 'King Viserys I Targaryen',
photo: 'https://raw.githubusercontent.com/PraisesPJMT/Data/main/profiles/King_Viserys_I_Targaryen.png',
bio: 'Remembered as Viserys the Peaceful, was the fifth king of the Targaryen dynasty to rule the Seven Kingdoms. Viserys I was the grandson of Jaehaerys I Targaryen, and father of Rhaenyra. He briefly rode Balerion the Black Dread in his youth before the dragon\'s death of old age.',
email: 'king_viserys@email',
password: 'king_viserys@password',
password_confirmation: 'king_viserys@password' )

# user_3
User.create( name: 'Prince Daemon Targaryen',
photo: 'https://raw.githubusercontent.com/PraisesPJMT/Data/main/profiles/Prince_Daemon_Targaryen.png',
bio: 'Prince of the Targaryen dynasty, and the younger brother of King Viserys I Targaryen. He is the uncle of Queen Rhaenyra Targaryen, and later becomes her second husband and king consort.',
email: 'prince_daemon@email',
password: 'prince_daemon@password',
password_confirmation: 'prince_daemon@password' )

# user_4
User.create( name: 'Queen Rhaenyra Targaryen',
photo: 'https://raw.githubusercontent.com/PraisesPJMT/Data/main/profiles/Queen_Rhaenyra_Targaryen.png',
bio: 'Queen Rhaenyra Targaryen is the daughter and only surviving child of King Viserys I Targaryen and his first wife, Queen Aemma Arryn. She disputes the claim of her younger half-brother Aegon II, using the style Queen of the Andals and the Rhoynar and the First Men, Lady of the Seven Kingdoms, and Protector of the Realm. A dragonrider, her mount is the she-dragon Syrax.',
email: 'queenr_haenyra@email',
password: 'queenr_haenyra@password',
password_confirmation: 'queenr_haenyra@password' )

# user_5
User.create( name: 'Queen Alicent Hightower',
photo: 'https://raw.githubusercontent.com/PraisesPJMT/Data/main/profiles/Queen_Alicent_Hightower.png',
bio: 'Second wife of King Viserys I Targaryen and daughter of Ser Otto Hightower, the Hand of the King. ',
email: 'queenr_alicent@email',
password: 'queenr_alicent@password',
password_confirmation: 'queenr_alicent@password' )

# post_1
Post.create(author_id: 2, title: 'My Reign',
text: 'Viserys inherited the realm after an unprecedented fifty years of peace and prosperity under his grandfather, a golden age that Viserys strives not to disrupt.[2] A full century after the Targaryen Conquest, their dynasty\'s rule is unchallenged - save for still-independent Dorne, though relations with them have also been calm and stable for decades.' )
Comment.create(post_id: 1, author_id: 3, text: 'I am your brother! I know all these' )
Comment.create(post_id: 1, author_id: 4, text: 'Dad, You could have passed this to me without a fight' )
Comment.create(post_id: 1, author_id: 5, text: 'Husband! Your dying wish will be honoured' )
Comment.create(post_id: 1, author_id: 6, text: 'My close friend! Great legacy' )
Like.create([{post_id: 1, author_id: 4}, {post_id: 1, author_id: 5}, {post_id: 1, author_id: 3}])

# post_2
Post.create(author_id: 2, title: 'I Love My Models',
text: 'Later, while a disconsolate Viserys works on a large model of8 Old Valyria, he is visited by Otto\'s daughter, Alicent Hightower. She brings him a history book to distract him, knowing his love for the subject, and offers her condolences for his loss, relating her experience of losing her mother, which Viserys appreciates' )
Comment.create(post_id: 2, author_id: 3, text: 'Amazing work' )
Comment.create(post_id: 2, author_id: 4, text: 'Looks beautiful Dad' )
Comment.create(post_id: 2, author_id: 5, text: 'I did most of the work' )
Comment.create(post_id: 2, author_id: 10, text: 'I wish this Kings Landing stayed to our time' )
Like.create([{post_id: 2, author_id: 11}, {post_id: 2, author_id: 9}])

# post_3
Post.create(author_id: 2, title: 'The Great Worrior I Am',
text: 'Later, while a disconsolate Viserys works on a large model of Old Valyria, he is visited by Otto\'s daughter, Alicent Hightower. She brings him a history book to distract him, knowing his love for the subject, and offers her condolences for his loss, relating her experience of losing her mother, which Viserys appreciates' )
Comment.create(post_id: 3, author_id: 4, text: 'I loved Sir Christien' )
Comment.create(post_id: 3, author_id: 5, text: 'I think He is handsome too' )
Comment.create(post_id: 3, author_id: 3, text: 'This should be about me' )
Like.create([{post_id: 3, author_id: 11}, {post_id: 3, author_id: 9}])

# post_4
Post.create(author_id: 3, title: 'The Greatest Queen Ever',
text: 'Rhaenyra took the capital and sat in the throne for roughly half a year. Upon taking the city, Rhaenyra insisted on claiming her father\'s seat, and so she climbed the Iron Throne and accepted pleas of forgiveness and loyalty from those in the Red Keep all throughout the night. Although Rhaenyra was dressed in armor, Septon Eustace claimed that those present witnessed the throne leaving several cuts on her legs and left hand.' )
Comment.create(post_id: 4, author_id: 2, text: 'Thats my daughter' )
Comment.create(post_id: 4, author_id: 3, text: 'I am the greatest queen ever' )
Comment.create(post_id: 4, author_id: 4, text: 'All of you cant stand my wrath' )
Comment.create(post_id: 4, author_id: 5, text: 'Check my bio for my titles and rename your title' )
Like.create([{post_id: 4, author_id: 1}, {post_id: 4, author_id: 2}, {post_id: 4, author_id: 3}, {post_id: 4, author_id: 4}])

# post_5
Post.create(author_id: 4, title: 'Friends Like Snakes',
text: 'Prince Daemon Targaryen was opposed to Alicent and her sons, and after his return to King\'s Landing, he made fun of Alicent, Aegon and Aemond, and the other greens, to entertain Princess Rhaenyra. It is said he acted cool towards the princes Aegon and Aemond, because they had pushed him even lower in the line of succession.' )
Comment.create(post_id: 5, author_id: 3, text: 'Yes Mom! Vipers around' )
Comment.create(post_id: 5, author_id: 2, text: 'I wish I was never King' )
Like.create([{post_id: 5, author_id: 3}, {post_id: 5, author_id: 2}])
