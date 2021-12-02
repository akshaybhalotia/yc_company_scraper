<!-- PROJECT LOGO -->
<p align="center">
  <a href="https://ycombinator.com">
    <img src="https://www.ycombinator.com/assets/ycdc/ycombinator-logo-37cf030fbc255fc71d19aa21bd5b32076aa206e8fbd0121c9247db2adcbd7851.png" alt="Logo" width="80">
  </a>

  <h2 align="center">yc_company_scraper by akshaybhalotia</h3>

  <p align="center">
    Barebones scraper for listing all YC companies
    <br />
    <a href="https://github.com/akshaybhalotia/yc_company_scraper/blob/main/data/yc_essential_data.json">View Data</a>
    ·
    <a href="https://github.com/akshaybhalotia/yc_company_scraper/issues">Report Bug</a>
    ·
    <a href="https://github.com/akshaybhalotia/yc_company_scraper/issues">Request Feature</a>
  </p>
</p>

<!-- TABLE OF CONTENTS -->

## Table of Contents

- [About the Project](#about-the-project)
  - [Built With](#built-with)
- [Getting Started](#getting-started)
  - [Dependencies](#dependencies)
  - [Installing](#installing)
  - [Usage](#usage)
    - [Run locally](#run-project-locally)
  - [Help](#help)
- [Versioning](#versioning)
  - [Version History](#version-history)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [Support](#support)
- [License](#license)
- [Acknowledgments](#acknowledgments)
- [About Authors](#about-authors)

<!-- ABOUT THE PROJECT -->

## About The Project

This is an attempt to get publicly available data for all Y-Combinator (fondly known as "YC") backed companies, as available at the official ["startup directory"](https://www.ycombinator.com/companies/).

### Built With

- [jq](https://stedolan.github.io/jq/)
- [Ruby](https://www.ruby-lang.org/)
- [VS Code](https://code.visualstudio.com/)
- 
- :heart:

<!-- GETTING STARTED -->

## Getting Started

You can clone or download the repo, and run the `refresh_data.sh` to refresh the data. You may also look at the other scripts if you want to run individual tasks or learn more about the project.

If you just want to view the data, you can look into the `data` directory.

## Dependencies

To run these scripts locally, you would need

- Ruby language (if not pre-installed, visit https://www.ruby-lang.org/en/documentation/installation/)
  ```sh
  ruby -v
  ```
- jq (download using OS and distribution specific version from https://stedolan.github.io/jq/download/)

## Installing

Clone the repo

```sh
git clone https://github.com/akshaybhalotia/yc_company_scraper.git
```

<!-- USAGE EXAMPLES -->

## Usage

### Run project locally

```shell
sh refresh_data.sh
```

## Help

You might encounter 3 kinds of issues:

1. `ruby` or `jq` related: Something might change with the future (or past) versions of the Ruby lang or jq tool, causing the scripts to break. This script has been tested on ruby `v2.7.x` and `v3.0.x`, and jq `v1.6`. Your best bet is to read the official changelogs to figure out what changed and how to fix it. Submit a PR too! (Or you could ping me, I'll look at it in my free time - no promises)

2. OS related: I built this script on macOS `v12.1`, but is mostly generic enough to be run on all UNIX-derived, UNIX-like or Linux-like systems. If you still run into errors, please look at OS specific instructions to run the Ruby lang and `jq` properly.

3. Data related: Y-Combinator or Algolia may decide to change their APIs or data formats, which is always a risk for scrapers if something at the data source changes. If you can figure out what changed, you might want to submit a PR. (Or, again, you could ping me but no promises)

<!-- CHANGELOG -->

## Versioning

We use [SemVer](https://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/akshaybhalotia/yc_company_scraper/tags).

### Version History

See [CHANGELOG](./CHANGELOG.md).

<!-- ROADMAP -->

## Roadmap

See the [open issues](https://github.com/akshaybhalotia/yc_company_scraper/issues) for a list of proposed features (and known issues).

<!-- CONTRIBUTING -->

## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**. Sincere thanks to all our contributors. Thank you, [contributors](https://github.com/akshaybhalotia/yc_company_scraper/graphs/contributors)!

You are requested to follow the contribution guidelines specified in [CONTRIBUTING.md](./CONTRIBUTING.md) and code of conduct at [CODE_OF_CONDUCT.md](./CODE_OF_CONDUCT.md) while contributing to the project :smile:.

## Support

Contributions, issues, and feature requests are welcome!
Give a ⭐️ if you like this project. Donate $$ at https://paypal.me/akshaybhalotia if you like this work.

<!-- LICENSE -->

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

## Acknowledgments

This project is inspired by:

- [yclist](https://yclist.com)
- [yclist code](https://github.com/linrock/yclist)

When I didn't find a source to download the data for all YC companies, and came across this repo with outdated data - I decided to build my own. I hope to have enough time at some point to update the data at [yclist](https://github.com/linrock/yclist) repo.

## About Authors

`yc_company_scraper` is created & maintained by Akshay Bhalotia. You can find me on Twitter - [@akshay_bhalotia](https://twitter.com/akshay_bhalotia) or write to me at `opensource [at] axy.one`.
