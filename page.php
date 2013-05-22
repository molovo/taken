<?php theme_include('header'); ?>

		<?php if(is_homepage()): ?>
		<section class="grid 4of6 site-meta ralign">
			<h1><?php echo site_name(); ?></h1>
			<?php echo parse(site_description()); ?>
		</section>
		<?php else: ?>
		<section class="grid 3of6 page-content">
			<?php echo page_content(); ?>
		</section>
		<section class="grid 1of6 page-title ralign">
			<h1><?php echo page_title(); ?></h1>
		</section>
		<?php endif; ?>

<?php //theme_include('footer'); ?>