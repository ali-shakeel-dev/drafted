# Drafted - A Resume Builder

Drafted is a structured resume builder built with Ruby on Rails.

Users create resumes using structured data (experience, education, skills, projects)
and generate clean, professional PDFs using predefined templates.

This app focuses on functionality rather than
design-heavy editors.

## Features

- User authentication
- Multiple resumes per user
- Structured resume sections
- Resume versioning
- Template-based rendering
- PDF export

## Tech Stack

- Ruby on Rails
- PostgreSQL
- ERB
- CSS

## Setup

```bash
bundle install
bin/rails db:create db:migrate
bin/rails server