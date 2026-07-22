Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0E0C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 10:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L5j5knED6q3pX0T/5tJ3M251cDQCJBmX/HJ95U5CMOc=; b=ePi68YLvW9vWBs/m35YLLKNF5g
	xQrug/UW0mLLk9fH9nt550KC5SfI9fraG+2iLhVqllHINAX0VH6p0emW4FhRJjPQzebmwm0teuZta
	P4S68kxY4MHPde8FVpIPrwrZGeWlKERBZSrRxysfhawt3HX5WYBnRRMXHuDS0g32NLVu7Dcsxkfr/
	VUIYBkg6deEFYg2elm2FM9NaIcc9UarQ1avFWUH2xleqEE+HKmV/q6JG9k7vzyy3MS7wzIqE35amk
	Eau0i+YvVvY1mUHN0kj+6+YXe6R9NZ8ABTLKoCUvejJA2E5gwJ4Gt5mYDTEjAbM67zwgpFA+pyHs0
	kmBdj9Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmU7L-0000000BXpl-1Q7B;
	Wed, 22 Jul 2026 10:23:59 +0000
Received: from extorris.mess.org ([92.243.27.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmU77-0000000BXfi-0BEH;
	Wed, 22 Jul 2026 10:23:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715821; bh=1yP18ZTlPXUiRlBsdmIVfczBqI+60MXCB3xkhNeyZNs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BGF1/F+WLHXV6j/0OEn+ZivJ0nB6Px4t1hqikgOOJCqP/zbNmrLiYBHIjtVLQrh2j
	 SQVD/svrmElcKeMa8BJkPDMY6Mrfh3Kt/70XD28Fcno5rWyq+MMeFts9Y303i/o9Ob
	 n9dAbulXhuKI6Wu9fogxwm9sOtNXeXthu9vhRHuCmzI4MxxK1icoo0AJ7c6j8K90XB
	 CETWzUYEAB8vV7L85WZBqLyDEHwZdF4Vi5pYF8TnOxNtBlXCLr8vQOVDnBa/6Q5DLm
	 pw1zUbIBWekaczkjsTpWMh3S2VSN2t8tl3ij/BfZhjwkVU9vkQ2gZd2JZkVYA1Sfht
	 4N3aOQuid40+A==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id EC5544252A; Wed, 22 Jul 2026 11:23:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715820; bh=1yP18ZTlPXUiRlBsdmIVfczBqI+60MXCB3xkhNeyZNs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aUxM38mdUebm/sODIPjAEyhB2MYCSGA5vpuK9NuaD41gzIs8jVMeNLFQfZw/PDYsf
	 4c1/O/w90NCefxlE0SWSsMHmHR3+ExQSDNaXRQ+bUZ6M9c9J7uYxDOU2TleYAKxt5G
	 grc9w6L5D76tEycvdqZexf15/PFQs+d0DIiXxVBYM5EpdHkxhD/5nM2u8bcBU3gn5q
	 E5kgB1lhkHZJ5D5dd1ZRgTEwghIFFUmSENv3wswcIX1XZLUDTJeoqPp5noRWuPF8oK
	 OtwxAwdnROdN8y1cNziAk0PcSIkbZEf6H0fnqlT+qSDRtIMCzswiLFT+SghNwRV6Px
	 dm1cmKhlZ8z6g==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 6AA5F42538;
	Wed, 22 Jul 2026 11:23:40 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/13] media: meson-ir-tx: Ensure probe error is propagated
Date: Wed, 22 Jul 2026 11:23:21 +0100
Message-ID: <b34fb1c2603376b4ae99829fafae49897d975625.1784715737.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1784715737.git.sean@mess.org>
References: <cover.1784715737.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_032345_219881_C32B534C 
X-CRM114-Status: GOOD (  13.84  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

devm_clk_get_enabled() may return -EPROBE_DEFER which needs to be
propagated else the probe will not be deferred, it will fail instead.

Fixes: 49be1c78d575 ("media: rc: introduce Meson IR TX driver")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/meson-ir-tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/meson-ir-tx.c b/drivers/media/rc/meson-ir-tx.c
index abb107d19e8c..174d5135e1bb 100644
--- a/drivers/media/rc/meson-ir-tx.c
+++ b/drivers/media/rc/meson-ir-tx.c
@@ -290,7 +290,7 @@ static int meson_irtx_mod_clock_probe(struct meson_irtx *ir,
 
 	clock = devm_clk_get_enabled(ir->dev, "xtal");
 	if (IS_ERR(clock))
-		return -ENODEV;
+		return PTR_ERR(clock);
 
 	*clk_nr = IRB_MOD_XTAL3_CLK;
 	ir->clk_rate = clk_get_rate(clock) / 3;
@@ -324,7 +324,7 @@ static int meson_irtx_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-		return -ENODEV;
+		return irq;
 
 	ir->dev = dev;
 	ir->carrier = MIRTX_DEFAULT_CARRIER;
-- 
2.55.0


