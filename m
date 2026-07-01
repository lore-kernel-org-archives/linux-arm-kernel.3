Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4488AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 15:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/Qx/qpWHMvi/DpeSBJsFwXc7Ce7ddVvjddAn9gumSY=; b=3Ga07jVyIb+VVNTb0NlFHAehIy
	XyqZ7OtTrvmy7xV/jsgJPcUESjDfZV+lJ5n0vpKWv+50q3E57HzyTIfImrMK0KRUU4W6Q0QV+dc/h
	d2qtEMewypraDqchmwpx07wiPzWujiO7tCWErS/Hs4jMGJDjUrwjwwmqSvnFzWum0FVoZ0QChXRdJ
	NS3Xp8ihrQuaiIs5CcRWPMqT6OHqG6ceMJjArWrJ8DJnMp3GUjU4CiwZQ7O9CRUUCiYk4TChnIj3Q
	PPFEwFsBwlxAj3q86phb5qzfk6nIetBrNdF/TauamTFrYdkwumTUVQjLypjB1n88vrRfWUlJ3qoKO
	wTvzUy4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetwW-00000001uJx-0Smz;
	Wed, 01 Jul 2026 12:21:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetwC-00000001tc5-0hnH;
	Wed, 01 Jul 2026 12:21:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=U/Qx/qpWHMvi/DpeSBJsFwXc7Ce7ddVvjddAn9gumSY=; b=gBx5U6FgpYh/HvrU+4zetKQpRs
	nWW6NKJ9mKOHndzQ+fRRn3VkWyA6xrybosPWQgoFABTgNp+R5Wa76qHkO+BpVCJr8J5CoVtlbF91A
	m8V7RMq3Qub0JZYvD8+9muNEbzAUJEbcxvatRcKOgukGd4slpi7+ngHrLNdJRo+TtqX6+XWoHDmmv
	9l2gWcKjR9jzPmp3FIcb+OK4gbECiM0+uKZKXegFBuP5nxMpgUkQMfNtOhixtIHKKh2AkdJJXAmJ3
	8vfl1iq+m3a+wC+CZ5KRxAaSKfxE+mHn7Tgk0ibqcBV3aPgimbrQXgBkQENVLYE9GLPNqXykLMipz
	YNMTHlkg==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wetw9-00000002jb7-0QVX;
	Wed, 01 Jul 2026 12:21:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908463;
	bh=HD/1iSvmGHveXVO6ZZ5b9JhTEEz6rt/8UtCch44K9WE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ibW0pi4xW5NhYz3Q8GlBwLxmBBI+RAjUqTf8nptKvYt0HInkE5CS/M6+84yT/5n7+
	 3tpNb+8z6ung8ee7BhB7LzktBx4XmXXsrOWDdD1eFV7f9E25QUahnnjGAQYUgkCE3C
	 uNWWJIVopJCoxKImBPY1SFlYHnT51VLcmQDbtxyaXF5ommf/zUcEzPa2BuCZAjJ7i4
	 vHskRM4RAbcU7X+18GkA00lkZXnzH1tmDneHf6WGxdjs8ONUT3/7sev6xjo7+4J6Ja
	 XAwS+DPS1kCgwcQRBxBdDuPNPcSJvt1MKCMpWa8b8ABRD0dQkQzOf4XpeXmD0wnLAz
	 FD/LExVYCCaJw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8FC8417E0CF4;
	Wed,  1 Jul 2026 14:21:02 +0200 (CEST)
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
	kernel@collabora.com,
	Nancy Lin <nancy.lin@mediatek.com>,
	Paul-pl Chen <paul-pl.chen@mediatek.com>
Subject: [PATCH 02/42] drm/mediatek: Export OVL formats definitions and format conversion API
Date: Wed,  1 Jul 2026 14:20:17 +0200
Message-ID: <20260701122057.19648-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_132105_434308_E4070C5F 
X-CRM114-Status: GOOD (  27.74  )
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

From: Nancy Lin <nancy.lin@mediatek.com>

In upcoming SoCs, the OVL component will be divided into multiple
smaller hardware units to enhance flexibility. To facilitate this
transition, the OVL format definitions and format conversion API
should be exported for reuse across these units.

Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 192 ++++++++++++++----------
 drivers/gpu/drm/mediatek/mtk_disp_ovl.h |  19 +++
 2 files changed, 132 insertions(+), 79 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl.h

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 87c2b5e6d6b0..9ded20202191 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -4,7 +4,6 @@
  */
 
 #include <drm/drm_blend.h>
-#include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 
 #include <linux/clk.h>
