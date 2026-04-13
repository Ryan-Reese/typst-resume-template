# Resume for Researchers

<div align="center">Version 0.1.0</div>

A Typst resume template designed for researchers and academics. It provides ATS-compatible formatting with components tailored for research projects, co-authorships, and multiple repository links. Defaults to A4 paper and uses New Computer Modern with ligatures disabled for maximum ATS compatibility. Inspiration is taken from [Jake's Resume](https://github.com/jakegut/resume), [guided-resume-starter-cgc](https://typst.app/universe/package/guided-resume-starter-cgc/), and [stuxf/basic-typst-resume-template](https://github.com/stuxf/basic-typst-resume-template).

## Sample Resume

![example resume](https://raw.githubusercontent.com/Ryan-Reese/typst-resume-template/main/output/example-resume.png)

## Quick Start

A barebones resume looks like this, which you can use to get started.

```typst
#import "@preview/resume-for-researchers:0.1.0": *

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

== Education

#edu(
  institution: "Massachusetts Institute of Technology",
  location: "Cambridge, MA",
  dates: dates-helper(start-date: "Sep 2020", end-date: "Jun 2025"),
  degree: "PhD, Computer Science",
)
- Thesis: "Scalable Methods for Neural Program Synthesis"

== Work Experience

#work(
  title: "Research Scientist Intern",
  location: "New York, NY",
  company: "Meta AI (FAIR)",
  dates: dates-helper(start-date: "May 2023", end-date: "Aug 2023"),
)
- Developed novel attention mechanism for code generation
- Published findings at NeurIPS 2023 as first author

== Research Projects

#work-project(
  role: "Lead Author",
  title: "NeuralSynth: Program Synthesis via Guided Search",
  dates: dates-helper(start-date: "Jan 2022", end-date: "Dec 2023"),
  coauthor: "with Prof. Johnson",
  urls: ("github.com/janesmith/neuralsynth", "github.com/janesmith/neuralsynth-data"),
)
- State-of-the-art results on SyGuS benchmark, accepted at ICML 2024

// ... more sections below
```

## Available Functions

The following formatting functions are available:

| Function | Parameters | Description |
|---|---|---|
| `edu` | `institution`, `location`, `dates`, `degree`, `consistent` | Education entries |
| `work` | `company`, `dates`, `location`, `title` | Work experience entries |
| `work-project` | `role`, `title`, `dates`, `coauthor`, `urls` | Research projects with co-authors and multiple repository links |
| `project` | `dates`, `name`, `role`, `url` | General project entries |
| `certificates` | `name`, `issuer`, `url`, `date` | Certifications |
| `extracurriculars` | `activity`, `dates` | Extracurricular activities |

The `work-project` function is designed for research contexts — it supports listing a co-author and rendering multiple GitHub links inline (e.g. "github1 | github2") via the `urls` parameter.

There are also generic layout functions that don't apply any formatting:

| Function | Parameters |
|---|---|
| `generic-two-by-two` | `top-left`, `top-right`, `bottom-left`, `bottom-right` |
| `generic-one-by-two` | `left`, `right` |
