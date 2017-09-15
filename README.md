# salt-formulas


Apply formula

$ salt-call --local state.apply

Apply only one formula

$ salt-call --local state.sls php

If get error:

$ salt-call --file-root=. --local state.apply docker
