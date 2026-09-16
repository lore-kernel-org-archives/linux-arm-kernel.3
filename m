Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B87C982CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 14:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uaVGd9oBwLQ2XRSkizdYfEhjHa41h1V3zFQm5l7Erqw=; b=RMRMEdk/SL0ToGcGNnoKfSKYZ7
	3lBI1OvaEEdh5MQegfi7gxUSpnaNv+OhRv5shxJBEVoTJPbeEveINJVigqK3u7wpx/CBsUAjGIjlt
	GXZd7EpeNimG3Y/Q6CBPRloj0yyYccPy8RFiNPVOWzPlW2A5OYDsVtIHsUIj5iz4MCoiV8HaJL+tz
	6qcDWL6jDflCZApJyvFTvr65mGt/xgqkUfCSRzRsby17TCt/WRK7Ry5m/YY7kS35D7PZUSywR2g28
	NqfuBSqbWEnPwtabkYrLi2WWJn2lnkZ1Urn9+mipmWajKJwL+8DQIVva6fuzoUYRDVf/CfctaoN9O
	mLyl5a/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qa7-00000009OTw-20Jh;
	Wed, 16 Sep 2026 14:25:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qZy-00000009OOX-2wft;
	Wed, 16 Sep 2026 14:25:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=uaVGd9oBwLQ2XRSkizdYfEhjHa41h1V3zFQm5l7Erqw=; b=dYn1W9vc3CCMPyCBSOp/eBCrHi
	T+Zv6E/hk014eUHKnaE/IHfMq3Kj1YkmII3s26drqzun9G93atVLukKF0NQvE0MlLz5cJfILMWSuA
	EZBDRUK3m7bl4GYwjS782DfpQWUgsYHgHK+yJlO/r1AiTSxspTIrY8MjLxVHbZRtchBFcCZYo8JSZ
	EpZo9Ns5+z7JPsD2K0dISz3k2O4SVVhER4hJVYzH1ETAzmNQ6sioly+dP5KPjxYl7ApzNHkp5sft+
	ngwYcXaUpdWFwdQVwdcostU+KOOonOD1qadSvmXQlWYwxutsOOV348bVSvUK8LExjyToPUTyL3UIV
	LEzkK2uQ==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6qZv-00000007yVg-3OMx;
	Wed, 16 Sep 2026 14:25:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789568737;
	bh=rffjsrzNUHUz6Ej9X9i0hw88J4ZQTjnnMh0u/4385Lo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Zc1JPrSIAsq6dDX/gzI9oesvM2y8DXXWwJuP7wtyHlNWx9ZgaD36hLyxTnwjIyXxB
	 4ETG3PUhCT/dCVuj2BC/r2T5p/1dYszIYaZVD/463hNatHRbYWbFHEUxltxVGvR4vt
	 znOY+99Ps/0GwHgzgYxGlBzs2haIEeb+TAuus/W5YPHYkglDM9fLfYuxjoR42FERq0
	 OznCfHETYE+04swM0DOiP9O4MMVZhyVNY/upSGko8605doIArdwK6j55iACfePjNty
	 cQ8ug7InZiFC/oiCHLF0hTVOUC7iaIb2+kH8AYxDeY9IbTCBTE4aQCQOLhAa8JIGmq
	 nCnoHI6c2Bc8Q==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4F4F517E0070;
	Wed, 16 Sep 2026 16:25:36 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 16 Sep 2026 10:25:29 -0400
Subject: [PATCH 4/4] media: rkvdec: Switch to tracked dma allocations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-v4l2-add-mem-tracker-v1-4-900fa45e3e6a@collabora.com>
References: <20260916-v4l2-add-mem-tracker-v1-0-900fa45e3e6a@collabora.com>
In-Reply-To: <20260916-v4l2-add-mem-tracker-v1-0-900fa45e3e6a@collabora.com>
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_152540_172001_CE7ED1FC 
X-CRM114-Status: GOOD (  14.53  )
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

Use the newly introduced v4l2_dma_alloc_attrs and v4l2_dma_free_attrs
functions to track all dma allocations and have them exposed to
userspace for easier debug.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec-h264.c   | 14 ++++++---
 .../media/platform/rockchip/rkvdec/rkvdec-hevc.c   | 14 ++++++---
 .../media/platform/rockchip/rkvdec/rkvdec-rcb.c    | 21 ++++++++------
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c | 14 ++++++---
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c | 14 ++++++---
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c | 14 ++++++---
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c | 14 ++++++---
 .../media/platform/rockchip/rkvdec/rkvdec-vp9.c    | 33 +++++++++++++++-------
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    |  4 +++
 9 files changed, 100 insertions(+), 42 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
