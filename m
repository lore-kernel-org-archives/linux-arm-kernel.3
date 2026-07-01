Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3872BC44503
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBMZmPtFwytio1LDK+ZQgzNpQzKzlJxxW5W82YI3J/s=; b=H4zR1jPFH91bvRpaGZKbgPOpIj
	/u23PNzgHhPXiZEtgCz32Si3Ase08BhU+3dlKQvlmbSEikDxn0r1T0wsyv0hD7r/7SubwQ7d1Oix8
	2Zzi3Po9wEzhnwvqPtFfBPSg0gE40NJk3E6goA0M91dUscGTRahXlmZKGN/gixFTJ6FXfbCaTi9Az
	+d3KMTq1ACW+x72V2j/Hzu7FbJ0+tBrmm0e8G7S/3ThMWTAhss+d8+jyyuPfk8dlMI+Xa2QcJUF3n
	6/SIRriGwx9Oy7q4T/GvAVt+3HJ8EaEEJQa0sxEPwv8652wIhwbu6kWOGyJdtTlmnUEdDAUqA4XOV
	+UesFlPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetvh-00000001rzC-1gdV;
	Wed, 01 Jul 2026 12:20:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetvW-00000001rQ1-0eTR;
	Wed, 01 Jul 2026 12:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mBMZmPtFwytio1LDK+ZQgzNpQzKzlJxxW5W82YI3J/s=; b=RCaroP9GJS3HLKl/6FRIWaRCsA
	4/ZGhPKsmdjGzzwAhFo6SPktfn7PMFVE+H9G+N1Ix3rq0A9irjrr52ZhgrMLnlWRUThKtAqfjVgNc
	+5uNCH3B8Cvux9xePGKhd7nATEbJ8q4HPPWjyYhBCoAgtL8lZoSUr5eRXhw+gypkXtOrZ/EKNArVT
	mZK7FHxvVm6bwCjngclGMmER2i8YshCCIkaBWlAK5JXKwzVlYBy1CLOeK859vL6WkG8tje9286RD/
	TGq4AwmOICsKzJ5hjeGxLkEfEkvpcT6nBjvPekDhgLGhuULLh4/vMyDnGiM8LkQgZFcMpEE/wuNYu
	jOS1WkKQ==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetvP-00000006aXH-1TFr;
	Wed, 01 Jul 2026 12:20:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908415;
	bh=bRMKMGSLcucjrOoiYuWObf4Zp9x+zEQ+vrSfpZkz6bQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aOIecFkZxG6Y53vyVc3B5TPA0fYPr7qM+F8g+ipsy0fTT8XJCtDOyrAHuplciZl1Z
	 5/7plM+JEv5SxM+0PotMgSfXZ1sOh8t4u9a/Fx9n8oqgQCDZBgxK+DePAdjdLXMYQi
	 0/GmQ4PQEWLaQbYqrStbgAYZDpFp5HBK/mFKzKslYrp5PSRcXH8YDx08riuK543mmt
	 Q4N7K9YlytVITgsT6tHexuK71Mx+oTVT1zpPmPI3TtZbDgrNLuwz+B2zYqyTQJbLk4
	 QgQDDpbxZZ8RDND4COjp6c5wkh2ho+iwjb39E8rBhiHbW+EqkW/TEqhdVoOibpyeBm
	 wgkOv6duxSx0Q==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E35F817E116D;
	Wed,  1 Jul 2026 14:20:14 +0200 (CEST)
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
Subject: [PATCH 05/12] phy: phy-mtk-dp: Implement power_on and power_off PHY callbacks
Date: Wed,  1 Jul 2026 14:20:01 +0200
Message-ID: <20260701122008.19509-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122008.19509-1-angelogioacchino.delregno@collabora.com>
References: <20260701122008.19509-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_132019_640493_07294290 
X-CRM114-Status: GOOD (  15.86  )
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

