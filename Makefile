
.PHONEY: all
all :
	cabal v2-run -O2 jhc -- --help

.PHONEY: stdlib
stdlib : all
	cabal v2-run -O2 jhc -- -L . --build-hl  lib/jhc-prim/jhc-prim.yaml
	cabal v2-run -O2 jhc -- -L . --build-hl  lib/jhc/jhc.yaml
	cabal v2-run -O2 jhc -- -L . --build-hl  lib/haskell-extras/haskell-extras.yaml
	cabal v2-run -O2 jhc -- -L . --build-hl  lib/haskell2010/haskell2010.yaml
	cabal v2-run -O2 jhc -- -L . --build-hl  lib/haskell98/haskell98.yaml
	cabal v2-run -O2 jhc -- -L . --build-hl  lib/applicative/applicative.yaml
	cabal v2-run -O2 jhc -- -L . --build-hl  lib/flat-foreign/flat-foreign.yaml

.PHONEY: examples
examples : stdlib
	cabal v2-run -O2 jhc -- -L . examples/Calendar.hs -o calendar
	cabal v2-run -O2 jhc -- -L . examples/HelloWorld.hs -o hello
	cabal v2-run -O2 jhc -- -L . examples/Primes.hs -o primes

.PHONEY: jhc-stack
jhc-stack:
	stack build

.PHONEY: stdlib-stack
stdlib-stack : jhc-stack
	stack exec jhc -- -L . --build-hl  lib/jhc-prim/jhc-prim.yaml
	stack exec jhc -- -L . --build-hl  lib/jhc/jhc.yaml
	stack exec jhc -- -L . --build-hl  lib/haskell-extras/haskell-extras.yaml
	stack exec jhc -- -L . --build-hl  lib/haskell2010/haskell2010.yaml
	stack exec jhc -- -L . --build-hl  lib/haskell98/haskell98.yaml
	stack exec jhc -- -L . --build-hl  lib/applicative/applicative.yaml
	stack exec jhc -- -L . --build-hl  lib/flat-foreign/flat-foreign.yaml

.PHONEY: examples-stack
examples-stack : stdlib-stack
	stack exec jhc -- -L . examples/Calendar.hs -o calendar
	stack exec jhc -- -L . examples/HelloWorld.hs -o hello
	stack exec jhc -- -L . examples/Primes.hs -o primes
