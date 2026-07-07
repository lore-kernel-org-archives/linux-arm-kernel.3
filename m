Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4330C44502
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 14:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v5OrzgsU7rIRwzsqk8aQF/0r3LIC+nCVvbvICuv5eM0=; b=bEk9sw0H0gUcFoSWwKKniylkGc
	BeG9ZR++uyzaVb2t9ZDzhBxw35spZ82OHrDh5XgOLRrBtNPk1t7Qh41aLsQcQ0XEgCTOqNzDTgdeF
	+bTNCEFdP9fpAfw+cgS/TAVXuQoiq/K+RSxENNzHQwDkfwE9r8C4JBcFJSXO2iFRrX8apBuDu7Qmd
	eil2JuIbZYEwgRywubhGNIo4SauMxm9f/AlGgh1tP1qpYMtCtIljt0PFwBb764ynu9uCPm2ogvr2T
	E1ztZyYIw53ZhNQ96Zty+DrmNi3+yU0BFiDjF8Pb44ZeqUAJYkktjButhO4ze9txrwBqx4hP8z6Im
	Abv9uqMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6eX-0000000F8tP-1ma0;
	Tue, 07 Jul 2026 14:20:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6eR-0000000F8ie-39vo;
	Tue, 07 Jul 2026 14:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=v5OrzgsU7rIRwzsqk8aQF/0r3LIC+nCVvbvICuv5eM0=; b=Ah0Riz73OEyyGAfjiY/iORrTI7
	w2xbgqYGw8wworlLyvTuOgo3A2XgHdDyBHF7di/p0uo2U0DZj4XlfDKdILYiDcIQMkR+BNIy1toCq
	Iu6Wfyq3q4Tb7ptFb5VO8XD50/QOXspRaHiOhiUKx7M8Y7RiX+aseQ1Ov3BM/6CFxzqpGPSCZE7y2
	rEV/XgQWI0pFFhpSmgfLwyWb8/c4wfPxSaAp4pWvVtL62f20ldW7PhNYQ1HviSChrAtuDUKEMSbrP
	QXZM9bPQa5982T7oMatfr0apwkwoabrYB4vrS76L/zWn0QxcAo0FrH4grSG5maN2eXmSYW0A/3VXL
	a5hIBBRA==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wh6eO-00000007XVe-2hwP;
	Tue, 07 Jul 2026 14:19:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783433990;
	bh=TqL4eWaaA0oBsoWcRTHb3KyJlw6H0KWveV++ZhZWwEk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XufPc1GxuFTH6dTwOeh91VGAIm6UKaHUqzEFgIKksq6LCFz/si9vSw8FeMlUoDffc
	 dXiwV1XnHVV07960LDcxoBdt7Q4sLTSEprKoEF42IuwX8srM5nhd+4S1vDpkxzBS2O
	 Lh6fiXdB6h/d66uq5J2S/4/6NxRTspmT4Kc8NL+rhvr0IEjlrVhUzmlBFijqr+eInb
	 3xTb4tpHrLAmJ/ahJA9DHXTUsyhdZQbTZBa6iyUVUnyWmGPcP1gKrZT+riHw2NT/uz
	 1z//CZYaIzbIZxVnErNwew6FSF8vO2RdBgrZhgAS+TuHi2hq5VjqJjHJ6FgsgVVyc4
	 CSTcUpK8D2Y7w==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2E41717E0FAC;
	Tue, 07 Jul 2026 16:19:50 +0200 (CEST)
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
Subject: [PATCH v2 11/12] phy: phy-mtk-dp: Add PHYD Lane EN register mask to SoC data
Date: Tue,  7 Jul 2026 16:19:30 +0200
Message-ID: <20260707141931.191172-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707141931.191172-1-angelogioacchino.delregno@collabora.com>
References: <20260707141931.191172-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_151952_746263_DB4835F1 
X-CRM114-Status: GOOD (  13.82  )
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

In preparation for adding support for the eDP PHY found in newer
SoCs, transfer the register mask for PHYD_TX_LN_EN to SoC specific
data.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-dp.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
index 8ac086360138..64bdfda5394f 100644
--- a/drivers/phy/mediatek/phy-mtk-dp.c
+++ b/drivers/phy/mediatek/phy-mtk-dp.c
@@ -214,6 +214,7 @@ struct mtk_dp_phya_imp_sel {
  * @regs_ana_lane:  Register (layout) offsets for ana_lan
  * @regs_dig_glb:   Register (layout) offsets for dig_glb
  * @regs_dig_lane:  Register (layout) offsets for dig_lan
+ * @mask_dig_tx_ln: Register mask for PHYD_TX_LN_EN field
  * @val_dig_bitrate:IP Version specific register values for Bit Rate setting
  * @ana_bias_r:     Internal resistance "R" Selection Settings (global)
  * @ana_cktx_imp:   TX Clock Impedance Selection Settings (global)
@@ -233,6 +234,9 @@ struct mtk_dp_phy_pdata {
 	const u8 *regs_dig_glb;
 	const u8 *regs_dig_lane;
 
+	/* Register masks */
+	u32 mask_dig_tx_ln;
+
 	/* IP-Version specific register value arrays */
 	const u8 *val_dig_bitrate;
 
@@ -371,10 +375,10 @@ static int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
 
 		val = 0;
 		for (i = 0; i < opts->dp.lanes; i++)
-			val |= FIELD_PREP(PHYD_TX_LN_EN, BIT(i));
+			val |= field_prep(pdata->mask_dig_tx_ln, BIT(i));
 
 		regmap_update_bits(dp_phy->regmap, pdata->off_dig_glb + reg_dig_tx_ctl,
-				   PHYD_TX_LN_EN, val);
+				   pdata->mask_dig_tx_ln, val);
 	}
 
 	if (opts->dp.set_voltages) {
@@ -450,7 +454,7 @@ static int mtk_dp_phy_disable_all_lanes(struct mtk_dp_phy *dp_phy)
 		return ret;
 
 	/* Get mask of currently enabled lane */
-	val = FIELD_GET(PHYD_TX_LN_EN, val);
+	val = field_get(pdata->mask_dig_tx_ln, val);
 	if (val == 0)
 		return 0;
 
@@ -461,7 +465,7 @@ static int mtk_dp_phy_disable_all_lanes(struct mtk_dp_phy *dp_phy)
 
 		ret = regmap_clear_bits(dp_phy->regmap,
 					pdata->off_dig_glb + regs[DP_PHYD_TX_CTL_0],
-					FIELD_PREP(PHYD_TX_LN_EN, BIT(lane_num)));
+					field_prep(pdata->mask_dig_tx_ln, BIT(lane_num)));
 		if (ret)
 			return ret;
 	} while (val);
@@ -761,6 +765,7 @@ static const struct mtk_dp_phy_pdata mt8195_dp_phy_data = {
 	.regs_ana_lane = mt8195_phy_ana_lane_regs,
 	.regs_dig_glb = mt8195_phy_dig_glb_regs,
 	.regs_dig_lane = mt8195_phy_dig_lane_regs,
+	.mask_dig_tx_ln = PHYD_TX_LN_EN,
 	.val_dig_bitrate = mt8195_phy_dig_bitrate_val,
 	.ana_bias_r = 15,
 	.ana_cktx_imp = 8,
-- 
2.54.0


