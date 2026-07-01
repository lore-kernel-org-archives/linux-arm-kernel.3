Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21C7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 13:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZZNIunvezzi1hRh4HlL5d8b3sIAo8k+6zdPe3u6JKg=; b=PBNE4pM3Cp1MHou3OzsfDMHKkm
	XkhNqTT4RzalUhgGe/5zumG7eDA9HdR9WjhFcuiNiL2uWgf5k/LDoMkV9yKceGZ1zW6HF2P2yOEdi
	utt1Z9xfQ8T8RdIOjc67SkLKpWnBe/sxa6IvTIWCf6glKyE3mMhrG0cZzNYpWJMPO6s9cXBa3Gxcs
	wXQM7UJi49prVOSw5hn4mcEaOg81yFs8sWQCCD9HP27Qbsa/dF49MdjYVb/kcbf/g49vOVuFU2xSy
	P0tDukn/fAYg71krL7PyfXlsQTX5jrj17awspVXtsEgCBDmTg9OIQfn8w2xRQ4UKyohoxQXNa63ZH
	9yFU/SXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetwT-00000001uDz-2TDt;
	Wed, 01 Jul 2026 12:21:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetwA-00000001tXd-2Rqd;
	Wed, 01 Jul 2026 12:21:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZZZNIunvezzi1hRh4HlL5d8b3sIAo8k+6zdPe3u6JKg=; b=JXtA57IwJipnQBNDGpjqRazZe/
	Gbp0rIkvDPPj0g8n79LQgy6eYEhRpOMNkFScmMZxnxXERWQ+0ln7ixClbw6AgSkI01MmioQmt0p/7
	40CUUxpL8/POLi/kWnYdiGP8E5MDO2fsLu8HijKFfBb0muVwJrfdi1ymPUk9XsHF7SZtNtgX1WyRa
	9aj8YVl7NxKDlfonN/lze+BtD5OnmJxxkgXmwiONJ1Oz/M3bpEXiHiJ/XfsIuUkE3/DPH/FCUslWY
	Kk+DEk2tpBkndylQFTYakjg83sf6Uq5td8HamN5kfVLyHKmNQf55yZJIzw4LxP7F3m0kd/zTSrZjU
	lgVisFSg==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wetw7-00000002jaX-2mis;
	Wed, 01 Jul 2026 12:21:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908462;
	bh=Yl4F/qLiX1FuymwDnMa7ipHvpjWY2yM9HKkuyODQUtU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SyirWOW6u1Sce5SyCm2A3fXliMPnplIAViizuFyiiRACwzZvO1ZokfkjN2u2sDnRn
	 gA5JNEUXfiiqiy6TNStWlxAiZCMUmf+AwzZ6+2w+5OgKIa5DJ+I1xHW+5e3Pg0Jqkh
	 S88CIh+nvrqYxeGEWtn0fAnH2omit6MBy80aohLb7f9PIl9BT3HTwQYBTgR6Y532C2
	 QMkgHtEo7lz24PZXI7+0i7oogkJRRoBaB+jy/E9A4gXfzzwuB4t0dkO8eqsC+1G/7w
	 rcpkD1m4UL6seaZXvDCCkOF5PchUr0HsFE85A3cHtQC4ZpOxIoSACXwLjW+yZYT2Ab
	 ToiLWHt/owzLA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 38DF217E0CD4;
	Wed,  1 Jul 2026 14:21:01 +0200 (CEST)
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
	Paul-pl Chen <paul-pl.chen@mediatek.com>
Subject: [PATCH 01/42] drm/mediatek: Rename OVL format naming
Date: Wed,  1 Jul 2026 14:20:16 +0200
Message-ID: <20260701122057.19648-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_132103_857034_4F6D27FE 
X-CRM114-Status: GOOD (  11.32  )
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

From: Paul-pl Chen <paul-pl.chen@mediatek.com>

Rename format arrays from mt8173_formats[] to mt8173_ovl_formats[]
to explicitly indicate that these format definitions are specific
to OVL (Overlay) components.

This naming improvement is necessary because MT8196 introduces new
display components (EXDMA, BLENDER, OUTPROC) that support different
format capabilities than OVL. Without clear naming, it becomes
ambiguous which formats apply to which component type.

Examples of format differences between components:
- EXDMA supports 10-bit RGB formats that some OVL variants don't
- BLENDER has different YUV handling requirements
- Component-specific format conversion capabilities vary

The explicit naming:
- Prevents confusion when debugging format-related issues
- Makes it immediately clear which component a format array belongs to
- Improves code searchability (grep for "ovl_formats")
- Follows consistent naming convention for component-specific definitions
- Prepares for adding exdma_formats[], blender_formats[] arrays