index d3202cecb988..5b5bc091e792 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
@@ -11,6 +11,7 @@
 
 #include <media/v4l2-h264.h>
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-allocator.h>
 
 #include "rkvdec.h"
 #include "rkvdec-regs.h"
@@ -379,8 +380,11 @@ static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
 	if (!h264_ctx)
 		return -ENOMEM;
 
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
-				      &h264_ctx->priv_tbl.dma, GFP_KERNEL);
+	priv_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					sizeof(*priv_tbl),
+					&h264_ctx->priv_tbl.dma,
+					GFP_KERNEL, 0, &ctx->fh,
+					"h264-priv-tbl");
 	if (!priv_tbl) {
 		ret = -ENOMEM;
 		goto err_free_ctx;
@@ -404,8 +408,10 @@ static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, h264_ctx->priv_tbl.size,
-			  h264_ctx->priv_tbl.cpu, h264_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    h264_ctx->priv_tbl.size,
+			    h264_ctx->priv_tbl.cpu,
+			    h264_ctx->priv_tbl.dma, 0);
 	kfree(h264_ctx);
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
index ac8b825d080a..fef8bf6c7625 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
@@ -13,6 +13,7 @@
  */
 
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-allocator.h>
 
 #include "rkvdec.h"
 #include "rkvdec-regs.h"
@@ -532,8 +533,11 @@ static int rkvdec_hevc_start(struct rkvdec_ctx *ctx)
 	if (!hevc_ctx)
 		return -ENOMEM;
 
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
-				      &hevc_ctx->priv_tbl.dma, GFP_KERNEL);
+	priv_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					sizeof(*priv_tbl),
+					&hevc_ctx->priv_tbl.dma,
+					GFP_KERNEL, 0, &ctx->fh,
+					"hevc-priv-tbl");
 	if (!priv_tbl) {
 		kfree(hevc_ctx);
 		return -ENOMEM;
@@ -553,8 +557,10 @@ static void rkvdec_hevc_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, hevc_ctx->priv_tbl.size,
-			  hevc_ctx->priv_tbl.cpu, hevc_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    hevc_ctx->priv_tbl.size,
+			    hevc_ctx->priv_tbl.cpu,
+			    hevc_ctx->priv_tbl.dma, 0);
 	kfree(hevc_ctx);
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
index fdcf1f177379..1d43793720c7 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
@@ -13,6 +13,7 @@
 #include <linux/genalloc.h>
 #include <linux/sizes.h>
 #include <linux/types.h>
+#include <media/v4l2-allocator.h>
 
 struct rkvdec_rcb_config {
 	struct rkvdec_aux_buf *rcb_bufs;
@@ -65,10 +66,10 @@ void rkvdec_free_rcb(struct rkvdec_ctx *ctx)
 			gen_pool_free(dev->sram_pool, virt_addr, rcb_size);
 			break;
 		case RKVDEC_ALLOC_DMA:
-			dma_free_coherent(dev->dev,
-					  rcb_size,
-					  cfg->rcb_bufs[i].cpu,
-					  cfg->rcb_bufs[i].dma);
+			v4l2_dma_free_attrs(&dev->v4l2_dev, dev->dev,
+					    rcb_size,
+					    cfg->rcb_bufs[i].cpu,
+					    cfg->rcb_bufs[i].dma, 0);
 			break;
 		}
 	}
@@ -150,10 +151,14 @@ int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx,
 ram_fallback:
 		/* Fallback to RAM */
 		if (!cpu) {
-			cpu = dma_alloc_coherent(ctx->dev->dev,
-						 rcb_size,
-						 &dma,
-						 GFP_KERNEL);
+			char name[32];
+
+			snprintf(name, sizeof(name), "rcb-%d", i);
+			cpu = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, ctx->dev->dev,
+						   rcb_size,
+						   &dma,
+						   GFP_KERNEL, 0, &ctx->fh,
+						   name);
 			alloc_type = RKVDEC_ALLOC_DMA;
 		}
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
index b961fddc8583..b0cb6963c8e0 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
@@ -8,6 +8,7 @@
 
 #include <media/v4l2-h264.h>
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-allocator.h>
 
 #include "rkvdec.h"
 #include "rkvdec-cabac.h"
