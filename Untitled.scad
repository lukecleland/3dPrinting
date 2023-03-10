
module key() {
    $fn = 6;
    cylinder(15, 3.5, 3.5);
}

module base() {
    $fn = 50;
    cylinder(1, 12, 12);
}

key();
base();