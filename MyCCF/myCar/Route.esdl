package myCar;

import resources.vect;
import resources.arr_m;
import units.si.m;
import vectorOperations.vectOps;

class Route {

	vectOps vectOps;
	//arr_m x[9] = {0.0[m], 10.264[m], 92.392[m], 128.309[m], 154.688[m], 184.725[m], 380.987[m]};
	//arr_m y[9] = {0.0[m], 9.977[m], 94.244[m], 126.387[m], 146.327[m], 67.368[m], 276.906[m]};
	
	arr_m x[206] = {1.242679[m],  -16.808783[m],  -34.847397[m],  -52.870484[m],  -70.875363[m],  -88.859356[m],  -106.820032[m],  -124.813521[m],  -143.029457[m],  -161.675983[m],  -180.917598[m],  -200.741511[m],  -221.089921[m],  -241.926143[m],  -263.369745[m],  -284.822088[m],  -308.352691[m],  -315.307349[m],  -308.282149[m],  -299.088746[m],  -287.240574[m],  -273.751629[m],  -262.211681[m],  -260.782271[m],  -269.519354[m],  -286.687199[m],  -309.93477[m],  -334.849[m],  -359.676371[m],  -384.417964[m],  -409.016955[m],  -433.005245[m],  -455.852264[m],  -475.106079[m],  -481.841687[m],  -469.203538[m],  -447.317817[m],  -422.406673[m],  -397.701308[m],  -382.145171[m],  -382.610426[m],  -385.723848[m],  -389.536439[m],  -393.743254[m],  -398.319825[m],  -403.237579[m],  -408.383001[m],  -413.576294[m],  -418.696636[m],  -425.639813[m],  -434.083191[m],  -442.44603[m],  -450.553504[m],  -458.632788[m],  -466.874532[m],  -475.318695[m],  -483.64114[m],  -489.311524[m],  -486.953056[m],  -475.587362[m],  -457.329404[m],  -435.661037[m],  -413.181674[m],  -391.084513[m],  -370.810099[m],  -362.017844[m],  -369.30617[m],  -387.495627[m],  -409.548965[m],  -431.770986[m],  -454.035364[m],  -476.170317[m],  -498.033565[m],  -519.502036[m],  -540.460203[m],  -560.880732[m],  -580.793616[m],  -600.225573[m],  -619.088252[m],  -637.1677[m],  -654.244826[m],  -670.40058[m],  -686.340963[m],  -701.854676[m],  -716.181014[m],  -729.567834[m],  -742.527094[m],  -756.124822[m],  -775.39185[m],  -799.637436[m],  -818.880372[m],  -826.663927[m],  -819.716277[m],  -802.457426[m],  -783.921701[m],  -765.686607[m],  -747.571403[m],  -729.44094[m],  -711.285133[m],  -693.115147[m],  -674.942146[m],  -656.777297[m],  -638.631763[m],  -620.510246[m],  -603.827648[m],  -594.110684[m],  -588.533507[m],  -588.8427[m],  -594.693237[m],  -601.299484[m],  -604.177557[m],  -602.411185[m],  -595.237139[m],  -586.748217[m],  -578.197676[m],  -569.665915[m],  -561.22251[m],  -552.871644[m],  -544.593057[m],  -536.366446[m],  -528.171509[m],  -519.987944[m],  -511.795634[m],  -503.582198[m],  -495.345598[m],  -487.083511[m],  -478.645773[m],  -473.203323[m],  -480.245785[m],  -500.190707[m],  -522.967151[m],  -545.591038[m],  -568.260181[m],  -590.935983[m],  -613.515212[m],  -631.500295[m],  -642.389564[m],  -643.691838[m],  -634.919137[m],  -619.528103[m],  -602.75255[m],  -586.266386[m],  -569.78406[m],  -553.275296[m],  -536.75676[m],  -520.24512[m],  -503.757042[m],  -487.309193[m],  -470.915014[m],  -454.558203[m],  -438.206407[m],  -421.812167[m],  -405.03523[m],  -386.987505[m],  -366.144288[m],  -342.959534[m],  -318.827237[m],  -294.477182[m],  -270.114232[m],  -245.765891[m],  -221.424492[m],  -197.083216[m],  -172.740338[m],  -148.396046[m],  -124.050528[m],  -99.703972[m],  -75.356568[m],  -51.008546[m],  -26.661224[m],  -2.317108[m],  22.021357[m],  46.379522[m],  70.751675[m],  92.745692[m],  103.507133[m],  114.317552[m],  134.642527[m],  158.306757[m],  182.646247[m],  207.192066[m],  231.737396[m],  256.22131[m],  280.701549[m],  305.376514[m],  326.819615[m],  342.756596[m],  347.076851[m],  338.179139[m],  321.830723[m],  303.974799[m],  285.99058[m],  268.10469[m],  250.246838[m],  232.351964[m],  214.403208[m],  196.409433[m],  178.379739[m],  160.32323[m],  142.249007[m],  124.166151[m],  106.08132[m],  87.996622[m],  69.913664[m],  51.834053[m],  33.759396[m],  15.6913[m]}; 
	arr_m y[206] = {-1.293111[m],  -18.60197[m],  -35.924339[m],  -53.263394[m],  -70.622312[m],  -88.00427[m],  -105.412168[m],  -122.783823[m],  -139.908691[m],  -156.55565[m],  -172.531298[m],  -187.795433[m],  -202.346748[m],  -216.150271[m],  -228.922639[m],  -242.048741[m],  -244.935164[m],  -223.328482[m],  -199.291109[m],  -176.099104[m],  -154.029286[m],  -133.129134[m],  -110.873941[m],  -86.299079[m],  -62.971843[m],  -45.140805[m],  -36.386155[m],  -36.04409[m],  -38.994073[m],  -42.445496[m],  -47.230387[m],  -54.156787[m],  -64.101947[m],  -79.879895[m],  -103.181338[m],  -124.272336[m],  -134.959274[m],  -131.910324[m],  -134.697907[m],  -152.526557[m],  -177.417118[m],  -202.229978[m],  -226.93442[m],  -251.585953[m],  -276.17558[m],  -300.695845[m],  -325.167893[m],  -349.635194[m],  -374.125305[m],  -398.115815[m],  -421.666439[m],  -445.230858[m],  -468.890321[m],  -492.56342[m],  -516.173435[m],  -539.707599[m],  -563.351625[m],  -587.472378[m],  -612.269588[m],  -634.585293[m],  -651.177281[m],  -663.669185[m],  -674.712099[m],  -686.374602[m],  -700.771636[m],  -723.352875[m],  -746.95867[m],  -763.739955[m],  -775.392392[m],  -786.912504[m],  -798.286419[m],  -809.927413[m],  -822.078426[m],  -834.893249[m],  -848.513479[m],  -862.939412[m],  -878.079495[m],  -893.84508[m],  -910.268463[m],  -927.513957[m],  -945.75141[m],  -964.8689[m],  -984.16415[m],  -1003.744114[m],  -1024.219777[m],  -1045.374057[m],  -1066.772662[m],  -1087.698907[m],  -1102.781183[m],  -1100.684201[m],  -1085.718612[m],  -1062.206549[m],  -1038.52411[m],  -1020.726302[m],  -1003.928584[m],  -986.818711[m],  -969.580244[m],  -952.351248[m],  -935.145013[m],  -917.953624[m],  -900.769164[m],  -883.583718[m],  -866.38937[m],  -849.1449[m],  -830.632458[m],  -807.592913[m],  -783.306266[m],  -758.360058[m],  -734.110684[m],  -709.965278[m],  -685.17396[m],  -660.254844[m],  -636.359089[m],  -612.820908[m],  -589.314552[m],  -565.806586[m],  -542.267925[m],  -518.695768[m],  -495.097141[m],  -471.479085[m],  -447.848642[m],  -424.212855[m],  -400.578773[m],  -376.953776[m],  -353.345683[m],  -329.762091[m],  -306.144213[m],  -282.017025[m],  -258.222621[m],  -243.971874[m],  -233.554176[m],  -222.94471[m],  -212.325526[m],  -201.832984[m],  -190.944954[m],  -174.27548[m],  -151.750861[m],  -127.009113[m],  -103.800949[m],  -84.204935[m],  -65.530461[m],  -46.753797[m],  -27.972589[m],  -9.195439[m],  9.586201[m],  28.380876[m],  47.197132[m],  66.043515[m],  84.926744[m],  103.836688[m],  122.754126[m],  141.644376[m],  160.171698[m],  177.411043[m],  191.031774[m],  200.236016[m],  206.873954[m],  212.513751[m],  218.134999[m],  223.857298[m],  229.622568[m],  235.37955[m],  241.11821[m],  246.843932[m],  252.56213[m],  258.278214[m],  263.997597[m],  269.725432[m],  275.459967[m],  281.191954[m],  286.911653[m],  292.58105[m],  298.277316[m],  309.488763[m],  331.516431[m],  353.74229[m],  368.050195[m],  376.170575[m],  381.45837[m],  386.505246[m],  391.347976[m],  396.289463[m],  401.587992[m],  404.571199[m],  392.685485[m],  373.702077[m],  349.519664[m],  326.396395[m],  307.588379[m],  290.078387[m],  272.682667[m],  255.197583[m],  237.689797[m],  220.220967[m],  202.8067[m],  185.438027[m],  168.105751[m],  150.800673[m],  133.513595[m],  116.235341[m],  98.95919[m],  81.683035[m],  64.405276[m],  47.124314[m],  29.83855[m],  12.546384[m]}; 	
	
