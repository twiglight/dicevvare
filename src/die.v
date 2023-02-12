module dicevvare

import rand
import rand.seed

pub struct Die {
    n_seed int = 2
    eyes u32 = 6
}

pub fn (d Die) init() {
    rand.seed(seed.time_seed_array(d.n_seed))
}

pub fn (d Die) roll() u32 {
	return rand.u32_in_range(1, d.eyes + 1) or {panic('Couln\'t roll ${d.eyes} eyes!')}
}

