Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A3AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0gEdB6fyhKT6bqOi6jj0VPQiul8kZaoW+VH9yBjnbg=; b=ZGOYYL/0IMkPNPPCf4DI1zYGym
	de9yEC4nKtwmot8YyTky1xv/PVaLO2Z0tuXO6im3Jja+P4+EaAWHdvuoqe5diC8JFPNq5jOHFtRqJ
	FnOm7BMf0tzaUkeYzrEOyGwQ/GZyVlRsBibgWwScoRuOF9BcUaNHz/AZIorV7BFy6dOVAGfT0B50K
	qnhQd+ErECB/Qx6q7tZPlMMFixbYmB5X91qBC5VbIPNfYbMFagPP/7MBk9mrebc/28vyVqskhxLr5
	LWTjkI+tRkhn2LwiS2MRkHXePpHYahehJzwpb2BOlD9EA/logmVI4giaSgOkZMkbGTxz9ATf2G4bn
	sZmEieMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetwr-00000001vJ1-35u1;
	Wed, 01 Jul 2026 12:21:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetwT-00000001uDF-3gCx;
	Wed, 01 Jul 2026 12:21:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=j0gEdB6fyhKT6bqOi6jj0VPQiul8kZaoW+VH9yBjnbg=; b=Dfnr1fwb+7sPH6nFUdi7VKA7N4
	3zf0Akg1gpIKEXcBHGlynmy715VP/hyqvkJmAHfrVL30U/b8qRbrUxkaYnPCHFTqwI3JXNSyCCTgC
	lo5Ebh44rSNUox5R1op3BgDit13FsnhSXGL9Cr3/iadubPnHLPMq9uFsltf8LMKFPyYzCdMp0c288
	kN2CV7j6mBOnap6xkyl0nLmwYLn5zAZx69xMUE7Rxp2XbLCoiLjU9UAJTb3Rzqxitrpb4vd5X2+WR
	tfKN50yBkXCxBTrSR+4+Jm6mTnC0vD7jXsfBXXT5Ff/hvtzuKsB0gpvkRwo8kB97G+vxm9VWFtYuM
	1Pf4P49Q==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wetwP-00000002jkd-1okh;
	Wed, 01 Jul 2026 12:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908480;
	bh=xxtYdKDQGl2oTn57SJAbcDVtVzfSRsM6ZukEjORTD2E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OpzQalm+HgtuqiTekeSmXJgtIfDjjE0YPQtJRzjQcQRc+vNeGnqU03+JFQDjg13C8
	 tfbMW0K/YBPMqBJ96OQfPoa4d27LverVbjI4c4bWQuupmC2+Hk5K3teNBMKdt+MZfe
	 d0n/G9YfLMtfmY3Fi14Uz6LsSjZyMTW3IojRwbKKmlotKUEXKjdt0FUfhcSC7bPiS1
	 ejLMTc7d0Ne1uqGn4S24aZGZLiMF1SeryQPQgqh1Hg6Jgm8f3eiLdrRShY1myKrCue
	 RZTDLgIG48GqTt1SAdsbwXztgvRf/8x6AJdudB+Cpy0ZrhJ3BErbAvVYcgJviEyJz/
	 ATEUz0vaZqiyw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3673917E0FAA;
	Wed,  1 Jul 2026 14:21:19 +0200 (CEST)
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
Subject: [PATCH 15/42] drm/mediatek: mtk_crtc: Complete documentation for struct mtk_crtc
Date: Wed,  1 Jul 2026 14:20:30 +0200
Message-ID: <20260701122057.19648-16-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_132121_730594_EED7DB18 
X-CRM114-Status: GOOD (  13.10  )
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

The mtk_crtc structure was missing many member descriptions, for
which reason, a while ago it was demoted from kerneldoc to code
comment.

Add documentation for all of the missing structure members and
promote it back to kerneldoc.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 33 +++++++++++++++++++----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 8656b56618a2..e543fae9c580 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -41,18 +41,31 @@ struct mtk_crtc_hw_layer {
 	u8 layer_stages_nr;
 };
 
-/*
+/**
  * struct mtk_crtc - MediaTek specific crtc structure.
- * @base: crtc object.
- * @enabled: records whether crtc_enable succeeded
+ * @base:            CRTC object
+ * @enabled:         Records whether crtc_enable succeeded
+ * @pending_needs_vblank: Records whether pending config operation needs a VBlank to finish
+ * @event:           VBlank event to signal upon completion of state update
  * @hwlayers:        Array of mtk_crtc_hw_layer structures, one for each overlay plane
  * @hwlayer_nr:      Number of hwlayers
- * @mmsys_dev: pointer to the mmsys device for configuration registers
- * @mutex: handle to one of the ten disp_mutex streams
- * @ddp_comp_nr: number of components in ddp_comp
- * @ddp_comp: array of pointers the mtk_ddp_comp structures used by this crtc
- *
- * TODO: Needs update: this header is missing a bunch of member descriptions.
+ * @pending_planes:  Planes pending atomic configuration operation
+ * @pending_async_planes: Planes pending asynchronous configuration operation
+ * @cmdq_client:     CMDQ Mailbox Client structure
+ * @cmdq_handle:     Handle to CMDQ Packet structure, used to send a packet
+ * @cmdq_event:      Bitmask of GCE Events that CMDQ listens to (to send packets on event)
+ * @cmdq_vblank_cnt: Number of VBlanks after which CMDQ packet sending operation times out
+ * @cb_blocking_queue: Wait queue for sending blocking command packet through CMDQ Mailbox
+ * @mmsys_dev:       Pointer to the MMSYS device for configuration registers
+ * @dma_dev:         Pointer to the DMA device (usually linked to an IOMMU)
+ * @mutex:           Pointer to the MediaTek MuteX device for HW triggers mute/unmuting
+ * @ddp_comp_nr:     Number of HW components in ddp_comp structure
+ * @ddp_comp:        Array of HW components used in one Display Controller pipeline
+ * @num_conn_routes: Number of alternative connection routes for a pipeline
+ * @conn_routes:     Array of HW components usable as alternative connection route
+ * @hw_lock:         Display HW access mutex lock
+ * @config_updating: Tracks whether an asynchronous config update operation is in progress
+ * @config_lock:     Spinlock to protect config_updating variable
  */
 struct mtk_crtc {
 	struct drm_crtc			base;
@@ -82,10 +95,8 @@ struct mtk_crtc {
 	unsigned int			num_conn_routes;
 	const struct mtk_drm_route	*conn_routes;
 
-	/* lock for display hardware access */
 	struct mutex			hw_lock;
 	bool				config_updating;
-	/* lock for config_updating to cmd buffer */
 	spinlock_t			config_lock;
 };
 
-- 
2.54.0


