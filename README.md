# svelte-heroicons

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

[Svelte](https://svelte.dev/) component for [Heroicons](https://heroicons.com/).

## Install

```bash
npm i -S @martinse/svelte-heroicons
```

## Usage

```sveltehtml

<script>
    import Heroicon from '@martinse/svelte-heroicons';
    import {heart as solidHeart} from '@martinse/svelte-heroicons/dist/solid';
    import {heart as outlineHeart} from '@martinse/svelte-heroicons/dist/outline';
</script>


<Heroicon icon={outlineHeart}/>
<Heroicon icon={outlineHeart} size="2em"/>
<Heroicon icon={solidHeart} size="3em" class="red"/>


<style>
    :global(.red) {
        color: red;
    }
</style>
```

Will render:

![output](docs/output.png)

## Build / development

In order to build new versions of this package, there some prerequisites to be installed, and some commands to execute.
The build process is executed within a Docker container.

### Prerequisites

- [Docker](https://www.docker.com/)
- [Taskfile](https://taskfile.dev/)

### Building the Docker container

```shell
task build
```

### Building the package

Building the package is composed of two stes:

1. Download and generate icon data from a specific Heroicons version
2. Build the NPM package

```shell
task generate-icon-data
task build-npm-dist
```

### Publish to NPM

- Update the version in `package.json`
- Tag and push to GitHub
- Publish to NPM:

```shell
task publish
```

## Update Heroicons version

Update the `HEROICONS_VERSION` variable in `Taskfile.yml` and rebuild the Docker container + build/publish the NPM
package.

## Improvements

* [ ] Avoid the `/dist` path when importing solid or outline
* [ ] Investigate using this package with Svelte + Snowpack (or SvelteKit) as there seems to be an issue with the Rollup configuration
* [ ] Add tests
* [ ] Add linting
* [ ] Create a proper demo page + figure out how to publish a Svelte app to GitHub pages
* [ ] Sync version in `Taskfile.yml` and `package.json` automatically
* [ ] Implement `task publish`
* [ ] Add git tags for published versions
* [ ] Probably a lot more, feel free to create issues on what can be improved!

## License

[MIT](LICENSE.md)
