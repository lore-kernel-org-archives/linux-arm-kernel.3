Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069BCC88E73
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 08:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ek1po5DDxWdRUjCvs02thrBsakxljcjlsiYl3vs1ZMc=; b=33bEXB3dTcVjQOegBvb9MH9Yzm
	rXD88n40wXuXEIXIDdio2/xEMKsksaqOz/HKQWPycIxyOfbf+wGel/fBZ+TRhpP9X95Aijp0kWQcL
	2OjAX/cA6dkjYnZ+xqTu4S+tibTux6I/RY/PaJ/fjfBWkm5ZMlUJppMqY5s6Dm97zdh6pXfNGgp99
	v4OMKWJlqY2OBMWBiy0DrlypZ6DUz8xt+1nGELa/oFEgUiwPeHGDhjGRwp7PuwKYUB6YBw1SIbAVy
	N0uLZd16PpmXnVOkPWYAVAmlEsu2333o5CZhTkRjoAddvEtYivfIeWCTS5k1OcOUvrlT3C7NDRZ/n
	ZDKTiJcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ol1-00000005fL2-3VPk;
	Tue, 15 Sep 2026 08:43:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ok8-00000005ePL-1Fpt;
	Tue, 15 Sep 2026 08:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ek1po5DDxWdRUjCvs02thrBsakxljcjlsiYl3vs1ZMc=; b=YmsW0g+MOgmkLxHOddbEkUsEJb
	SzCJ681fiulwidu7IJNeLvU2wVax+ieMVArp6hyD01dGkYx3qnPHnAD+SzCHZhUE6FurTh2rQyH68
	47iMOwupfWzCQo/OMV9zJ//Pm8NPI6cscWMLtXmK9L/VuCO2IbttIv2kRP2j8ZWxTZn6UyZVqnzAj
	4p85aUBGYHp3JeWvvcVeLY7VzvPn8Fw0n8/zKcIOM+BhJ14pX3aOA7ImxCVUPYBtpCe9mqY0225ne
	JsVJmasxxNisIaHO7OHnEQ4dElv1PpcZQ6lKbWB+ZiXYvIqMD2XWsOId8uJBMz1FBKM7xRpS9Upfb
	gFmGlgKw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6Ok5-00000006Re9-1OyE;
	Tue, 15 Sep 2026 08:42:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789461735;
	bh=c7XddCiS6S/HY6vNB0OxftBcsBRc5rJIdwTpW043qdU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=isGC1GtjBaND7JQvauHzOhfSZKJfjXdmvRY5lPV6nWWLB/ESPiS9bRFKY21B0TFxP
	 AB0qkBFZcFi36NV7haHWVSPcg8afUfyJpKCe4f0tp2/fg4UxO1RlHfwoZtWsRlDFs6
	 ZwUzwAfp7sLfu//517KqFDaHVjj6hGQrshgbTWcXpr/wDJ8ned1KJ+7qvaEZEx5zyc
	 lEwenpKrQvHKSyIMwhiwP+EZOgl1C7vojZJL3EkJpHYOCSxszqVfktRCE33SY7EJfR
	 0kSCMWXWVQwo1jg6FsIKHYCTGsovKZnFIF5rOpz3Jip/2NXEg6Jc3uzuCZrA1wUFqM
	 vEU8oJBqmtDCw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F318B17E0FE2;
	Tue, 15 Sep 2026 10:42:13 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v8 10/13] drm/mediatek: mtk_dsi: Add support for MT8196
Date: Tue, 15 Sep 2026 10:41:45 +0200
Message-ID: <20260915084148.11385-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915084148.11385-1-angelogioacchino.delregno@collabora.com>
References: <20260915084148.11385-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_094217_630807_54BBF2AE 
X-CRM114-Status: GOOD (  12.10  )
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

Add support for the new DSI IP found in the Kompanio Ultra MT8196
SoC and its Dimensity and Genio variants.

Differently from the older DSI IPs, the one from MT8196 requires
the initialization of all of the QoS parameters and can make use
of a DSI SRAM reserved buffer (present also on older SoCs but not
mandatory on those).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c |  2 +
 drivers/gpu/drm/mediatek/mtk_dsi.c     | 67 ++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 08f6be311dd1..aec8da072a41 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -828,6 +828,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DSI },
 	{ .compatible = "mediatek,mt8189-dsi",
 	  .data = (void *)MTK_DSI },
+	{ .compatible = "mediatek,mt8196-dsi",
+	  .data = (void *)MTK_DSI },
 	{ }
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 16bf08bee38e..d930cb3c4d74 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -373,6 +373,59 @@ static const u16 mtk_dsi_regs_mt8186[DSI_ADV_REG_MAX] = {
 	[DSI_CMDQ] = 0xd00,
 };
 
