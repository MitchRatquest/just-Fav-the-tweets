function sstrfind(s, pattern)
	return string.find(s, pattern, 1, true)
end

function pre_format_html_hook (url, html)
	if sstrfind (url, "mobile.twitter.com") then
    html = string.gsub (html, '<div id="brand_bar.-</div>', '', 1)
        html = string.gsub (html, '<table id="global_nav".-</table>', '', 1)
        html = string.gsub (html, '<div class="search-fields".-</div>', '', 1)
        html = string.gsub (html, '<td class="avatar".-</td>', '', 90)
        --html = string.gsub (html, '<td class="timestamp">', '', 90)
        --html = string.gsub (html, '" href=".-</a>', '', 90)
       
        html = string.gsub (html, '" href="', '" hreff="', 90)
       
         html = string.gsub (html, '"tweet-actions">.-ast"></a></span>', '"tweet-actions"></span>', 90) --oops
        

         html = string.gsub (html, '<span class="middot">&middot;</span>', '', 90)
         html = string.gsub (html, '<span class="imgsprite_tweet_reply_gif" title="Reply"></span>', '', 90)
         html = string.gsub (html, '<span class="imgsprite_tweet_rt_gif" title="Retweet"></span>', '', 90)
         html = string.gsub (html, '<div id="footer">.-</form>', '')
         html = string.gsub (html, '<div class="view-actions">.-</div>', '', 90)
        html = string.gsub (html, 'Back to top', '')
        html = string.gsub (html, 'Turn images off', '')
        html = string.gsub (html, '&middot;', '', 90)
         html = string.gsub (html, '<form action="/sess.-</form>', '')
        html = string.gsub (html, '<script id="scribe.-</body>', '')
        --html = string.gsub (html, '<span class="metadata".-</span>', '', 90)
       
       
        html = string.gsub (html, '[a-zA-Z0-9_]+/reply/.-</a>', "", 100)
        html = string.gsub (html, '<a href="/statuses/[0-9]+/retweet">', "", 100)
        html = string.gsub (html, '<a href="/[a-zA-Z0-9_]+/status/[0-9]+\?p=v">View details</a>', "", 100)

        html = string.gsub (html, '<style type="text/css" .-="text/javascript">', "")
       
       
        html = string.gsub (html, '<table class="tweet  ".-[a-zA-Z0-9_]+/status/[0-9]+\?i=.-</table>', 'PROMOTION DELETED', 100)  --HOLYCRAP
		
	end
	return html
	
end
