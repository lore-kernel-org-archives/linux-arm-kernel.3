Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B22C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m4Z5pWHAYmt7m7KtNfIU1rNnfqDpY05zeAJJ5XpoEVA=; b=G3XJvNFF4DJXGm9gXeh+v1vcvW
	ASEP/n61cDKyij26fUYsJTb6IaBvvLune9uTSgAtV30T86TkDKmarf6LdvXYypeVJsytuxUqZRXxt
	3jSGI0Y0Uk62p0RcbIQLnuI2DssJXYP7JT0jR1yo6DbfbDxqxC917TN1tpHhsocGpAGq7BAh0niVk
	retbH7wyvdySDEwZPONjUOg2itnlCvcH4P55y4os8WIbryYq5wee/FIN5Ggz+1Vn7QydLt+6sW5Qf
	udwMo0l/IqOeDVcinpYp9+fJf4paPEu+K0oNyW5Thwm1PGQuUu28KVt1/XwOuGgb16GVM6PHhX/9Y
	865EdNsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtVV-0000000HLjo-16Yv;
	Mon, 03 Aug 2026 14:19:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtVT-0000000HLgD-29ry
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Aug 2026 14:19:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=m4Z5pWHAYmt7m7KtNfIU1rNnfqDpY05zeAJJ5XpoEVA=; b=Zjm3CLLQ16LBYyT8/WYzWHf3bT
	15bOk5TVeg9wEGNrbN7Ah5peeW5+wvF5SqFA/oZtzSQNZz7OfqGBwbcHtO41iNAFHjDQ3VoZkoaUb
	Lih2/YuD/2lowazx8GxpEuTEDK2hlOT6az+hJNhfOv51Nz8VBg+VVBmopoObmELVzJbWHHGX074H9
	2jFspZQiQ737dIWeu9OTTu0xyLVVoo2bBD2Nb/zhjfJpG5QVZvOzCyhTKHx6XZMF0MBSlgENHZ1nV
	l1Lb/SOW4Q6Cxv+PreeRw59meGwuPM7wpi1/gKTaZ25cYFFY73/SVHFhdqVFv1sOK5woq744UEVwC
	sMZsu6Yw==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wqtVQ-000000092G6-3OXs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:19:06 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so851015a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766743; x=1786371543; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m4Z5pWHAYmt7m7KtNfIU1rNnfqDpY05zeAJJ5XpoEVA=;
        b=Zou7pVJZ5mFS3aAbM/Y5NifC4B6hELFwGpXyP8i5mA68oukvxEvk+wovttIP80lcw9
         92ULtXE2SW/tWQ0gmreF/CGvkhkT0MEWZbyiLzSa0xjxLW82GkRJkPzWSX5ldCAu4wJP
         n5m06MnbnSQiYcZprtzb70XwR8lCWXD5DV19FpqM6kPBgCyrHtoGKtML7QXdNZY4p4I6
         1d1PHoa3NVnybDjTXIZsz9+6Cksg43LW1sSr3kP3O3N2CVYw9/Vtp7q4/9IlDZ7UnIVa
         9VB/ATbOfBp2JTPoBxCj1LdoUqbpX0tPyaIO/IWAAFiI0kpTVLJhGezCQn0LCVbEnXLW
         Wv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766743; x=1786371543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m4Z5pWHAYmt7m7KtNfIU1rNnfqDpY05zeAJJ5XpoEVA=;
        b=PQhGo7rxCzMcuco6xZfOjMiBq1NKc0V5QgDIQy2rnPBMoUtqdF2E7ggX96FtNx5r04
         aIhK07/zYY1zzQKKBp+bq9m5xQk/uEeiZdSjCgvFASMNNUXrN8w7kGlIGWGPcJ4t/gAR
         2tC1ttcNaLWGUPT6/jMaWHqwelm3GcFjMFMmmKkm8r4E0+op801cbkTu3lX/nEeT9Nty
         hBjKQdMLYBoJMHRTKS8Gcn+ft0uwR8NvWDWwa+zqLuRt/plDit0HPQEf3v28RRYPHvAX
         x/Np3qFYRqp2/g7dINDxFli9fdkw9o98vp5X1BvHId6vGDDmQe8SdpaVs4+vrakYEiqP
         fVww==
