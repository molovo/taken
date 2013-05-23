<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title><?php echo page_title('Page can’t be found'); ?> - <?php echo site_name(); ?></title>

		<meta name="description" content="<?php echo site_description(); ?>">

		<link rel="stylesheet" href="<?php echo theme_url('/css/melody.css'); ?>">
		<link rel="stylesheet" href="<?php echo theme_url('/css/style.css'); ?>">

		<link rel="alternate" type="application/rss+xml" title="RSS" href="<?php echo rss_url(); ?>">
		<link rel="shortcut icon" href="<?php echo theme_url('img/favicon.png'); ?>">

		<!--[if lt IE 9]>
			<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

		<script>var base = '<?php echo theme_url(); ?>';</script>
		<script src="<?php echo asset_url('/js/zepto.js'); ?>"></script>
		<script src="<?php echo theme_url('/js/main.js'); ?>"></script>

	    <meta name="viewport" content="width=device-width">
	    <meta name="generator" content="Anchor CMS">

	    <meta property="og:title" content="<?php echo site_name(); ?>">
	    <meta property="og:type" content="website">
	    <meta property="og:url" content="<?php echo current_url(); ?>">
	    <meta property="og:image" content="<?php echo theme_url('img/og_image.gif'); ?>">
	    <meta property="og:site_name" content="<?php echo site_name(); ?>">
	    <meta property="og:description" content="<?php echo site_description(); ?>">

		<?php if(customised()): ?>
		    <!-- Custom CSS -->
    		<style><?php echo article_css(); ?></style>

    		<!--  Custom Javascript -->
    		<script><?php echo article_js(); ?></script>
		<?php endif; ?>

		<style>
			aside.image {
				background: url("<?php echo article_custom_field('image', theme_url('img/bg.jpg')); ?>") center no-repeat;
				background-size: cover;
			}
		</style>

		<?php if (current_url() == 'blog' || strstr(current_url(), 'category') || page_slug() == 'portfolio' || (is_article() && article_category() == 'Blogs')): ?>
			<style>
				@media (min-width: 701px) {
					main, aside.image {
						height: 100%;
					}
					main {
						box-shadow: 5px 0px 15px rgba(0,0,0,0.3);
						padding: 1.5em 0;
						float: left;
						overflow-y: auto;
						width: 75%;
					}

					.logo-nav-wrapper.grid {
						width: 16.6667%;
					}
						.logo-nav-wrapper .logo.grid,
						.logo-nav-wrapper nav.grid {
							width: 100%;
						}
						.logo-nav-wrapper + section.grid:not(.article-content) {
							width: 66.6667%;
						}

					aside.image {
						float: right;
						width: 25%;
					}
				}
			</style>
		<?php else: ?>
			<style>
				@media (min-width: 701px) {
					main, aside.image {
						height: 100%;
					}
					main {
						width: 22.5%;
						box-shadow: 0px -5px 15px rgba(0,0,0,0.3);
						position: absolute;
						bottom: 0;
						padding: 1.5em;
					}

					aside.image {
						width: 77.5%;
						background: url("<?php echo article_custom_field('image', theme_url('img/bg.jpg')); ?>") center no-repeat;
						background-size: cover;
						float: right;
					}

					.logo-nav-wrapper.grid {
						width: 100%;
					}
						.logo-nav-wrapper .logo.grid,
						.logo-nav-wrapper nav.grid {
							width: 100%;
						}
						.logo-nav-wrapper + section.grid {
							width: 100%;
						}
				}
			</style>
		<?php endif; ?>
	</head>
	<body class="<?php echo body_class(); ?>">
		<aside class="image">
		</aside>
		<main role="main">
			<div class="container">
				<div class="grid 2of6 remove-padding logo-nav-wrapper" style="letter-spacing: -.4em">
					<a href="<?php echo base_url(); ?>">
						<img src="<?php echo theme_url('img/logo-white.png'); ?>" alt="Logo" class="grid 1of2 logo" />
					</a>

					<?php if(has_menu_items()): ?>
						<nav class="grid 1of2" id="main">
							<ul>
								<?php while(menu_items()): ?>
									<li>
										<a href="<?php echo menu_url(); ?>" <?php echo (
											menu_url() == base_url() . current_url()
											 || (
												 	(
												 		(is_article()
												 		 && category_title() == 'Blogs')
														 || strstr(current_url(), 'category/blogs')
													)
													 && menu_name() == 'Blog'
												)
											 || (
											 		(
											 			(
												 			is_article() &&
												 			category_title() !== 'Blogs'
												 		)
												 		|| (
												 			strstr(current_url(), 'category')
												 			 && !strstr(current_url(), 'category/blogs')
												 		)
												 	)
											 	 	 && menu_name() == 'Portfolio'
											 	)
										 	 ? 'class="active"' : ''); ?> title="<?php echo menu_title(); ?>"><?php echo menu_name(); ?></a>
									</li>
								<?php endwhile; ?>
							</ul>
						</nav>
					<?php endif; ?>
				</div>
