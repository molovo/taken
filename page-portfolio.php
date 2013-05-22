<?php theme_include('header'); ?>

	<section class="grid 3of6 posts">
		<ul class="items force-grid">
			<?php while(categories()): ?>
				<?php if (category_title() !== 'Blogs'): ?>
					<li class="grid 1of1 remove-padding">
						<article>
							<h3><?php echo category_title(); ?></h3>
							<p><?php echo category_description(); ?></p>
							<a href="<?php echo category_url(); ?>" class="button">View</a>
						</article>
						<hr />
					</li>
				<?php endif ?>
			<?php endwhile; ?>
		</ul>
	</section>
	<div class="grid 1of6 title ralign">
		<h1><?php echo page_name(); ?></h1>
	</div>

<?php //theme_include('footer'); ?>