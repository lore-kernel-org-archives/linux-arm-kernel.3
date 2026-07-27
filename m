Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EF7C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 13:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GNaAp7I/rX0bwwaGe5Y0Pt0YkaCz4Vw6T9/IS56ZcLw=; b=VGYcBpDWXXUguT5rdaEqcqxKgT
	flWGCUH2Sg50NVLcgLrrAVkXJasC1n7kaRTiO0s8bAP8PJhmSLGRXbnJP2AeQzDceI5Fz0fMjS89o
	xJ69zjrYA0LcJ6OT53WD0NZDeAnQO2Ene7eK8lLAi/ki8bWHSop/F6ivkLbua6YK7zUnvxeqiQNJq
	xk03O/Y++0awpXafzouW+SJhqWSp3z8ECgLsG6u157cBycJcjdA3wQGeyE4P7PagFVkAb7CaxfAzr
	Ef2z6Y0AnpsU9SYtNl4AKHkUZYgY+ehqzJ4U3J7Vwy5VIeI3VeR9SHKTgazuKMULiov7gr9DnHCLl
	WqWhAOIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLEw-00000002pOp-2dX6;
	Mon, 27 Jul 2026 13:19:30 +0000
Received: from extorris.mess.org ([92.243.27.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLEm-00000002pKh-0UQt;
	Mon, 27 Jul 2026 13:19:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1785158358; bh=eSs17I3gI0a4kTGzSQjzniOZzuQNj3YU+5kAUZgohrs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FtWdFM+2rtbsBuCBugcaeSqtYfYdAoNi2n4K4gwcaC1FRlyVX4PBfkNMwqf+gUmmv
	 dPzZ+VitKy/OapW3JtQQ3XvDSKMTK2RyEsIY0NOuhiIbCiAdbnYYIDZUnl37jUaYMh
	 w7Euxx0RyrM9cSb+1bv0dkF5SIpPPBe9ISWdo5rNJbxDR8u05iQPOFtYOTiEWHET7C
	 xIGJCDxzhnPX45Gb7BLP25R+LEBYmTu4lj/DTUSTJwg8OIIB6IYU2gVey9nuW8wMiG
	 lw3u4MUuTee1o2I3y7+7G9qHZDvzMa78Bz3q5pd9UG4ePQYOLCnKGmkrCyR7KunJtD
	 EHIuQ6oz74Big==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 7E5EF42556; Mon, 27 Jul 2026 14:19:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1785158357; bh=eSs17I3gI0a4kTGzSQjzniOZzuQNj3YU+5kAUZgohrs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FwA6BcLZVQ884ht9BqiiKjjKp1UmdkCuqqFzzEbnjxrfb8gYed8A4AhRdXnGFb7KI
	 SqiGhFp9DMzqzM1gEhWtoWdhpnbBUt56BLP6nqFdXSsMhYxgKKqQ7eHNzjCHJTE1sB
	 yGAbFlpxttmexsnYz1FKtdLXrwslY/lw6Uyl7Kh8SYYYvPxiTxfsqtoQSH8b1WXcm7
	 CgDwedvDy92RkdDsBOjK4hd5SoQlAHd9LgMXiu04gOy9qs3XdFbdwTfnyA1Bm/b6Xl
	 e3KO1klW1xEKRWVTOXWWu7abn5vcoHcgtk1tFOG2MilpT5WOkUHXxGr6ytRNN4RVK3
	 GfvBm4GeoGE8Q==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id C897E42554;
	Mon, 27 Jul 2026 14:19:16 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc: stable@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 09/15] media: meson-ir-tx: Ensure probe error is propagated
Date: Mon, 27 Jul 2026 14:18:52 +0100
Message-ID: <45cb104675d7abe96dd3570d54f017bce7063be4.1785158244.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785158244.git.sean@mess.org>
References: <cover.1785158244.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_061920_297958_9DADA242 
X-CRM114-Status: GOOD (  13.08  )
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
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: stable@vger.kernel.org
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


