# Generate supabase types
`supabase gen types typescript --project-id xfvygonrlhymjorcvyue > database.types.ts`


# blog-ai

This template should help get you started developing with Vue 3 in Vite.

## Recommended IDE Setup

[VSCode](https://code.visualstudio.com/) + [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) (and disable Vetur) + [TypeScript Vue Plugin (Volar)](https://marketplace.visualstudio.com/items?itemName=Vue.vscode-typescript-vue-plugin).

## Type Support for `.vue` Imports in TS

TypeScript cannot handle type information for `.vue` imports by default, so we replace the `tsc` CLI with `vue-tsc` for type checking. In editors, we need [TypeScript Vue Plugin (Volar)](https://marketplace.visualstudio.com/items?itemName=Vue.vscode-typescript-vue-plugin) to make the TypeScript language service aware of `.vue` types.

If the standalone TypeScript plugin doesn't feel fast enough to you, Volar has also implemented a [Take Over Mode](https://github.com/johnsoncodehk/volar/discussions/471#discussioncomment-1361669) that is more performant. You can enable it by the following steps:

1. Disable the built-in TypeScript Extension
    1) Run `Extensions: Show Built-in Extensions` from VSCode's command palette
    2) Find `TypeScript and JavaScript Language Features`, right click and select `Disable (Workspace)`
2. Reload the VSCode window by running `Developer: Reload Window` from the command palette.

## Customize configuration

See [Vite Configuration Reference](https://vitejs.dev/config/).

## Project Setup

```sh
npm install
```

### Compile and Hot-Reload for Development

```sh
npm run dev
```

### Type-Check, Compile and Minify for Production

```sh
npm run build
```

### Lint with [ESLint](https://eslint.org/)

```sh
npm run lint
```




You are a professional travel writer writing in a confident, knowledgeable, neutral and clear manor, writing in plural first person. You are writing an article on a titled ###road trip from Portland Oregon to Sanfransisco###. The outline is as follows:###
Introduction
Itinerary
Day 1: Portland to Cannon Beach
Day 2: Cannon Beach to Columbia River Gorge
Day 3: Columbia River Gorge to Mt Hood
Day 4: Mt Hood to Bend
Day 5: Bend to Crater Lake
Day 6: Crater Lake to Redwood National and State Parks
Day 7: Redwood National and State Parks Fort Bragg
Day 8: Fort Bragg to Point Reyes National Seashore
Day 9: Point Reyes National Seashore to San Fransisco
Festivals and events
Key Takeaways
Conclusion
###
Write just "Day 1: Portland to Cannon Beach", include things to see a to see along the route and hip things to do at the destination

### Sample openai prompt
```angular2html
You are a professional travel writer writing in a confident, knowledgeable, neutral and clear manor, writing in plural first person. You are writing an article on a titled ###road trip from Portland Oregon to Sanfransisco###. The outline is as follows:###
Introduction
Itinerary
   Day 1: Portland to Cannon Beach
   Day 2: Cannon Beach to Columbia River Gorge
   Day 3: Columbia River Gorge to Mt Hood
   Day 4: Mt Hood to Bend
   Day 5: Bend to Crater Lake
   Day 6: Crater Lake to Redwood National and State Parks
   Day 7: Redwood National and State Parks Fort Bragg
   Day 8: Fort Bragg to Point Reyes National Seashore
   Day 9: Point Reyes National Seashore to San Fransisco
Festivals and events
Key Takeaways
Conclusion
###
Write just "Day 1: Portland to Cannon Beach", include things to see a to see along the route and hip things to do at the destination. Write 2 to 4 paragraphs.
```