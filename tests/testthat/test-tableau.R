context("tableau")

test_that("tableau_color_pal works", {
  pal <- tableau_color_pal()
  expect_is(pal, "function")
  expect_is(attr(pal, "max_n"), "integer")
  n <- 3
  vals <- pal(n)
  expect_is(vals, "character")
  expect_equal(length(vals), n)
})

test_that("tableau_color_pal direction = -1 works", {
  n <- 4L
  expect_false(all(tableau_color_pal(direction = -1)(n) ==
                   rev(tableau_color_pal()(n))))
})

test_that("tableau_color_pal works with diverging palette", {
  n <- 3L
  pal <- tableau_color_pal("Orange-Blue Diverging",
                           type = "ordered-diverging")(n)
  expect_is(pal, "character")
  expect_equal(length(pal), n)
})

test_that("tableau_color_pal raises error with invalid palette", {
  expect_error(tableau_color_pal("dsaga"))
})

test_that("tableau_shape_pal raises error with bad palette", {
  expect_error(tableau_shape_pal(palette = "gender"))
})

test_that("tableau_shape_pal works", {
  n <- 3
  pal <- tableau_shape_pal()(n)
  expect_is(pal, "integer")
  expect_is(attr(tableau_shape_pal(), "max_n"), "integer")
  # all unicode
  expect_true(all(pal < 0))
  expect_equal(length(pal), n)
})

test_that("scale_shape_tableau works", {
  expect_is(scale_shape_tableau(), "ScaleDiscrete")
})

test_that("scale_colour_tableau works", {
  expect_is(scale_colour_tableau(), "ScaleDiscrete")
})

test_that("scale_fill_tableau works", {
  expect_is(scale_fill_tableau(), "ScaleDiscrete")
})

test_that("tableau_gradient_pal works", {
  p <- tableau_gradient_pal()
  expect_is(p, "function")
  expect_hexcolor(p(seq(0, 1, by = 0.1)))
})

test_that("tableau_seq_gradient_pal works", {
  p <- tableau_seq_gradient_pal()
  expect_is(p, "function")
  expect_hexcolor(p(seq(0, 1, by = 0.1)))
})

test_that("tableau_div_gradient_pal works", {
  p <- tableau_seq_gradient_pal()
  expect_is(p, "function")
  expect_hexcolor(p(seq(0, 1, by = 0.1)))
})

test_that("scale_colour_gradient_tableau works", {
  expect_is(scale_colour_gradient_tableau(), "ScaleContinuous")
})

test_that("scale_fill_gradient_tableau works", {
  expect_is(scale_fill_gradient_tableau(), "ScaleContinuous")
})

test_that("scale_colour_gradient_tableau works", {
  expect_is(scale_colour_gradient2_tableau(), "ScaleContinuous")
})

test_that("scale_fill_gradient_tableau works", {
  expect_is(scale_fill_gradient2_tableau(), "ScaleContinuous")
})