@@ -387,8 +388,11 @@ static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
 	if (!h264_ctx)
 		return -ENOMEM;
 
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
-				      &h264_ctx->priv_tbl.dma, GFP_KERNEL);
+	priv_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					sizeof(*priv_tbl),
+					&h264_ctx->priv_tbl.dma,
+					GFP_KERNEL, 0, &ctx->fh,
+					"vdpu381-h264-priv-tbl");
 	if (!priv_tbl) {
 		ret = -ENOMEM;
 		goto err_free_ctx;
@@ -412,8 +416,10 @@ static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, h264_ctx->priv_tbl.size,
-			  h264_ctx->priv_tbl.cpu, h264_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    h264_ctx->priv_tbl.size,
+			    h264_ctx->priv_tbl.cpu,
+			    h264_ctx->priv_tbl.dma, 0);
 	kfree(h264_ctx);
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
index fe6414a17551..c1e16ba6f80f 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
@@ -7,6 +7,7 @@
  */
 
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-allocator.h>
 
 #include "rkvdec.h"
 #include "rkvdec-cabac.h"
@@ -555,8 +556,11 @@ static int rkvdec_hevc_start(struct rkvdec_ctx *ctx)
 	if (!hevc_ctx)
 		return -ENOMEM;
 
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
-				      &hevc_ctx->priv_tbl.dma, GFP_KERNEL);
+	priv_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					sizeof(*priv_tbl),
+					&hevc_ctx->priv_tbl.dma,
+					GFP_KERNEL, 0, &ctx->fh,
+					"vdpu381-hevc-priv-tbl");
 	if (!priv_tbl) {
 		ret = -ENOMEM;
 		goto err_free_ctx;
@@ -580,8 +584,10 @@ static void rkvdec_hevc_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, hevc_ctx->priv_tbl.size,
-			  hevc_ctx->priv_tbl.cpu, hevc_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    hevc_ctx->priv_tbl.size,
+			    hevc_ctx->priv_tbl.cpu,
+			    hevc_ctx->priv_tbl.dma, 0);
 	kfree(hevc_ctx);
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
index fb4f849d7366..3c1d3ca7cb6f 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
@@ -8,6 +8,7 @@
 
 #include <media/v4l2-h264.h>
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-allocator.h>
 
 #include <linux/iopoll.h>
 
@@ -455,8 +456,11 @@ static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
 	if (!h264_ctx)
 		return -ENOMEM;
 
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
-				      &h264_ctx->priv_tbl.dma, GFP_KERNEL);
+	priv_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					sizeof(*priv_tbl),
+					&h264_ctx->priv_tbl.dma,
+					GFP_KERNEL, 0, &ctx->fh,
+					"vdpu383-h264-priv-tbl");
 	if (!priv_tbl) {
 		ret = -ENOMEM;
 		goto err_free_ctx;
@@ -481,8 +485,10 @@ static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, h264_ctx->priv_tbl.size,
-			  h264_ctx->priv_tbl.cpu, h264_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    h264_ctx->priv_tbl.size,
+			    h264_ctx->priv_tbl.cpu,
+			    h264_ctx->priv_tbl.dma, 0);
 	kfree(h264_ctx);
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
index 96d938ee70b0..b0ec46f482fa 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
@@ -7,6 +7,7 @@
  */
 
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-allocator.h>
 
 #include "rkvdec.h"
 #include "rkvdec-cabac.h"
@@ -563,8 +564,11 @@ static int rkvdec_hevc_start(struct rkvdec_ctx *ctx)
 	if (!hevc_ctx)
 		return -ENOMEM;
 
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
-				      &hevc_ctx->priv_tbl.dma, GFP_KERNEL);
+	priv_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					sizeof(*priv_tbl),
+					&hevc_ctx->priv_tbl.dma,
+					GFP_KERNEL, 0, &ctx->fh,
+					"vdpu383-hevc-priv-tbl");
 	if (!priv_tbl) {
 		ret = -ENOMEM;
 		goto err_free_ctx;
@@ -588,8 +592,10 @@ static void rkvdec_hevc_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, hevc_ctx->priv_tbl.size,
-			  hevc_ctx->priv_tbl.cpu, hevc_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    hevc_ctx->priv_tbl.size,
+			    hevc_ctx->priv_tbl.cpu,
+			    hevc_ctx->priv_tbl.dma, 0);
 	kfree(hevc_ctx);
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
index 2751f5396ee8..9f41f6ca82d1 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
@@ -20,6 +20,7 @@
 #include <linux/vmalloc.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/v4l2-vp9.h>
