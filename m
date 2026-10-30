Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B32606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 17:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UUMxJxp7;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=R7FVsMSx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=p5fsbr8zakmt2LaD3B1QD/vUAK+i4p9LYfhfMfto9I4=; b=UUMxJxp7CRR0UauG+/lQ0kR+zU
	131/UgiHXqETRrkX0jWkaSOcLjiWA9BdvqnhHji+KV9RpgkBFWJb3xfzZuulKutCm2rZDG1n6dx1Z
	zl9m/WgpiCDrv/xWuKI+BKlbajAf5gG9XYU5cWyIyUbnhDDqRkeGig0ebrPbU3Mnm0sVr6EWuBY7K
	FrTwRtvtLGeBQRpqcMfyszeux8EYqG94c46/0Rd2jbF2rRFbs1hd6YeuqjzDPDHMfYbqCb1PkO74m
	U3JrYmssYCy7MQ5RuQBIQSeBOewvZHSPbdPr0F/ic8ZcuYp4eUWCiAmezwCMoxtg0BthqWe2QLGUk
	NBy5UGlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqKV-0000000CEPp-1UrE;
	Fri, 30 Oct 2026 17:23:51 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqKT-0000000CEOq-1nqh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 17:23:50 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so8694905e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 10:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793381027; x=1793985827; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p5fsbr8zakmt2LaD3B1QD/vUAK+i4p9LYfhfMfto9I4=;
        b=R7FVsMSxohj3swJNZ9ysuN7IkLiqb3PHeR1hbo38W3c9xQUCyp3IpnQ1dv50+BM6up
         3uHtESfh5Q3KgrGbS+NAAeZd/oF+V67Dv0OIYR9EBJtS4uFN3feH+KhWCwCOxSUP6CZ+
         oe3eaGnjsu5uFp9WnTzKIvKYN2CIl3yHT5gjdkqCeDJyHhYFlhKPq92FfHr/Z9/3AFm8
         PA4Mq8jS5IfQ0LwiNcTjLI09BC6o3qW563kwCsMGs4P0Oh0xgjoU4CnEA211w/u3EJ58
         pY6F1ZRWLi/d2REY5n8WQdZd/6uI+QQjF4KAIu0VkXjvo/WBKNhNlcsRwOsYIYIgJjaA
         DItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793381027; x=1793985827;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=p5fsbr8zakmt2LaD3B1QD/vUAK+i4p9LYfhfMfto9I4=;
        b=C6UqRtE7+Zv0ys6izYK65eEbWRP9e+TqeXEqlHIyLDObq3G6MPHJhG+W5uqzuw7rOq
         lcxATRlwiWlaTeBnno4YoVIEn3W4u+1pjXMCzKsU4lvKFmW+0tEaH9jsuY5DbeA2AHOn
         8ec6+cYVNLt9f7RD5l5AAcbp6P2V++1vKOt8h2QgJU+Lv7WFBHFwWwegLiYCJz7ROucD
         Lbl4qXrai0b2Azzhfc6EbAymwYrHNrKl3ywGecuxDfThIai5OgScoP1/fHQrQFf9nvwQ
         uDQ6nwcSlFNhreiBe8/7+yHGmlm1L/XAK6SYf3Eu1c6w0VXQ9cIqXN/qv0qV4OdP3IR8
         qXaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrlR7enexOjLnKumMCjpGPSSl0R3ki5AsTTeJUVINmsak6XVfxv+D6f1W5m+zR/++VUaGdpQvOCw/dM1sBuy76@lists.infradead.org
X-Gm-Message-State: AFq9FYKlvx3QG5yp38XDGA/VPQ9pGgW5ktfZLLYosk28Rzu48WwRGE47
	XhlyWl/ZuTCC5Yrbva+v6xKfzoktyqNC8FzqCHGfdC+UrduCAmkMEe3GQtOvmC1ELeI=
X-Gm-Gg: AYBFou0H5xkBlQiol/2vPFeJfelm6tgT9ufdKmQvDMz6+xW0QyhvJ+CPA+XHFoHbt47
	iUBjfKO4+L0oTsYW/6hkd3Tw3AYtg2BYjIcrn0kBD98UVFdqKtzs9nkh5sgjiiPPocBp+Qw2Jev
	jPkKyUs2LK98VVvMFWmmR5ISGslmnIuExTEbYyVHIn1MgH1mIVE5AmbB+QRWN3boCw1zHLT155M
	xDdvyCMw99QwwbfezFB6tvZdpX1/CQBq0z0a1ATh7OO4EB8mDHM4ilS37ukcTQMKzVDyLON51Sy
	k36a3CSZwYDtFmRpuyXxrjtAnyN2SNoplppBlhyPc4Rvgs5OU+kM6bSbL8i5mUC5WJ7sHN5pZq0
	Zz1bGt3NlKyYQbhNH+dzSojApFYPJsevDN0I9+qSYrT+U/HP7ehMnqQvewYbS4EopDfN/zuCUNI
	GGw9LwWs8W1zeK56i7gCB43JQeUKIPmeoKL0jN95cHDCJnJdPi/qq3pKDtMmWnHdnBVTR326ips
	x7CNFApDxoFSiPz5586HN/VLyD4TzTitvcsGdahm0zU4JrPbPlxQdJoFk/alunLEuC4MoTFJ13c
	qdaYWuZ0AsO0ykPtin15KLFpL34Y1iNPpygstS2OsZqCo0mX
