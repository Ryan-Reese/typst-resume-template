#import "src/lib.typ": *

#let name = "Jane Doe"
#let location = "London, UK"
#let email = "jane.doe@example.com"
#let github = "github.com/janedoe"
#let linkedin = "linkedin.com/in/janedoe"
#let phone = "+44 7700 900000"
#let personal-site = "janedoe.dev"

#show: resume.with(
  author: name,
  location: location,
  email: email,
  github: github,
  linkedin: linkedin,
  phone: phone,
  personal-site: personal-site,
  accent-color: "#26428b",
  font: "New Computer Modern",
  // Tests user's a4 default + upstream's lang param
  lang: "en",
  author-position: left,
  personal-info-position: left,
)

== Education

#edu(
  institution: "University of Oxford",
  location: "Oxford, UK",
  dates: dates-helper(start-date: "Oct 2020", end-date: "Jun 2024"),
  degree: "DPhil, Computational Biology",
)
- Thesis: "Graph Neural Networks for Protein Structure Prediction"
- Awards: Clarendon Scholarship, Best Paper Award at ICML 2023

#edu(
  institution: "Imperial College London",
  location: "London, UK",
  dates: dates-helper(start-date: "Sep 2016", end-date: "Jun 2020"),
  degree: "MEng, Computer Science (First Class Honours)",
)

== Work Experience

#work(
  title: "Senior Research Scientist",
  location: "Cambridge, UK",
  company: "DeepMind",
  dates: dates-helper(start-date: "Jul 2024", end-date: "Present"),
)
- Leading protein folding team on next-generation structure prediction models
- Published 3 papers in Nature and Science on AI-driven drug discovery

// Test upstream's optional start-date in dates-helper
#work(
  title: "Research Intern",
  location: "Remote",
  company: "OpenAI",
  dates: dates-helper(end-date: "Summer 2023"),
)
- Contributed to alignment research on large language models

// Test user's work-project component
== Research Projects

#work-project(
  role: "Lead Researcher",
  title: "ProteinGNN: Graph Networks for Folding",
  dates: dates-helper(start-date: "Jan 2022", end-date: "Dec 2023"),
  coauthor: "with Prof. Smith",
  urls: ("github.com/janedoe/proteingnn", "github.com/janedoe/proteingnn-data"),
)
- Achieved state-of-the-art accuracy on CASP15 benchmark

// Test user's work-project with single URL
#work-project(
  role: "Contributor",
  title: "BioSeq Toolkit",
  dates: dates-helper(start-date: "Mar 2021", end-date: "Present"),
  urls: ("github.com/janedoe/bioseq",),
)
- Open-source bioinformatics library with 500+ GitHub stars

== Projects

#project(
  name: "ML Paper Digest",
  role: "Creator",
  dates: dates-helper(start-date: "Sep 2023", end-date: "Present"),
  url: "mldigest.dev",
)
- Weekly newsletter summarising top ML research papers

== Extracurricular Activities

#extracurriculars(
  activity: "Oxford AI Society",
  dates: dates-helper(start-date: "Oct 2020", end-date: "Jun 2024"),
)
- President (2022--2024); organised speaker series with researchers from Google, Meta, and Microsoft

#certificates(
  name: "AWS Solutions Architect",
  issuer: "Amazon Web Services",
  date: "Mar 2023",
)

== Skills
- *Languages*: Python, C++, Rust, Julia, R, SQL
- *Frameworks*: PyTorch, JAX, TensorFlow, scikit-learn, Hugging Face
- *Tools*: Docker, Kubernetes, Git, AWS, GCP, Weights & Biases
