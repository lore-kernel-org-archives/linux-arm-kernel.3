Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A4CC88E45
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 09:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHMQBfB5CmorHjmhOruJ1owFc0hJtwTR38zIzgW0ppQ=; b=mIc1JnigHU3MQXqsLMbyPPbuXj
	nFFOIK/qDyQSQAqjtMpK739+Gp+bSzaAAADVSLymuk7pIDBjw0kXU/2SUTBf1M/z1U48ZYMcoMva0
	ckXDrwnEY7wWe6u2Eh4gXmJXPNfdzZkv6lcNxb19qMGy+aoIrSpNm+OPl53FY16IaHzcHXwSKw2u1
	I+NEhCKsi8AELpUlTEaLgYV2Pgxh4hx8p+UvVOktbT5kgVdgVFj8wQAMKYg1f+YZ6vX6iHK7NixMP
	HfdT+dnK5p04RDTXb+4Pv4vKmVWmz9Im+o45w2fDM/SewFlzq1O8yDTW+n5gEEpzQo2I0GRXOvIoj
	DZNu1Liw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4axy-0000000Dr9b-1Dhy;
	Thu, 10 Sep 2026 09:21:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4axk-0000000Dqky-4C6e;
	Thu, 10 Sep 2026 09:20:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=eHMQBfB5CmorHjmhOruJ1owFc0hJtwTR38zIzgW0ppQ=; b=XBRBpSOyVqfVDIPlXHADYZM2FA
	YuBwJeQMR+mn1hEls1RVCXfl1Q2hOVmM1P49jPTvepwEi0jYEKV52gGGQX64+4vknIhvWreQKITUs
	OVExoZSv1frgSXi+X6GXyQPztYSjGzHuXlb///tDceWQ6zMS06sy/egH1WG0qOtvNyPi9kFg+d2O+
	477JO1IYNjYs7Wj4pX5TP+NGVUgN/Xrl4MrNQVtGkZYyZdB6xSL1HXl5tUlCwUTOwtrVGkVYUTCLY
	7UeU5lP+Z+6UtlTKYXnWDL3pEgP1I91GrkZfxLJic0udjaCtMjN/2iiXT2ErG4+IRIiQp472VgN5n
	wGAT+2gg==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4axi-00000002FkP-0h2r;
	Thu, 10 Sep 2026 09:20:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789032052;
	bh=ldi6Shky0O6c0vEROLxXRj05CZhkaRERiTZ6JwZW9KI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IHfc3naU2sTdrlLccr5+DCLCIjJoWe0kUxXNXNQjEMoLK9PD0lsRO/puVNMdMO4Li
	 RvFRmLy2MO/fxxmLdsyr03MYursnj9MsQdFhxeVPoXzsPPnopCcEVwL45ScuLkDVtV
	 OhNFjYXPfb48P35ThW4YS7KZGzcWnm/JxoIRuD7o3keHKCC0ktpJx1D3qVcw8McO6K
	 GdfMa4E5sFvUbFtmjc7rpt0Iv71jcPB6S0mC3rTP45vltbY1pl1DWqEwNTRE9FXOqh
	 gqXOUJXfLyg/dvViu2Un13X3Cm586lJFmAcITHgPQ8pQKBT0Sr9I5tUw4pKZxF5aRj
	 aE5rf0pgW2/ZQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 986C117E0D7F;
	Thu, 10 Sep 2026 11:20:51 +0200 (CEST)
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
	kernel@collabora.com
Subject: [PATCH v4 11/12] phy: phy-mtk-dp: Add PHYD Lane EN register mask to SoC data
Date: Thu, 10 Sep 2026 11:20:37 +0200
Message-ID: <20260910092038.48291-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910092038.48291-1-angelogioacchino.delregno@collabora.com>
References: <20260910092038.48291-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_102054_447065_1E171CE3 
X-CRM114-Status: GOOD (  13.19  )
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
index 643666c454f4..30f9fa6e6b9b 100644
--- a/drivers/phy/mediatek/phy-mtk-dp.c
+++ b/drivers/phy/mediatek/phy-mtk-dp.c
@@ -220,6 +220,7 @@ struct mtk_dp_phya_imp_sel {
  * @regs_ana_lane:  Register (layout) offsets for ana_lan
  * @regs_dig_glb:   Register (layout) offsets for dig_glb
  * @regs_dig_lane:  Register (layout) offsets for dig_lan
+ * @mask_dig_tx_ln: Register mask for PHYD_TX_LN_EN field
  * @val_dig_bitrate:IP Version specific register values for Bit Rate setting
  * @ana_bias_r:     Internal resistance "R" Selection Settings (global)
  * @ana_cktx_imp:   TX Clock Impedance Selection Settings (global)
@@ -239,6 +240,9 @@ struct mtk_dp_phy_pdata {
 	const u8 *regs_dig_glb;
 	const u8 *regs_dig_lane;
 
+	/* Register masks */
+	u32 mask_dig_tx_ln;
+
 	/* IP-Version specific register value arrays */
 	const u8 *val_dig_bitrate;
 
@@ -355,10 +359,10 @@ static int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
 
 		val = 0;
 		for (i = 0; i < opts->dp.lanes; i++)
-			val |= FIELD_PREP(PHYD_TX_LN_EN, BIT(i));
+			val |= field_prep(pdata->mask_dig_tx_ln, BIT(i));
 
 		regmap_update_bits(dp_phy->regmap, pdata->off_dig_glb + reg_dig_tx_ctl,
-				   PHYD_TX_LN_EN, val);
+				   pdata->mask_dig_tx_ln, val);
 	}
 
 	if (opts->dp.set_voltages) {
@@ -422,7 +426,7 @@ static int mtk_dp_phy_disable_all_lanes(struct mtk_dp_phy *dp_phy)
 
 	/* Get mask of currently enabled lane */
 	regmap_read(dp_phy->regmap, pdata->off_dig_glb + regs[DP_PHYD_TX_CTL_0], &val);
-	val = FIELD_GET(PHYD_TX_LN_EN, val);
+	val = field_get(pdata->mask_dig_tx_ln, val);
 	if (val == 0)
 		return 0;
 
@@ -433,7 +437,7 @@ static int mtk_dp_phy_disable_all_lanes(struct mtk_dp_phy *dp_phy)
 
 		regmap_clear_bits(dp_phy->regmap,
 				  pdata->off_dig_glb + regs[DP_PHYD_TX_CTL_0],
-				  FIELD_PREP(PHYD_TX_LN_EN, BIT(lane_num)));
+				  field_prep(pdata->mask_dig_tx_ln, BIT(lane_num)));
 	} while (val);
 
 	return 0;
@@ -730,6 +734,7 @@ static const struct mtk_dp_phy_pdata mt8195_dp_phy_data = {
 	.regs_ana_lane = mt8195_phy_ana_lane_regs,
 	.regs_dig_glb = mt8195_phy_dig_glb_regs,
 	.regs_dig_lane = mt8195_phy_dig_lane_regs,
+	.mask_dig_tx_ln = PHYD_TX_LN_EN,
 	.val_dig_bitrate = mt8195_phy_dig_bitrate_val,
 	.ana_bias_r = 15,
 	.ana_cktx_imp = 8,
-- 
2.55.0