Add .power_on() and .power_off() callbacks to mtk_dp_phy_dev_ops
to be able to call those with phy_power_on() and phy_power_off()
API in the DisplayPort driver to be able to stop using all of
those hardcoded register writes in that external driver.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-dp.c | 87 +++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
index ce33f6812bae..586e72795633 100644
--- a/drivers/phy/mediatek/phy-mtk-dp.c
+++ b/drivers/phy/mediatek/phy-mtk-dp.c
@@ -20,6 +20,9 @@
 
 #define MTK_DP_PHY_MAX_LANES		4
 
+/* DP_PHYA_GLB_FORCE_CTRL_1 */
+#define CKM_CKTX0_EN_FORCE_MODE		BIT(10)
+
 /* DP_PHYD_PLL_CTL_1 */
 #define TPLL_SSC_EN			BIT(3)
 
@@ -37,6 +40,11 @@
 #  define DP_GLB_SW_RST_XTAL_CLK	BIT(2)
 #  define DP_GLB_SW_RST_MAIN_LINK	BIT(3)
 
+/* DP_PHYD_AUX_RX_CTL */
+#define PHYD_DIG_DPAUX_RX_EN		BIT(0)
+#define PHYD_DIG_XTP_GLB_CKDET_EN	BIT(1)
+#define PHYD_DIG_DPAUX_RX_DEGLITCH_EN	BIT(2)
+
 #define XTP_LN_TX_LCTXC0_SW0_PRE0_DEFAULT	BIT(4)
 #define XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT	(BIT(10) | BIT(12))
 #define XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT	GENMASK(20, 19)
@@ -83,6 +91,12 @@
 #define DRIVING_PARAM_8_DEFAULT	(XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT | \
 				 XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT)
 
+enum mtk_dp_phya_ana_glb_regidx {
+	DP_PHYA_GLB_FORCE_CTRL_0,
+	DP_PHYA_GLB_FORCE_CTRL_1,
+	DP_PHYA_GLOBAL_MAX
+};
+
 enum mtk_dp_phyd_dig_lane_regidx {
 	DP_PHYD_LAN_DRIVING_PARAM_0,
 	DP_PHYD_LAN_MAX
@@ -93,9 +107,15 @@ enum mtk_dp_phyd_dig_glb_regidx {
 	DP_PHYD_PLL_CTL_1,
 	DP_PHYD_SW_RST,
 	DP_PHYD_BIT_RATE,
+	DP_PHYD_AUX_RX_CTL,
 	DP_PHYD_GLOBAL_MAX
 };
 
+static const u8 mt8195_phy_ana_glb_regs[DP_PHYA_GLOBAL_MAX] = {
+	[DP_PHYA_GLB_FORCE_CTRL_0] = 0x30,
+	[DP_PHYA_GLB_FORCE_CTRL_1] = 0x34,
+};
+
 static const u8 mt8195_phy_dig_lane_regs[DP_PHYD_LAN_MAX] = {
 	[DP_PHYD_LAN_DRIVING_PARAM_0] = 0x2c,
 };
@@ -105,21 +125,26 @@ static const u8 mt8195_phy_dig_glb_regs[DP_PHYD_GLOBAL_MAX] = {
 	[DP_PHYD_PLL_CTL_1] = 0x14,
 	[DP_PHYD_SW_RST] = 0x38,
 	[DP_PHYD_BIT_RATE] = 0x3c,
+	[DP_PHYD_AUX_RX_CTL] = 0x40,
 };
 
 /**
  * struct mtk_dp_phy_pdata - Platform data and defaults for MediaTek DP/eDP PHY
+ * @off_ana_glb:    Base offset for dptx_phyd_sifslv_ana_glb
  * @off_dig_glb:    Base offset for dptx_phyd_sifslv_dig_glb
  * @off_dig_lane:   Base offsets for dptx_phyd_sifslv_dig_lan (for each lane)
+ * @regs_ana_glb:   Register (layout) offsets for ana_glb
  * @regs_dig_glb:   Register (layout) offsets for dig_glb
  * @regs_dig_lane:  Register (layout) offsets for dig_lan
  */
 struct mtk_dp_phy_pdata {
 	/* Register offsets */
+	u16 off_ana_glb;
 	u16 off_dig_glb;
 	u16 off_dig_lane[MTK_DP_PHY_MAX_LANES];
 
 	/* Register maps */
+	const u8 *regs_ana_glb;
 	const u8 *regs_dig_glb;
 	const u8 *regs_dig_lane;
 };
@@ -193,6 +218,17 @@ static int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
 		regmap_write(dp_phy->regmap, pdata->off_dig_glb + reg_bit_rate, val);
 	}
 
