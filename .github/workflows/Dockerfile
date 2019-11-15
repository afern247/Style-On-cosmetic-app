FROM swift:5.0
USER root
LABEL "com.github.actions.name"="SwiftPM-GitHubAction"
LABEL "com.github.actions.description"="CI/CD Swift Packages with Github Actions"
LABEL "com.github.actions.icon"="airplay"
LABEL "com.github.actions.color"="orange"
LABEL "repository"="https://github.com/afern247/Style-On-cosmetic-app"
LABEL "homepage"="https://github.com/afern247/Style-On-cosmetic-app"
LABEL "maintainer"="Arturo and Ramses <afern247@protonmail.com>"
RUN apt-get update && apt-get install -y git
RUN mkdir /SwiftPM-GitHubAction
WORKDIR /SwiftPM-GitHubAction
COPY . /SwiftPM-GitHubAction
# ENTRYPOINT ["/SwiftPM-GitHubAction/entrypoint.sh"]