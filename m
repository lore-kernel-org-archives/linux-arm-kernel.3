Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70653C4450C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 14:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJXlZazpHceQcJsQ9sxgswjD0zzNIDGMkWyfqqZrV4E=; b=uJU756GEv1XLcAC7BaxY9iB2S0
	XOT+b2rUjqZ1Mn8PlmU5IUV4/uBAJmgqP2lX7CQwwwHmMspz6LKcPay2It+DflHCRLB9FB89lwaU1
	nULEYY5wZLyZYmvIlWis8m5DqGvEA8chqFWsT8gf9S+c90oaqxuYZ+9vC2boXRV1bJ0uMXQooxTBl
	oSTG6GkVsmhyWFFIV4qv+J/uJqZBxHVO8SD0aHYoOyHseXZFPiEfCgFTKGGoXjIFspPEUD+lEaa99
	bMtKsX1ji/IJnqmEVUj0uXpj6J+QnEAku3oU9MZpHqGjvS7PSqavupzL4rTcUzkZrbHJlh+UrLmC8
	rdcSiagA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6eS-0000000F8mS-3Ig3;
	Tue, 07 Jul 2026 14:19:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6eQ-0000000F8iI-0gMJ;
	Tue, 07 Jul 2026 14:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZJXlZazpHceQcJsQ9sxgswjD0zzNIDGMkWyfqqZrV4E=; b=VYsd7b3iEeTNeuJUEAudZz6j7M
	PEoSZPEMVAKsBTt8FauBI17xe6qlzzPwGxga7k8qHF9Lrs1agUIJNuw3EW/CIrjMcKpdjGKqvCaai
	kHO9/k/rd9RKZoXuh3Z8dWoDQFBMofpQXssY6RLNxuM0oIRX3cNN6FStbvQMzF3mTtGOLm524vN2M
	AKy49Bm/q505RXUZYQ8HJy969aHhyVtFU7dQGVj5BIMfezt9NrKB2Xc18p24gD0C5G9/p/c/BSnlw
	i7vS7SXh/KPVo5AMwdSsG8pGQWEg/7cX/j3G63AXXfgNK+Bh4sb8QejM2SSdbc9mxe7L1r+7Moand
	KU7BgFAA==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wh6eN-00000007XTR-0tl6;
	Tue, 07 Jul 2026 14:19:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783433986;
	bh=uWvafhQZACPPgTHZaiTAeMipR1JyKuuz0oKkprEexJQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b0QGGyjtE3CtPhQiSYtFt804AFeHE7Vm4QvAl1mJzSrXafFxoNhYkvasDzxuYd2nf
	 cEyMoi4bzigSoSihVZ9Sp4xDmPyxXqlUa62r85BDDE3Iw/expAtq7SOa4EolFjW3Na
	 D69m4DtHYtKQ5XQSveMgJgRWjFzdm7CyIskuV15LfVO+tsahuuGTyRI+c6YgvsYnqm
	 83zOLSK09QLshs+FphsaMxsZWkqWbVsEed3HL1O8Flnlx6fSJO52jvz+iqI1Pb7aIX
	 lUHspqdnmZSt6IB8hn2+c3xlGPt6IxXVbCJ/NEI4u7VxtPJxN3lNy7YXJ7p/z6WSDv
	 03qvBJ9j5Cr7w==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1AD2A17E0D56;
	Tue, 07 Jul 2026 16:19:46 +0200 (CEST)
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
Subject: [PATCH v2 06/12] phy: phy-mtk-dp: Support set_lanes in configure and properly cleanup
Date: Tue,  7 Jul 2026 16:19:25 +0200
Message-ID: <20260707141931.191172-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707141931.191172-1-angelogioacchino.delregno@collabora.com>
References: <20260707141931.191172-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_151951_431282_E2722DA8 
X-CRM114-Status: GOOD (  16.66  )
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

Add support for enabling a specifically requested number of lanes
in the .configure() callback and disable all lanes in power off
and reset callbacks for proper hardware cleanup.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-dp.c | 60 +++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
index 0c3f06791613..2f3ec3fa384d 100644
--- a/drivers/phy/mediatek/phy-mtk-dp.c
+++ b/drivers/phy/mediatek/phy-mtk-dp.c
@@ -45,6 +45,9 @@
 #define PHYD_DIG_XTP_GLB_CKDET_EN	BIT(1)
 #define PHYD_DIG_DPAUX_RX_DEGLITCH_EN	BIT(2)
 
+/* DP_PHYD_TX_CTL_0 */
+#define PHYD_TX_LN_EN			GENMASK(7, 4)
+
 #define XTP_LN_TX_LCTXC0_SW0_PRE0_DEFAULT	BIT(4)
 #define XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT	(BIT(10) | BIT(12))
 #define XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT	GENMASK(20, 19)