@@ -18,6 +17,7 @@
 #include "mtk_crtc.h"
 #include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
+#include "mtk_disp_ovl.h"
 #include "mtk_drm_drv.h"
 
 #define DISP_REG_OVL_INTEN			0x0004
@@ -62,22 +62,16 @@
 /* OVL_CON_RGB_SWAP works only if OVL_CON_CLRFMT_MAN is enabled */
 #define OVL_CON_RGB_SWAP	BIT(25)
 
-#define OVL_CON_CLRFMT_RGB	(1 << 12)
-#define OVL_CON_CLRFMT_ARGB8888	(2 << 12)
-#define OVL_CON_CLRFMT_RGBA8888	(3 << 12)
-#define OVL_CON_CLRFMT_ABGR8888	(OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP)
-#define OVL_CON_CLRFMT_BGRA8888	(OVL_CON_CLRFMT_RGBA8888 | OVL_CON_BYTE_SWAP)
-#define OVL_CON_CLRFMT_UYVY	(4 << 12)
-#define OVL_CON_CLRFMT_YUYV	(5 << 12)
-#define OVL_CON_MTX_YUV_TO_RGB	(6 << 16)
-#define OVL_CON_CLRFMT_PARGB8888 ((3 << 12) | OVL_CON_CLRFMT_MAN)
-#define OVL_CON_CLRFMT_PABGR8888 (OVL_CON_CLRFMT_PARGB8888 | OVL_CON_RGB_SWAP)
-#define OVL_CON_CLRFMT_PBGRA8888 (OVL_CON_CLRFMT_PARGB8888 | OVL_CON_BYTE_SWAP)
-#define OVL_CON_CLRFMT_PRGBA8888 (OVL_CON_CLRFMT_PABGR8888 | OVL_CON_BYTE_SWAP)
-#define OVL_CON_CLRFMT_RGB565(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \
-					0 : OVL_CON_CLRFMT_RGB)
-#define OVL_CON_CLRFMT_RGB888(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \
-					OVL_CON_CLRFMT_RGB : 0)
+#define OVL_CON_CLRFMT_SHIFT			(12)
+#define OVL_CON_CLRFMT_RGB565(shift)		(0 << (shift))
+#define OVL_CON_CLRFMT_RGB888(shift)		(1 << (shift))
+#define OVL_CON_CLRFMT_ARGB8888(shift)		(2 << (shift))
+#define OVL_CON_CLRFMT_RGBA8888(shift)		(3 << (shift))
+#define OVL_CON_CLRFMT_UYVY(shift)		(4 << (shift))
+#define OVL_CON_CLRFMT_YUYV(shift)		(5 << (shift))
+#define OVL_CON_MTX_YUV_TO_RGB			(6 << 16)
+#define OVL_CON_CLRFMT_PARGB8888(shift, man)	((3 << (shift)) | (man))
+
 #define	OVL_CON_AEN		BIT(8)
 #define	OVL_CON_ALPHA		0xff
 #define	OVL_CON_VIRT_FLIP	BIT(9)
@@ -85,21 +79,6 @@
 
 #define OVL_COLOR_ALPHA		GENMASK(31, 24)
 
