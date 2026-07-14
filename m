Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065C3C4450C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 11:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XssXXMFiVHZ363B06JDa2YdyuDSvYLRqPeLScJMj95E=; b=1EaNzgWxsCw8cv7tOsl8B3ek/u
	u/NrTaPqgJIrsxYKiSg0exA0eb6peYyP8IEGp5kz5Inec/ygSdGkXnQ5tavxsERU/mGW1NLGwboni
	bZMpLemTm9cFL8q/U9gSsSQKX7AnYcSoq9/SCSKPH/MBuQLGL0TjG9jvBy8AwF6Eqj4yLFg2xqoj5
	L5pIm1g/gXHONQzMSCmY6CHxdKDyl3Pa3SZDVV6/A5izsPGK6kDHJBh30D/wOC5bXC0e0hqZCpiy+
	bW1Uhg5hdJ6Mqpx73iGZ5oxVZbiRwaWsHz6lDLWQSgYElD3MBKyqBmEOtl7P6dNMyusp5TV1+UjCA
	jImjjl9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbZv-0000000BjeT-39j8;
	Tue, 14 Jul 2026 11:45:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbZF-0000000BigD-47nd;
	Tue, 14 Jul 2026 11:44:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784029492;
	bh=OmKruBuMwOuM/jqTHcrOt10988D6GNY5qNqd/zM9TCI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XQ5w0jngNb6D1U5uNMeKYsXPWUjUWjb4vJjC740GFMQ17Mw1vGctmrs4+ctsBvwXE
	 A4RECSeal47P84Z6MSxKjenDeTaRm8uYTis1kznDHkUn2wIFGv9+iy95sogiTtzFKT
	 t+xHVJ+0ca1MbafoKFkCUXfP6RWFjAp9X+Plz8lCBtfyZe8rXW0y0c2sTOzvGctI6G
	 uWBGtVzOvibucycFutQIUJ2dh9nGiuMklFTnKombycKUWR66VD0Vch1FWCOzCLCy21
	 aCDhcxFCJnHBq9HrD5yQotJUQwLskJmFyIRGR5EJ1dBudOdoZ5khNd63NnQ2S7jja+
	 HdnRUgtT/m1SQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7C21B17E010F;
	Tue, 14 Jul 2026 13:44:51 +0200 (CEST)
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
Subject: [PATCH v2 18/46] drm/mediatek: mtk_crtc: Complete documentation for struct mtk_crtc
Date: Tue, 14 Jul 2026 13:43:46 +0200
Message-ID: <20260714114414.184512-19-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_044454_338089_D934C983 
X-CRM114-Status: GOOD (  12.88  )
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
index 28c0269c3424..e74f6244606f 100644
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
+ * @num_conn_routes: Number of alternative connection routes for a pipeline
+ * @conn_routes:     Array of HW components usable as alternative connection route
+ * @hw_lock:         Display HW access mutex lock
+ * @config_updating: Tracks whether an asynchronous config update operation is in progress
+ * @config_lock:     Spinlock to protect config_updating variable
+ * @ddp_comp:        Array of HW components used in one Display Controller pipeline
  */
 struct mtk_crtc {
 	struct drm_crtc			base;
@@ -81,10 +94,8 @@ struct mtk_crtc {
 	unsigned int			num_conn_routes;
 	const struct mtk_drm_route	*conn_routes;
 
-	/* lock for display hardware access */
 	struct mutex			hw_lock;
 	bool				config_updating;
-	/* lock for config_updating to cmd buffer */
 	spinlock_t			config_lock;
 
 	struct mtk_ddp_comp		*ddp_comp[];
-- 
2.54.0


