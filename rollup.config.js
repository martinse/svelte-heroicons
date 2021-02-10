import svelte from 'rollup-plugin-svelte';
import resolve from '@rollup/plugin-node-resolve';
import css from 'rollup-plugin-css-only';
import pkg from './package.json';

const name = pkg.name
    .replace(/^(@\S+\/)?(svelte-)?(\S+)/, '$3')
    .replace(/^\w/, m => m.toUpperCase())
    .replace(/-\w/g, m => m[1].toUpperCase());

export default [
    {
        input: 'src/index.js',
        output: [
            {dir: 'dist', 'format': 'es'},
            {dir: 'dist', 'format': 'umd', name}
        ],
        plugins: [
            svelte(),
            css(),
            resolve({
                browser: false,
                modulesOnly: true,
            }),
        ]
    },
    {
        input: 'src/outline/index.js',
        output: [
            {dir: 'dist/outline', 'format': 'es'},
            {dir: 'dist/outline', 'format': 'umd', name}
        ],
        plugins: [
            svelte(),
            css(),
            resolve({
                browser: false,
                modulesOnly: true,
            }),
        ]
    },
    {
        input: 'src/solid/index.js',
        output: [
            {dir: 'dist/solid', 'format': 'es'},
            {dir: 'dist/solid', 'format': 'umd', name}
        ],
        plugins: [
            svelte(),
            css(),
            resolve({
                browser: false,
                modulesOnly: true,
            }),
        ]
    }
];