-static inline bool is_10bit_rgb(u32 fmt)
-{
-	switch (fmt) {
-	case DRM_FORMAT_XRGB2101010:
-	case DRM_FORMAT_ARGB2101010:
-	case DRM_FORMAT_RGBX1010102:
-	case DRM_FORMAT_RGBA1010102:
-	case DRM_FORMAT_XBGR2101010:
-	case DRM_FORMAT_ABGR2101010:
-	case DRM_FORMAT_BGRX1010102:
-	case DRM_FORMAT_BGRA1010102:
-		return true;
-	}
-	return false;
-}
 
 static const u32 mt8173_ovl_formats[] = {
 	DRM_FORMAT_XRGB8888,
@@ -115,7 +94,9 @@ static const u32 mt8173_ovl_formats[] = {
 	DRM_FORMAT_YUYV,
 };
 
-static const u32 mt8195_ovl_formats[] = {
+static const size_t mt8173_ovl_formats_len = ARRAY_SIZE(mt8173_ovl_formats);
+
+const u32 mt8195_ovl_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XRGB2101010,
@@ -139,6 +120,8 @@ static const u32 mt8195_ovl_formats[] = {
 	DRM_FORMAT_YUYV,
 };
 
+const size_t mt8195_ovl_formats_len = ARRAY_SIZE(mt8195_ovl_formats);
+
 struct mtk_disp_ovl_data {
 	unsigned int addr;
 	unsigned int gmc_bits;
@@ -168,6 +151,22 @@ struct mtk_disp_ovl {
 	void				*vblank_cb_data;
 };
 
+bool mtk_ovl_is_10bit_rgb(unsigned int fmt)
+{
+	switch (fmt) {
+	case DRM_FORMAT_XRGB2101010:
+	case DRM_FORMAT_ARGB2101010:
+	case DRM_FORMAT_RGBX1010102:
+	case DRM_FORMAT_RGBA1010102:
+	case DRM_FORMAT_XBGR2101010:
+	case DRM_FORMAT_ABGR2101010:
+	case DRM_FORMAT_BGRX1010102:
+	case DRM_FORMAT_BGRA1010102:
+		return true;
+	}
+	return false;
+}
+
 static irqreturn_t mtk_disp_ovl_irq_handler(int irq, void *dev_id)
 {
 	struct mtk_disp_ovl *priv = dev_id;
@@ -303,7 +302,7 @@ static void mtk_ovl_set_bit_depth(struct device *dev, int idx, u32 format,
 	if (!ovl->data->supports_clrfmt_ext)
 		return;
 
-	if (is_10bit_rgb(format))
+	if (mtk_ovl_is_10bit_rgb(format))
 		bit_depth = OVL_CON_CLRFMT_10_BIT;
 
 	mtk_ddp_write_mask(cmdq_pkt, OVL_CON_CLRFMT_BIT_DEPTH(bit_depth, idx),
@@ -402,70 +401,97 @@ void mtk_ovl_layer_off(struct device *dev, unsigned int idx,
 		      DISP_REG_OVL_RDMA_CTRL(idx));
 }
 
-static unsigned int mtk_ovl_fmt_convert(struct mtk_disp_ovl *ovl,
-					struct mtk_plane_state *state)
+unsigned int mtk_ovl_fmt_convert(unsigned int fmt, unsigned int blend_mode,
+				 bool fmt_rgb565_is_0, bool color_convert,
+				 u8 clrfmt_shift, u32 clrfmt_man, u32 byte_swap, u32 rgb_swap)
 {
-	unsigned int fmt = state->pending.format;
-	unsigned int blend_mode = DRM_MODE_BLEND_COVERAGE;
-
-	/*
-	 * For the platforms where OVL_CON_CLRFMT_MAN is defined in the hardware data sheet
-	 * and supports premultiplied color formats, such as OVL_CON_CLRFMT_PARGB8888.
-	 *
-	 * Check blend_modes in the driver data to see if premultiplied mode is supported.
-	 * If not, use coverage mode instead to set it to the supported color formats.
-	 *
-	 * Current DRM assumption is that alpha is default premultiplied, so the bitmask of
-	 * blend_modes must include BIT(DRM_MODE_BLEND_PREMULTI). Otherwise, mtk_plane_init()
-	 * will get an error return from drm_plane_create_blend_mode_property() and
-	 * state->base.pixel_blend_mode should not be used.
-	 */
-	if (ovl->data->blend_modes & BIT(DRM_MODE_BLEND_PREMULTI))
-		blend_mode = state->base.pixel_blend_mode;
+	unsigned int con = 0;
+	bool need_byte_swap = false, need_rgb_swap = false;
 
 	switch (fmt) {
 	default:
 	case DRM_FORMAT_RGB565:
-		return OVL_CON_CLRFMT_RGB565(ovl);
+		con = fmt_rgb565_is_0 ?
+			OVL_CON_CLRFMT_RGB565(clrfmt_shift) : OVL_CON_CLRFMT_RGB888(clrfmt_shift);
+	break;
 	case DRM_FORMAT_BGR565:
-		return OVL_CON_CLRFMT_RGB565(ovl) | OVL_CON_BYTE_SWAP;
+		con = fmt_rgb565_is_0 ?
+			OVL_CON_CLRFMT_RGB565(clrfmt_shift) : OVL_CON_CLRFMT_RGB888(clrfmt_shift);
+		need_byte_swap = true;	/* RGB565 -> BGR565 */
+	break;
 	case DRM_FORMAT_RGB888:
-		return OVL_CON_CLRFMT_RGB888(ovl);
+		con = fmt_rgb565_is_0 ?
+			OVL_CON_CLRFMT_RGB888(clrfmt_shift) : OVL_CON_CLRFMT_RGB565(clrfmt_shift);
+	break;
 	case DRM_FORMAT_BGR888:
-		return OVL_CON_CLRFMT_RGB888(ovl) | OVL_CON_BYTE_SWAP;
+		con = fmt_rgb565_is_0 ?
+			OVL_CON_CLRFMT_RGB888(clrfmt_shift) : OVL_CON_CLRFMT_RGB565(clrfmt_shift);
+		need_byte_swap = true;	/* RGB888 -> BGR888 */
+	break;
 	case DRM_FORMAT_RGBX8888:
 	case DRM_FORMAT_RGBA8888:
 	case DRM_FORMAT_RGBX1010102:
 	case DRM_FORMAT_RGBA1010102:
-		return blend_mode == DRM_MODE_BLEND_COVERAGE ?
-		       OVL_CON_CLRFMT_RGBA8888 :
-		       OVL_CON_CLRFMT_PRGBA8888;
+		if (blend_mode == DRM_MODE_BLEND_COVERAGE) {
+			con = OVL_CON_CLRFMT_RGBA8888(clrfmt_shift);
+		} else {
+			con = OVL_CON_CLRFMT_PARGB8888(clrfmt_shift, clrfmt_man);
+			need_byte_swap = true;	/* PARGB8888 -> PBGRA8888 */
+			need_rgb_swap = true;	/* PBGRA8888 -> PRGBA8888 */
+		}
+	break;
 	case DRM_FORMAT_BGRX8888:
 	case DRM_FORMAT_BGRA8888:
 	case DRM_FORMAT_BGRX1010102:
 	case DRM_FORMAT_BGRA1010102:
-		return blend_mode == DRM_MODE_BLEND_COVERAGE ?
-		       OVL_CON_CLRFMT_BGRA8888 :
-		       OVL_CON_CLRFMT_PBGRA8888;
+		if (blend_mode == DRM_MODE_BLEND_COVERAGE) {
+			con = OVL_CON_CLRFMT_RGBA8888(clrfmt_shift);
+			need_byte_swap = true;	/* RGB8888 -> BGR8888 */
+		} else {
+			con = OVL_CON_CLRFMT_PARGB8888(clrfmt_shift, clrfmt_man);
+			need_byte_swap = true;	/* PARGB8888 -> PBGRA8888 */
+		}
+	break;
 	case DRM_FORMAT_XRGB8888:
 	case DRM_FORMAT_ARGB8888:
 	case DRM_FORMAT_XRGB2101010:
 	case DRM_FORMAT_ARGB2101010:
-		return blend_mode == DRM_MODE_BLEND_COVERAGE ?
-		       OVL_CON_CLRFMT_ARGB8888 :
-		       OVL_CON_CLRFMT_PARGB8888;
+		if (blend_mode == DRM_MODE_BLEND_COVERAGE)
+			con = OVL_CON_CLRFMT_ARGB8888(clrfmt_shift);
+		else
+			con = OVL_CON_CLRFMT_PARGB8888(clrfmt_shift, clrfmt_man);
+	break;
 	case DRM_FORMAT_XBGR8888:
 	case DRM_FORMAT_ABGR8888:
 	case DRM_FORMAT_XBGR2101010:
 	case DRM_FORMAT_ABGR2101010:
-		return blend_mode == DRM_MODE_BLEND_COVERAGE ?
-		       OVL_CON_CLRFMT_ABGR8888 :
-		       OVL_CON_CLRFMT_PABGR8888;
+		if (blend_mode == DRM_MODE_BLEND_COVERAGE) {
+			con = OVL_CON_CLRFMT_ARGB8888(clrfmt_shift);
+			need_rgb_swap = true;	/* ARGB8888 -> ABGR8888 */
+		} else {
+			con = OVL_CON_CLRFMT_PARGB8888(clrfmt_shift, clrfmt_man);
+			need_rgb_swap = true;	/* PARGB8888 -> PABGR8888 */
+		}
+	break;
 	case DRM_FORMAT_UYVY:
-		return OVL_CON_CLRFMT_UYVY | OVL_CON_MTX_YUV_TO_RGB;
+		con = OVL_CON_CLRFMT_UYVY(clrfmt_shift);
+		if (color_convert)
+			con |= OVL_CON_MTX_YUV_TO_RGB;
+	break;
 	case DRM_FORMAT_YUYV:
-		return OVL_CON_CLRFMT_YUYV | OVL_CON_MTX_YUV_TO_RGB;
+		con = OVL_CON_CLRFMT_YUYV(clrfmt_shift);
+		if (color_convert)
+			con |= OVL_CON_MTX_YUV_TO_RGB;
+	break;
 	}
+
+	if (need_byte_swap)
+		con |= byte_swap;
+
+	if (need_rgb_swap)
+		con |= rgb_swap;
+
+	return con;
 }
 
 static void mtk_ovl_afbc_layer_config(struct mtk_disp_ovl *ovl,
@@ -512,7 +538,15 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 		return;
 	}
 
-	con = mtk_ovl_fmt_convert(ovl, state);
+	if (ovl->data->blend_modes & BIT(DRM_MODE_BLEND_PREMULTI))
+		con = mtk_ovl_fmt_convert(fmt, blend_mode,
+					  ovl->data->fmt_rgb565_is_0, true, OVL_CON_CLRFMT_SHIFT,
+					  OVL_CON_CLRFMT_MAN, OVL_CON_BYTE_SWAP, OVL_CON_RGB_SWAP);
+	else
+		con = mtk_ovl_fmt_convert(fmt, DRM_MODE_BLEND_COVERAGE,
+					  ovl->data->fmt_rgb565_is_0, true, OVL_CON_CLRFMT_SHIFT,
+					  OVL_CON_CLRFMT_MAN, OVL_CON_BYTE_SWAP, OVL_CON_RGB_SWAP);
+
 	if (state->base.fb) {
 		con |= state->base.alpha & OVL_CON_ALPHA;
 
@@ -674,7 +708,7 @@ static const struct mtk_disp_ovl_data mt2701_ovl_driver_data = {
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = false,
 	.formats = mt8173_ovl_formats,
-	.num_formats = ARRAY_SIZE(mt8173_ovl_formats),
+	.num_formats = mt8173_ovl_formats_len,
 };
 
 static const struct mtk_disp_ovl_data mt8167_ovl_driver_data = {
@@ -693,7 +727,7 @@ static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
 	.formats = mt8173_ovl_formats,
-	.num_formats = ARRAY_SIZE(mt8173_ovl_formats),
+	.num_formats = mt8173_ovl_formats_len,
 };
 
 static const struct mtk_disp_ovl_data mt8183_ovl_driver_data = {
@@ -702,7 +736,7 @@ static const struct mtk_disp_ovl_data mt8183_ovl_driver_data = {
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
 	.formats = mt8173_ovl_formats,
-	.num_formats = ARRAY_SIZE(mt8173_ovl_formats),
+	.num_formats = mt8173_ovl_formats_len,
 };
 
 static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
@@ -711,7 +745,7 @@ static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
 	.layer_nr = 2,
 	.fmt_rgb565_is_0 = true,
 	.formats = mt8173_ovl_formats,
-	.num_formats = ARRAY_SIZE(mt8173_ovl_formats),
+	.num_formats = mt8173_ovl_formats_len,
 };
 
 static const struct mtk_disp_ovl_data mt8192_ovl_driver_data = {
@@ -724,7 +758,7 @@ static const struct mtk_disp_ovl_data mt8192_ovl_driver_data = {
 		       BIT(DRM_MODE_BLEND_COVERAGE) |
 		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
 	.formats = mt8173_ovl_formats,
-	.num_formats = ARRAY_SIZE(mt8173_ovl_formats),
+	.num_formats = mt8173_ovl_formats_len,
 };
 
 static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
@@ -737,7 +771,7 @@ static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
 		       BIT(DRM_MODE_BLEND_COVERAGE) |
 		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
 	.formats = mt8173_ovl_formats,
-	.num_formats = ARRAY_SIZE(mt8173_ovl_formats),
+	.num_formats = mt8173_ovl_formats_len,
 };
 
 static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
@@ -751,7 +785,7 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 		       BIT(DRM_MODE_BLEND_COVERAGE) |
 		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
 	.formats = mt8195_ovl_formats,
-	.num_formats = ARRAY_SIZE(mt8195_ovl_formats),
+	.num_formats = mt8195_ovl_formats_len,
 	.supports_clrfmt_ext = true,
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.h b/drivers/gpu/drm/mediatek/mtk_disp_ovl.h
new file mode 100644
index 000000000000..919498496bb6
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ */
+
+#ifndef __MTK_DISP_OVL_H__
+#define __MTK_DISP_OVL_H__
+
+#include <drm/drm_fourcc.h>
+
+extern const u32 mt8195_ovl_formats[];
+extern const size_t mt8195_ovl_formats_len;
+
+bool mtk_ovl_is_10bit_rgb(unsigned int fmt);
+unsigned int mtk_ovl_fmt_convert(unsigned int fmt, unsigned int blend_mode,
+				 bool fmt_rgb565_is_0, bool color_convert,
+				 u8 clrfmt_shift, u32 clrfmt_man, u32 byte_swap, u32 rgb_swap);
+
+#endif
-- 
2.54.0


