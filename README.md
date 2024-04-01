# ModularShiny Project Repository

## Overview
This repository contains a suite of interconnected Shiny applications and associated helper packages designed for deployment with ShinyProxy. Our structure emphasizes modularity and reusability across different projects.

## Repository Structure
- `.github/workflows`: Contains GitHub Actions workflows for CI/CD.
- `ShinyApp1`, `ShinyApp2`, `ShinyApp3`: Individual Shiny applications.
- `ShinyAdmin`: An admin interface for managing Shiny applications.
- `deployment/shinyproxy`: Configuration files for deploying apps with ShinyProxy.
- `helperAuth`, `helperDbManagement`, `helperDesign`: Helper packages to support app functionality.
- `README.md`: Documentation of repository structure and setup instructions.
- `architecture.excalidraw`: Visual representation of the project architecture.

## Project Architecture
![Modular Shiny Architecture](architecture.png)

The architecture is designed to keep Shiny projects mostly isolated, while shared logic is maintained through helper packages.

## Helper Packages
- `helperAuth`: Manages authentication across Shiny applications.
- `helperDbManagement`: Provides database connections and operations.
- `helperDesign`: Contains common UI elements and themes.

## Deployment
We use ShinyProxy to serve our Shiny applications. Here is a snippet of our configuration:

```yaml
proxy:
  title: ShinyProxy
  logo-url: http://www.example.org/logo.png
  landing-page: /
  heartbeat-rate: 10000
  heartbeat-timeout: 60000
  port: 8080
  authentication: simple
  admin-groups: admins
...

## License
This project is licensed under the MIT License - see the LICENSE.md file for details.

##  Contact
For any further questions, please contact michael_hogers@live.nl.