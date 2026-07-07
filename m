Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92A8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 14:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4WZPy/c3sDMh6FvNOubKwY8eXgDSBJISVtNHbO2gM08=; b=JRIJlXsbzn/IFrCY3sqEdlfLXl
	mkKCBTfJOmpcBPjeLIsZf7TnQWhRuBtv781GeSV/PmnN9G4QFq9wkUJ81RzFMexw3VtSnvZpDK0Bo
	FwBeuA4ypZOlwsYlW4rsEAEFhkUq5bHkaAFa5rsqdAzg0E/In2FjaUgGq+sVsXVs9Wz7aYGyqCVxH
	7GOA8G/sht1JmFt6IR3nwLltqgCbZ8agXU+DWPIu5nOkAv1SBR1JMRfrGV8bDiX0AKmK7cJRhpx71
	XfoHAPrvOUHzsjWHoGQ1gELFMweKkj43WlBHprWBB7D8hx/7sum4Po5skcVutV2MmHf9Glp5wp7ql
	3sf2grsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6ea-0000000F8zD-0RHt;
	Tue, 07 Jul 2026 14:20:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6eR-0000000F8id-3Di5;
	Tue, 07 Jul 2026 14:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4WZPy/c3sDMh6FvNOubKwY8eXgDSBJISVtNHbO2gM08=; b=DFPf9TYM1HRIdE37v0k7ANnIRB
	/VE+Em9qs5TIsXE83GrVKCJ2BaLIHznL+EHbB+/b7jrv/Em6AvokkHIVvuAFahI73QITCOXa/7fBQ
	YqnzKhtkouqRo8lSdqeqlQU6FlsZt2hYCGHtiNWELp71arDSdibicO4mCDxNn11a8YLH0LHc2CEoZ
	MxiIcid/fKnnDG++lq3CJVf7+NH6iAA+Ksu+5Mz5h6erU0wCUWJIQqP6SClDgCi5IQOTTKnqmK6Kx
	xbcpJ9mIcImqH24JsJ33xJK3Hs5hT/fRkhzOq3XXhV0LMUqnSGJSu3qCybnoU/Rt3xiU/pyYb4N7U
	J4m6DhSg==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wh6eO-00000007XVc-2HRR;
	Tue, 07 Jul 2026 14:19:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783433990;
	bh=1mFwOiUnJoBtpdzPigcW8ucCsQx6xBaelg4YAbDZAJw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gAYBUVS5YAHxL44NpBbw6lJESG2MwC+fA1bhwtE4X8RoSiQzZ1kNWUAOXATS7sp9z
	 ME4SsMDnDv9QWmWnDIw0z9qWhmAGEbHhygDwoMW+5rcInMHS9sOM1cRV5rF2NLS39K
	 YwAsqMOaLWllP8B8JW60RadNMXDfuDDRpYGBfro4i5rUN3wWJoSEwm+8VIlR9nZfid
	 XX8hbHDZaWOWfPBduDpCXQWPPZAZA0+0ScrvS/bsnmeUc9tDuSuaUV5sf8Eufwc3yD
	 b6G3W88qtXEurUpzvGTds6vRttS1mQOLi0VrvBzXJBHX5hBk2pdtCZ54jB6sp0sX3b
	 tn1pMR2uwkDOA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5B3BB17E0076;
	Tue, 07 Jul 2026 16:19:49 +0200 (CEST)
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
Subject: [PATCH v2 10/12] phy: phy-mtk-dp: Add bitrate register val definitions to SoC data
Date: Tue,  7 Jul 2026 16:19:29 +0200
Message-ID: <20260707141931.191172-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707141931.191172-1-angelogioacchino.delregno@collabora.com>
References: <20260707141931.191172-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_151952_700350_245662C9 
X-CRM114-Status: GOOD (  13.36  )
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
SoCs, transfer the bitrate register value definitions to SoC
specific data.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-dp.c | 36 +++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
index 9a800d6b91c3..8ac086360138 100644
--- a/drivers/phy/mediatek/phy-mtk-dp.c
+++ b/drivers/phy/mediatek/phy-mtk-dp.c
@@ -42,10 +42,6 @@
 
 /* DP_PHYD_BIT_RATE */
 #define PHYD_DIG_RG_BIT_RATE		GENMASK(1, 0)
-#  define BIT_RATE_RBR			0
-#  define BIT_RATE_HBR			1
-#  define BIT_RATE_HBR2			2
-#  define BIT_RATE_HBR3			3
 
 /* DP_PHYD_SW_RST */
 #define PHYD_DIG_GLB_SW_RST_B		GENMASK(7, 0)
