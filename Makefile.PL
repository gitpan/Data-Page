    use ExtUtils::MakeMaker;
    WriteMakefile
      ('DISTNAME' => 'Data-Page',
       'VERSION' => '0.18',
       'PL_FILES' => {},
       'PREREQ_PM' => {
			'Test::More' => '0.1',

		      },
      );
