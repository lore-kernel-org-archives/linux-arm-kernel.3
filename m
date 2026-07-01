Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D9BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 13:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulnU4ItQiW+x4IFQUgwhDo/KjUl2F74dtI9+YusiXsI=; b=qvPmXoyAug4GxTOpJhv72+7bUU
	cTBUCTL0Nh6PJx2hdG46cawAGb4Vbczjg+yN4ulOIVfBNM58J7MxpxQr9HGWsPYm5VCunuoszNTDX
	NujoERWHKq80Dxib0+qYlcD5jItbgRWCn+f0LHFeth6EiDgFdMZhmSCCplhMLebgxCesZbdTWIME8
	Nqr9qjNzIwKG3y/dAcdA06wn02pUfoBE09/h22Ir9e5zJr/CooCF/nwAoYApH7Lt4GlSUkXciriF6
	w0WGt/lcPXPVQGs16Fe3EpjakpxU999/UYZDiXN1pYPVgYSEAXhLYkBiwSqrWSJOjoGhOFjGCm4HV
	NI+Zgaiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetwe-00000001uhO-0P3K;
	Wed, 01 Jul 2026 12:21:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetwJ-00000001trI-2Pwi;
	Wed, 01 Jul 2026 12:21:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ulnU4ItQiW+x4IFQUgwhDo/KjUl2F74dtI9+YusiXsI=; b=jmLE3BCqp84vKUqBe8mM91czv3
	JidrC68BndnW4GS5Y4UFdKdZ4amJ6AX6V2Gz2Hk12Wc8Ktr10OEaTuI74dAbcrwcO5+RnXZBuVqjQ
	1U0x85nmtAZow7iyEjcXwFMiVqs6QcyexHKNdq2LPtXThFraea5eb/vByfZQoCqN5WC38YUL1Ic35
	oN80KigzOGkYqm8K9LzkD4purw7EpWuQPbmM3Ms1L616EbivKzxlpBBHUGuQPTIDvNs/hxcKrPgjn
	tlrf4Xcu6NXZrtvjifWLwZJejv/NfnNubaeBveQhRfn38MjTkDPvvLtifL12/xYTXcmZkc7ACT6gl
	RavuHKKw==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wetwC-00000002jd6-0dxZ;
	Wed, 01 Jul 2026 12:21:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908466;
	bh=gcCOGWCtiQjkn/Cjq5l9iNxePEf+xSdyXx0qiipj9bo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ocJoGaIMy03Ch2z8HPk0z8wYBTim3UYrCopjIhpdc7hI7VhA9nHBdbj02AJH148ng
	 e1iKXbTZ7PyDMDA+URErghDfnxJiE1GGZeeq8yfyWaTRK4MhovW7PUEkUQ7W+jwn2Y
	 xjn4m7bBqgsuIH+fIhQ+D+3eQ7gQmcA4W5PF0iiMPCkhqCIXGepfC7aZEaAT1uXyW2
	 NMJhpsB4xR9XPOayBAfUwfX+W3WkXCuGA7RM1DOtWHBovHuwmGlvUwvn9TmuSmFw9y
	 y+m7N+lb5NzRZuFgxr38FfpgAGLYQxBLkcbrFd6BZB2KaGe4c/duMqObc95xzihMeF
	 39og/sC5ma/hA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EDDA617E0FAA;
	Wed,  1 Jul 2026 14:21:05 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	kernel@collabora.com
Subject: [PATCH 05/42] drm/mediatek: Rename all display component type to have DISP_ prefix
Date: Wed,  1 Jul 2026 14:20:20 +0200
Message-ID: <20260701122057.19648-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_132108_399346_250C6C97 
X-CRM114-Status: GOOD (  16.55  )
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

The mtk_ddp_comp_type enumeration will end up containing both the
Display Controller and Media Data Path Controller components: this
is because those can be interconnected together (as in, using MDP
components in Display Controller paths is possible!) and because
both MMSYS and MuteX are managing both of those in practically the
same way.

