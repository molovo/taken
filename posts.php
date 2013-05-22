<?php theme_include('header'); ?>
	<?php if (current_url() == 'blog'): ?>
		<script type="text/javascript">
			window.location.href = <?php echo base_url(); ?> + 'category/blogs';
		</script>
	<?php endif; ?>
	<section class="grid 3of6 posts">
		<?php if(has_posts()): ?>
			<ul class="items force-grid">
				<?php while(posts()): ?>
				<?php if (current_url() == 'category/blogs'): ?>
					<li class="grid 1of1 remove-padding">
						<article>
							<h3><?php echo article_title(); ?></h3>
							<p><?php echo article_description(); ?></p>
							<a href="<?php echo article_url(); ?>" class="button">Read Now</a>
						</article>
						<hr />
					</li>
				<?php else: ?>
					<li class="grid 1of2 image-wrapper">
						<a href="<?php echo article_url(); ?>">
							<img class="grid 1of1 remove-padding" src="<?php echo article_custom_field('image'); ?>" alt="<?php echo article_title(); ?>" />
							<h3><?php echo article_title(); ?></h3>
						</a>
					</li>
				<?php endif; ?>
				<?php endwhile; ?>
			</ul>
		<?php endif; ?>
	</section>
	<div class="grid 1of6">
		<h1><?php echo page_name(); ?></h1>
	</div>
	<?/*php if(has_posts()): ?>
		<ul class="items">
			<?php posts(); ?>
			<li>
				<article class="wrap">
					<h1>
						<a href="<?php echo article_url(); ?>" title="<?php echo article_title(); ?>"><?php echo article_title(); ?></a>
					</h1>

					<div class="content">
						<?php echo article_markdown(); ?>
					</div>

					<footer>
						Posted <time datetime="<?php echo date(DATE_W3C, article_time()); ?>"><?php echo relative_time(article_time()); ?></time> by <?php echo article_author('real_name'); ?>.
					</footer>
				</article>
			</li>
			<?php $i = 0; while(posts()): ?>
			<?php $bg = sprintf('background: hsl(215, 28%%, %d%%);', round(((++$i / posts_per_page()) * 20) + 20)); ?>
			<li style="<?php echo $bg; ?>">
				<article class="wrap">
					<h2>
						<a href="<?php echo article_url(); ?>" title="<?php echo article_title(); ?>"><?php echo article_title(); ?></a>
					</h2>
				</article>
			</li>
			<?php endwhile; ?>
		</ul>

		<?php if(has_pagination()): ?>
		<nav class="pagination">
			<div class="wrap">
				<?php echo posts_prev(); ?>
				<?php echo posts_next(); ?>
			</div>
		</nav>
		<?php endif; ?>

	<?php else: ?>
		<p>Looks like you have some writing to do!</p>
	<?php endif;*/ ?>


<?php //theme_include('footer'); ?>