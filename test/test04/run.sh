#!/bin/bash
cp input/*.sch .
../../gxref *.sch
diff expect/p1.sch p1.sch
diff expect/p2.sch p2.sch
diff expect/p3.sch p3.sch