Rename all of the Display Controller related HW components in the
list to always have a "DISP_" prefix.
This includes components that are in the MDP Controller instead,
and the strategy here is for some of those to also have the same
DISP_ prefix, so that:
 - Display Controller specific components have a DISP_ prefix
   - Example: MTK_DISP_(NAME)
 - MDP Controller components that can be interconnected to the
   Display Controller will have both DISP_ and MDP_ prefixes
   - Example: MTK_DISP_MDP_(NAME)
 - MDP Controller components that are exclusive to MDP and can
   not be interconnected with Display Controller will only have
   an MDP_ prefix but not a DISP_ prefix
   - Example: MTK_MDP_(NAME).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 28 +++++++++----------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 36 ++++++++++++-------------
 include/linux/soc/mediatek/mtk-mmsys.h  |  6 ++---
 3 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index 94b356da6de7..a6c1815ffa39 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -423,9 +423,9 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DISP_RDMA] = "rdma",
 	[MTK_DISP_UFOE] = "ufoe",
 	[MTK_DISP_WDMA] = "wdma",
-	[MTK_DP_INTF] = "dp-intf",
-	[MTK_DPI] = "dpi",
-	[MTK_DSI] = "dsi",
+	[MTK_DISP_DP_INTF] = "dp-intf",
+	[MTK_DISP_DPI] = "dpi",
+	[MTK_DISP_DSI] = "dsi",
 };
 
 struct mtk_ddp_comp_match {
@@ -442,17 +442,17 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_DRM_ID_MAX]
 	[DDP_COMPONENT_COLOR0]		= { MTK_DISP_COLOR,		0, &ddp_color },
 	[DDP_COMPONENT_COLOR1]		= { MTK_DISP_COLOR,		1, &ddp_color },
 	[DDP_COMPONENT_DITHER0]		= { MTK_DISP_DITHER,		0, &ddp_dither },
-	[DDP_COMPONENT_DP_INTF0]	= { MTK_DP_INTF,		0, &ddp_dpi },
-	[DDP_COMPONENT_DP_INTF1]	= { MTK_DP_INTF,		1, &ddp_dpi },
-	[DDP_COMPONENT_DPI0]		= { MTK_DPI,			0, &ddp_dpi },
-	[DDP_COMPONENT_DPI1]		= { MTK_DPI,			1, &ddp_dpi },
+	[DDP_COMPONENT_DP_INTF0]	= { MTK_DISP_DP_INTF,		0, &ddp_dpi },
+	[DDP_COMPONENT_DP_INTF1]	= { MTK_DISP_DP_INTF,		1, &ddp_dpi },
+	[DDP_COMPONENT_DPI0]		= { MTK_DISP_DPI,		0, &ddp_dpi },
+	[DDP_COMPONENT_DPI1]		= { MTK_DISP_DPI,		1, &ddp_dpi },
 	[DDP_COMPONENT_DRM_OVL_ADAPTOR]	= { MTK_DISP_OVL_ADAPTOR,	0, &ddp_ovl_adaptor },
 	[DDP_COMPONENT_DSC0]		= { MTK_DISP_DSC,		0, &ddp_dsc },
 	[DDP_COMPONENT_DSC1]		= { MTK_DISP_DSC,		1, &ddp_dsc },
-	[DDP_COMPONENT_DSI0]		= { MTK_DSI,			0, &ddp_dsi },
-	[DDP_COMPONENT_DSI1]		= { MTK_DSI,			1, &ddp_dsi },
-	[DDP_COMPONENT_DSI2]		= { MTK_DSI,			2, &ddp_dsi },
-	[DDP_COMPONENT_DSI3]		= { MTK_DSI,			3, &ddp_dsi },
+	[DDP_COMPONENT_DSI0]		= { MTK_DISP_DSI,		0, &ddp_dsi },
+	[DDP_COMPONENT_DSI1]		= { MTK_DISP_DSI,		1, &ddp_dsi },
+	[DDP_COMPONENT_DSI2]		= { MTK_DISP_DSI,		2, &ddp_dsi },
+	[DDP_COMPONENT_DSI3]		= { MTK_DISP_DSI,		3, &ddp_dsi },
 	[DDP_COMPONENT_GAMMA]		= { MTK_DISP_GAMMA,		0, &ddp_gamma },
 	[DDP_COMPONENT_MERGE0]		= { MTK_DISP_MERGE,		0, &ddp_merge },
 	[DDP_COMPONENT_MERGE1]		= { MTK_DISP_MERGE,		1, &ddp_merge },
@@ -659,9 +659,9 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *node, struct mtk_d
 	    type == MTK_DISP_PWM ||
 	    type == MTK_DISP_RDMA ||
 	    type == MTK_DISP_WDMA ||
