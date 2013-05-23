<?php theme_include('header'); ?>

	<?php if (article_category() !== 'Blogs'): ?>

		<section class="grid 3of6 article-content">
			<h2><?php echo article_title(); ?></h2>
			<article>
				<?php echo article_markdown(); ?>
			</article>
		</section>

	<?php else: ?>

		<section class="grid 5of6 article-content" id="article-<?php echo article_id(); ?>">
			<h1><?php echo article_title(); ?></h1>

			<article>
				<?php echo article_markdown(); ?>
			</article>

			<section class="footnote">
				<!-- Unfortunately, CSS means everything's got to be inline. -->
				<p>This article is my <?php echo numeral(article_id()); ?> oldest. It is <?php echo count_words(article_markdown()); ?> words long<?php if(comments_open()): ?>, and it’s got <?php echo total_comments() . pluralise(total_comments(), ' comment'); ?> for now.<?php endif; ?> <?php echo article_custom_field('attribution'); ?></p>
			</section>
		</section>

	<?php endif ?>

<?php //theme_include('footer'); ?>