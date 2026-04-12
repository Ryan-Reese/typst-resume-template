#import "@preview/resume-for-researchers:0.1.0": *

// Put your personal information here, replacing mine
#let name = "Jane Smith"
#let location = "Boston, MA"
#let email = "jane.smith@example.edu"
#let github = "github.com/janesmith"
#let linkedin = "linkedin.com/in/janesmith"
#let phone = "+1 (555) 123-4567"
#let personal-site = "janesmith.dev"

#show: resume.with(
  author: name,
  // All the lines below are optional.
  // For example, if you want to hide your phone number:
  // feel free to comment those lines out and they will not show.
  location: location,
  email: email,
  github: github,
  linkedin: linkedin,
  phone: phone,
  personal-site: personal-site,
  accent-color: "#26428b",
  font: "New Computer Modern",
  author-position: left,
  personal-info-position: left,
)

/*
* Lines that start with == are formatted into section headings
* You can use the specific formatting functions if needed
* The following formatting functions are listed below
* #edu(dates: "", degree: "", institution: "", location: "", consistent: false)
* #work(company: "", dates: "", location: "", title: "")
* #work-project(role: "", title: "", dates: "", coauthor: "", urls: ())
* #project(dates: "", name: "", role: "", url: "")
* #certificates(name: "", issuer: "", url: "", date: "")
* #extracurriculars(activity: "", dates: "")
* There are also the following generic functions that don't apply any formatting
* #generic-two-by-two(top-left: "", top-right: "", bottom-left: "", bottom-right: "")
* #generic-one-by-two(left: "", right: "")
*/
== Education

#edu(
  institution: "Massachusetts Institute of Technology",
  location: "Cambridge, MA",
  dates: dates-helper(start-date: "Sep 2020", end-date: "Jun 2025"),
  degree: "PhD, Computer Science",

  // Uncomment the line below if you want edu formatting to be consistent with everything else
  // consistent: true
)
- Thesis: "Scalable Methods for Neural Program Synthesis"
- Awards: NSF Graduate Research Fellowship, MIT Presidential Fellowship

#edu(
  institution: "University of California, Berkeley",
  location: "Berkeley, CA",
  dates: dates-helper(start-date: "Aug 2016", end-date: "May 2020"),
  degree: "B.S., Electrical Engineering and Computer Science",
)
- Cumulative GPA: 3.95\/4.0 | Regents' and Chancellor's Scholar

== Work Experience

#work(
  title: "Research Scientist Intern",
  location: "New York, NY",
  company: "Meta AI (FAIR)",
  dates: dates-helper(start-date: "May 2023", end-date: "Aug 2023"),
)
- Developed novel attention mechanism for code generation, achieving 15% improvement on HumanEval benchmark
- Published findings at NeurIPS 2023 as first author

#work(
  title: "Student Researcher",
  location: "Mountain View, CA",
  company: "Google DeepMind",
  dates: dates-helper(start-date: "Jun 2022", end-date: "Sep 2022"),
)
- Contributed to large-scale distributed training infrastructure for language models
- Reduced training time by 20% through optimized data pipeline design

// The work-project component is designed for research projects within a work context
== Research Projects

#work-project(
  role: "Lead Author",
  title: "NeuralSynth: Program Synthesis via Guided Search",
  dates: dates-helper(start-date: "Jan 2022", end-date: "Dec 2023"),
  coauthor: "with Prof. Johnson",
  urls: ("github.com/janesmith/neuralsynth", "github.com/janesmith/neuralsynth-data"),
)
- State-of-the-art results on SyGuS benchmark, accepted at ICML 2024

#work-project(
  role: "Contributor",
  title: "CodeBERT-XL: Pre-training for Code Understanding",
  dates: dates-helper(start-date: "Sep 2021", end-date: "May 2022"),
  urls: ("github.com/janesmith/codebertxl",),
)
- Extended CodeBERT architecture to support 12 additional programming languages

== Projects

#project(
  name: "SynthBench",
  role: "Creator",
  dates: dates-helper(start-date: "Mar 2023", end-date: "Present"),
  url: "synthbench.dev",
)
- Open-source benchmarking suite for program synthesis, used by 30+ research groups worldwide

== Extracurricular Activities

#extracurriculars(
  activity: "MIT AI Research Group",
  dates: dates-helper(start-date: "Sep 2020", end-date: "Present"),
)
- Co-organizer of weekly reading group; mentored 5 undergraduate researchers

#certificates(
  name: "AWS Solutions Architect",
  issuer: "Amazon Web Services",
  date: "Mar 2023",
)

== Skills
- *Languages*: Python, C++, Rust, OCaml, Haskell, SQL, JavaScript
- *Frameworks*: PyTorch, JAX, TensorFlow, Hugging Face Transformers, CUDA
- *Tools*: Docker, Kubernetes, Git, AWS, GCP, Weights & Biases, Slurm
