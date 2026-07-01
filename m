Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8610EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQXXeoS5xx6k4JjbrCS8jo5FPpmxXXrL3xwnxNMJdIQ=; b=GWnwae724/7qw31g3Xb2ntTLel
	/J4KtMVONabknPeuHlTeAtq1mmHm3lhi3QpRTC4PtLdmoufYilEOEo84fzCKt+RzfXIJIGCiAxJQT
	XGEdMSXvu0lKd1EBKNaJG1wKZRVlSeMfwemXxm4qjnizmi8cbfRrjGo6BV1hOZEX0gihkmANBUBo+
	tq8euQiZDAa4kNXoai4kb3zgr/MZDh5m6D9ONMM34GdTzmnQCi2ZeLZ87jIB2sE1MpYNSu8ihx9U3
	Zh+mycx+xzUL0Ay0q2ZPqW5D81rBmwfvPvi3x/hgCNPeNLRr8BD3/olemzax+nbSlzWv55lt5ZeVK
	wHU4B9nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetwy-00000001vbo-07wz;
	Wed, 01 Jul 2026 12:21:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetwW-00000001uGb-0fgp;
	Wed, 01 Jul 2026 12:21:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KQXXeoS5xx6k4JjbrCS8jo5FPpmxXXrL3xwnxNMJdIQ=; b=AQ1FVK9/6c3Mx+x0N5BQSqr4st
	oEU6aDkK4uUrqhmrEOgBk3w3A9njpRy5CDe8Zstpm59p9qWR1IzI/NAiywMJ1VDUhU19MaCnRK/Tu
	PvKvJQVt2qxiaDqcxgQHKj4M/GUXEzjfRpioKH/dyUlAbAMNDvqnoYhOPdUSQZQcamYTezhKh5XZq
	khW6aHGUgeqL1bt7xMITXuxKljwPOhCed6ohLtBf31cpqs6XS1pt3lnSMkxh7gYXe4AwnPmsU3BuD
	G3fjwm+I4pHpYTFmceNToVkiyJWs+e8f7b0dnYpheLR2mwKz4rM/A/NwsNlQzKsD4AO6BPFJeJoRy
	CYczSNHg==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wetwR-00000002jmO-0OQF;
	Wed, 01 Jul 2026 12:21:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908481;
	bh=2GELx/eEx+c71RQFU/Y8sKrjihrr9+sCnaSy4Cvn9MQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RXTXFJg3xDeUXdaBx/7z+jhdyfKOPq2H4TCBf0FsU3GlXZnR/c0/6TknGdR1+Q2Xe
	 nTreSiLdfcsdQ1FimCjVKrYVsHled5FRdhcI+45duu3PL2Oq2F7nrcKO5DO/jvl/B0
	 BNjJ4DobzoYTvK63v0sHuiGk+46NOfAz83V6QFPgqPqFqhlkL8GxNrPjV6mF2YWgBc
	 9X6IvfRlwDjn+HdXB/V8Z1CQOK1yRf1IyXn0b71e3kzAJxEpuD49zkxvJK7pvUEvXn
	 y2ZLFh2lOr9OKr/W2oe28/wrZiEBm/ku0jd/UWTDXOgJm8jaOyKU4LuDuO7LzUnUtR
	 0UygAuVv0U6Xw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0C54517E15A5;
	Wed,  1 Jul 2026 14:21:21 +0200 (CEST)
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
Subject: [PATCH 17/42] drm/mediatek: mtk_crtc: Dynamically find vblank/cfg component indices
Date: Wed,  1 Jul 2026 14:20:32 +0200
Message-ID: <20260701122057.19648-18-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_132124_588303_B2D40E02 
X-CRM114-Status: GOOD (  28.26  )
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

As of now mtk_crtc assumes that, on all MediaTek SoCs, both the
vblank and configuration components are the same one, and also
that this would always be the first one in a display pipeline.

This is not true!

Or at least, it's true for the display pipelines supported by the
legacy SoCs like MT8173, and also for the ones that are currently
used in the upstream boards on more recent SoCs like MT8188/95,
but for the latter ones it just happens to be like this because
of how the boards are configured.