-	    type == MTK_DPI ||
-	    type == MTK_DP_INTF ||
-	    type == MTK_DSI)
+	    type == MTK_DISP_DPI ||
+	    type == MTK_DISP_DP_INTF ||
+	    type == MTK_DISP_DSI)
 		return 0;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index e54f0654f2f9..9c6dfc1e384b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -801,35 +801,35 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	{ .compatible = "mediatek,mt8173-disp-wdma",
 	  .data = (void *)MTK_DISP_WDMA },
 	{ .compatible = "mediatek,mt2701-dpi",
-	  .data = (void *)MTK_DPI },
+	  .data = (void *)MTK_DISP_DPI },
 	{ .compatible = "mediatek,mt8167-dsi",
-	  .data = (void *)MTK_DSI },
+	  .data = (void *)MTK_DISP_DSI },
 	{ .compatible = "mediatek,mt8173-dpi",
-	  .data = (void *)MTK_DPI },
+	  .data = (void *)MTK_DISP_DPI },
 	{ .compatible = "mediatek,mt8183-dpi",
-	  .data = (void *)MTK_DPI },
+	  .data = (void *)MTK_DISP_DPI },
 	{ .compatible = "mediatek,mt8186-dpi",
-	  .data = (void *)MTK_DPI },
+	  .data = (void *)MTK_DISP_DPI },
 	{ .compatible = "mediatek,mt8188-dp-intf",
-	  .data = (void *)MTK_DP_INTF },
+	  .data = (void *)MTK_DISP_DP_INTF },
 	{ .compatible = "mediatek,mt8192-dpi",
-	  .data = (void *)MTK_DPI },
+	  .data = (void *)MTK_DISP_DPI },
 	{ .compatible = "mediatek,mt8195-dp-intf",
-	  .data = (void *)MTK_DP_INTF },
+	  .data = (void *)MTK_DISP_DP_INTF },
 	{ .compatible = "mediatek,mt8195-dpi",
-	  .data = (void *)MTK_DPI },
+	  .data = (void *)MTK_DISP_DPI },
 	{ .compatible = "mediatek,mt2701-dsi",
-	  .data = (void *)MTK_DSI },
+	  .data = (void *)MTK_DISP_DSI },
 	{ .compatible = "mediatek,mt8173-dsi",
-	  .data = (void *)MTK_DSI },
+	  .data = (void *)MTK_DISP_DSI },
 	{ .compatible = "mediatek,mt8183-dsi",
-	  .data = (void *)MTK_DSI },
+	  .data = (void *)MTK_DISP_DSI },
 	{ .compatible = "mediatek,mt8186-dsi",
-	  .data = (void *)MTK_DSI },
+	  .data = (void *)MTK_DISP_DSI },
 	{ .compatible = "mediatek,mt8188-dsi",
-	  .data = (void *)MTK_DSI },
+	  .data = (void *)MTK_DISP_DSI },
 	{ .compatible = "mediatek,mt8196-dsi",
-	  .data = (void *)MTK_DSI },
+	  .data = (void *)MTK_DISP_DSI },
 	{ }
 };
 
@@ -1176,9 +1176,9 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		    comp_type == MTK_DISP_OVL_ADAPTOR ||
 		    comp_type == MTK_DISP_RDMA ||
 		    comp_type == MTK_DISP_WDMA ||
-		    comp_type == MTK_DP_INTF ||
-		    comp_type == MTK_DPI ||
-		    comp_type == MTK_DSI) {
+		    comp_type == MTK_DISP_DP_INTF ||
+		    comp_type == MTK_DISP_DPI ||
+		    comp_type == MTK_DISP_DSI) {
 			dev_info(dev, "Adding component match for %pOF\n",
 				 node);
 			drm_of_component_match_add(dev, &match, component_compare_of,
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 3ddfdeac658d..bbdd0b01927d 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -111,9 +111,9 @@ enum mtk_ddp_comp_type {
 	MTK_DISP_MDP_RDMA,
 
 	/* Keep Display outputs at the end for readability */
-	MTK_DPI,
-	MTK_DP_INTF,
-	MTK_DSI,
+	MTK_DISP_DPI,
+	MTK_DISP_DP_INTF,
+	MTK_DISP_DSI,
 
 	MTK_DDP_COMP_TYPE_MAX
 };
-- 
2.54.0


