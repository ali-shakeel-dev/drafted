puts "Seeding database..."

Skill.delete_all
Project.delete_all
Experience.delete_all
Education.delete_all
Profile.delete_all
Resume.delete_all
User.delete_all

user = User.create!(
  email: "ali@gmail.com",
  password: "123123",
  password_confirmation: "123123"
)

resume = Resume.create!(
  user: user,
  title: "Senior Software Engineer Resume",
  template: "classic",
  active: true
)

Profile.create!(
  resume: resume,
  name: "Ali Khan",
  profession: "Full Stack Software Engineer",
  email: "ali@gmail.com",
  phone: "+92 300 1234567",
  location: "Lahore, Pakistan",
  website: "https://github.com/ali",
  description: <<~TEXT
    I am a full stack software engineer with hands-on experience building scalable web applications using Ruby on Rails, PostgreSQL, and modern frontend technologies. Over the past several years, I have worked on real-world products that required strong problem-solving skills, clean architecture, and attention to performance and maintainability.

    My core expertise lies in backend development with Rails, where I have designed RESTful APIs, implemented authentication and authorization systems, and optimized database queries for high-traffic use cases. 
  TEXT
)

# ======================
# Experiences (3)
# ======================
Experience.create!(
  resume: resume,
  company: "TechSoft Solutions",
  role: "Junior Software Engineer",
  start_date: Date.new(2021, 1, 1),
  end_date: Date.new(2022, 6, 30),
  description: "Worked on backend features using Ruby on Rails, implemented REST APIs, and fixed production bugs. Collaborated closely with senior engineers.",
  position: 1
)

Experience.create!(
  resume: resume,
  company: "Innovate Labs",
  role: "Software Engineer",
  start_date: Date.new(2022, 7, 1),
  end_date: Date.new(2023, 12, 31),
  description: "Built scalable Rails applications, optimized PostgreSQL queries, and integrated third-party services. Took ownership of multiple features from design to deployment.",
  position: 2
)

Experience.create!(
  resume: resume,
  company: "Remote Startup",
  role: "Full Stack Developer",
  start_date: Date.new(2024, 1, 1),
  end_date: nil,
  description: "Leading full stack development using Rails and React. Responsible for architecture decisions, code reviews, and improving application performance.",
  position: 3
)

# ======================
# Education
# ======================
Education.create!(
  resume: resume,
  institution: "Punjab University",
  degree: "BS Computer Science",
  start_date: Date.new(2017, 9, 1),
  end_date: Date.new(2021, 6, 30),
  description: "Studied computer science fundamentals including data structures, databases, and software engineering.",
  position: 1
)

# ======================
# Achievements (stored as Projects)
# ======================
Project.create!(
  resume: resume,
  name: "Achievement: Performance Optimization Award",
  description: "Recognized for improving application response time by over 40 percent through query optimization and caching strategies.",
  link: nil,
  position: 1
)

Project.create!(
  resume: resume,
  name: "Achievement: Product Launch Lead",
  description: "Led the successful launch of a production Rails application used by thousands of users with zero critical issues at launch.",
  link: nil,
  position: 2
)

# ======================
# Skills (9)
# ======================
[
  ["Ruby on Rails", "Advanced"],
  ["PostgreSQL", "Advanced"],
  ["JavaScript", "Intermediate"],
  ["React", "Intermediate"],
  ["HTML", "Advanced"],
  ["CSS", "Advanced"],
  ["Git", "Advanced"],
  ["REST APIs", "Advanced"],
  ["System Design", "Intermediate"]
].each_with_index do |(name, level), index|
  Skill.create!(
    resume: resume,
    name: name,
    level: level,
    position: index + 1
  )
end

puts "✅ Seeding complete!"