X-Forwarded-Encrypted: i=1; AHgh+RqRTauRCtjxp/ocKVnJr9rSvrephtvSsCT7099BGPD5g21RHEJDsn1coKZWgrhg8haBhSuK+r1ERgK/gd/uq2ga@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6sMuev15OwwOpvgSvvQuCif614pwMaa5pRhk2nWksdmpth23T
	h3DsEBamkc9zldnuxCxldSm9e9cVvgp2KKGCC2hQL7nwhQvb7YX35uqV
X-Gm-Gg: AR+sD11yOZl0MQlOQTeiyok55VFKN/cmDNh0uNlxYg1+IsztXXVszJSUd2cfsqR3p/p
	ccxPA5+C+Od1J/ENPkc9LodvCYH1++StiPCF0GnfCEmoAnsq6p44Hu43R7avaYoziqaDCkyp4h7
	s52t9bMG43CSHvJzoX71msUnnZuLFwf/XutuHcgPJVeIMCWhza1L1aOx0D/Bq7igkhtHVBdOxzt
	oxGDu1R/ROm+udz/J/P6aeXySqOwSrPCtEXBo1InB2S8BO7DNvderp0x3A7i1eWIs9uscvGN0WS
	eiH2/hBqhkE5AGlC0jnMeSvJBLX2WP7ExTy2eiN/SCYWGWdk43mPwLGv9DsgSgX4Jg1huBxRBnH
	t+4D8W32vTfm/kbNZLa1ZnCjEqglnMbe2AnbK56i/5NCSwWEylEHFhH6ImoU6SqgJ4v6N3adHJ4
	C6SygpO4GHRjoyQNK3Z47Ez1x6RjhvbmaLtWHHsWUJTq+kkL86G/m5dKAkNAPcMTaYElOsm0Suz
	lNjOlqfPS8c1PxB4P35
X-Received: by 2002:a17:90b:4b41:b0:38d:e658:595a with SMTP id 98e67ed59e1d1-38fbc409a24mr9805618a91.2.1785766742716;
        Mon, 03 Aug 2026 07:19:02 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:19:02 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_)),
	stable@vger.kernel.org
Subject: [PATCH 21/32] clk: mediatek: mt7986-apmixed: Switch to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:48 +0900
Message-ID: <20260803141659.559129-22-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_151904_955026_CB41D0AA 
X-CRM114-Status: GOOD (  15.65  )
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

The MT7986 apmixed driver can use the MediaTek clock framework common
initialization sequence. Reduce boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.
Also, add a remove callback to properly support module unloading.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt7986-apmixed.c | 37 ++++++-----------------
 1 file changed, 9 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7986-apmixed.c b/drivers/clk/mediatek/clk-mt7986-apmixed.c
index af3e002bbfb7..6df3e9555e4e 100644
--- a/drivers/clk/mediatek/clk-mt7986-apmixed.c
+++ b/drivers/clk/mediatek/clk-mt7986-apmixed.c
@@ -57,45 +57,26 @@ static const struct mtk_pll_data plls[] = {
 	    0x0278, 4, 0, 0x027c, 0),
 };
 
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+};
+
 static const struct of_device_id of_match_clk_mt7986_apmixed[] = {
-	{ .compatible = "mediatek,mt7986-apmixedsys", },
+	{ .compatible = "mediatek,mt7986-apmixedsys", .data = &apmixed_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt7986_apmixed);
 
-static int clk_mt7986_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(ARRAY_SIZE(plls));
-	if (!clk_data)
-		return -ENOMEM;
-
-	mtk_clk_register_plls(&pdev->dev, plls, ARRAY_SIZE(plls), clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r) {
-		pr_err("%s(): could not register clock provider: %d\n",
-		       __func__, r);
-		goto free_apmixed_data;
-	}
-	return r;
-
-free_apmixed_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
 static struct platform_driver clk_mt7986_apmixed_drv = {
-	.probe = clk_mt7986_apmixed_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt7986-apmixed",
 		.of_match_table = of_match_clk_mt7986_apmixed,
 	},
 };
-builtin_platform_driver(clk_mt7986_apmixed_drv);
+module_platform_driver(clk_mt7986_apmixed_drv);
 
 MODULE_DESCRIPTION("MediaTek MT7986 apmixedsys clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.55.0