This is a preparatory patch for MT8196 component support, which
requires clear distinction between OVL formats and EXDMA/BLENDER
formats to avoid applying incorrect format configurations.

Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 36 ++++++++++++-------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index c4b5a262fa8a..87c2b5e6d6b0 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -101,7 +101,7 @@ static inline bool is_10bit_rgb(u32 fmt)
 	return false;
 }
 
-static const u32 mt8173_formats[] = {
+static const u32 mt8173_ovl_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_BGRX8888,
@@ -115,7 +115,7 @@ static const u32 mt8173_formats[] = {
 	DRM_FORMAT_YUYV,
 };
 
-static const u32 mt8195_formats[] = {
+static const u32 mt8195_ovl_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XRGB2101010,
@@ -673,8 +673,8 @@ static const struct mtk_disp_ovl_data mt2701_ovl_driver_data = {
 	.gmc_bits = 8,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = false,
-	.formats = mt8173_formats,
-	.num_formats = ARRAY_SIZE(mt8173_formats),
+	.formats = mt8173_ovl_formats,
+	.num_formats = ARRAY_SIZE(mt8173_ovl_formats),
 };
 
 static const struct mtk_disp_ovl_data mt8167_ovl_driver_data = {
@@ -683,8 +683,8 @@ static const struct mtk_disp_ovl_data mt8167_ovl_driver_data = {
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
-	.formats = mt8173_formats,
-	.num_formats = ARRAY_SIZE(mt8173_formats),
+	.formats = mt8173_ovl_formats,
+	.num_formats = ARRAY_SIZE(mt8173_ovl_formats),
 };
 
 static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
@@ -692,8 +692,8 @@ static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
 	.gmc_bits = 8,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
-	.formats = mt8173_formats,
-	.num_formats = ARRAY_SIZE(mt8173_formats),
+	.formats = mt8173_ovl_formats,
+	.num_formats = ARRAY_SIZE(mt8173_ovl_formats),
 };
 
 static const struct mtk_disp_ovl_data mt8183_ovl_driver_data = {
@@ -701,8 +701,8 @@ static const struct mtk_disp_ovl_data mt8183_ovl_driver_data = {
 	.gmc_bits = 10,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
-	.formats = mt8173_formats,
-	.num_formats = ARRAY_SIZE(mt8173_formats),
+	.formats = mt8173_ovl_formats,
+	.num_formats = ARRAY_SIZE(mt8173_ovl_formats),
 };
 
 static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
@@ -710,8 +710,8 @@ static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
 	.gmc_bits = 10,
 	.layer_nr = 2,
 	.fmt_rgb565_is_0 = true,
-	.formats = mt8173_formats,
-	.num_formats = ARRAY_SIZE(mt8173_formats),
+	.formats = mt8173_ovl_formats,
+	.num_formats = ARRAY_SIZE(mt8173_ovl_formats),
 };
 
 static const struct mtk_disp_ovl_data mt8192_ovl_driver_data = {
@@ -723,8 +723,8 @@ static const struct mtk_disp_ovl_data mt8192_ovl_driver_data = {
 	.blend_modes = BIT(DRM_MODE_BLEND_PREMULTI) |
 		       BIT(DRM_MODE_BLEND_COVERAGE) |
 		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
-	.formats = mt8173_formats,
-	.num_formats = ARRAY_SIZE(mt8173_formats),
+	.formats = mt8173_ovl_formats,
+	.num_formats = ARRAY_SIZE(mt8173_ovl_formats),
 };
 
 static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
@@ -736,8 +736,8 @@ static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
 	.blend_modes = BIT(DRM_MODE_BLEND_PREMULTI) |
 		       BIT(DRM_MODE_BLEND_COVERAGE) |
 		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
-	.formats = mt8173_formats,
-	.num_formats = ARRAY_SIZE(mt8173_formats),
+	.formats = mt8173_ovl_formats,
+	.num_formats = ARRAY_SIZE(mt8173_ovl_formats),
 };
 
 static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
@@ -750,8 +750,8 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 	.blend_modes = BIT(DRM_MODE_BLEND_PREMULTI) |
 		       BIT(DRM_MODE_BLEND_COVERAGE) |
 		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
-	.formats = mt8195_formats,
-	.num_formats = ARRAY_SIZE(mt8195_formats),
+	.formats = mt8195_ovl_formats,
+	.num_formats = ARRAY_SIZE(mt8195_ovl_formats),
 	.supports_clrfmt_ext = true,
 };
 
-- 
2.54.0