+#include <media/v4l2-allocator.h>
 
 #include "rkvdec.h"
 #include "rkvdec-regs.h"
@@ -979,8 +980,11 @@ static int rkvdec_vp9_start(struct rkvdec_ctx *ctx)
 	ctx->priv = vp9_ctx;
 
 	BUILD_BUG_ON(sizeof(priv_tbl->probs) % 16); /* ensure probs size is 128-bit aligned */
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
-				      &vp9_ctx->priv_tbl.dma, GFP_KERNEL);
+	priv_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					sizeof(*priv_tbl),
+					&vp9_ctx->priv_tbl.dma,
+					GFP_KERNEL, 0, &ctx->fh,
+					"vp9-priv-tbl");
 	if (!priv_tbl) {
 		ret = -ENOMEM;
 		goto err_free_ctx;
@@ -989,8 +993,11 @@ static int rkvdec_vp9_start(struct rkvdec_ctx *ctx)
 	vp9_ctx->priv_tbl.size = sizeof(*priv_tbl);
 	vp9_ctx->priv_tbl.cpu = priv_tbl;
 
-	count_tbl = dma_alloc_coherent(rkvdec->dev, RKVDEC_VP9_COUNT_SIZE,
-				       &vp9_ctx->count_tbl.dma, GFP_KERNEL);
+	count_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					 RKVDEC_VP9_COUNT_SIZE,
+					 &vp9_ctx->count_tbl.dma,
+					 GFP_KERNEL, 0, &ctx->fh,
+					 "vp9-count-tbl");
 	if (!count_tbl) {
 		ret = -ENOMEM;
 		goto err_free_priv_tbl;
@@ -1003,8 +1010,10 @@ static int rkvdec_vp9_start(struct rkvdec_ctx *ctx)
 	return 0;
 
 err_free_priv_tbl:
-	dma_free_coherent(rkvdec->dev, vp9_ctx->priv_tbl.size,
-			  vp9_ctx->priv_tbl.cpu, vp9_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    vp9_ctx->priv_tbl.size,
+			    vp9_ctx->priv_tbl.cpu,
+			    vp9_ctx->priv_tbl.dma, 0);
 
 err_free_ctx:
 	kfree(vp9_ctx);
@@ -1016,10 +1025,14 @@ static void rkvdec_vp9_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_vp9_ctx *vp9_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, vp9_ctx->count_tbl.size,
-			  vp9_ctx->count_tbl.cpu, vp9_ctx->count_tbl.dma);
-	dma_free_coherent(rkvdec->dev, vp9_ctx->priv_tbl.size,
-			  vp9_ctx->priv_tbl.cpu, vp9_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    vp9_ctx->count_tbl.size,
+			    vp9_ctx->count_tbl.cpu,
+			    vp9_ctx->count_tbl.dma, 0);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    vp9_ctx->priv_tbl.size,
+			    vp9_ctx->priv_tbl.cpu,
+			    vp9_ctx->priv_tbl.dma, 0);
 	kfree(vp9_ctx);
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 1d1e9bfef8e9..8770fdb5c919 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1208,6 +1208,8 @@ static int rkvdec_queue_init(void *priv,
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	src_vq->lock = &rkvdec->vdev_lock;
 	src_vq->dev = rkvdec->v4l2_dev.dev;
+	src_vq->v4l2_dev = &rkvdec->v4l2_dev;
+	src_vq->v4l2_fh = &ctx->fh;
 	src_vq->supports_requests = true;
 	src_vq->requires_requests = true;
 
@@ -1227,6 +1229,8 @@ static int rkvdec_queue_init(void *priv,
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	dst_vq->lock = &rkvdec->vdev_lock;
 	dst_vq->dev = rkvdec->v4l2_dev.dev;
+	dst_vq->v4l2_dev = &rkvdec->v4l2_dev;
+	dst_vq->v4l2_fh = &ctx->fh;
 
 	return vb2_queue_init(dst_vq);
 }

-- 
2.55.0


