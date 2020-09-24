puts "Creating users..."

User.destroy_all

u1 = User.create!(
    name: "Ben Purvis",
    email: "benny.purvis@hotmail.com",
    password: "chicken",
    prioritising: true,
    daily_review: true
)

u2 = User.create!(
    name: "John Cena",
    email: "youcantseeme@gmail.com",
    password: "chicken",
    prioritising: false,
    daily_review: false
)

puts "Created #{User.count} users"

puts "Creating tasks..."
puts "Creating category..."
puts "Creating sublist..."
Task.destroy_all
SubList.destroy_all 
Category.destroy_all 

t1 = Task.create!(
    user_id: u1.id,
    task: "Clean up room",
    solidifier: "Mental clarity",
    completed: true,
    global: false,
    priority_level: 10
)
t10 = Task.create!(
    user_id: u2.id,
    task: "Beat Randy Savage",
    solidifier: "Title Ship",
    completed: false,
    global: false,
    priority_level: 10
)
t2 = Task.create!(
    user_id: u1.id,
    task: "Finish final project",
    solidifier: "For learning & employment",
    completed: false,
    global: false,
    priority_level: 100
)

c1 = Category.create!(
    title: "Fitness",
    user_id: u1.id
)

subl1 = SubList.create!(
    title: "Workout Day 1",
    category_id: c1.id 
)

subl2 = SubList.create!(
    title: "Workout Day 2",
    category_id: c1.id 
)

subl3 = SubList.create!(
    title: "Workout Day 3",
    category_id: c1.id 
)

t4 = Task.create!(
    user_id: u1.id,
    category_id: c1.id,
    sub_list_id: subl2.id,
    task: "3 sets 70kg MAX, 3 sets of tri ups and 3 sets of archer push ups",
    solidifier: "Bigger chest",
    completed: false,
    global: false
)

t3 = Task.create!(
    user_id: u1.id,
    category_id: c1.id,
    sub_list_id: subl1.id,
    task: "3 sets 80kg leg press 3 sets of 80kg squats 3 sets of 50kg leg curls",
    solidifier: "Get bigger legs",
    completed: false,
    global: false
)

t5 = Task.create!(
    user_id: u1.id,
    category_id: c1.id,
    sub_list_id: subl3.id,
    task: "3 sets of 17kg dumbell curls and 3 sets of 50 kg benchpress",
    solidifier: "Get bigger biceps",
    completed: true,
    global: false
)

t6 = Task.create!(
    user_id: u1.id,
    task: "Mow lawns",
    solidifier: "My lawn yawns for a mowin",
    completed: true,
    global: true
)

puts "Created #{Task.count} tasks"
puts "Created #{Category.count} catergories"
puts "Created #{SubList.count} sublists"

puts "Fitness Category has #{c1.tasks.length} tasks"
puts "Workout Day 3 has #{subl3.tasks.length} tasks"

puts "Creating reviews"

Review.destroy_all

r1 = Review.create!(
    user_id: u1.id,
    daily_review: "I completed so much today blah blah blah blah blab",
    weekly_review: "This week I shat my self and had to go clean it up ok poo poo time",
    future_proof_review: "This month I ate 17 moths"
)

puts "Created #{Review.count} reviews"

FutureProofer.destroy_all

puts "Creating a Future Proofer"

fp1 = FutureProofer.create!(
    user_id: u1.id,
    start_date: DateTime.now,
    end_date: DateTime.now + 30
)

puts "Created #{FutureProofer.count} Proofers"
