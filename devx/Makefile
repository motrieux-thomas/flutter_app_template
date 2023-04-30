# Test and update goldens without coverage or analyzer
test_goldens_update:
	make test_template_app_goldens_update
	make test_template_theme_goldens_update

# Test, generate coverage and update goldens for template App
test_template_app_goldens_update:
	(cd ../app_template && \
	flutter test --update-goldens --no-pub --test-randomize-ordering-seed random)

# Test, generate coverage and update goldens for template Theme
test_template_theme_goldens_update:
	(cd ../template_theme && \
	flutter test --update-goldens --no-pub --test-randomize-ordering-seed random)

############################################################################################################

# Open coverage file for template App
open_coverage_template_app:
	open ../app_template/coverage/index.html

# Open coverage file for template_theme
open_coverage_template_theme:
	open ../template_theme/coverage/index.html

############################################################################################################

# Test and generate coverage for app
test_cov:
	make test_cov_template_app
	make test_cov_template_theme
	make test_cov_local_repo

# Test and generate coverage for template App
test_cov_template_app:
	(cd ../app_template && \
	flutter analyze lib test && \
	flutter test --no-pub --coverage --test-randomize-ordering-seed random && \
	remove_from_coverage -f coverage/lcov.info -r '\.gql\.dart|\.g\.dart|\.freezed\.dart' && \
	genhtml coverage/lcov.info -o coverage)

# Test and generate coverage for template Theme
test_cov_template_theme:
	(cd ../template_theme && \
	flutter analyze lib test && \
	flutter test --no-pub --coverage --test-randomize-ordering-seed random && \
	remove_from_coverage -f coverage/lcov.info -r '\.gql\.dart|\.g\.dart|\.freezed\.dart' && \
	genhtml coverage/lcov.info -o coverage)

############################################################################################################

# Test fast without coverage or analyzer
fast_test:
	make fast_test_template_app
	make fast_test_template_theme
	make fast_test_local_repo

# Test template App
fast_test_template_app:
	(cd ../app_template && \
	flutter test --no-pub --test-randomize-ordering-seed random)

# Fast test for template Theme
fast_test_template_theme:
	(cd ../template_theme && \
	flutter test --no-pub --test-randomize-ordering-seed random)

############################################################################################################

# Flutter pub get everywhere
get:
	(cd ../app_template && flutter pub get)
	(cd ../template_theme && flutter pub get)

# Flutter clean everywhere
clean:
	(cd ../app_template && flutter clean)
	(cd ../template_theme && flutter clean)

# Flutter clean & get everywhere
clean_and_get:
	make clean
	make get