+	if (opts->dp.set_lanes) {
+		const u32 reg_dig_tx_ctl = pdata->regs_dig_glb[DP_PHYD_TX_CTL_0];
+
+		val = 0;
+		for (i = 0; i < opts->dp.lanes; i++)
+			val |= FIELD_PREP(PHYD_TX_LN_EN, i);
+
+		regmap_update_bits(dp_phy->regmap, pdata->off_dig_glb + reg_dig_tx_ctl,
+				   PHYD_TX_LN_EN, val);
+	}
+
 	regmap_update_bits(dp_phy->regmap,
 			   pdata->off_dig_glb + pdata->regs_dig_glb[DP_PHYD_PLL_CTL_1],
 			   TPLL_SSC_EN, opts->dp.ssc ? TPLL_SSC_EN : 0);
@@ -200,6 +236,53 @@ static int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
 	return 0;
 }
 
+static int mtk_dp_phy_power_on(struct phy *phy)
+{
+	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
+	const struct mtk_dp_phy_pdata *pdata = dp_phy->pdata;
+	const u8 *regs = pdata->regs_dig_glb;
+	int ret;
+
+	/* Enable AUX Channel with RX De-Glitch and input clock detection */
+	ret = regmap_write(dp_phy->regmap,
+			   pdata->off_dig_glb + regs[DP_PHYD_AUX_RX_CTL],
+			   PHYD_DIG_DPAUX_RX_EN |
+			   PHYD_DIG_XTP_GLB_CKDET_EN |
+			   PHYD_DIG_DPAUX_RX_DEGLITCH_EN);
+	if (ret)
+		return ret;
+
+	ret = regmap_clear_bits(dp_phy->regmap,
+				pdata->off_ana_glb + regs[DP_PHYA_GLB_FORCE_CTRL_1],
+				CKM_CKTX0_EN_FORCE_MODE);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int mtk_dp_phy_power_off(struct phy *phy)
+{
+	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
+	const struct mtk_dp_phy_pdata *pdata = dp_phy->pdata;
+	const u8 *regs = pdata->regs_dig_glb;
+	int ret;
+
+	ret = regmap_set_bits(dp_phy->regmap,
+				pdata->off_ana_glb + regs[DP_PHYA_GLB_FORCE_CTRL_1],
+				CKM_CKTX0_EN_FORCE_MODE);
+	if (ret)
+		return ret;
+
+	/* Disable RX */
+	ret = regmap_write(dp_phy->regmap,
+			   pdata->off_dig_glb + regs[DP_PHYD_AUX_RX_CTL], 0);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int mtk_dp_phy_reset(struct phy *phy)
 {
 	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
@@ -220,6 +303,8 @@ static int mtk_dp_phy_reset(struct phy *phy)
 
 static const struct phy_ops mtk_dp_phy_dev_ops = {
 	.init = mtk_dp_phy_init,
+	.power_on = mtk_dp_phy_power_on,
+	.power_off = mtk_dp_phy_power_off,
 	.configure = mtk_dp_phy_configure,
 	.reset = mtk_dp_phy_reset,
 	.owner = THIS_MODULE,
@@ -305,8 +390,10 @@ static int mtk_dp_phy_probe(struct platform_device *pdev)
 }
 
 static const struct mtk_dp_phy_pdata mt8195_dp_phy_data = {
+	.off_ana_glb = 0x0,
 	.off_dig_glb = 0x1000,
 	.off_dig_lane = (const u16[]) { 0x1100, 0x1200, 0x1300, 0x1400 },
+	.regs_ana_glb = mt8195_phy_ana_glb_regs,
 	.regs_dig_glb = mt8195_phy_dig_glb_regs,
 	.regs_dig_lane = mt8195_phy_dig_lane_regs,
 };
-- 
2.54.0


