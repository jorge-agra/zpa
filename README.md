# Z PL/SQL Analyzer - ZPA

[![Latest release](https://img.shields.io/github/release/felipebz/zpa.svg) ](https://github.com/felipebz/zpa/releases/latest)
[![Build](https://github.com/felipebz/zpa/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/felipebz/zpa/actions/workflows/build.yml)
[![Quality Gate Status](https://sonarqube.felipezorzo.com.br/api/project_badges/measure?project=com.felipebz.zpa%3Azpa&metric=alert_status)](https://sonarqube.felipezorzo.com.br/dashboard?id=com.felipebz.zpa%3Azpa)

The Z PL/SQL Analyzer (or simply ZPA) is a code analyzer for PL/SQL and Oracle SQL code.

You can use it in a [SonarQube](https://www.sonarqube.org) on-premise instance. SonarQube is an open platform to manage code quality.

See some examples in our [SonarQube instance](https://sonarqube.felipezorzo.com.br/projects?languages=plsqlopen)!

Do you want to use this analyzer in a project hosted on [SonarCloud](https://sonarcloud.io)? Try the [zpa-cli](https://github.com/felipebz/zpa-cli)!

## Installation

- Download the [latest sonar-zpa-plugin release](https://github.com/felipebz/zpa/releases/latest) and copy to the SONARQUBE_HOME/extensions/plugins directory;
- Restart your SonarQube server;
- Navigate to the Marketplace (SONARQUBE_URL/marketplace?filter=installed). It should list "Z PL/SQL Analyzer" on the tab "Installed Plugins";
- Run an analysis with [SonarScanner](https://docs.sonarsource.com/sonarqube/latest/analyzing-source-code/overview/).

If you like to live on the bleeding edge, you can use the [latest development version](https://github.com/felipebz/zpa/releases/early-access).

## Compatibility matrix

| ZPA version                                                                                       | SonarQube version (min/max) |
|---------------------------------------------------------------------------------------------------|-----------------------------|
| 3.4.0                                                                                             | 9.9 / 10.5                  |
| 3.5.0 ([early-access](https://github.com/felipebz/zpa/releases/tag/early-access), in development) | 9.9 / 10.6                  |

## ZPA Toolkit

The ZPA Toolkit is visual tool to review the AST (abstract syntax tree) and the symbol table generated by the parser.

![](https://raw.githubusercontent.com/wiki/felipebz/zpa/img/zpa-toolkit.png)

The latest ZPA Toolkit can be downloaded from the [releases page](https://github.com/felipebz/zpa/releases/latest) and it requires JDK 11 or newer. You can also download the [latest development version](https://github.com/felipebz/zpa/releases/early-access). 

## Contribute

Everyone is welcome to contribute. Please read our [contribution guidelines](CONTRIBUTING.md) for more information.

There are a few things you need to know about the code. It is divided in these modules:

- `plsql-custom-rules` - Demo project showing how to extend ZPA with custom coding rules.
- `sonar-zpa-plugin` - The SonarQube plugin itself, this module contains all the code necessary to integrate with the SonarQube platform.
- `zpa-checks` - The built-in coding rules provided by ZPA.
- `zpa-checks-testkit` - Test helper for coding rules, it can be used to test custom rules.
- `zpa-core` - The heart of this project. It contains the lexer, the parser and the code required to understand and process PL/SQL code.
- `zpa-toolkit` - A visual tool to review the AST (abstract syntax tree) generated by the parser.

The API exposed to custom plugins must be located in the package `org.sonar.plugins.plsqlopen.api` (it's a requirement from the SonarQube server). The classes located outside this package are not prepared for external consumption, so if you use them, your code can break without any further notice.

### Running the integration tests

There are two sets of integration tests:

- [sonar-zpa-plugin/integrationTest](https://github.com/felipebz/zpa/tree/main/sonar-zpa-plugin/src/integrationTest): checks if the metrics are imported correctly in SonarQube
- [zpa-checks/integrationTest](https://github.com/felipebz/zpa/tree/main/zpa-checks/src/integrationTest): checks the quality of parser and rules against real-world code

To run the integrations tests, first update the submodules:

    git submodule update --init --recursive
    
Build the main plugin and the custom rules example:

    ./gradlew build publishToMavenLocal
    ./gradlew build -p plsql-custom-rules

Then run the tests:

    ./gradlew integrationTest

By default, the tests will be executed using SonarQube 9.9 LTS. You can change the SonarQube version using the property `sonar.runtimeVersion`, passing one of `LATEST_RELEASE[9.9]` (for SonarQube 9.9.x LTS), `LATEST_RELEASE[10.4]` (latest official release) or `a.b.c.d` for an exact release including build number: 

    ./gradlew integrationTest -Dsonar.runtimeVersion=LATEST_RELEASE[9.9]