@@ -157,6 +153,14 @@ enum mtk_dp_phyd_dig_glb_regidx {
 	DP_PHYD_GLOBAL_MAX
 };
 
+enum mtk_dp_phyd_bit_rate_regval {
+	DP_PHYD_BIT_RATE_RBR,
+	DP_PHYD_BIT_RATE_HBR,
+	DP_PHYD_BIT_RATE_HBR2,
+	DP_PHYD_BIT_RATE_HBR3,
+	DP_PHYD_BIT_RATE_MAX,
+};
+
 static const u8 mt8195_phy_ana_glb_regs[DP_PHYA_GLOBAL_MAX] = {
 	[DP_PHYA_GLB_BIAS_GEN_0] = 0x0,
 	[DP_PHYA_GLB_BIAS_GEN_1] = 0x4,
@@ -183,6 +187,13 @@ static const u8 mt8195_phy_dig_glb_regs[DP_PHYD_GLOBAL_MAX] = {
 	[DP_PHYD_TX_CTL_0] = 0x44,
 };
 
+static const u8 mt8195_phy_dig_bitrate_val[DP_PHYD_BIT_RATE_MAX] = {
+	[DP_PHYD_BIT_RATE_RBR] = 0,
+	[DP_PHYD_BIT_RATE_HBR] = 1,
+	[DP_PHYD_BIT_RATE_HBR2] = 2,
+	[DP_PHYD_BIT_RATE_HBR3] = 3
+};
+
 /**
  * struct mtk_dp_phya_imp_sel - Per-Lane Impedance Selection
  * @pmos: Impedance selection for P-Channel MOSFET
@@ -203,6 +214,7 @@ struct mtk_dp_phya_imp_sel {
  * @regs_ana_lane:  Register (layout) offsets for ana_lan
  * @regs_dig_glb:   Register (layout) offsets for dig_glb
  * @regs_dig_lane:  Register (layout) offsets for dig_lan
+ * @val_dig_bitrate:IP Version specific register values for Bit Rate setting
  * @ana_bias_r:     Internal resistance "R" Selection Settings (global)
  * @ana_cktx_imp:   TX Clock Impedance Selection Settings (global)
  * @ana_lanes_imp:  TX Impedance Selection Settings (for all lanes)
@@ -221,6 +233,9 @@ struct mtk_dp_phy_pdata {
 	const u8 *regs_dig_glb;
 	const u8 *regs_dig_lane;
 
+	/* IP-Version specific register value arrays */
+	const u8 *val_dig_bitrate;
+
 	/* Calibration defaults */
 	u8 ana_bias_r;
 	u8 ana_cktx_imp;
@@ -326,6 +341,7 @@ static int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
 
 	if (opts->dp.set_rate) {
 		const u32 reg_bit_rate = pdata->regs_dig_glb[DP_PHYD_BIT_RATE];
+		enum mtk_dp_phyd_bit_rate_regval regval_idx;
 
 		switch (opts->dp.link_rate) {
 		default:
@@ -334,19 +350,20 @@ static int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
 				opts->dp.link_rate);
 			return -EINVAL;
 		case 1620:
-			val = BIT_RATE_RBR;
+			regval_idx = DP_PHYD_BIT_RATE_RBR;
 			break;
 		case 2700:
-			val = BIT_RATE_HBR;
+			regval_idx = DP_PHYD_BIT_RATE_HBR;
 			break;
 		case 5400:
-			val = BIT_RATE_HBR2;
+			regval_idx = DP_PHYD_BIT_RATE_HBR2;
 			break;
 		case 8100:
-			val = BIT_RATE_HBR3;
+			regval_idx = DP_PHYD_BIT_RATE_HBR3;
 			break;
 		}
-		regmap_write(dp_phy->regmap, pdata->off_dig_glb + reg_bit_rate, val);
+		regmap_write(dp_phy->regmap, pdata->off_dig_glb + reg_bit_rate,
+			     pdata->val_dig_bitrate[regval_idx]);
 	}
 
 	if (opts->dp.set_lanes) {
@@ -744,6 +761,7 @@ static const struct mtk_dp_phy_pdata mt8195_dp_phy_data = {
 	.regs_ana_lane = mt8195_phy_ana_lane_regs,
 	.regs_dig_glb = mt8195_phy_dig_glb_regs,
 	.regs_dig_lane = mt8195_phy_dig_lane_regs,
+	.val_dig_bitrate = mt8195_phy_dig_bitrate_val,
 	.ana_bias_r = 15,
 	.ana_cktx_imp = 8,
 	.ana_lanes_imp = {
-- 
2.54.0