	@get
	vect focuspoint = {0.0[m], 0.0[m]};
	@get
	m distanceFocusEnd = 0[m];

	@generated("blockdiagram", "432c4023")
	public void calc(integer in arg) {
		distanceFocusEnd = this.distanceFocuspointEnd(arg); // Main/calc 1
		focuspoint = vectOps.getPoint(x[arg], y[arg]); // Main/calc 2
	}

	public m point_distance(vect point_in) {
		m tmp_distance;
		vect tmp_start = vectOps.getPoint(x[0], y[0]);
		vect tmp_end = vectOps.getPoint(x[1], y[1]);

		m min_distance = vectOps.distancePointSegment(point_in, tmp_start, tmp_end);
		for (i in 1 .. x.length(0) - 2) {
			tmp_start = vectOps.getPoint(x[i], y[i]);
			tmp_end = vectOps.getPoint(x[i + 1], y[i + 1]);
			tmp_distance = vectOps.distancePointSegment(point_in, tmp_start, tmp_end);

			if (tmp_distance < min_distance) {
				min_distance = tmp_distance;
			}
		}
		return min_distance;
	}

	public m distanceFocuspointEnd(integer arg) {
		m remainingDistance = 0[m];
		vect segStart;
		vect segEnd;
		if (arg >= x.length() - 1) {
			return 0[m];
		}
		for (i in arg .. x.length() - 2) {
			segStart = vectOps.getPoint(x[i], y[i]);
			segEnd = vectOps.getPoint(x[i + 1], y[i + 1]);
			remainingDistance = remainingDistance + vectOps.length(vectOps.getVect(segStart, segEnd));
		}
		return remainingDistance;
	}
}