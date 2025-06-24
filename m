Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E567CC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 16:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLX+vkQrETtNyOQ4ZsInMSK9f7xVFIJKfGkO1l/6I0w=; b=wZnBxStTFLG0btxb8Ww0rhKqnf
	nBBKsPkpMHrDPYycVkAiQzpenXBuPpeBNhS7yx3p2AAkgZwY0Qv7LmQcgLJ79XySqlc8inTAJ/OK5
	CdDVterq4lBrqzsVZlZau51OayRuO0u1qr+trNm4teyNGpiBz2v39ux2jcuMp3I4oBz1Uf9c+hAyE
	BqFP4ejNzDHmWXBvTiDvIFSAlHyKuxItUo+FQ9NMkQW7/KDmoPH9T/rrTqjz/Ba4kLNfApNTSs9st
	FxS2nONcZ6t8dol80LFLUKTOkpI9QeudB2iGlhtQuu/Sx8T3TKhNKvKQ6nx0fI3fz6yRjJVzkEbTe
	E9HIBbWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU6LG-00000006FsE-0mVU;
	Tue, 24 Jun 2025 16:17:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4iW-00000005vZk-2dQK;
	Tue, 24 Jun 2025 14:33:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hLX+vkQrETtNyOQ4ZsInMSK9f7xVFIJKfGkO1l/6I0w=; b=lznI6YcrFtI5yng45iInRGkkOm
	Xtwlu4MStCXkkiwMgsNj2xUp5bDywEFF3UclncHQliu4PKbrKu91ah7n7RqeT53DQE3uXmLJ1mYTz
	DWwoFYwj4BbGFhSzgilyd/ufReO1J8tTHtfJLQ/aJ1DNJGLmN3QWW/piBsptB3tzXMm/6J+GVGDHh
	DJM3/SoPCO2xT5fI3P+U2xeBV3w/B6fBbzFyZQl37uOQ8PQycQC5o6bRng266UYRf3qI4v8hVLlBy
	BMSWsS5zYJbECsndOLBasXbIVsEGM/Zg0f+Nmx12zeUZLGiCKCgzP1XMr3MLuN1GsuVE8WUXOh4Ks
	JL/xkRQA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4iT-00000005Sqz-0hIX;
	Tue, 24 Jun 2025 14:33:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750775619;
	bh=klP6Z1aV1eyxlTcl3AKzPnOACsLqgTD3I16ktsRtqv4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R7CgJfUWV1SGdMfq+tI+tK3LmI0W+6vKN2T81rBSq9j5kDV0Jy+RIylAolIHE/D+A
	 jw1WVY4albHhDA3Tq0GNFBGmgMs9ieMvmP5WNxcJzlgR2+U9QGABUd9M+Uczgunotj
	 QEszEOCFfObucTJvngaPtxS4aTskxRWQB9apZpahAn3ySe0osgU6FNAyHUsvNbA4Hf
	 Jx0UtKGGABgbKLiRunSkixrB+BWaBdWBgb8KizIvoA2dvPK8bC4b40J0iKZWRPWQI1
	 HywX03FTIlv8PVylAP/hnbLqiubl/KUCYpH0khkilWYdyI7uNO/2D19Sy88HxycUsx
	 37nKJTNrrm6/w==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:d2c7:2075:2c3c:38e5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0172117E0EA4;
	Tue, 24 Jun 2025 16:33:37 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	richardcochran@gmail.com
Cc: guangjie.song@mediatek.com,
	wenst@chromium.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH v2 06/29] clk: mediatek: clk-gate: Refactor mtk_clk_register_gate to use mtk_gate struct
Date: Tue, 24 Jun 2025 16:31:57 +0200
Message-Id: <20250624143220.244549-7-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250624143220.244549-1-laura.nao@collabora.com>
References: <20250624143220.244549-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_153341_304113_796C2EA8 
X-CRM114-Status: GOOD (  11.05  )
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

MT8196 uses a HW voter for gate enable/disable control, with
set/clr/sta registers located in a separate regmap. Refactor
mtk_clk_register_gate() to take a struct mtk_gate instead of individual
parameters, avoiding the need to add three extra arguments to support
HW voter register offsets.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/clk/mediatek/clk-gate.c | 35 ++++++++++++---------------------
 1 file changed, 13 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index 67d9e741c5e7..0375ccad4be3 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -152,12 +152,9 @@ const struct clk_ops mtk_clk_gate_ops_no_setclr_inv = {
 };
 EXPORT_SYMBOL_GPL(mtk_clk_gate_ops_no_setclr_inv);
 
-static struct clk_hw *mtk_clk_register_gate(struct device *dev, const char *name,
-					 const char *parent_name,
-					 struct regmap *regmap, int set_ofs,
-					 int clr_ofs, int sta_ofs, u8 bit,
-					 const struct clk_ops *ops,
-					 unsigned long flags)
+static struct clk_hw *mtk_clk_register_gate(struct device *dev,
+						const struct mtk_gate *gate,
+						struct regmap *regmap)
 {
 	struct mtk_clk_gate *cg;
 	int ret;
@@ -167,17 +164,17 @@ static struct clk_hw *mtk_clk_register_gate(struct device *dev, const char *name
 	if (!cg)
 		return ERR_PTR(-ENOMEM);
 
-	init.name = name;
-	init.flags = flags | CLK_SET_RATE_PARENT;
-	init.parent_names = parent_name ? &parent_name : NULL;
-	init.num_parents = parent_name ? 1 : 0;
-	init.ops = ops;
+	init.name = gate->name;
+	init.flags = gate->flags | CLK_SET_RATE_PARENT;
+	init.parent_names = gate->parent_name ? &gate->parent_name : NULL;
+	init.num_parents = gate->parent_name ? 1 : 0;
+	init.ops = gate->ops;
 
 	cg->regmap = regmap;
-	cg->set_ofs = set_ofs;
-	cg->clr_ofs = clr_ofs;
-	cg->sta_ofs = sta_ofs;
-	cg->bit = bit;
+	cg->set_ofs = gate->regs->set_ofs;
+	cg->clr_ofs = gate->regs->clr_ofs;
+	cg->sta_ofs = gate->regs->sta_ofs;
+	cg->bit = gate->shift;
 
 	cg->hw.init = &init;
 
@@ -228,13 +225,7 @@ int mtk_clk_register_gates(struct device *dev, struct device_node *node,
 			continue;
 		}
 
-		hw = mtk_clk_register_gate(dev, gate->name, gate->parent_name,
-					    regmap,
-					    gate->regs->set_ofs,
-					    gate->regs->clr_ofs,
-					    gate->regs->sta_ofs,
-					    gate->shift, gate->ops,
-					    gate->flags);
+		hw = mtk_clk_register_gate(dev, gate, regmap);
 
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %pe\n", gate->name,
-- 
2.39.5


