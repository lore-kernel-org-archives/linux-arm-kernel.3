Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B88C88E47
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 09:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7U3kp4CtCEgOP7iLmn8sMtYhQ+Yr7npaw/r976WCEog=; b=EHNKuoevMpeOCg3aPHq0Q6YQSw
	WM0B2b9l76EaLtweA33VAbtWtuAoTB94vLfQtyT1j12EYAaKRbgJDbh0TZmwOmmSna/rvm2DdJeNB
	FmnIZw+PQfHhyBXCjLU2LYRz+m9FaHehoiLphU0cHCr/5k0OmH05RWxssyHS+1HkR8n4qL1WZ402W
	WorhInCfk3ltaIRsC8w5rVnuwkuzT4vxugVB5n3dPkVeOo6y+DwQg6ndc4AMBnsDZF5InMoxNhwx5
	eO6DG62WuYWkGidqR0NIWWGVZqhpiGZppEDKQnI938ifn+TD9uzsfSQkcH+qciY0iRYNOBPA1NyZF
	dIMMMQ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4axv-0000000Dr2n-1mvq;
	Thu, 10 Sep 2026 09:21:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4axk-0000000Dqj0-096f;
	Thu, 10 Sep 2026 09:20:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7U3kp4CtCEgOP7iLmn8sMtYhQ+Yr7npaw/r976WCEog=; b=W6dqEsu+hm6QpZAAJk1apG38b2
	D/1527N+D7K46ul7ULYYKqN6UzrsjDm+9Td29gslVkhBnNvuQl25J2tumpsPccxpScTx7ZGvFYl0f
	z11Nrv8Nm2yitrtLIWEa7q+/BtYnZcYxKuzuIM/g+qlCUPkvogINg+Xju/OHivQOHiIu4gGBlTIA0
	0nPzzzHqaxHzjGJ+ia1HBRL+kDzd9AZiuZnglDvYkaH95whQ0+dPeA/L26yQ7JmxQ07tXhX8NgpPl
	SSJHD/Wyf39ic0zPbh/hqIaA7dJ9Mg2Imsi0uUXWu2m/zwjuuw1SeViRmW/yEN9m5LmW6sv644mQQ
	XJkPMhnw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4axg-00000002Fji-3Vx3;
	Thu, 10 Sep 2026 09:20:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789032051;
	bh=CqvZJ9iwGOJsfGLwPD8vlMkeK751yceDISWCvRJVLeI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZhIVx/MeEREOsQ83/h6v0cQUuNICdxEdWN9+IHiJdsfgBHW/D0AHdrLbe9fslcLSC
	 Yq6vGOIXtmPKRG6QI8Ezf9wZuNL9A0e7GgTy/2OFNtJCqqunljfytiIh0aZYJ4z8pA
	 yaoj2ZMU60vdxiYpkE6v6FU1Ir2wLSTvMRrTMsOzLwi8KlMeRAb2Wd+8KlQAQuC5SM
	 uRafDSoKyjHAZKZ+CnIDhKnpbyy8jbn/AkYB9L05iaFChXC71vIVADmfVO4AnF5qbS
	 AqUhFVI6/AUd1dKgCYJKIodgM087cgQ1fsqY9nlelI+DWxN8d6lUrWkfCrLWoA5Qjp
	 7gXP43+A64UXw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B0A5B17E0C7E;
	Thu, 10 Sep 2026 11:20:50 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mani@kernel.org
Cc: chunfeng.yun@mediatek.com,
	vkoul@kernel.org,
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
	kernel@collabora.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v4 10/12] phy: phy-mtk-dp: Add bitrate register val definitions to SoC data
Date: Thu, 10 Sep 2026 11:20:36 +0200
Message-ID: <20260910092038.48291-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910092038.48291-1-angelogioacchino.delregno@collabora.com>
References: <20260910092038.48291-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_102053_076395_0195775B 
X-CRM114-Status: GOOD (  13.21  )
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-dp.c | 36 +++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
index 8e1fc4e16ba6..643666c454f4 100644
--- a/drivers/phy/mediatek/phy-mtk-dp.c
+++ b/drivers/phy/mediatek/phy-mtk-dp.c
@@ -44,10 +44,6 @@
 
 /* DP_PHYD_BIT_RATE */
 #define PHYD_DIG_RG_BIT_RATE		GENMASK(1, 0)
-#  define BIT_RATE_RBR			0
-#  define BIT_RATE_HBR			1
-#  define BIT_RATE_HBR2			2
-#  define BIT_RATE_HBR3			3
 
 /* DP_PHYD_SW_RST */
 #define PHYD_DIG_GLB_SW_RST_B		GENMASK(7, 0)
@@ -163,6 +159,14 @@ enum mtk_dp_phyd_dig_glb_regidx {
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
@@ -189,6 +193,13 @@ static const u8 mt8195_phy_dig_glb_regs[DP_PHYD_GLOBAL_MAX] = {
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
@@ -209,6 +220,7 @@ struct mtk_dp_phya_imp_sel {
  * @regs_ana_lane:  Register (layout) offsets for ana_lan
  * @regs_dig_glb:   Register (layout) offsets for dig_glb
  * @regs_dig_lane:  Register (layout) offsets for dig_lan
+ * @val_dig_bitrate:IP Version specific register values for Bit Rate setting
  * @ana_bias_r:     Internal resistance "R" Selection Settings (global)
  * @ana_cktx_imp:   TX Clock Impedance Selection Settings (global)
  * @ana_lanes_imp:  TX Impedance Selection Settings (for all lanes)
@@ -227,6 +239,9 @@ struct mtk_dp_phy_pdata {
 	const u8 *regs_dig_glb;
 	const u8 *regs_dig_lane;
 
+	/* IP-Version specific register value arrays */
+	const u8 *val_dig_bitrate;
+
 	/* Calibration defaults */
 	u8 ana_bias_r;
 	u8 ana_cktx_imp;
@@ -310,6 +325,7 @@ static int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
 
 	if (opts->dp.set_rate) {
 		const u32 reg_bit_rate = pdata->regs_dig_glb[DP_PHYD_BIT_RATE];
+		enum mtk_dp_phyd_bit_rate_regval regval_idx;
 
 		switch (opts->dp.link_rate) {
 		default:
@@ -318,19 +334,20 @@ static int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
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
@@ -713,6 +730,7 @@ static const struct mtk_dp_phy_pdata mt8195_dp_phy_data = {
 	.regs_ana_lane = mt8195_phy_ana_lane_regs,
 	.regs_dig_glb = mt8195_phy_dig_glb_regs,
 	.regs_dig_lane = mt8195_phy_dig_lane_regs,
+	.val_dig_bitrate = mt8195_phy_dig_bitrate_val,
 	.ana_bias_r = 15,
 	.ana_cktx_imp = 8,
 	.ana_lanes_imp = {
-- 
2.55.0


