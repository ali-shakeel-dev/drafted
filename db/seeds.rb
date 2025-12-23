# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.find_or_create_by!(email: "muhammadalykhan77@gmail.com") do |u|
  u.password = "ASHAH@77"
  u.password_confirmation = "ASHAH@77"
end

resume = user.resumes.find_or_create_by!(title: "Backend Engineer Resume") do |r|
  r.template = "minimal"
  r.active = true
end

resume.experiences.destroy_all
resume.educations.destroy_all
resume.projects.destroy_all
resume.skills.destroy_all

resume.experiences.create!(
  [
    {
      company: "Acme Corp",
      role: "Backend Engineer",
      start_date: Date.new(2022, 1, 1),
      end_date: nil,
      description: "Built and maintained REST APIs using Ruby on Rails. Improved response times by optimizing database queries.",
      position: 1
    },
    {
      company: "Beta Labs",
      role: "Junior Software Engineer",
      start_date: Date.new(2020, 6, 1),
      end_date: Date.new(2021, 12, 31),
      description: "Worked on internal tools and dashboards. Collaborated with product managers to ship features quickly.",
      position: 2
    }
  ]
)

resume.educations.create!(
  [
    {
      institution: "State University",
      degree: "B.Sc. in Computer Science",
      start_date: Date.new(2016, 9, 1),
      end_date: Date.new(2020, 6, 1),
      description: "Focused on software engineering, databases, and distributed systems.",
      position: 1
    }
  ]
)

resume.projects.create!(
  [
    {
      name: "Drafted",
      description: "A structured resume builder that generates clean, professional PDFs using Ruby on Rails.",
      link: "https://github.com/yourusername/drafted",
      position: 1
    },
    {
      name: "Feature Flag Tool",
      description: "Internal tool to manage feature rollouts and kill switches in production.",
      link: "",
      position: 2
    }
  ]
)

resume.skills.create!(
  [
    { name: "Ruby on Rails", level: "advanced", position: 1 },
    { name: "PostgreSQL", level: "advanced", position: 2 },
    { name: "REST APIs", level: "advanced", position: 3 },
    { name: "Git", level: "advanced", position: 4 },
    { name: "Docker", level: "intermediate", position: 5 }
  ]
)