@@ -108,6 +111,7 @@ enum mtk_dp_phyd_dig_glb_regidx {
 	DP_PHYD_SW_RST,
 	DP_PHYD_BIT_RATE,
 	DP_PHYD_AUX_RX_CTL,
+	DP_PHYD_TX_CTL_0,
 	DP_PHYD_GLOBAL_MAX
 };
 
@@ -126,6 +130,7 @@ static const u8 mt8195_phy_dig_glb_regs[DP_PHYD_GLOBAL_MAX] = {
 	[DP_PHYD_SW_RST] = 0x38,
 	[DP_PHYD_BIT_RATE] = 0x3c,
 	[DP_PHYD_AUX_RX_CTL] = 0x40,
+	[DP_PHYD_TX_CTL_0] = 0x44,
 };
 
 /**
@@ -192,6 +197,7 @@ static int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
 	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
 	const struct mtk_dp_phy_pdata *pdata = dp_phy->pdata;
 	u32 val;
+	int i;
 
 	if (opts->dp.set_rate) {
 		const u32 reg_bit_rate = pdata->regs_dig_glb[DP_PHYD_BIT_RATE];
@@ -218,6 +224,17 @@ static int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
 		regmap_write(dp_phy->regmap, pdata->off_dig_glb + reg_bit_rate, val);
 	}
 
+	if (opts->dp.set_lanes) {
+		const u32 reg_dig_tx_ctl = pdata->regs_dig_glb[DP_PHYD_TX_CTL_0];
+
+		val = 0;
+		for (i = 0; i < opts->dp.lanes; i++)
+			val |= FIELD_PREP(PHYD_TX_LN_EN, BIT(i));
+
+		regmap_update_bits(dp_phy->regmap, pdata->off_dig_glb + reg_dig_tx_ctl,
+				   PHYD_TX_LN_EN, val);
+	}
+
 	regmap_update_bits(dp_phy->regmap,
 			   pdata->off_dig_glb + pdata->regs_dig_glb[DP_PHYD_PLL_CTL_1],
 			   TPLL_SSC_EN, opts->dp.ssc ? TPLL_SSC_EN : 0);
@@ -255,6 +272,37 @@ static int mtk_dp_phy_power_on(struct phy *phy)
 	return 0;
 }
 
+static int mtk_dp_phy_disable_all_lanes(struct mtk_dp_phy *dp_phy)
+{
+	const struct mtk_dp_phy_pdata *pdata = dp_phy->pdata;
+	const u8 *regs = pdata->regs_dig_glb;
+	int ret;
+	u32 val;
+
+	ret = regmap_read(dp_phy->regmap, pdata->off_dig_glb + regs[DP_PHYD_TX_CTL_0], &val);
+	if (ret)
+		return ret;
+
+	/* Get mask of currently enabled lane */
+	val = FIELD_GET(PHYD_TX_LN_EN, val);
+	if (val == 0)
+		return 0;
+
+	/* Disable all lanes (needs to be done one by one, from last to first) */
+	do {
+		u32 lane_num = fls(val) - 1;
+		val &= ~BIT(lane_num);
+
+		ret = regmap_clear_bits(dp_phy->regmap,
+					pdata->off_dig_glb + regs[DP_PHYD_TX_CTL_0],
+					FIELD_PREP(PHYD_TX_LN_EN, BIT(lane_num)));
+		if (ret)
+			return ret;
+	} while (val);
+
+	return 0;
+}
+
 static int mtk_dp_phy_power_off(struct phy *phy)
 {
 	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
@@ -275,6 +323,12 @@ static int mtk_dp_phy_power_off(struct phy *phy)
 	if (ret)
 		return ret;
 
+	ret = mtk_dp_phy_disable_all_lanes(dp_phy);
+	if (ret) {
+		dev_err(dp_phy->dev, "Could not disable lanes for poweroff!\n");
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -283,6 +337,7 @@ static int mtk_dp_phy_reset(struct phy *phy)
 	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
 	const struct mtk_dp_phy_pdata *pdata = dp_phy->pdata;
 	const u32 reg_rst = pdata->regs_dig_glb[DP_PHYD_SW_RST];
+	int ret;
 
 	/* Clearing bits sets reset state */
 	regmap_clear_bits(dp_phy->regmap, pdata->off_dig_glb + reg_rst, DP_GLB_SW_RST_PHYD);
@@ -293,6 +348,11 @@ static int mtk_dp_phy_reset(struct phy *phy)
 	/* Setting bits means go out of reset */
 	regmap_set_bits(dp_phy->regmap, pdata->off_dig_glb + reg_rst, DP_GLB_SW_RST_PHYD);
 
+	/* Disable all lanes and continue reset even if this fails, but notify */
+	ret = mtk_dp_phy_disable_all_lanes(dp_phy);
+	if (ret)
+		dev_err(dp_phy->dev, "Could not disable lanes during reset!\n");
+
 	return 0;
 }
 
-- 
2.54.0