X-Received: by 2002:a05:600c:348f:b0:4a2:be6:60aa with SMTP id 5b1f17b1804b1-4ac17d16b14mr69175235e9.10.1793381027072;
        Fri, 30 Oct 2026 10:23:47 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0a66caefsm56949685e9.5.2026.10.30.10.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:23:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 30 Oct 2026 18:14:56 +0100
Subject: [PATCH] ASoC: meson: axg-fifo: request the irq with the clock
 enabled
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-asoc-axg-fifo-irq-clock-v1-1-f8c170ac8b0d@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBCF4auQWTtJS2MlXIW4qOMUBw2FjhoSw
 t2tsPyS9/4VlLOwQlutkPkrKmkssKcK6BHGnlHuxVCb2lvjDAZNhGHpMUpMKHlGeiV6oi2LS3N
 23jsD5T1ljrLs5e56WD+3gen9z8G2/QAPnbFrewAAAA==
X-Change-ID: 20261030-asoc-axg-fifo-irq-clock-120278536630
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2821; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=oVESQqWI9ddX5fwFsFHblshua3jUvLRhTVEHMsN3Hq8=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlPLs0rq1z+7l7V64M1PfXPE/revDg4b9F/g8NHP62zy
 jn3KePV6o5SFgYxLgZZMUWWGu5q8XeSWl9mTde5DTOHlQlkCAMXpwBMJNSLkeGoU2L32W9tq7bH
 Txd/uUK8zPlqU9Z9J8OVa27YP/vQJfSLkWHGX29VWemkFcHHeO6Evzt8ZuvSQt8lSlPN/x+xWLt
 amp0PAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_102349_499362_40F992B2 
X-CRM114-Status: GOOD (  13.75  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The fifo irq handler accesses registers which need pclk, but the irq is
requested before pclk is enabled on open and freed after it is disabled
on close.

Request the irq after enabling pclk and masking the fifo irqs.
Free it before disabling pclk.

Fixes: 6dc4fa179fb8 ("ASoC: meson: add axg fifo base driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-30e88a8a-f33a-40f0-92aa-9ea62c5b7299
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-fifo.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index 75909196b769..edf43b7fb5cf 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -244,17 +244,10 @@ int axg_fifo_pcm_open(struct snd_soc_component *component,
 	if (ret)
 		return ret;
 
-	/* Use the threaded irq handler only with non-atomic links */
-	ret = request_threaded_irq(fifo->irq, NULL,
-				   axg_fifo_pcm_irq_block,
-				   IRQF_ONESHOT, dev_name(dev), ss);
-	if (ret)
-		return ret;
-
 	/* Enable pclk to access registers and clock the fifo ip */
 	ret = clk_prepare_enable(fifo->pclk);
 	if (ret)
-		goto free_irq;
+		return ret;
 
 	/* Setup status2 so it reports the memory pointer */
 	regmap_update_bits(fifo->map, FIFO_CTRL1,
@@ -271,17 +264,24 @@ int axg_fifo_pcm_open(struct snd_soc_component *component,
 	/* Clear any pending interrupt */
 	axg_fifo_ack_irq(fifo, FIFO_INT_MASK);
 
+	/* Use the threaded irq handler only with non-atomic links */
+	ret = request_threaded_irq(fifo->irq, NULL,
+				   axg_fifo_pcm_irq_block,
+				   IRQF_ONESHOT, dev_name(dev), ss);
+	if (ret)
+		goto free_clk;
+
 	/* Take memory arbitror out of reset */
 	ret = reset_control_deassert(fifo->arb);
 	if (ret)
-		goto free_clk;
+		goto free_irq;
 
 	return 0;
 
-free_clk:
-	clk_disable_unprepare(fifo->pclk);
 free_irq:
 	free_irq(fifo->irq, ss);
+free_clk:
+	clk_disable_unprepare(fifo->pclk);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(axg_fifo_pcm_open);
@@ -295,12 +295,12 @@ int axg_fifo_pcm_close(struct snd_soc_component *component,
 	/* Put the memory arbitror back in reset */
 	ret = reset_control_assert(fifo->arb);
 
-	/* Disable fifo ip and register access */
-	clk_disable_unprepare(fifo->pclk);
-
 	/* remove IRQ */
 	free_irq(fifo->irq, ss);
 
+	/* Disable fifo ip and register access */
+	clk_disable_unprepare(fifo->pclk);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(axg_fifo_pcm_close);

---
base-commit: 11ae63bd9030349a0136fb2edd1622a4a029edc8
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
change-id: 20261030-asoc-axg-fifo-irq-clock-120278536630

Best regards,
--  
Jerome


