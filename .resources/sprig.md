[View on GitHub](https://github.com/Masterminds/sprig)

# sprig

## Useful template functions for Go templates.

# Sprig Function Documentation

The Sprig library provides over 70 template functions for Go’s template language.

- [String Functions](/sprig/strings.html): `trim`, `wrap`, `randAlpha`, `plural`, etc.
  
  - [String List Functions](/sprig/string_slice.html): `splitList`, `sortAlpha`, etc.
- [Integer Math Functions](/sprig/math.html): `add`, `max`, `mul`, etc.
  
  - [Integer Slice Functions](/sprig/integer_slice.html): `until`, `untilStep`
- [Float Math Functions](/sprig/mathf.html): `addf`, `maxf`, `mulf`, etc.
- [Date Functions](/sprig/date.html): `now`, `date`, etc.
- [Defaults Functions](/sprig/defaults.html): `default`, `empty`, `coalesce`, `fromJson`, `toJson`, `toPrettyJson`, `toRawJson`, `ternary`
- [Encoding Functions](/sprig/encoding.html): `b64enc`, `b64dec`, etc.
- [Lists and List Functions](/sprig/lists.html): `list`, `first`, `uniq`, etc.
- [Dictionaries and Dict Functions](/sprig/dicts.html): `get`, `set`, `dict`, `hasKey`, `pluck`, `dig`, `deepCopy`, etc.
- [Type Conversion Functions](/sprig/conversion.html): `atoi`, `int64`, `toString`, etc.
- [Path and Filepath Functions](/sprig/paths.html): `base`, `dir`, `ext`, `clean`, `isAbs`, `osBase`, `osDir`, `osExt`, `osClean`, `osIsAbs`
- [Flow Control Functions](/sprig/flow_control.html): `fail`
- Advanced Functions
  
  - [UUID Functions](/sprig/uuid.html): `uuidv4`
  - [OS Functions](/sprig/os.html): `env`, `expandenv`
  - [Version Comparison Functions](/sprig/semver.html): `semver`, `semverCompare`
  - [Reflection](/sprig/reflection.html): `typeOf`, `kindIs`, `typeIsLike`, etc.
  - [Cryptographic and Security Functions](/sprig/crypto.html): `derivePassword`, `sha256sum`, `genPrivateKey`, etc.
  - [Network](/sprig/network.html): `getHostByName`
  - [URL](/sprig/url.html): `urlParse`, `urlJoin`

sprig maintained by [Masterminds](https://github.com/Masterminds)

Published with [GitHub Pages](https://pages.github.com)
