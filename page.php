<?php theme_include('header'); ?>

		<?php if(is_homepage()): ?>
		<section class="grid 1of1 site-meta">
			<h1><?php echo site_name(); ?></h1>
			<?php echo parse(site_description()); ?>
		</section>
		<?php else: ?>
		<section class="grid 1of1 page-content">
			<h2><?php echo page_title(); ?></h2>
			<?php echo page_content(); ?>
		</section>
		<?php endif; ?>

<?php //theme_include('footer'); ?>