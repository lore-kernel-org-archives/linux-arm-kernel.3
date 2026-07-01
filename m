Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81C3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4yekgiJ+T/S7uCQwESFyMiYYet29UYuCPdFELTnGD58=; b=Qk+VUMmpVrYCuKykZ+slB1WA8a
	/tvyWF3Hzn+o3fKO4Rpu/W51cSGryvli13QSiZMqqguqBVNpJGO8RzWMxfG9qykV08nRofqrZdukP
	fIagJjULg/MKTHA8xsSHr+jiKJzY+qCan6PWM5h1oupwyYpDqhJOL3/uju+AZA65PfnAueefxRGG5
	PYz9wN+zPFAExfjVOWGJXNAZ0exss+hRRpusjY5TUlKNbF+VflftAk62sbcLdkPVdvpGDrWrn5HUK
	swYO6GKY14avF0WXwMGuY508AuBHrd3yWJqb4IxkLmIZmiO8gqI1Tu/jrQAajUUhWevbaA4OnX3bS
	gkbNtUcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetvP-00000001rCj-3vBb;
	Wed, 01 Jul 2026 12:20:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetvP-00000001r7y-0bFh;
	Wed, 01 Jul 2026 12:20:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4yekgiJ+T/S7uCQwESFyMiYYet29UYuCPdFELTnGD58=; b=n1HhXzEygwk8mXewLA+hhnoW2u
	KEh3TCWrNeHEEPvwf57XKKIAwNLx4qGQQIMAcFIHvtRWWVvFnCK12uJr4W8LEg9ikVCCLnFnH9vni
	NL+hmJVyVlACbTGPM4paYTPqKf3xQaiW98L/OEe8lmo63YCQPiIsN0sPie5Rc+RXjTHvGDTZq49zS
	vjOSIiJ97xStoxtDt/opQYDFDJrdZnZIuEMhvCPMUqq8t9GIOlRGf6CCx6G8JqM7BUKotwufZRF9H
	JOecAZf9+DHWQU5RvItu+m4U8dK+CP90CeTlS/BGAztpOHQ/X6Q/ZJ+1nHSvSc3MBZJu9aPBWy0NZ
	MWhjbxFg==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wetvK-00000002jA8-2tpU;
	Wed, 01 Jul 2026 12:20:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908413;
	bh=WveJIKcSDFtln6moBUm4mMfeMv6Y8I/JiesYCykNM8g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KuWQiqXO3Bo3bL3GfEx3ALn6r1FYE+70kyIXjMrLlJEKwrsXVgFkgXpix7MHSCW+7
	 1GINPA2qAKDJ9Wq0DD8z8UjczYeYu8sczvDAVgK6MJ2bBJU7thsYXSmPw+rgsvLwVD
	 3YLUra77S2Lwp9Vk6PfRexipL+2q+/QMJBI6NUjTZ78wU5ioClQTVX1jYsW96qvu18
	 KeXaGWTfw22bN6vSnub8paTUGwVjLnvA1Fs6s1tPJk+9J3fyqkWgdW7qaaDNPp+WnA
	 Gr3ATRPJUi5BRRYZBScXN+9psjzSqAcShbfzD1BHlm+i3+bYfeZXIehZnYmG0oG1u0
	 es5Li1MWMGsFA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 54C6D17E0D72;
	Wed,  1 Jul 2026 14:20:12 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	justin.yeh@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH 02/12] phy: phy-mtk-dp: Rename regs to regmap in struct mtk_dp_phy
Date: Wed,  1 Jul 2026 14:19:58 +0200
Message-ID: <20260701122008.19509-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122008.19509-1-angelogioacchino.delregno@collabora.com>
References: <20260701122008.19509-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_132014_790148_D0477572 
X-CRM114-Status: GOOD (  11.57  )
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

In preparation to perform further cleanups and to extend the
driver to support more SoCs, rename the `regs` member to `regmap`
to improve readability, as this is a common name across many
kernel drivers for a struct regmap.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-dp.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
index d7024a144335..bf7b3a95e72d 100644
--- a/drivers/phy/mediatek/phy-mtk-dp.c
+++ b/drivers/phy/mediatek/phy-mtk-dp.c
@@ -79,7 +79,7 @@
 				 XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT)
 
 struct mtk_dp_phy {
-	struct regmap *regs;
+	struct regmap *regmap;
 };
 
 static int mtk_dp_phy_init(struct phy *phy)
@@ -94,13 +94,13 @@ static int mtk_dp_phy_init(struct phy *phy)
 		DRIVING_PARAM_8_DEFAULT
 	};
 
-	regmap_bulk_write(dp_phy->regs, MTK_DP_LANE0_DRIVING_PARAM_3,
+	regmap_bulk_write(dp_phy->regmap, MTK_DP_LANE0_DRIVING_PARAM_3,
 			  driving_params, ARRAY_SIZE(driving_params));
-	regmap_bulk_write(dp_phy->regs, MTK_DP_LANE1_DRIVING_PARAM_3,
+	regmap_bulk_write(dp_phy->regmap, MTK_DP_LANE1_DRIVING_PARAM_3,
 			  driving_params, ARRAY_SIZE(driving_params));
-	regmap_bulk_write(dp_phy->regs, MTK_DP_LANE2_DRIVING_PARAM_3,
+	regmap_bulk_write(dp_phy->regmap, MTK_DP_LANE2_DRIVING_PARAM_3,
 			  driving_params, ARRAY_SIZE(driving_params));
-	regmap_bulk_write(dp_phy->regs, MTK_DP_LANE3_DRIVING_PARAM_3,
+	regmap_bulk_write(dp_phy->regmap, MTK_DP_LANE3_DRIVING_PARAM_3,
 			  driving_params, ARRAY_SIZE(driving_params));
 
 	return 0;
@@ -131,10 +131,10 @@ static int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
 			val = BIT_RATE_HBR3;
 			break;
 		}
-		regmap_write(dp_phy->regs, MTK_DP_PHY_DIG_BIT_RATE, val);
+		regmap_write(dp_phy->regmap, MTK_DP_PHY_DIG_BIT_RATE, val);
 	}
 
-	regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_PLL_CTL_1,
+	regmap_update_bits(dp_phy->regmap, MTK_DP_PHY_DIG_PLL_CTL_1,
 			   TPLL_SSC_EN, opts->dp.ssc ? TPLL_SSC_EN : 0);
 
 	return 0;
@@ -144,10 +144,10 @@ static int mtk_dp_phy_reset(struct phy *phy)
 {
 	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
 
-	regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_SW_RST,
+	regmap_update_bits(dp_phy->regmap, MTK_DP_PHY_DIG_SW_RST,
 			   DP_GLB_SW_RST_PHYD, 0);
 	usleep_range(50, 200);
-	regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_SW_RST,
+	regmap_update_bits(dp_phy->regmap, MTK_DP_PHY_DIG_SW_RST,
 			   DP_GLB_SW_RST_PHYD, 1);
 
 	return 0;
@@ -176,7 +176,7 @@ static int mtk_dp_phy_probe(struct platform_device *pdev)
 	if (!dp_phy)
 		return -ENOMEM;
 
-	dp_phy->regs = regs;
+	dp_phy->regmap = regs;
 	phy = devm_phy_create(dev, NULL, &mtk_dp_phy_dev_ops);
 	if (IS_ERR(phy))
 		return dev_err_probe(dev, PTR_ERR(phy),
-- 
2.54.0


