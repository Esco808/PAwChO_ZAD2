### Tagowanie obrazów

## Obrazy tagowane są za pomocą:

- **semantyczne wersjonowanie** na podstawie `https://semver.org/`:

>Given a version number MAJOR.MINOR.PATCH, increment the:
MAJOR version when you make incompatible API changes
MINOR version when you add functionality in a backward compatible manner
PATCH version when you make backward compatible bug fixes

Taka praktyka zwiększa czytelność projektu i ułatwia zrozumienie skali zmian pomiędzy wersjami.

- **sha** (np. `sha-abc1234`)

## Cache w DockerHub:

Dane cache są przechowywane w oddzielnym repozytorium DockerHub:
- `https://hub.docker.com/r/ostrowski2000/zad2`

Zostały użyte oddzielne tagi dla plików cache obu architektur, w formie "cache-<architektura>"

### Skanowanie CVE

Do skanowania użyto narzędzia **Trivy**:
- wykonywany jest lokalny skan zbudowanego obrazu (każda architektura oddzielnie)
- jeśli występuje chociaż jedno zagrożenie HIGH lub CRITICAL, zwracany jest kod 1
- obraz jest publikowany tylko w przypadku pomyślnego wyniku testu

### Uruchamianie łańcucha GHAction:

Łańcuch jest uruchamiany po wypchnięciu tagu w formacie `vX.Y.Z`, np.:
```bash
git tag v1.0.0
git push origin v1.0.0
```