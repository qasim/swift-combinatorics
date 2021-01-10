# Permutations

Returns all possible [permutations](https://en.wikipedia.org/wiki/Permutations) of a collection's elements.

## Samples

```swift
for permutation in [1, 2, 3].permutations(length: 2) {
    print(permutation)
}
// [1, 2]
// [1, 3]
// [2, 1]
// [2, 3]
// [3, 1]
// [3, 2]
```

```swift
for permutation in [1, 2, 3].permutations(length: 2, withReplacement: true) {
    print(permutation)
}
// [1, 1]
// [1, 2]
// [1, 3]
// [2, 1]
// [2, 2]
// [2, 3]
// [3, 1]
// [3, 2]
// [3, 3]
```