+static const u16 mtk_dsi_regs_main_v2[DSI_MAIN_REG_MAX] = {
+	[DSI_START] = 0x00,
+	[DSI_INTEN] = 0x08,
+	[DSI_INTSTA] = 0x0c,
+	[DSI_CON_CTRL] = 0x30,
+	[DSI_MODE_CTRL] = 0x34,
+	[DSI_TXRX_CTRL] = 0x38,
+	[DSI_PSCTRL] = 0x3c,
+	[DSI_VSA_NL] = 0x60,
+	[DSI_VBP_NL] = 0x64,
+	[DSI_VFP_NL] = 0x68,
+	[DSI_VACT_NL] = 0x6c,
+	[DSI_SIZE_CON] = 0x2c,
+	[DSI_HSA_WC] = 0x80,
+	[DSI_HBP_WC] = 0x84,
+	[DSI_HFP_WC] = 0x88,
+	[DSI_CMDQ_SIZE] = 0x44,
+	[DSI_HSTX_CKL_WC] = 0x100,
+	[DSI_RX_DATA0] = 0xa4,
+	[DSI_RX_DATA1] = 0xa8,
+	[DSI_RX_DATA2] = 0xac,
+	[DSI_RX_DATA3] = 0xb0,
+	[DSI_RACK] = 0xb4,
+	[DSI_PHY_LCCON] = 0x1d0,
+	[DSI_PHY_LD0CON] = 0x1d4,
+	[DSI_PHY_TIMECON0] = 0x600,
+	[DSI_PHY_TIMECON1] = 0x604,
+	[DSI_PHY_TIMECON2] = 0x608,
+	[DSI_PHY_TIMECON3] = 0x60c,
+};
+
+static const u16 mtk_dsi_regs_qos_v2[DSI_QOS_REG_MAX] = {
+	[DSI_QOS_BUF_CON0] = 0x300,
+	[DSI_QOS_BUF_CON1] = 0x304,
+	[DSI_QOS_TX_BUF_RW_TIMES] = 0x310,
+	[DSI_QOS_SODI_HIGH] = 0x314,
+	[DSI_QOS_SODI_LOW] = 0x318,
+	[DSI_QOS_PREULTRA_HIGH] = 0x324,
+	[DSI_QOS_PREULTRA_LOW] = 0x328,
+	[DSI_QOS_ULTRA_HIGH] = 0x32c,
+	[DSI_QOS_ULTRA_LOW] = 0x330,
+	[DSI_QOS_URGENT_HIGH] = 0x334,
+	[DSI_QOS_URGENT_LOW] = 0x338,
+	[DSI_QOS_PREURGENT_HIGH] = 0x33c
+};
+
+static const u16 mtk_dsi_regs_mt8196[DSI_ADV_REG_MAX] = {
+	[DSI_VM_CMD_CON] = 0x110,
+	[DSI_SHADOW_DEBUG] = 0xd0,
+	[DSI_CMDQ] = 0x400,
+	[DSI_VDE] = 0x3f8,
+};
+
 static inline struct mtk_dsi *bridge_to_dsi(struct drm_bridge *b)
 {
 	return container_of(b, struct mtk_dsi, bridge);
@@ -1743,6 +1796,19 @@ static const struct mtk_dsi_driver_data mt8189_dsi_driver_data = {
 	.support_per_frame_lp = true,
 };
 
+static const struct mtk_dsi_driver_data mt8196_dsi_driver_data = {
+	.reg_main = mtk_dsi_regs_main_v2,
+	.reg_qos = mtk_dsi_regs_qos_v2,
+	.reg_adv = mtk_dsi_regs_mt8196,
+	.max_link_rate_mbps = 2000,
+	.dsi_sram_bytes = 32,
+	.pixels_per_iter = 2,
+	.num_burst_lines = 8,
+	.has_size_ctl = true,
+	.cmdq_long_packet_ctl = true,
+	.support_per_frame_lp = true,
+};
+
 static const struct of_device_id mtk_dsi_of_match[] = {
 	{ .compatible = "mediatek,mt2701-dsi", .data = &mt2701_dsi_driver_data },
 	{ .compatible = "mediatek,mt8167-dsi", .data = &mt2701_dsi_driver_data },
@@ -1751,6 +1817,7 @@ static const struct of_device_id mtk_dsi_of_match[] = {
 	{ .compatible = "mediatek,mt8186-dsi", .data = &mt8186_dsi_driver_data },
 	{ .compatible = "mediatek,mt8188-dsi", .data = &mt8188_dsi_driver_data },
 	{ .compatible = "mediatek,mt8189-dsi", .data = &mt8189_dsi_driver_data },
+	{ .compatible = "mediatek,mt8196-dsi", .data = &mt8196_dsi_driver_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_dsi_of_match);
-- 
2.55.0


