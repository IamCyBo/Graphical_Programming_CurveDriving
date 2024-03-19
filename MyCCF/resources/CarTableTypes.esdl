package resources;

import units.si.m;
import units.si.s;
import units.common.kmph;
import units.common.mps2;

type curve_m is table m -> m;
type curve_real_mps2 is table real -> mps2;
type curve_kmph_mps2 is table kmph -> mps2;
type curve_m_kmph is table m -> kmph;

type map_real_kmph_mps2 is table real, kmph -> mps2;
