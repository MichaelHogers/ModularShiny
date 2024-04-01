# ModularShiny Project Repository

## Overview
This repository contains a suite of interconnected Shiny applications and associated helper packages designed for deployment with ShinyProxy. Our structure emphasizes modularity and reusability across different projects.

## Repository Structure
- `.github/workflows`: Contains GitHub Actions workflows for CI/CD.
- `ShinyApp1`, `ShinyApp2`, `ShinyApp3`: Individual Shiny applications.
- `ShinyAdmin`: An admin interface for managing Shiny applications.
- `deployment/shinyproxy`: Configuration files for deploying apps with ShinyProxy.
- `helperAuth`, `helperDbManagement`, `helperDesign`: Helper packages to support app functionality.

## Project Architecture
![Modular Shiny Architecture](docs/diagrams/architecture.png)

The architecture is designed to keep Shiny projects mostly isolated, while shared logic is maintained through helper packages.

## Helper Packages
- `helperAuth`: Manages authentication across Shiny applications.
- `helperDbManagement`: Provides database connections and operations.
- `helperDesign`: Contains common UI elements and themes.

## Deployment
Repo focuses on ShinyProxy to serve applications. Other deployment methods, such as RStudio Connect, may work as well.

## License
This project is licensed under the MIT License - see the LICENSE.md file for details.

##  Contact
For any further questions, please contact michael_hogers@live.nl.