This is done both in preparation for adding support for complex
Display Controller pipelines like needed in MT8196 and MT8894, but
also for supporting display pipelines in MT8188/89/95 (and others
from the same generation) that are not starting with a component
that handles both vblank and layer configuration at the same time.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 56 ++++++++++++++++++++++++++---
 1 file changed, 51 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 35e78ece899a..6a1af60de469 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -61,6 +61,8 @@ struct mtk_crtc_hw_layer {
  * @mutex:           Pointer to the MediaTek MuteX device for HW triggers mute/unmuting
  * @ddp_comp_nr:     Number of HW components in ddp_comp structure
  * @ddp_comp:        Array of HW components used in one Display Controller pipeline
+ * @vblank_comp_idx: Index of HW component where to enable sending VBlanks
+ * @config_comp_idx: Index of main HW component to use for plane configuration
  * @num_conn_routes: Number of alternative connection routes for a pipeline
  * @conn_routes:     Array of HW components usable as alternative connection route
  * @hw_lock:         Display HW access mutex lock
@@ -92,6 +94,8 @@ struct mtk_crtc {
 	struct mtk_mutex		*mutex;
 	unsigned int			ddp_comp_nr;
 	struct mtk_ddp_comp		**ddp_comp;
+	s8				vblank_comp_idx;
+	s8				config_comp_idx;
 	unsigned int			num_conn_routes;
 	const struct mtk_drm_route	*conn_routes;
 
@@ -522,7 +526,7 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
 {
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_crtc_state *state = to_mtk_crtc_state(mtk_crtc->base.state);
-	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
+	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[mtk_crtc->config_comp_idx];
 	unsigned int i;
 
 	/*
@@ -692,7 +696,7 @@ static void mtk_crtc_ddp_irq(void *data)
 static int mtk_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
-	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
+	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[mtk_crtc->vblank_comp_idx];
 
 	mtk_ddp_comp_enable_vblank(comp);
 
@@ -702,7 +706,7 @@ static int mtk_crtc_enable_vblank(struct drm_crtc *crtc)
 static void mtk_crtc_disable_vblank(struct drm_crtc *crtc)
 {
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
-	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
+	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[mtk_crtc->vblank_comp_idx];
 
 	mtk_ddp_comp_disable_vblank(comp);
 }
@@ -815,7 +819,7 @@ static void mtk_crtc_atomic_enable(struct drm_crtc *crtc,
 				   struct drm_atomic_commit *state)
 {
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
-	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
+	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[mtk_crtc->config_comp_idx];
 	struct drm_device *dev = mtk_crtc->base.dev;
 	int ret;
 
@@ -843,7 +847,7 @@ static void mtk_crtc_atomic_disable(struct drm_crtc *crtc,
 				    struct drm_atomic_commit *state)
 {
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
-	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
+	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[mtk_crtc->config_comp_idx];
 	struct drm_device *dev = mtk_crtc->base.dev;
 	int i;
 
@@ -1181,6 +1185,10 @@ int mtk_crtc_create(struct drm_device *drm_dev,
 		return ret;
 	}
 
+	/* Component 0 would be valid so initialize vblank and config idx to -EINVAL */
+	mtk_crtc->vblank_comp_idx = -EINVAL;
+	mtk_crtc->config_comp_idx = -EINVAL;
+
 	for (i = 0, j = 0; i < mtk_crtc->ddp_comp_nr; i++, j++) {
 		unsigned int comp_id = output_path->comp[i].type;
 		struct mtk_ddp_comp *comp;
@@ -1203,12 +1211,50 @@ int mtk_crtc_create(struct drm_device *drm_dev,
 
 			if (comp->funcs->ctm_set)
 				has_ctm = true;
+
+			/*
+			 * Assumes that there can only be one vblank enabler per CRTC,
+			 * and that should there be more than one, the one that should
+			 * handle vblanks has to be the bottom-most HW component.
+			 */
+			if (mtk_crtc->vblank_comp_idx < 0 && comp->funcs->enable_vblank)
+				mtk_crtc->vblank_comp_idx = j;
+
+			/*
+			 * Assumes that there can only be one main configuration
+			 * component per CRTC, and that if more than one has to
+			 * be configured for at each frame, the main one would
+			 * take care of the config chain.
+			 *
+			 * As a note, such component has specific characteristics:
+			 * - It is configurable, and supports per-layer properties;
+			 * - It is a main layer component and not a layer stage;
+			 * - It is always the first one (the bottom-most) in the
+			 *   pipeline that has the characteristics explaned above.
+			 *
+			 * Such hardware is usually an OVL, RDMA or exDMA.
+			 *
+			 * This may change in the future with more complex pipelines.
+			 */
+			if (mtk_crtc->config_comp_idx < 0 && comp->funcs->config &&
+			    comp->funcs->layer_config && comp->funcs->layer_nr)
+				mtk_crtc->config_comp_idx = j;
 		}
 
 		mtk_ddp_comp_register_vblank_cb(comp, mtk_crtc_ddp_irq,
 						&mtk_crtc->base);
 	}
 
+	if (mtk_crtc->config_comp_idx < 0) {
+		dev_err(dev, "No HW component for layer configuration. Bailing out.\n");
+		return -EINVAL;
+	}
+
+	if (mtk_crtc->vblank_comp_idx < 0) {
+		dev_info(dev, "No vblank enabler component found! Expect timeouts.\n");
+		mtk_crtc->vblank_comp_idx = 0;
+	}
+
 	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
 		struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[i];
 
-- 
2.54.0


