Class {
	#name : #NCLineArrowGlyph,
	#superclass : #NCCurve,
	#instVars : [
		'originalFirstContour'
	],
	#category : #'MinimalConnectors-CurvesAndArrows'
}

{ #category : #'arrow forms' }
NCLineArrowGlyph class >> appleWithBite [
	"glyph 210 from BitstreamVeraSans"
	^ (NCLineArrowGlyph withContours: ((Array new: 2) at: 1 put: ((Array new: 66) at: 1 put: 0.0 @ 2.059;
				 at: 2 put: -0.082 @ 2.059;
				 at: 3 put: -0.238 @ 2.119;
				 at: 4 put: -0.238 @ 2.119;
				 at: 5 put: -0.395 @ 2.179;
				 at: 6 put: -0.469 @ 2.179;
				 at: 7 put: -0.469 @ 2.179;
				 at: 8 put: -0.586 @ 2.179;
				 at: 9 put: -0.704 @ 2.098;
				 at: 10 put: -0.704 @ 2.098;
				 at: 11 put: -0.82 @ 2.018;
				 at: 12 put: -0.938 @ 1.858;
				 at: 13 put: -0.938 @ 1.858;
				 at: 14 put: -1.123 @ 1.603;
				 at: 15 put: -1.225 @ 1.321;
				 at: 16 put: -1.225 @ 1.321;
				 at: 17 put: -1.324 @ 1.036;
				 at: 18 put: -1.324 @ 0.773;
				 at: 19 put: -1.324 @ 0.773;
				 at: 20 put: -1.323 @ 0.374;
				 at: 21 put: -1.095 @ 0.125;
				 at: 22 put: -1.095 @ 0.125;
				 at: 23 put: -0.868 @ 0.125 negated;
				 at: 24 put: -0.507 @ 0.125 negated;
				 at: 25 put: -0.507 @ 0.125 negated;
				 at: 26 put: -0.384 @ 0.124 negated;
				 at: 27 put: -0.226 @ 0.062 negated;
				 at: 28 put: -0.226 @ 0.062 negated;
				 at: 29 put: -0.067 @ 0.0;
				 at: 30 put: 0.0 @ 0.0;
				 at: 31 put: 0.0 @ 0.0;
				 at: 32 put: 0.062 @ 0.0;
				 at: 33 put: 0.22 @ 0.063 negated;
				 at: 34 put: 0.22 @ 0.063 negated;
				 at: 35 put: 0.38 @ 0.127 negated;
				 at: 36 put: 0.499 @ 0.126 negated;
				 at: 37 put: 0.499 @ 0.126 negated;
				 at: 38 put: 0.699 @ 0.126 negated;
				 at: 39 put: 0.859 @ 0.053 negated;
				 at: 40 put: 0.859 @ 0.053 negated;
				 at: 41 put: 1.019 @ 0.02;
				 at: 42 put: 1.151 @ 0.173;
				 at: 43 put: 1.151 @ 0.173;
				 at: 44 put: 0.965 @ 0.291;
				 at: 45 put: 0.874 @ 0.438;
				 at: 46 put: 0.874 @ 0.438;
				 at: 47 put: 0.785 @ 0.583;
				 at: 48 put: 0.785 @ 0.769;
				 at: 49 put: 0.785 @ 0.769;
				 at: 50 put: 0.784 @ 0.975;
				 at: 51 put: 0.893 @ 1.133;
				 at: 52 put: 0.893 @ 1.133;
				 at: 53 put: 1.002 @ 1.292;
				 at: 54 put: 1.208 @ 1.385;
				 at: 55 put: 1.208 @ 1.385;
				 at: 56 put: 0.999 @ 1.834;
				 at: 57 put: 0.833 @ 2.008;
				 at: 58 put: 0.833 @ 2.008;
				 at: 59 put: 0.668 @ 2.181;
				 at: 60 put: 0.462 @ 2.18;
				 at: 61 put: 0.462 @ 2.18;
				 at: 62 put: 0.371 @ 2.18;
				 at: 63 put: 0.222 @ 2.12;
				 at: 64 put: 0.222 @ 2.12;
				 at: 65 put: 0.075 @ 2.059;
				 at: 66 put: 0.0 @ 2.059;
				 yourself);
			 at: 2 put: ((Array new: 33) at: 1 put: -0.007 @ 0.096 negated;
				 at: 2 put: -0.009 @ 0.107 negated;
				 at: 3 put: -0.011 @ 0.122 negated;
				 at: 4 put: -0.011 @ 0.122 negated;
				 at: 5 put: -0.011 @ 0.137 negated;
				 at: 6 put: -0.01 @ 0.164 negated;
				 at: 7 put: -0.01 @ 0.164 negated;
				 at: 8 put: -0.01 @ 0.389 negated;
				 at: 9 put: 0.163 @ 0.58 negated;
				 at: 10 put: 0.163 @ 0.58 negated;
				 at: 11 put: 0.336 @ 0.773 negated;
				 at: 12 put: 0.593 @0.819 negated;
				 at: 13 put: 0.593 @0.819 negated;
				 at: 14 put: 0.595 @0.801 negated;
				 at: 15 put: 0.595 @0.778 negated;
				 at: 16 put: 0.595 @0.778 negated;
				 at: 17 put: 0.596 @0.754 negated;
				 at: 18 put: 0.596 @0.707 negated;
				 at: 19 put: 0.596 @0.707 negated;
				 at: 20 put: 0.596 @0.468 negated;
				 at: 21 put: 0.406 @0.279 negated;
				 at: 22 put: 0.406 @0.279 negated;
				 at: 23 put: 0.218 @0.092 negated;
				 at: 24 put: 0.037 @0.093 negated;
				 at: 25 put: 0.037 @0.093 negated;
				 at: 26 put: 0.037 @0.093 negated;
				 at: 27 put: 0.022 @0.093 negated;
				 at: 28 put: 0.022 @0.093 negated;
				 at: 29 put: 0.017 @0.093 negated;
				 at: 30 put: 0.008 @0.095 negated;
				 at: 31 put: 0.008 @0.095 negated ;
				 at: 32 put: 0.0 @0.096 negated;
				 at: 33 put: -0.007 @ 0.096 negated;
				 yourself);
			 yourself)) offset: 0 @ 0;
		 yourself
]

{ #category : #'arrow forms' }
NCLineArrowGlyph class >> basicArrow1 [
	"glyph 54 from Arrows1"
	^ (NCLineArrowGlyph withContours: ((Array new: 1) at: 1 put: {0.0 @ 0.0. 0.0 @ 0.0. -0.5 @ 0.3298. -0.5 @ 0.3298. -0.5 @ 0.3298. 0.0 @0.666 negated. 0.0 @0.666 negated. 0.0 @0.666 negated. 0.5 @ 0.3298. 0.5 @ 0.3298. 0.5 @ 0.3298. 0.0 @ 0.0};
			 yourself)) offset: 0 @ 0.666;
		 defaultScale: 2.5;
		 yourself"clicks 0.0@0.0"
]

{ #category : #'arrow forms' }
NCLineArrowGlyph class >> basicArrow2 [
	"glyph 54 from Arrows1, modified"
	^ (NCLineArrowGlyph withContours: ((Array new: 1) at: 1 put: {0.0 @ 0.0. 0.0 @ 0.0. -0.5 @ 0.0. -0.5 @ 0.0. -0.5 @ 0.0. 0.0 @0.666 negated. 0.0 @0.666 negated. 0.0 @0.666 negated. 0.5 @ 0.0. 0.5 @ 0.0. 0.5 @ 0.0. 0.0 @ 0.0};
			 yourself)) offset: 0 @ 0.666;
		 defaultScale: 2;
		 yourself"clicks 0.0@0.0"
]

{ #category : #'arrow forms' }
NCLineArrowGlyph class >> doubleArrow [
	"glyph 154 from StarBats"
	^ (NCLineArrowGlyph withContours: ((Array new: 2) at: 1 put: ((Array new: 18) at: 1 put: 0.0 @ 0.0;
				 at: 2 put: -0.499 @ 0.29;
				 at: 3 put: -0.499 @ 0.29;
				 at: 4 put: -0.499 @ 0.29;
				 at: 5 put: -0.499 @ 0.124;
				 at: 6 put: -0.499 @ 0.124;
				 at: 7 put: -0.499 @ 0.124;
				 at: 8 put: 0.0 @ 0.22 negated;
				 at: 9 put: 0.0 @ 0.22 negated;
				 at: 10 put: 0.0 @ 0.22 negated;
				 at: 11 put: 0.501 @ 0.124;
				 at: 12 put: 0.501 @ 0.124;
				 at: 13 put: 0.501 @ 0.124;
				 at: 14 put: 0.501 @ 0.29;
				 at: 15 put: 0.501 @ 0.29;
				 at: 16 put: 0.501 @ 0.29;
				 at: 17 put: 0.0 @ 0.0;
				 at: 18 put: 0.0 @ 0.0;
				 yourself);
			 at: 2 put: ((Array new: 18) at: 1 put: 0.0 @0.425 negated;
				 at: 2 put: -0.499 @0.137 negated;
				 at: 3 put: -0.499 @0.137 negated;
				 at: 4 put: -0.499 @0.137 negated;
				 at: 5 put: -0.499 @0.301 negated;
				 at: 6 put: -0.499 @0.301 negated;
				 at: 7 put: -0.499 @0.301 negated;
				 at: 8 put: 0.0 @0.652 negated;
				 at: 9 put: 0.0 @0.652 negated;
				 at: 10 put: 0.0 @0.652 negated;
				 at: 11 put: 0.501 @0.301 negated;
				 at: 12 put: 0.501 @0.301 negated;
				 at: 13 put: 0.501 @0.301 negated;
				 at: 14 put: 0.501 @0.139 negated;
				 at: 15 put: 0.501 @0.139 negated;
				 at: 16 put: 0.501 @0.139 negated;
				 at: 17 put: 0.0 @0.425 negated;
				 at: 18 put: 0.0 @0.425 negated;
				 yourself);
			 yourself)) scale: 1.85 @ 2.49;
		 offset: 0.0 @ 1.623;
		 yourself"clicks: 0.01@0.01 0.0@-0.65 0.0@0.01"
]

{ #category : #'arrow forms' }
NCLineArrowGlyph class >> doubleBubble [
	"glyph 65 from Webdings"
	^ (NCLineArrowGlyph withContours: ((Array new: 2) at: 1 put: ((Array new: 39) at: 1 put: 0.0 @ 0.0;
				 at: 2 put: 0.042 @0.005 negated;
				 at: 3 put: 0.067 @0.035 negated;
				 at: 4 put: 0.067 @0.035 negated;
				 at: 5 put: 0.093 @0.066 negated;
				 at: 6 put: 0.093 @0.113 negated;
				 at: 7 put: 0.093 @0.113 negated;
				 at: 8 put: 0.093 @0.12 negated;
				 at: 9 put: 0.093 @0.128 negated;
				 at: 10 put: 0.093 @0.128 negated;
				 at: 11 put: 0.013 @0.192 negated;
				 at: 12 put: 0.013 @0.281 negated;
				 at: 13 put: 0.013 @0.281 negated;
				 at: 14 put: 0.013 @0.373 negated;
				 at: 15 put: 0.099 @0.435 negated;
				 at: 16 put: 0.099 @0.435 negated;
				 at: 17 put: 0.183 @0.497 negated;
				 at: 18 put: 0.306 @0.497 negated;
				 at: 19 put: 0.306 @0.497 negated;
				 at: 20 put: 0.429 @0.497 negated;
				 at: 21 put: 0.515 @0.435 negated;
				 at: 22 put: 0.515 @0.435 negated;
				 at: 23 put: 0.601 @0.373 negated;
				 at: 24 put: 0.601 @0.281 negated;
				 at: 25 put: 0.601 @0.281 negated;
				 at: 26 put: 0.601 @0.188 negated;
				 at: 27 put: 0.515 @0.123 negated;
				 at: 28 put: 0.515 @0.123 negated;
				 at: 29 put: 0.429 @0.057 negated;
				 at: 30 put: 0.307 @0.057 negated;
				 at: 31 put: 0.307 @0.057 negated;
				 at: 32 put: 0.248 @0.057 negated;
				 at: 33 put: 0.194 @0.074 negated;
				 at: 34 put: 0.194 @ 0.074 negated;
				 at: 35 put: 0.178 @ 0.027 ;
				 at: 36 put: 0.079 @ 0.027 ;
				 at: 37 put: 0.079 @ 0.027 ;
				 at: 38 put: 0.046 @ 0.027 ;
				 at: 39 put: 0.0 @ 0.0;
				 yourself);
			 at: 2 put: ((Array new: 45) at: 1 put: 1.0 @0.523 negated;
				 at: 2 put: 1.0 @0.418 negated;
				 at: 3 put: 0.894 @0.351 negated;
				 at: 4 put: 0.894 @0.351 negated;
				 at: 5 put: 0.892 @0.334 negated;
				 at: 6 put: 0.892 @0.319 negated;
				 at: 7 put: 0.892 @0.319 negated;
				 at: 8 put: 0.892 @0.274 negated;
				 at: 9 put: 0.919 @0.244 negated;
				 at: 10 put: 0.919 @0.244 negated;
				 at: 11 put: 0.922 @0.24 negated;
				 at: 12 put: 0.975 @0.196 negated;
				 at: 13 put: 0.975 @0.196 negated;
				 at: 14 put: 0.887 @0.194 negated;
				 at: 15 put: 0.838 @0.227 negated;
				 at: 16 put: 0.838 @0.227 negated;
				 at: 17 put: 0.801 @0.252 negated;
				 at: 18 put: 0.778 @0.306 negated;
				 at: 19 put: 0.778 @0.306 negated;
				 at: 20 put: 0.743 @0.299 negated;
				 at: 21 put: 0.706 @0.299 negated;
				 at: 22 put: 0.706 @0.299 negated;
				 at: 23 put: 0.666 @0.299 negated;
				 at: 24 put: 0.621 @0.312 negated;
				 at: 25 put: 0.621 @0.312 negated;
				 at: 26 put: 0.603 @0.377 negated;
				 at: 27 put: 0.547 @0.43 negated;
				 at: 28 put: 0.547 @0.43 negated;
				 at: 29 put: 0.486 @0.487 negated;
				 at: 30 put: 0.417 @0.492 negated;
				 at: 31 put: 0.417 @0.492 negated;
				 at: 32 put: 0.413 @0.512 negated;
				 at: 33 put: 0.413 @0.523 negated;
				 at: 34 put: 0.413 @0.523 negated;
				 at: 35 put: 0.413 @0.614 negated;
				 at: 36 put: 0.499 @0.674 negated;
				 at: 37 put: 0.499 @0.674 negated;
				 at: 38 put: 0.583 @0.733 negated;
				 at: 39 put: 0.706 @0.733 negated;
				 at: 40 put: 0.706 @0.733 negated;
				 at: 41 put: 0.83 @0.733 negated;
				 at: 42 put: 0.914 @0.674 negated;
				 at: 43 put: 0.914 @0.674 negated;
				 at: 44 put: 1.0 @0.614 negated;
				 at: 45 put: 1.0 @0.523 negated;
				 yourself);
			 yourself)) scale: 2.0 @ 2.0;
		 offset: 0.0 @ 0.0;
		 yourself"clicks: 0.02@0.0"
]

{ #category : #'arrow forms' }
NCLineArrowGlyph class >> epsilonFork [
	"glyph 90 from StarMath"
	^ (NCLineArrowGlyph withContours: ((Array new: 1) at: 1 put: ((Array new: 51) at: 1 put: 0.0 @ 1.988;
				 at: 2 put: -0.717 @ 1.97;
				 at: 3 put: -1.126 @ 1.507;
				 at: 4 put: -1.126 @ 1.507;
				 at: 5 put: -1.53 @ 1.043;
				 at: 6 put: -1.512 @ 0.32;
				 at: 7 put: -1.512 @ 0.32;
				 at: 8 put: -1.506 @ 0.094;
				 at: 9 put: -1.355 @0.412 negated;
				 at: 10 put: -1.355 @0.412 negated ;
				 at: 11 put: -1.355 @0.412 negated;
				 at: 12 put: -1.166 @0.407 negated;
				 at: 13 put: -1.166 @0.407 negated;
				 at: 14 put: -1.294 @0.071 negated;
				 at: 15 put: -1.301 @ 0.219;
				 at: 16 put: -1.301 @ 0.219;
				 at: 17 put: -1.314 @ 0.703;
				 at: 18 put: -0.976 @ 1.026;
				 at: 19 put: -0.976 @ 1.026;
				 at: 20 put: -0.663 @ 1.323;
				 at: 21 put: -0.167 @ 1.393;
				 at: 22 put: -0.167 @ 1.393;
				 at: 23 put: -0.167 @ 1.393;
				 at: 24 put: -0.132 @0.022 negated;
				 at: 25 put: -0.132 @0.022 negated;
				 at: 26 put: -0.132 @0.022 negated;
				 at: 27 put: 0.095 @0.017 negated;
				 at: 28 put: 0.095 @0.017 negated;
				 at: 29 put: 0.095 @0.017 negated;
				 at: 30 put: 0.059 @ 1.398;
				 at: 31 put: 0.059 @ 1.398;
				 at: 32 put: 0.608 @ 1.343;
				 at: 33 put: 0.937 @ 1.018;
				 at: 34 put: 0.937 @ 1.018;
				 at: 35 put: 1.266 @ 0.693;
				 at: 36 put: 1.28 @ 0.146;
				 at: 37 put: 1.28 @ 0.146;
				 at: 38 put: 1.282 @ 0.051;
				 at: 39 put: 1.238 @0.182 negated;
				 at: 40 put: 1.238 @0.182 negated;
				 at: 41 put: 1.238 @0.182 negated;
				 at: 42 put: 1.414 @0.178 negated;
				 at: 43 put: 1.414 @0.178 negated;
				 at: 44 put: 1.493 @ 0.189;
				 at: 45 put: 1.485 @ 0.472;
				 at: 46 put: 1.485 @ 0.472;
				 at: 47 put: 1.469 @ 1.144;
				 at: 48 put: 1.074 @ 1.562;
				 at: 49 put: 1.074 @ 1.562;
				 at: 50 put: 0.66 @ 2.005;
				 at: 51 put: 0.0 @ 1.988;
				 yourself);
			 yourself)) scale: 1.0 @ 1.0;
		 offset: 0 @ 0;
		 yourself
]

{ #category : #'arrow forms' }
NCLineArrowGlyph class >> filledCircle [
	"glyph 34 from StarBats"
	^ (NCLineArrowGlyph withContours: ((Array new: 1) at: 1 put: {0.0 @ 0.0. -0.655 @ 0.0. -1.079 @0.419  negated. -1.079 @0.419  negated. -1.502 @0.842 negated. -1.502 @1.498 negated. -1.502 @1.498 negated. -1.502 @2.162 negated. -1.083 @2.581 negated. -1.083 @2.581  negated. -0.664 @3.0  negated. 0.0 @3.0 negated. 0.0 @3.0 negated. 0.66 @3.0  negated. 1.079 @2.576  negated. 1.079 @2.576  negated. 1.498 @2.158  negated. 1.498 @1.498 negated. 1.498 @1.498 negated. 1.498 @0.834 negated. 1.079 @0.415 negated. 1.079 @0.415  negated. 0.66 @ 0.0. 0.0 @ 0.0};
			 yourself)) scale: 1.0 @ 1.0;
		 offset: -0.01337295665871352 @ 2.942050464916974;
		 yourself
]

{ #category : #'arrow forms' }
NCLineArrowGlyph class >> fred [
	"glyph 85 from StarBats"
^(NCLineArrowGlyph withContours: (
(Array new: 5)
	at: 1 put: { 
		0.0@0.0 . -0.2224@0.0 . -0.3605@0.1381 negated . 
	-0.3605@0.1381 negated. -0.5@0.2776 negated. -0.5@0.5 negated. 
	-0.5@0.5 negated. -0.5@0.7196 negated. -0.3591@0.8591negated . 
	-0.3591@0.8591 negated. -0.2196@0.9986 negated. 0.0@0.9986 negated . 
	0.0@0.9986 negated. 0.221@0.9986 negated. 0.3605@0.8591 negated. 
	0.3605@0.8591 negated. 0.5@0.721 negated. 0.5@0.5 negated. 
	0.5@0.5 negated. 0.5@0.2776 negated. 0.3619@0.1381 negated . 
	0.3619@0.1381 negated. 0.2224@0.0 . 0.0@0.0 };
	at: 2 put: { 
	0.0@0.0677 negated. 0.1906@0.0677 negated. 0.3122@0.1892 negated. 
	0.3122@0.1892 negated . 0.4337@0.3108 negated. 0.4337@0.5 negated . 
	0.4337@0.5 negated  . 0.4337@0.6934 negated . 0.3135@0.8122 negated . 
	0.3135@0.8122 negated  . 0.1934@0.9309 negated  . 0.0@0.9309 negated  . 
	0.0@0.9309 negated  . -0.1934@0.9309 negated  . -0.3135@0.8108  negated . 
	-0.3135@0.8108 negated  . -0.4337@0.692 negated  . -0.4337@0.5 negated  . 
	-0.4337@0.5 negated  . -0.4337@0.3094 negated  . -0.3122@0.1878 negated  . 
	-0.3122@0.1878  negated . -0.192@0.0677  negated . 0.0@0.0677  negated };
	at: 3 put: { 
	-0.0249@ 0.4075   negated . -0.0884@ 0.3163  negated  . -0.1671@ 0.3163  negated  . 
	-0.1671@ 0.3163   negated . -0.2431@ 0.3163   negated . -0.2873@ 0.3743   negated . 
	-0.2873@ 0.3743   negated . -0.3273@ 0.4268  negated  . -0.3273@ 0.5055  negated  . 
	-0.3273@ 0.5055  negated  . -0.3273@ 0.576   negated . -0.2956@ 0.6243   negated . 
	-0.2956@ 0.6243   negated . -0.2597@ 0.6796   negated . -0.192@ 0.6796   negated . 
	-0.192@ 0.6796  negated  . -0.1008@ 0.6796   negated . -0.0249@ 0.5622   negated . 
	-0.0249@ 0.5622  negated  . 0.0428@ 0.7044   negated . 0.1547@ 0.7044   negated . 
	0.1547@ 0.7044  negated  . 0.239@ 0.7044   negated . 0.2887@ 0.6381   negated . 
	0.2887@ 0.6381  negated  . 0.3329@ 0.5787   negated . 0.3329@ 0.4917   negated . 
	0.3329@ 0.4917   negated . 0.3329@ 0.4061   negated . 0.2914@ 0.3481   negated . 
	0.2914@ 0.3481  negated  . 0.2445@ 0.2831   negated . 0.1616@ 0.2831   negated . 
	0.1616@ 0.2831   negated . 0.0497@ 0.2831   negated . -0.0249@ 0.4075   negated };
	at: 4 put: { 
	-0.0511@ 0.5152   negated . -0.1091@ 0.6036  negated  . -0.1809@ 0.6036   negated . 
	-0.1809@ 0.6036   negated . -0.2652@ 0.6036  negated  . -0.2652@ 0.4972  negated  . 
	-0.2652@ 0.4972  negated  . -0.2652@ 0.4558  negated  . -0.2445@ 0.424  negated  . 
	-0.2445@ 0.424  negated  . -0.2238@ 0.3923  negated  . -0.1837@ 0.3923  negated  . 
	-0.1837@ 0.3923  negated  . -0.1215@ 0.3923   negated . -0.0511@ 0.5152   negated };
	at: 5 put: { 
	0.0083@ 0.4544  negated  . 0.0746@ 0.3674  negated  . 0.1492@ 0.3674   negated . 
	0.1492@ 0.3674  negated  . 0.2058@ 0.3674  negated  . 0.239@ 0.4019  negated  . 
	0.239@ 0.4019  negated  . 0.2707@ 0.4365  negated  . 0.2707@ 0.4931   negated . 
	0.2707@ 0.4931  negated  . 0.2707@ 0.5428  negated  . 0.2431@ 0.5801  negated  . 
	0.2431@ 0.5801  negated  . 0.2155@ 0.6188  negated  . 0.1671@ 0.6188  negated  . 
	0.1671@ 0.6188  negated  . 0.1215@ 0.6188  negated  . 0.0732@ 0.5566   negated . 
	0.0732@ 0.5566  negated  . 0.0539@ 0.5318  negated  . 0.0083@ 0.4544   negated };
	yourself
"clicks -0.0152@-0.9903 -0.0055@-0.0055"
)) offset: 0.0@1.0;
defaultScale: 3.0;
yourself
]

{ #category : #'arrow forms' }
NCLineArrowGlyph class >> heavyDoubleArrow [
	"glyph 170 from BitstreamVeraSans"
	^((NCLineArrowGlyph withContours: ((Array new: 2)
at: 1 put: ((Array new: 21) at: 1 put: 0.0@1.971; at: 2 put: 0.0@1.971; at: 3 put: -0.868@2.962; at: 4 put: -0.868@2.962; at: 5 put: -0.868@2.962; at: 6 put: -1.492@2.967; at: 7 put: -1.492@2.967; at: 8 put: -1.492@2.967; at: 9 put: -0.139@1.423; at: 10 put: -0.139@1.423; at: 11 put: -0.139@1.423; at: 12 put: 0.129@1.42; at: 13 put: 0.129@1.42; at: 14 put: 0.129@1.42; at: 15 put: 1.508@2.942; at: 16 put: 1.508@2.942; at: 17 put: 1.508@2.942; at: 18 put: 0.884@2.947; at: 19 put: 0.884@2.947; at: 20 put: 0.884@2.947; at: 21 put: 0.0@1.971; yourself);
at: 2 put: ((Array new: 21) at: 1 put: -1.504@1.549; at: 2 put: -0.879@1.543; at: 3 put: -0.879@1.543; at: 4 put: -0.879@1.543; at: 5 put: -0.012@0.552; at: 6 put: -0.012@0.552; at: 7 put: -0.012@0.552; at: 8 put: 0.872@1.529; at: 9 put: 0.872@1.529; at: 10 put: 0.872@1.529; at: 11 put: 1.496@1.524; at: 12 put: 1.496@1.524; at: 13 put: 1.496@1.524; at: 14 put: 0.118@0.002; at: 15 put: 0.118@0.002; at: 16 put: 0.118@0.002; at: 17 put: -0.15@0.004; at: 18 put: -0.15@0.004; at: 19 put: -0.15@0.004; at: 20 put: -1.504@1.549; at: 21 put: -1.504@1.549; yourself); yourself))
offset: 0@0;
defaultScale: 2.0;
yourself)

]

{ #category : #'arrow forms' }
NCLineArrowGlyph class >> junctionDot [
	"glyph 135 from BitstreamVeraSans"
	^ (NCLineArrowGlyph withContours: ((Array new: 1) at: 1 put: ((Array new: 24) at: 1 put: 0.0 @ 0.0;
				 at: 2 put: -0.209 @ 0.004;
				 at: 3 put: -0.354 @0.139 negated;
				 at: 4 put: -0.354 @0.139 negated;
				 at: 5 put: -0.502 @0.283 negated;
				 at: 6 put: -0.505 @0.495 negated;
				 at: 7 put: -0.505 @0.495 negated;
				 at: 8 put: -0.509 @0.704 negated;
				 at: 9 put: -0.366 @0.849 negated;
				 at: 10 put: -0.366 @0.849 negated;
				 at: 11 put: -0.226 @0.996 negated;
				 at: 12 put: -0.017 @1.0 negated;
				 at: 13 put: -0.017 @1.0 negated;
				 at: 14 put: 0.193 @1.003 negated;
				 at: 15 put: 0.341 @0.861 negated;
				 at: 16 put: 0.341 @0.861 negated;
				 at: 17 put: 0.488 @0.719 negated;
				 at: 18 put: 0.491 @0.508 negated;
				 at: 19 put: 0.491 @0.508 negated;
				 at: 20 put: 0.495 @0.298 negated;
				 at: 21 put: 0.353 @0.151 negated;
				 at: 22 put: 0.353 @0.151 negated;
				 at: 23 put: 0.21 @0.004 negated;
				 at: 24 put: 0.0 @ 0.0;
				 yourself);
			 yourself)) scale: 1.0 @ 1.0;
		 offset: 0.0 @ 0.5;
		 defaultScale: 2.0;
		 yourself"clicks: 0.0@-0.5 0.0@0.0"
]

{ #category : #'arrow forms' }
NCLineArrowGlyph class >> noArrow [
	^NCLineArrowGlyph withContours: { Array new: 6 withAll: 0.0@0.0 }
]

{ #category : #'arrow forms' }
NCLineArrowGlyph class >> numeroDos [
	"glyph 79 from StarBats"
	^ (NCLineArrowGlyph withContours: (
		(Array new: 3)
			at: 1 put:
			 {0.0 @ 0.0. -0.667 @ 0.0. -1.086 @0.414 negated. -1.086 @0.414 negated. -1.5 @0.833 negated. -1.5 @1.5 negated. -1.5 @1.5 negated. -1.5 @2.167 negated. -1.086 @2.582 negated. -1.086 @2.582 negated. -0.667 @3.0 negated. 0.0 @3.0 negated. 0.0 @3.0 negated. 0.659 @3.0 negated. 1.077 @2.577 negated. 1.077 @2.577 negated. 1.496 @2.159 negated. 1.496 @1.5 negated. 1.496 @1.5 negated. 1.496 @0.837 negated. 1.077 @0.418 negated. 1.077 @0.418 negated. 0.663 @ 0.0. 0.0 @ 0.0};
			 at: 2 put: {-1.297 @1.5 negated. -1.297 @2.076 negated. -0.937 @2.437 negated. -0.937 @2.437 negated. -0.572 @2.801 negated. 0.0 @2.801 negated. 0.0 @2.801 negated. 0.576 @2.801 negated. 0.932 @2.441 negated. 0.932 @2.441 negated. 1.293 @2.08 negated. 1.293 @1.5 negated .1.293 @1.5 negated .1.293 @0.92 negated .0.937 @0.559 negated .0.937 @0.559 negated .0.58 @0.199 negated .0.0 @0.199 negated .0.0 @0.199 negated. -0.568 @0.199 negated. -0.932 @0.563 negated. -0.932 @0.563 negated. -1.297 @0.928 negated. -1.297 @1.5 negated};
			 at: 3 put: {-0.551 @0.58 negated. -0.551 @0.58 negated. -0.551 @0.796 negated. -0.551 @0.796 negated. -0.481 @0.0941 negated. -0.249 @ 1.181 negated. -0.249 @ 1.181 negated. 0.071 @1.5 negated.  0.128 @1.5 negated. 0.128 @1.5 negated. 0.315 @ 1.811 negated. 0.315 @ 1.981 negated. 0.315 @ 1.981 negated. 0.315 @ 2.321 negated. -0.041 @ 2.321 negated. -0.041 @ 2.321 negated. -0.236 @ 2.321 negated. -0.501 @ 2.175 negated. -0.501 @ 2.175 negated. -0.501 @ 2.175 negated. -0.501 @ 2.399 negated. -0.501 @ 2.399 negated. -0.236 @ 2.519 negated. -0.004 @ 2.519 negated. -0.004 @ 2.519 negated. 0.253 @ 2.519 negated. 0.414 @ 2.378 negated. 0.414 @ 2.378 negated. 0.58 @ 2.238 negated. 0.58 @ 1.985 negated. 0.58 @ 1.985 negated. 0.58 @ 1.753 negated. 0.386 @1.5 negated. 0.386 @1.5 negated. 0.199 @ 1.38 negated. 0.008 @ 1.21 negated. 0.008 @ 1.21 negated. -0.207 @ 1.003 negated. -0.245 @0.796 negated. -0.245 @0.796 negated. -0.245 @0.796 negated. 0.572 @0.796 negated. 0.572 @0.796 negated. 0.572 @0.796 negated. 0.572 @0.58 negated. 0.572 @0.58 negated. 0.572 @0.58 negated. -0.551 @ 0.58 negated};
			 yourself))
		scale: 1.0 @ 1.0;
		offset: 0.0580110519658774 @ 2.970994589966722;
		yourself
]

{ #category : #'arrow forms' }
NCLineArrowGlyph class >> numeroUno [
	"glyph 78 from StarBats"
	^((NCLineArrowGlyph withContours: ((Array new: 3)
at: 1 put: {
 0.0@0.0 negated. -0.667@0.0  negated. -1.086@ 0.414  negated.
 -1.086@ 0.414 negated . -1.5@ 0.833  negated. -1.5@ 1.5  negated.
 -1.5@ 1.5 negated . -1.5@ 2.167 negated . -1.086@ 2.582  negated.
 -1.086@ 2.582  negated. -0.667@ 3.0  negated. 0.0@ 3.0  negated.
 0.0@ 3.0 negated . 0.659@ 3.0  negated. 1.077@ 2.577  negated.
 1.077@ 2.577 negated . 1.496@ 2.159 negated . 1.496@ 1.5  negated.
 1.496@ 1.5 negated . 1.496@ 0.837  negated. 1.077@ 0.418  negated.
 1.077@ 0.418 negated . 0.663@0.0  negated. 0.0@0.0  negated.};

at: 2 put: {
 -1.297@ 1.5 negated . -1.297@ 2.076 negated . -0.937@ 2.437  negated.
 -0.937@ 2.437 negated . -0.572@ 2.801 negated . 0.0@ 2.801  negated.
 0.0@ 2.801  negated. 0.576@ 2.801 negated . 0.932@ 2.441  negated.
 0.932@ 2.441  negated. 1.293@ 2.08  negated. 1.293@ 1.5  negated.
 1.293@ 1.5  negated. 1.293@ 0.92  negated. 0.937@ 0.559  negated.
 0.937@ 0.559 negated . 0.58@ 0.199  negated. 0.0@ 0.199  negated.
 0.0@ 0.199 negated . -0.568@ 0.199 negated . -0.932@ 0.563  negated.
 -0.932@ 0.563 negated . -1.297@ 0.928 negated . -1.297@ 1.5  negated.};

at: 3 put: {
 -0.099@ 0.547 negated . -0.099@ 0.547 negated . -0.099@ 2.246  negated.
 -0.099@ 2.246 negated . -0.099@ 2.246 negated . -0.398@ 2.246  negated.
 -0.398@ 2.246 negated . -0.398@ 2.246 negated . -0.398@ 2.407  negated.
 -0.398@ 2.407 negated . -0.398@ 2.407 negated . 0.153@ 2.453  negated.
 0.153@ 2.453 negated. 0.153@ 2.453 negated . 0.153@ 0.547  negated.
 0.153@ 0.547  negated. 0.153@ 0.547  negated. -0.099@ 0.547  negated.};
yourself))
scale: 1.0@1.0;
offset: -0.01657458627596497@2.925414477707818  negated;
yourself)
]

{ #category : #'arrow forms' }
NCLineArrowGlyph class >> openArrow [
	| a a2 |
	a := { 0.0@0.0 . 0.0@0.0 . -0.5@0.0 . 
	-0.5@0.0 . -0.5@0.0 . 0.0@1.0 negated . 
	0.0@1.0 negated . 0.0@1.0 negated . 0.5@0.0 . 
	0.5@0.0 . 0.5@0.0 . 0.0@0.0 }.
	a2 := a collect:[:each | each + (0.0@0.33) * 0.6 - ( 0.0@0.33) ]. 
	
^(NCLineArrowGlyph withContours: (
(Array new: 2)
	at: 1 put: a ;
	at: 2 put:  a2;
	yourself) )  offset: 0@1.0;
defaultScale: 2.5;
yourself
]

{ #category : #'arrow forms' }
NCLineArrowGlyph class >> openCircleWithPlus [
	"glyph 56 from StarMath"
	^((NCLineArrowGlyph withContours: ((Array new: 5)
at: 1 put: ((Array new: 24) at: 1 put: 0.0@1.485; at: 2 put: -0.68@1.499; at: 3 put: -1.098@1.098; at: 4 put: -1.098@1.098; at: 5 put: -1.517@0.696; at: 6 put: -1.531@0.017; at: 7 put: -1.531@0.017; at: 8 put: -1.546@0.668 negated; at: 9 put: -1.149@1.082 negated; at: 10 put: -1.149@1.082 negated; at: 11 put: -0.748@1.5 negated; at: 12 put: -0.063@1.515 negated; at: 13 put: -0.063@1.515 negated; at: 14 put: 0.617@1.529 negated; at: 15 put: 1.035@1.128 negated; at: 16 put: 1.035@1.128 negated; at: 17 put: 1.454@0.726 negated; at: 18 put: 1.468@0.046 negated; at: 19 put: 1.468@0.046 negated; at: 20 put: 1.483@0.638; at: 21 put: 1.081@1.057; at: 22 put: 1.081@1.057; at: 23 put: 0.685@1.47; at: 24 put: 0.0@1.485; yourself);
at: 2 put: ((Array new: 12) at: 1 put: 0.091@0.142 negated; at: 2 put: 0.067@1.263 negated; at: 3 put: 0.067@1.263 negated; at: 4 put: 0.067@1.263 negated; at: 5 put: 0.535@1.21 negated; at: 6 put: 0.837@0.921 negated; at: 7 put: 0.837@0.921 negated; at: 8 put: 1.139@0.631 negated; at: 9 put: 1.211@0.166 negated; at: 10 put: 1.211@0.166 negated; at: 11 put: 0.091@0.142 negated; at: 12 put: 0.091@0.142 negated; yourself);
at: 3 put: ((Array new: 9) at: 1 put: -0.148@0.112; at: 2 put: -0.148@0.112; at: 3 put: -1.274@0.136; at: 4 put: -1.274@0.136; at: 5 put: -1.129@1.098; at: 6 put: -0.13@1.233; at: 7 put: -0.13@1.233; at: 8 put: -0.13@1.233; at: 9 put: -0.148@0.112; yourself);
at: 4 put: ((Array new: 12) at: 1 put: -0.159@0.137 negated; at: 2 put: -1.279@0.113 negated; at: 3 put: -1.279@0.113 negated; at: 4 put: -1.279@0.113 negated; at: 5 put: -1.232@0.576 negated; at: 6 put: -0.937@0.878 negated; at: 7 put: -0.937@0.878 negated; at: 8 put: -0.637@1.186 negated; at: 9 put: -0.177@1.258 negated; at: 10 put: -0.177@1.258 negated; at: 11 put: -0.159@0.137 negated; at: 12 put: -0.159@0.137 negated; yourself);
at: 5 put: ((Array new: 12) at: 1 put: 0.096@0.107; at: 2 put: 0.096@0.107; at: 3 put: 0.119@1.228; at: 4 put: 0.119@1.228; at: 5 put: 0.585@1.156; at: 6 put: 0.875@0.854; at: 7 put: 0.875@0.854; at: 8 put: 1.164@0.552; at: 9 put: 1.217@0.083; at: 10 put: 1.217@0.083; at: 11 put: 1.217@0.083; at: 12 put: 0.096@0.107; yourself); yourself))
scale: 1.0@1.0;
offset: 9.16770659387112e-10@1.484755672790925;
yourself)

]

{ #category : #'arrow forms' }
NCLineArrowGlyph class >> openCircleWithSquareDot [
	"glyph 60 from StarMath"
	^ (NCLineArrowGlyph withContours: ((Array new: 3) at: 1 put: ((Array new: 24) at: 1 put: 0.0 @ 1.516;
				 at: 2 put: -0.685 @ 1.518;
				 at: 3 put: -1.091 @ 1.114;
				 at: 4 put: -1.091 @ 1.114;
				 at: 5 put: -1.498 @ 0.706;
				 at: 6 put: -1.5 @ 0.021;
				 at: 7 put: -1.5 @ 0.021;
				 at: 8 put: -1.502 @ 0.665 negated;
				 at: 9 put: -1.099 @ 1.071 negated;
				 at: 10 put: -1.099 @ 1.071 negated;
				 at: 11 put: -0.695 @ 1.482 negated;
				 at: 12 put: -0.01 @ 1.484 negated;
				 at: 13 put: -0.01 @ 1.484 negated;
				 at: 14 put: 0.675 @ 1.487 negated;
				 at: 15 put: 1.086 @ 1.078 negated;
				 at: 16 put: 1.086 @ 1.078 negated;
				 at: 17 put: 1.498 @ 0.675 negated;
				 at: 18 put: 1.5 @ 0.01;
				 at: 19 put: 1.5 @ 0.01;
				 at: 20 put: 1.502 @ 0.696;
				 at: 21 put: 1.094 @ 1.107;
				 at: 22 put: 1.094 @ 1.107;
				 at: 23 put: 0.685 @ 1.513;
				 at: 24 put: 0.0 @ 1.516;
				 yourself);
			 at: 2 put: ((Array new: 24) at: 1 put: -0.001 @ 1.267;
				 at: 2 put: -0.561 @ 1.268;
				 at: 3 put: -0.905 @ 0.927;
				 at: 4 put: -0.905 @ 0.927;
				 at: 5 put: -1.249 @ 0.58;
				 at: 6 put: -1.251 @ 0.02;
				 at: 7 put: -1.251 @ 0.02;
				 at: 8 put: -1.253 @ 0.541 negated;
				 at: 9 put: -0.911 @ 0.884 negated;
				 at: 10 put: -0.911 @ 0.884 negated;
				 at: 11 put: -0.57 @ 1.233 negated;
				 at: 12 put: -0.009 @ 1.235 negated;
				 at: 13 put: -0.009 @ 1.235 negated;
				 at: 14 put: 0.551 @ 1.237 negated;
				 at: 15 put: 0.9 @ 0.891 negated;
				 at: 16 put: 0.9 @ 0.891 negated;
				 at: 17 put: 1.249 @ 0.549 negated;
				 at: 18 put: 1.251 @ 0.011;
				 at: 19 put: 1.251 @ 0.011;
				 at: 20 put: 1.253 @ 0.572;
				 at: 21 put: 0.906 @ 0.921;
				 at: 22 put: 0.906 @ 0.921;
				 at: 23 put: 0.56 @ 1.264;
				 at: 24 put: -0.001 @ 1.267;
				 yourself);
			 at: 3 put: ((Array new: 12) at: 1 put: -0.284 @ 0.297;
				 at: 2 put: -0.284 @ 0.297;
				 at: 3 put: -0.286 @ 0.264 negated;
				 at: 4 put: -0.286 @ 0.264 negated;
				 at: 5 put: -0.286 @ 0.264 negated;
				 at: 6 put: 0.274 @ 0.266 negated;
				 at: 7 put: 0.274 @ 0.266 negated;
				 at: 8 put: 0.274 @ 0.266 negated;
				 at: 9 put: 0.276 @ 0.295;
				 at: 10 put: 0.276 @ 0.295;
				 at: 11 put: 0.276 @ 0.295;
				 at: 12 put: -0.284 @ 0.297;
				 yourself);
			 yourself)) scale: 1.0 @ 1.0;
		 offset: 1.63709046319127e-10 @ 1.51557988458535;
		 yourself

]

{ #category : #'arrow forms' }
NCLineArrowGlyph class >> openCircleWithX [
	"glyph 58 from StarMath"
	^ (NCLineArrowGlyph withContours: ((Array new: 5) at: 1 put: ((Array new: 24) at: 1 put: 0.0 @ 1.469;
				 at: 2 put: -0.685 @ 1.464;
				 at: 3 put: -1.087 @ 1.056;
				 at: 4 put: -1.087 @ 1.056;
				 at: 5 put: -1.489 @ 0.644;
				 at: 6 put: -1.484 @ 0.042 negated;
				 at: 7 put: -1.484 @ 0.042 negated;
				 at: 8 put: -1.479 @ 0.727 negated;
				 at: 9 put: -1.072 @ 1.129 negated;
				 at: 10 put: -1.072 @ 1.129 negated;
				 at: 11 put: -0.664 @ 1.536 negated;
				 at: 12 put: 0.021 @ 1.531 negated;
				 at: 13 put: 0.021 @ 1.531 negated;
				 at: 14 put: 0.706 @ 1.526 negated;
				 at: 15 put: 1.113 @ 1.113 negated;
				 at: 16 put: 1.113 @ 1.113 negated;
				 at: 17 put: 1.521 @ 0.706 negated;
				 at: 18 put: 1.516 @ 0.02 negated;
				 at: 19 put: 1.516 @ 0.02 negated;
				 at: 20 put: 1.511 @ 0.665;
				 at: 21 put: 1.098 @ 1.072;
				 at: 22 put: 1.098 @ 1.072;
				 at: 23 put: 0.685 @ 1.474;
				 at: 24 put: 0.0 @ 1.469;
				 yourself);
			 at: 2 put: ((Array new: 12) at: 1 put: 0.192 @ 0.03 negated;
				 at: 2 put: 0.192 @ 0.03 negated;
				 at: 3 put: 0.976 @ 0.765;
				 at: 4 put: 0.976 @ 0.765;
				 at: 5 put: 1.264 @ 0.403;
				 at: 6 put: 1.267 @ 0.022 negated;
				 at: 7 put: 1.267 @ 0.022 negated;
				 at: 8 put: 1.27 @ 0.448 negated;
				 at: 9 put: 0.987 @ 0.813 negated;
				 at: 10 put: 0.987 @ 0.813 negated;
				 at: 11 put: 0.987 @ 0.813 negated;
				 at: 12 put: 0.192 @ 0.03 negated;
				 yourself);
			 at: 3 put: ((Array new: 12) at: 1 put: -0.166 @ 0.032 negated;
				 at: 2 put: -0.96 @ 0.751;
				 at: 3 put: -0.96 @ 0.751;
				 at: 4 put: -0.96 @ 0.751;
				 at: 5 put: -1.238 @ 0.365;
				 at: 6 put: -1.235 @ 0.04 negated;
				 at: 7 put: -1.235 @ 0.04 negated;
				 at: 8 put: -1.232 @ 0.466 negated;
				 at: 9 put: -0.949 @ 0.827 negated;
				 at: 10 put: -0.949 @ 0.827 negated;
				 at: 11 put: -0.166 @ 0.032 negated;
				 at: 12 put: -0.166 @ 0.032 negated;
				 yourself);
			 at: 4 put: ((Array new: 12) at: 1 put: 0.012 @ 0.208 negated;
				 at: 2 put: -0.771 @ 1.007 negated;
				 at: 3 put: -0.771 @ 1.007 negated;
				 at: 4 put: -0.771 @ 1.007 negated;
				 at: 5 put: -0.416 @ 1.285 negated;
				 at: 6 put: 0.025 @ 1.282 negated;
				 at: 7 put: 0.025 @ 1.282 negated;
				 at: 8 put: 0.45 @ 1.279 negated;
				 at: 9 put: 0.811 @ 0.996 negated;
				 at: 10 put: 0.811 @ 0.996 negated;
				 at: 11 put: 0.012 @ 0.208 negated;
				 at: 12 put: 0.012 @ 0.208 negated;
				 yourself);
			 at: 5 put: ((Array new: 12) at: 1 put: 0.009 @ 0.145;
				 at: 2 put: 0.009 @ 0.145;
				 at: 3 put: -0.785 @ 0.929;
				 at: 4 put: -0.785 @ 0.929;
				 at: 5 put: -0.424 @ 1.217;
				 at: 6 put: 0.007 @ 1.22;
				 at: 7 put: 0.007 @ 1.22;
				 at: 8 put: 0.433 @ 1.223;
				 at: 9 put: 0.798 @ 0.94;
				 at: 10 put: 0.798 @ 0.94;
				 at: 11 put: 0.798 @ 0.94;
				 at: 12 put: 0.009 @ 0.145;
				 yourself);
			 yourself)) scale: 1.0 @ 1.0;
		 offset: -1.746229827404022e-10 @ 1.46889486873988;
		 yourself
]

{ #category : #'arrow forms' }
NCLineArrowGlyph class >> openDiamond [
	"glyph 185 from BitstreamVeraSans"
	^ (NCLineArrowGlyph withContours: ((Array new: 2) at: 1 put: ((Array new: 12) at: 1 put: 0.0 @ 0.0;
				 at: 2 put: 0.0 @ 0.0;
				 at: 3 put: -0.235 @ 0.498 negated;
				 at: 4 put: -0.235 @ 0.498 negated;
				 at: 5 put: -0.235 @ 0.498 negated;
				 at: 6 put: 0.0 @ 1.0 negated;
				 at: 7 put: 0.0 @ 1.0 negated;
				 at: 8 put: 0.0 @ 1.0 negated;
				 at: 9 put: 0.235 @ 0.498 negated;
				 at: 10 put: 0.235 @ 0.498 negated;
				 at: 11 put: 0.235 @ 0.498 negated;
				 at: 12 put: 0.0 @ 0.0;
				 yourself);
			 at: 2 put: ((Array new: 12) at: 1 put: 0.0 @ 0.115 negated;
				 at: 2 put: -0.181 @ 0.498 negated;
				 at: 3 put: -0.181 @ 0.498 negated;
				 at: 4 put: -0.181 @ 0.498 negated;
				 at: 5 put: 0.0 @ 0.885 negated;
				 at: 6 put: 0.0 @ 0.885 negated;
				 at: 7 put: 0.0 @ 0.885 negated;
				 at: 8 put: 0.181 @ 0.498 negated;
				 at: 9 put: 0.181 @ 0.498 negated;
				 at: 10 put: 0.181 @ 0.498 negated;
				 at: 11 put: 0.0 @ 0.115 negated;
				 at: 12 put: 0.0 @ 0.115 negated;
				 yourself);
			 yourself)) scale: 4.71 @ 3.86;
		 offset: 0.0 @ 3.86;
		 yourself"clicks: 0.0@-0.12 0.0@-0.98 0.0@-0.01"
]

{ #category : #'arrow forms' }
NCLineArrowGlyph class >> pi [
	"glyph 155 from BitstreamVeraSans"
	^ (NCLineArrowGlyph withContours: ((Array new: 1) at: 1 put: ((Array new: 84) at: 1 put: 0.0 @ 0.0;
				 at: 2 put: 0.0 @ 0.0;
				 at: 3 put: -0.158 @ 0.745;
				 at: 4 put: -0.158 @ 0.745;
				 at: 5 put: -0.158 @ 0.745;
				 at: 6 put: -0.306 @ 0.745;
				 at: 7 put: -0.306 @ 0.745;
				 at: 8 put: -0.306 @ 0.745;
				 at: 9 put: -0.147 @ 0.0;
				 at: 10 put: -0.147 @ 0.0;
				 at: 11 put: -0.147 @ 0.0;
				 at: 12 put: -0.18 @ 0.0;
				 at: 13 put: -0.18 @ 0.0;
				 at: 14 put: -0.225 @ 0.0;
				 at: 15 put: -0.249 @ 0.026;
				 at: 16 put: -0.249 @ 0.026;
				 at: 17 put: -0.274 @ 0.052;
				 at: 18 put: -0.281 @ 0.109;
				 at: 19 put: -0.281 @ 0.109;
				 at: 20 put: -0.281 @ 0.109;
				 at: 21 put: -0.411 @ 0.109;
				 at: 22 put: -0.411 @ 0.109;
				 at: 23 put: -0.389 @0.027 negated;
				 at: 24 put: -0.331 @0.078 negated;
				 at: 25 put: -0.331 @0.078 negated;
				 at: 26 put: -0.272 @0.129 negated;
				 at: 27 put: -0.137 @0.129 negated;
				 at: 28 put: -0.137 @0.129 negated;
				 at: 29 put: -0.137 @0.129 negated;
				 at: 30 put: 0.589 @0.129 negated;
				 at: 31 put: 0.589 @0.129 negated;
				 at: 32 put: 0.589 @0.129 negated;
				 at: 33 put: 0.56 @ 0.0;
				 at: 34 put: 0.56 @ 0.0;
				 at: 35 put: 0.56 @ 0.0;
				 at: 36 put: 0.411 @ 0.0;
				 at: 37 put: 0.411 @ 0.0;
				 at: 38 put: 0.411 @ 0.0;
				 at: 39 put: 0.326 @ 0.398;
				 at: 40 put: 0.326 @ 0.398;
				 at: 41 put: 0.314 @ 0.458;
				 at: 42 put: 0.307 @ 0.496;
				 at: 43 put: 0.307 @ 0.496;
				 at: 44 put: 0.301 @ 0.533;
				 at: 45 put: 0.301 @ 0.551;
				 at: 46 put: 0.301 @ 0.551;
				 at: 47 put: 0.301 @ 0.598;
				 at: 48 put: 0.32 @ 0.619;
				 at: 49 put: 0.32 @ 0.619;
				 at: 50 put: 0.34 @ 0.638;
				 at: 51 put: 0.385 @ 0.638;
				 at: 52 put: 0.385 @ 0.638;
				 at: 53 put: 0.398 @ 0.638;
				 at: 54 put: 0.417 @ 0.637;
				 at: 55 put: 0.417 @ 0.637;
				 at: 56 put: 0.436 @ 0.634;
				 at: 57 put: 0.466 @ 0.63;
				 at: 58 put: 0.466 @ 0.63;
				 at: 59 put: 0.466 @ 0.63;
				 at: 60 put: 0.442 @ 0.745;
				 at: 61 put: 0.442 @ 0.745;
				 at: 62 put: 0.417 @ 0.752;
				 at: 63 put: 0.394 @ 0.755;
				 at: 64 put: 0.394 @ 0.755;
				 at: 65 put: 0.372 @ 0.758;
				 at: 66 put: 0.351 @ 0.758;
				 at: 67 put: 0.351 @ 0.758;
				 at: 68 put: 0.255 @ 0.758;
				 at: 69 put: 0.205 @ 0.717;
				 at: 70 put: 0.205 @ 0.717;
				 at: 71 put: 0.156 @ 0.675;
				 at: 72 put: 0.156 @ 0.594;
				 at: 73 put: 0.156 @ 0.594;
				 at: 74 put: 0.156 @ 0.556;
				 at: 75 put: 0.164 @ 0.497;
				 at: 76 put: 0.164 @ 0.497;
				 at: 77 put: 0.173 @ 0.438;
				 at: 78 put: 0.201 @ 0.307;
				 at: 79 put: 0.201 @ 0.307;
				 at: 80 put: 0.201 @ 0.307;
				 at: 81 put: 0.266 @ 0.0;
				 at: 82 put: 0.266 @ 0.0;
				 at: 83 put: 0.266 @ 0.0;
				 at: 84 put: 0.0 @ 0.0;
				 yourself);
			 yourself)) scale: 2.0 @ 2.0;
		 offset: 0.0 @ 0.0;
		 yourself
]

{ #category : #'arrow forms' }
NCLineArrowGlyph class >> pointingHand [
	"glyph 29 from StarBats"
	^ (NCLineArrowGlyph withContours: ((Array new: 2) at: 1 put: ((Array new: 30) at: 1 put: 0.0 @ 3.02;
				 at: 2 put: -0.178 @ 2.999;
				 at: 3 put: -0.37 @ 2.913;
				 at: 4 put: -0.37 @ 2.913;
				 at: 5 put: -0.623 @ 2.802;
				 at: 6 put: -0.608 @ 2.671;
				 at: 7 put: -0.608 @ 2.671;
				 at: 8 put: -0.602 @ 2.615;
				 at: 9 put: -0.542 @ 2.584;
				 at: 10 put: -0.542 @ 2.584;
				 at: 11 put: -0.546 @ 2.725;
				 at: 12 put: -0.316 @ 2.82;
				 at: 13 put: -0.316 @ 2.82;
				 at: 14 put: -0.153 @ 2.891;
				 at: 15 put: 0.042 @ 2.913;
				 at: 16 put: 0.042 @ 2.913;
				 at: 17 put: 0.221 @ 2.933;
				 at: 18 put: 0.365 @ 2.907;
				 at: 19 put: 0.365 @ 2.907;
				 at: 20 put: 0.571 @ 2.871;
				 at: 21 put: 0.587 @ 2.739;
				 at: 22 put: 0.587 @ 2.739;
				 at: 23 put: 0.651 @ 2.773;
				 at: 24 put: 0.644 @ 2.84;
				 at: 25 put: 0.644 @ 2.84;
				 at: 26 put: 0.628 @ 2.976;
				 at: 27 put: 0.374 @ 3.016;
				 at: 28 put: 0.374 @ 3.016;
				 at: 29 put: 0.203 @ 3.043;
				 at: 30 put: 0.0 @ 3.02;
				 yourself);
			 at: 2 put: ((Array new: 51) at: 1 put: 0.839 @ 1.858;
				 at: 2 put: 0.82 @ 2.019;
				 at: 3 put: 0.576 @ 2.386;
				 at: 4 put: 0.576 @ 2.386;
				 at: 5 put: 0.576 @ 2.386;
				 at: 6 put: 0.513 @ 2.705;
				 at: 7 put: 0.513 @ 2.705;
				 at: 8 put: 0.402 @ 2.851;
				 at: 9 put: -0.01 @ 2.804;
				 at: 10 put: -0.01 @ 2.804;
				 at: 11 put: -0.319 @ 2.768;
				 at: 12 put: -0.382 @ 2.645;
				 at: 13 put: -0.382 @ 2.645;
				 at: 14 put: -0.424 @ 2.447;
				 at: 15 put: -0.469 @ 2.248;
				 at: 16 put: -0.469 @ 2.248;
				 at: 17 put: -0.469 @ 2.248;
				 at: 18 put: -0.66 @ 1.552;
				 at: 19 put: -0.66 @ 1.552;
				 at: 20 put: -0.62 @ 1.209;
				 at: 21 put: -0.438 @ 0.667;
				 at: 22 put: -0.438 @ 0.667;
				 at: 23 put: -0.203 @ 0.023 negated;
				 at: 24 put: 0.0 @ 0.0;
				 at: 25 put: 0.0 @ 0.0;
				 at: 26 put: 0.055 @ 0.006;
				 at: 27 put: 0.083 @ 0.095;
				 at: 28 put: 0.083 @ 0.095;
				 at: 29 put: 0.11 @ 0.167;
				 at: 30 put: 0.102 @ 0.231;
				 at: 31 put: 0.102 @ 0.231;
				 at: 32 put: 0.086 @ 0.371;
				 at: 33 put: -0.077 @ 0.932;
				 at: 34 put: -0.077 @ 0.932;
				 at: 35 put: 0.023 @ 0.806;
				 at: 36 put: 0.142 @ 0.82;
				 at: 37 put: 0.142 @ 0.82;
				 at: 38 put: 0.299 @ 0.838;
				 at: 39 put: 0.306 @ 1.036;
				 at: 40 put: 0.306 @ 1.036;
				 at: 41 put: 0.35 @ 0.955;
				 at: 42 put: 0.46 @ 0.968;
				 at: 43 put: 0.46 @ 0.968;
				 at: 44 put: 0.574 @ 0.981;
				 at: 45 put: 0.615 @ 1.115;
				 at: 46 put: 0.615 @ 1.115;
				 at: 47 put: 0.646 @ 1.105;
				 at: 48 put: 0.676 @ 1.109;
				 at: 49 put: 0.676 @ 1.109;
				 at: 50 put: 0.921 @ 1.137;
				 at: 51 put: 0.839 @ 1.858;
				 yourself);
			 yourself)) offset: 0 @ 0;
		 defaultScale: 1.5;
		 yourself
]

{ #category : #'arrow forms' }
NCLineArrowGlyph class >> quadDiamond [
	"glyph 19 from StarBats"
	^ (NCLineArrowGlyph withContours: ((Array new: 4) at: 1 put: ((Array new: 12) at: 1 put: 0.0 @ 1.452;
				 at: 2 put: 0.0 @ 1.452;
				 at: 3 put: -0.603 @ 0.84;
				 at: 4 put: -0.603 @ 0.84;
				 at: 5 put: -0.603 @ 0.84;
				 at: 6 put: 0.014 @ 0.237;
				 at: 7 put: 0.014 @ 0.237;
				 at: 8 put: 0.014 @ 0.237;
				 at: 9 put: 0.613 @ 0.854;
				 at: 10 put: 0.613 @ 0.854;
				 at: 11 put: 0.613 @ 0.854;
				 at: 12 put: 0.0 @ 1.452;
				 yourself);
			 at: 2 put: ((Array new: 12) at: 1 put: -0.882 @ 0.55;
				 at: 2 put: -0.882 @ 0.55;
				 at: 3 put: -1.485 @ 0.063 negated;
				 at: 4 put: -1.485 @ 0.063 negated;
				 at: 5 put: -1.485 @ 0.063 negated;
				 at: 6 put: -0.868 @ 0.666 negated;
				 at: 7 put: -0.868 @ 0.666 negated;
				 at: 8 put: -0.868 @ 0.666 negated;
				 at: 9 put: -0.269 @ 0.049 negated;
				 at: 10 put: -0.269 @ 0.049 negated;
				 at: 11 put: -0.269 @ 0.049 negated;
				 at: 12 put: -0.882 @ 0.55;
				 yourself);
			 at: 3 put: ((Array new: 12) at: 1 put: -0.583 @ 0.945 negated;
				 at: 2 put: 0.02 @ 0.328 negated;
				 at: 3 put: 0.02 @ 0.328 negated;
				 at: 4 put: 0.02 @ 0.328 negated;
				 at: 5 put: 0.637 @ 0.931 negated;
				 at: 6 put: 0.637 @ 0.931 negated;
				 at: 7 put: 0.637 @ 0.931 negated;
				 at: 8 put: 0.034 @ 1.547 negated;
				 at: 9 put: 0.034 @ 1.547 negated;
				 at: 10 put: 0.034 @ 1.547 negated;
				 at: 11 put: -0.583 @ 0.945 negated;
				 at: 12 put: -0.583 @ 0.945 negated;
				 yourself);
			 at: 4 put: ((Array new: 12) at: 1 put: 0.916 @ 0.645 negated;
				 at: 2 put: 0.299 @ 0.042 negated;
				 at: 3 put: 0.299 @ 0.042 negated;
				 at: 4 put: 0.299 @ 0.042 negated;
				 at: 5 put: 0.902 @ 0.57;
				 at: 6 put: 0.902 @ 0.57;
				 at: 7 put: 0.902 @ 0.57;
				 at: 8 put: 1.515 @ 0.028 negated;
				 at: 9 put: 1.515 @ 0.028 negated;
				 at: 10 put: 1.515 @ 0.028 negated;
				 at: 11 put: 0.916 @ 0.645 negated;
				 at: 12 put: 0.916 @ 0.645 negated;
				 yourself);
			 yourself)) scale: 1.0 @ 1.0;
		 offset: -4.91127138957381e-10 @ 1.45237701159931;
		 yourself
]

{ #category : #'arrow forms' }
NCLineArrowGlyph class >> roundFork [
	"glyph 61 from StarMath"
	^ (NCLineArrowGlyph withContours: ((Array new: 1) at: 1 put: ((Array new: 42) at: 1 put: 0.0 @ 3.016;
				 at: 2 put: -0.685 @ 3.0;
				 at: 3 put: -1.08 @ 2.585;
				 at: 4 put: -1.08 @ 2.585;
				 at: 5 put: -1.475 @ 2.166;
				 at: 6 put: -1.458 @ 1.481;
				 at: 7 put: -1.458 @ 1.481;
				 at: 8 put: -1.458 @ 1.481;
				 at: 9 put: -1.422 @0.019 negated;
				 at: 10 put: -1.422 @0.019 negated;
				 at: 11 put: -1.422 @0.019 negated;
				 at: 12 put: -1.173 @0.013 negated;
				 at: 13 put: -1.173 @0.013 negated;
				 at: 14 put: -1.173 @0.013 negated;
				 at: 15 put: -1.209 @ 1.487;
				 at: 16 put: -1.209 @ 1.487;
				 at: 17 put: -1.223 @ 2.047;
				 at: 18 put: -0.889 @ 2.403;
				 at: 19 put: -0.889 @ 2.403;
				 at: 20 put: -0.554 @ 2.754;
				 at: 21 put: 0.006 @ 2.767;
				 at: 22 put: 0.006 @ 2.767;
				 at: 23 put: 0.566 @ 2.781;
				 at: 24 put: 0.922 @ 2.447;
				 at: 25 put: 0.922 @ 2.447;
				 at: 26 put: 1.278 @ 2.107;
				 at: 27 put: 1.292 @ 1.547;
				 at: 28 put: 1.292 @ 1.547;
				 at: 29 put: 1.292 @ 1.547;
				 at: 30 put: 1.328 @ 0.048;
				 at: 31 put: 1.328 @ 0.048;
				 at: 32 put: 1.328 @ 0.048;
				 at: 33 put: 1.577 @ 0.054;
				 at: 34 put: 1.577 @ 0.054;
				 at: 35 put: 1.577 @ 0.054;
				 at: 36 put: 1.541 @ 1.553;
				 at: 37 put: 1.541 @ 1.553;
				 at: 38 put: 1.524 @ 2.238;
				 at: 39 put: 1.105 @ 2.638;
				 at: 40 put: 1.105 @ 2.638;
				 at: 41 put: 0.685 @ 3.033;
				 at: 42 put: 0.0 @ 3.016;
				 yourself);
			 yourself)) scale: 1.0 @ 1.0;
		 offset: 0.0 @ 3.01644631032832;
		 yourself
]

{ #category : #'arrow forms' }
NCLineArrowGlyph class >> roundTrident [
	"glyph 88 from StarMath"
	^ (NCLineArrowGlyph withContours: ((Array new: 1) at: 1 put: ((Array new: 45) at: 1 put: 0.0 @ 2.967;
				 at: 2 put: -0.714 @ 2.971;
				 at: 3 put: -1.113 @ 2.462;
				 at: 4 put: -1.113 @ 2.462;
				 at: 5 put: -1.472 @ 2.003;
				 at: 6 put: -1.477 @ 1.266;
				 at: 7 put: -1.477 @ 1.266;
				 at: 8 put: -1.477 @ 1.266;
				 at: 9 put: -1.484 @0.025 negated;
				 at: 10 put: -1.484 @0.025 negated;
				 at: 11 put: -1.484 @0.025 negated;
				 at: 12 put: -1.176 @0.026 negated;
				 at: 13 put: -1.176 @0.026 negated;
				 at: 14 put: -1.176 @0.026 negated;
				 at: 15 put: -1.168 @ 1.303;
				 at: 16 put: -1.168 @ 1.303;
				 at: 17 put: -1.162 @ 2.462;
				 at: 18 put: -0.161 @ 2.649;
				 at: 19 put: -0.161 @ 2.649;
				 at: 20 put: -0.161 @ 2.649;
				 at: 21 put: -0.176 @0.032  negated;
				 at: 22 put: -0.176 @0.032 negated;
				 at: 23 put: -0.176 @0.032 negated;
				 at: 24 put: 0.148 @0.034 negated;
				 at: 25 put: 0.148 @0.034 negated;
				 at: 26 put: 0.148 @0.034 negated;
				 at: 27 put: 0.163 @ 2.642;
				 at: 28 put: 0.163 @ 2.642;
				 at: 29 put: 1.167 @ 2.373;
				 at: 30 put: 1.161 @ 1.285;
				 at: 31 put: 1.161 @ 1.285;
				 at: 32 put: 1.161 @ 1.285;
				 at: 33 put: 1.154 @0.04  negated;
				 at: 34 put: 1.154 @0.04 negated;
				 at: 35 put: 1.154 @0.04 negated;
				 at: 36 put: 1.461 @0.041 negated;
				 at: 37 put: 1.461 @0.041 negated;
				 at: 38 put: 1.461 @0.041 negated;
				 at: 39 put: 1.469 @ 1.239;
				 at: 40 put: 1.469 @ 1.239;
				 at: 41 put: 1.473 @ 1.986;
				 at: 42 put: 1.118 @ 2.45;
				 at: 43 put: 1.118 @ 2.45;
				 at: 44 put: 0.725 @ 2.963;
				 at: 45 put: 0.0 @ 2.967;
				 yourself);
			 yourself)) scale: 1.0 @ 1.0;
		 offset: 1.113221514970064e-9 @ 2.967078724404928;
		 yourself
]

{ #category : #'arrow forms' }
NCLineArrowGlyph class >> starInCircle [
	"glyph 91 from StarBats"
	^ (NCLineArrowGlyph withContours: ((Array new: 10) at: 1 put: ((Array new: 12) at: 1 put: 0.0 @ 1.483;
				 at: 2 put: -0.281 @ 0.871;
				 at: 3 put: -0.281 @ 0.871;
				 at: 4 put: -0.281 @ 0.871;
				 at: 5 put: -0.111 @ 0.925;
				 at: 6 put: 0.02 @ 0.929;
				 at: 7 put: 0.02 @ 0.929;
				 at: 8 put: 0.15 @ 0.932;
				 at: 9 put: 0.323 @ 0.888;
				 at: 10 put: 0.323 @ 0.888;
				 at: 11 put: 0.0 @ 1.483;
				 at: 12 put: 0.0 @ 1.483;
				 yourself);
			 at: 2 put: ((Array new: 24) at: 1 put: 1.544 @ 0.074;
				 at: 2 put: 1.526 @ 0.727;
				 at: 3 put: 1.091 @ 1.138;
				 at: 4 put: 1.091 @ 1.138;
				 at: 5 put: 0.656 @ 1.55;
				 at: 6 put: 0.003 @ 1.532;
				 at: 7 put: 0.003 @ 1.532;
				 at: 8 put: -0.654 @ 1.514;
				 at: 9 put: -1.066 @ 1.084;
				 at: 10 put: -1.066 @ 1.084;
				 at: 11 put: -1.473 @ 0.649;
				 at: 12 put: -1.455 @0.008 negated;
				 at: 13 put: -1.455 @0.008 negated;
				 at: 14 put: -1.437 @0.666 negated;
				 at: 15 put: -1.007 @1.073 negated;
				 at: 16 put: -1.007 @1.073 negated;
				 at: 17 put: -0.572 @1.485 negated;
				 at: 18 put: 0.085 @1.467 negated;
				 at: 19 put: 0.085 @1.467 negated;
				 at: 20 put: 0.738 @1.449 negated;
				 at: 21 put: 1.15 @1.014 negated;
				 at: 22 put: 1.15 @1.014 negated;
				 at: 23 put: 1.562 @0.579 negated;
				 at: 24 put: 1.544 @ 0.074;
				 yourself);
			 at: 3 put: ((Array new: 12) at: 1 put: 0.369 @ 0.797;
				 at: 2 put: 0.24 @ 0.859 negated;
				 at: 3 put: 0.069 @ 0.863 negated;
				 at: 4 put: 0.069 @ 0.863 negated;
				 at: 5 put: -0.111 @ 0.868 negated;
				 at: 6 put: -0.235 @ 0.813 negated;
				 at: 7 put: -0.235 @ 0.813 negated;
				 at: 8 put: 0.088 @ 1.417 negated;
				 at: 9 put: 0.088 @ 1.417 negated;
				 at: 10 put: 0.088 @ 1.417 negated;
				 at: 11 put: 0.369 @ 0.797 negated;
				 at: 12 put: 0.369 @ 0.797 negated;
				 yourself);
			 at: 4 put: ((Array new: 9) at: 1 put: 1.103 @ 0.966 negated;
				 at: 2 put: 1.103 @ 0.966 negated;
				 at: 3 put: 0.445 @ 0.776 negated;
				 at: 4 put: 0.445 @ 0.776 negated;
				 at: 5 put: 0.76 @ 0.592 negated;
				 at: 6 put: 0.865 @ 0.328 negated;
				 at: 7 put: 0.865 @ 0.328 negated;
				 at: 8 put: 0.865 @ 0.328 negated;
				 at: 9 put: 1.103 @ 0.966 negated;
				 yourself);
			 at: 5 put: ((Array new: 9) at: 1 put: -0.316 @ 0.797 negated;
				 at: 2 put: -0.316 @ 0.797 negated;
				 at: 3 put: -0.959 @ 1.027 negated;
				 at: 4 put: -0.959 @ 1.027 negated;
				 at: 5 put: -0.959 @ 1.027 negated;
				 at: 6 put: -0.756 @ 0.372 negated;
				 at: 7 put: -0.756 @ 0.372 negated;
				 at: 8 put: -0.631 @ 0.635 negated;
				 at: 9 put: -0.316 @ 0.797 negated;
				 yourself);
			 at: 6 put: ((Array new: 12) at: 1 put: 1.49 @ 0.077;
				 at: 2 put: 0.878 @ 0.358;
				 at: 3 put: 0.878 @ 0.358;
				 at: 4 put: 0.878 @ 0.358;
				 at: 5 put: 0.931 @ 0.219;
				 at: 6 put: 0.936 @ 0.057;
				 at: 7 put: 0.936 @ 0.057;
				 at: 8 put: 0.94 @ 0.105 negated;
				 at: 9 put: 0.894 @ 0.246 negated;
				 at: 10 put: 0.894 @ 0.246 negated;
				 at: 11 put: 1.49 @ 0.077;
				 at: 12 put: 1.49 @ 0.077;
				 yourself);
			 at: 7 put: ((Array new: 12) at: 1 put: -0.806 @ 0.311;
				 at: 2 put: -1.405 @ 0.011;
				 at: 3 put: -1.405 @ 0.011;
				 at: 4 put: -1.405 @ 0.011;
				 at: 5 put: -0.79 @ 0.292;
				 at: 6 put: -0.79 @ 0.292;
				 at: 7 put: -0.79 @ 0.292;
				 at: 8 put: -0.851 @ 0.172;
				 at: 9 put: -0.856 @ 0.008;
				 at: 10 put: -0.856 @ 0.008;
				 at: 11 put: -0.861 @ 0.188;
				 at: 12 put: -0.806 @ 0.311;
				 yourself);
			 at: 8 put: ((Array new: 9) at: 1 put: -0.361 @ 0.842;
				 at: 2 put: -1.02 @ 1.031;
				 at: 3 put: -1.02 @ 1.031;
				 at: 4 put: -1.02 @ 1.031;
				 at: 5 put: -0.786 @ 0.384;
				 at: 6 put: -0.786 @ 0.384;
				 at: 7 put: -0.786 @ 0.384;
				 at: 8 put: -0.649 @ 0.681;
				 at: 9 put: -0.361 @ 0.842;
				 yourself);
			 at: 9 put: ((Array new: 9) at: 1 put: 1.038 @ 1.096;
				 at: 2 put: 0.401 @ 0.849;
				 at: 3 put: 0.401 @ 0.849;
				 at: 4 put: 0.401 @ 0.849;
				 at: 5 put: 0.697 @ 0.731;
				 at: 6 put: 0.844 @ 0.438;
				 at: 7 put: 0.844 @ 0.438;
				 at: 8 put: 1.038 @ 1.096;
				 at: 9 put: 1.038 @ 1.096;
				 yourself);
			 at: 10 put: ((Array new: 24) at: 1 put: -0.378 @ 0.006 negated;
				 at: 2 put: -0.383 @ 0.156;
				 at: 3 put: -0.264 @ 0.268;
				 at: 4 put: -0.264 @ 0.268;
				 at: 5 put: -0.141 @ 0.375;
				 at: 6 put: 0.026 @ 0.379;
				 at: 7 put: 0.026 @ 0.379;
				 at: 8 put: 0.188 @ 0.384;
				 at: 9 put: 0.312 @ 0.279;
				 at: 10 put: 0.312 @ 0.279;
				 at: 11 put: 0.441 @ 0.174;
				 at: 12 put: 0.446 @ 0.017;
				 at: 13 put: 0.446 @ 0.017;
				 at: 14 put: 0.45 @ 0.145 negated;
				 at: 15 put: 0.331 @ 0.252 negated;
				 at: 16 put: 0.331 @ 0.252 negated;
				 at: 17 put: 0.213 @ 0.364 negated;
				 at: 18 put: 0.046 @ 0.368 negated;
				 at: 19 put: 0.046 @ 0.368 negated;
				 at: 20 put: -0.121 @ 0.373 negated;
				 at: 21 put: -0.25 @ 0.268 negated;
				 at: 22 put: -0.25 @ 0.268 negated;
				 at: 23 put: -0.374 @ 0.168 negated;
				 at: 24 put: -0.378 @ 0.006 negated;
				 yourself);
			 yourself)) scale: 1.0 @ 1.0;
		 offset: 1.517037162557244e-9 @ 1.482536442923447;
		 yourself
]

{ #category : #'arrow forms' }
NCLineArrowGlyph class >> test2 [
	"glyph 22 from StarBats"
	^ (NCLineArrowGlyph withContours: ((Array new: 2) at: 1 put: ((Array new: 12) at: 1 put: 0.0 @ 0.0;
				 at: 2 put: 0.0 @ 0.0;
				 at: 3 put: -1.502 @ 0.867;
				 at: 4 put: -1.502 @ 0.867;
				 at: 5 put: -1.502 @ 0.867;
				 at: 6 put: 0.0 @1.73 negated;
				 at: 7 put: 0.0 @1.73 negated;
				 at: 8 put: 0.0 @1.73 negated;
				 at: 9 put: 1.498 @ 0.867;
				 at: 10 put: 1.498 @ 0.867;
				 at: 11 put: 1.498 @ 0.867;
				 at: 12 put: 0.0 @ 0.0;
				 yourself);
			 at: 2 put: ((Array new: 9) at: 1 put: 0.0 @1.531 negated;
				 at: 2 put: 0.0 @1.531 negated;
				 at: 3 put: -1.228 @ 0.593;
				 at: 4 put: -1.228 @ 0.593;
				 at: 5 put: -1.228 @ 0.593;
				 at: 6 put: 0.0 @0.116  negated;
				 at: 7 put: 0.0 @0.116 negated;
				 at: 8 put: 0.0 @0.116 negated;
				 at: 9 put: 0.0 @1.531 negated;
				 yourself);
			 yourself)) scale: 1.0 @ 1.0;
		 offset: 0.0 @ 1.730290498933755;
		 yourself
]

{ #category : #'arrow forms' }
NCLineArrowGlyph class >> thinDoubleArrow [
	"glyph 70 from StarMath"
	^((NCLineArrowGlyph withContours: ((Array new: 2)
at: 1 put: ((Array new: 18) at: 1 put: 0.0@1.438; at: 2 put: 0.0@1.438; at: 3 put: -0.775@3.002; at: 4 put: -0.775@3.002; at: 5 put: -0.775@3.002; at: 6 put: -0.955@3.002; at: 7 put: -0.955@3.002; at: 8 put: -0.955@3.002; at: 9 put: 0.002@1.075; at: 10 put: 0.002@1.075; at: 11 put: 0.002@1.075; at: 12 put: 0.969@2.998; at: 13 put: 0.969@2.998; at: 14 put: 0.969@2.998; at: 15 put: 0.789@2.998; at: 16 put: 0.789@2.998; at: 17 put: 0.789@2.998; at: 18 put: 0.0@1.438; yourself);
at: 2 put: ((Array new: 18) at: 1 put: 0.967@1.922; at: 2 put: 0.0@0.0; at: 3 put: 0.0@0.0; at: 4 put: 0.0@0.0; at: 5 put: -0.958@1.927; at: 6 put: -0.958@1.927; at: 7 put: -0.958@1.927; at: 8 put: -0.778@1.926; at: 9 put: -0.778@1.926; at: 10 put: -0.778@1.926; at: 11 put: -0.002@0.363; at: 12 put: -0.002@0.363; at: 13 put: -0.002@0.363; at: 14 put: 0.787@1.923; at: 15 put: 0.787@1.923; at: 16 put: 0.787@1.923; at: 17 put: 0.967@1.922; at: 18 put: 0.967@1.922; yourself); yourself))
scale: 1.0@1.0;
offset: 5.45696821063757e-11@1.438405608597577;
yourself)

]

{ #category : #'arrow forms' }
NCLineArrowGlyph class >> umlArrow [
	| a |
	a := { 0.0@0.0 . 0.0@0.0 . -0.5@0.0 . 
	-0.5@0.0 . -0.5@0.0 . 0.0@1.0 negated. 
	0.0@1.0 negated . 0.0@1.0 negated . 0.5@0.0 . 
	0.5@0.0 . 0.5@0.0 . 0.0@0.0 }.
^(NCLineArrowGlyph withContours: (
(Array new: 1)
	at: 1 put: a; 
	yourself
"clicks 0.0@0.0"
)) offset: 0@1.0;
defaultScale: 2.5;
yourself.
]

{ #category : #'instance creation' }
NCLineArrowGlyph class >> withContours: anArray [
	"anArray is expected to have lists of points already scaled to fit in a unit box"
	^self new withContours: anArray
]

{ #category : #'arrow forms' }
NCLineArrowGlyph class >> zap [
	"glyph 97 from Webdings"
	^ (NCLineArrowGlyph withContours: ((Array new: 1) at: 1 put: ((Array new: 18) at: 1 put: 0.0 @ 2.148;
				 at: 2 put: 0.0 @ 2.148;
				 at: 3 put: -0.74 @0.429 negated;
				 at: 4 put: -0.74 @0.429 negated;
				 at: 5 put: -0.74 @0.429 negated;
				 at: 6 put: -0.052 @0.275 negated;
				 at: 7 put: -0.052 @0.275 negated;
				 at: 8 put: -0.052 @0.275 negated;
				 at: 9 put: -0.06 @2.077 negated;
				 at: 10 put: -0.06 @2.077 negated;
				 at: 11 put: -0.06 @2.077 negated;
				 at: 12 put: 0.761 @ 0.545;
				 at: 13 put: 0.761 @ 0.545;
				 at: 14 put: 0.761 @ 0.545;
				 at: 15 put: 0.01 @ 0.326;
				 at: 16 put: 0.01 @ 0.326;
				 at: 17 put: 0.01 @ 0.326;
				 at: 18 put: 0.0 @ 2.148;
				 yourself);
			 yourself)) scale: 1.0 @ 1.0;
		 offset: 4.67989593744278e-8 @ 2.147536450764164;
		 yourself
]

{ #category : #accessing }
NCLineArrowGlyph >> fixEndContours [
	"Re-order first so that first seg ends to left of last seg."

	| reversed |
	reversed := self contours collect: 
					[:c | 
					| p1 p2 |
					p1 := c at: 3.
					p2 := c at: c size - 2.
					p1 x > p2 x].
	self contours: (self contours with: reversed
				collect: 
					[:c :rev | 
					| newC |
					newC := rev ifTrue: [c reversed] ifFalse: [c].
					newC first ~= newC last 
						ifTrue: 
							[newC := newC asOrderedCollection.
							newC addAllLast: { 
										newC last.
										newC last.
										newC first}].
					newC asArray]).
	^self contours
]

{ #category : #'line attachment' }
NCLineArrowGlyph >> joinIndex [
	"Answer the point index of the end of the first contour"

	^self contours first size
]

{ #category : #'line attachment' }
NCLineArrowGlyph >> joinPoint [
	^originalFirstContour first * self scale + self offset
]

{ #category : #accessing }
NCLineArrowGlyph >> openForLineWidth: width [ 
	| newContour xOffset seg intersections i1 realBounds offestedCollection |
	offestedCollection :=  ( originalFirstContour collect:[:each|  each *  self scale ]  ) collect:[:each| each + self offset ] .
	width isZero 
		ifTrue: 
			[self contours at: 1 put:  offestedCollection  .
			self updateBounds.
			^self].
	newContour := OrderedCollection  withAll: offestedCollection .
	realBounds := Rectangle encompassing: newContour.
	xOffset := width / -2.0.
	seg := LineSegment fromPoints: (newContour copyFrom: 1 to: 3).
	intersections := seg 
				intersectionsWithLineFrom: xOffset @ realBounds bottom
				to: xOffset @ realBounds top.
	i1 := intersections at: 1 ifAbsent: [xOffset @ realBounds bottom].
	seg isBezier2Segment 
		ifFalse: [newContour := newContour copyFrom: 4 to: newContour size].
	newContour addAllFirst: { 
				i1.
				i1.
				newContour first}.
	xOffset := xOffset negated.
	seg := LineSegment 
				from: newContour last
				to: (newContour at: newContour size - 2)
				via: (newContour at: newContour size - 1).
	intersections := seg 
				intersectionsWithLineFrom: xOffset @ realBounds bottom
				to: xOffset @ realBounds top.
	i1 := intersections at: 1 ifAbsent: [xOffset @ realBounds bottom].
	seg isBezier2Segment 
		ifFalse: [newContour := newContour copyFrom: 1 to: newContour size - 3].
	newContour addAll: { 
				newContour last.
				i1.
				i1}.
	self contours at: 1 put: newContour asArray.
	self updateBounds
]

{ #category : #accessing }
NCLineArrowGlyph >> originalFirstContour [
	^originalFirstContour
]

{ #category : #accessing }
NCLineArrowGlyph >> setAsDefaultScale [
	"Call my current scale the default"

	originalFirstContour := originalFirstContour 
				collect: [:ea | ea * scale ].
	super setAsDefaultScale.
]

{ #category : #accessing }
NCLineArrowGlyph >> withContours: anArray [ 
	"anArray is expected to have lists of points already scaled to fit in a unit box"

	super withContours: anArray.
	self fixEndContours.
	originalFirstContour := self contours first copy.
	self updateBounds
]
