# Combinations

Returns all possible [combinations](https://en.wikipedia.org/wiki/Combinations) of a collection's elements.

## Samples

```swift
for combination in [1, 2, 3].combinations(length: 2) {
    print(combination)
}
// [1, 2]
// [1, 3]
// [2, 3]
```

```swift
for combination in [1, 2, 3].combinations(length: 2, withReplacement: true) {
    print(combination)
}
// [1, 1]
// [1, 2]
// [2, 2]
// [1, 3]
// [2, 3]
// [3, 3]
```
