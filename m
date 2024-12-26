Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF020E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 02:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ekg/UKB4/lYLmQ4zoU6HE87Q7T/RgQ0dvlW6KUtiFAI=; b=n04bd+v5h5UjuKDk6DVKT4WecA
	DBKI/QKeWA/F0TIfvAi69HWV+mnl0qHp0wxp4MOKAol2TGoxTSkynhLgXjROnpYxtNIAySvExDPAO
	Nt13ZiP8pjCtWMpNe4qoQQg3nUQqoOb2EaLNE3R4a0J7tGrdvTcfBZQnEY//SjWfJWrWGNPkJPOfJ
	pDAcGF8DsK48jGztDJz5hPGzmshDcq/oVtP7LVf3DZ7B89L11LEGslU/YS2j5uDvz2I4mlgVnMDlz
	fO+VcgsVkacYWkqe1iLOgT2aZl50u3rglIXDzkHasIujkltz3ojtAF3pvG7JKEEmGQrkAKCl7Vw+F
	NxE9b0wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQdil-0000000Eyzt-02AT;
	Thu, 26 Dec 2024 02:35:31 +0000
Received: from mx.treblig.org ([2a00:1098:5b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQdbn-0000000ExzD-2J9v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 02:28:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=ekg/UKB4/lYLmQ4zoU6HE87Q7T/RgQ0dvlW6KUtiFAI=; b=flqOZRkBUSff6t+9
	UdbssLKyddIkHRcpOP97NpnFf0RkaSChotpTWNoMLX+xfhYxdPIwf9f8/YTTiJdfu/5ZK6cL2G20T
	ZJVB2WyBtTg0oE33aFkbdIIMio6KoDaE5flbb/xpuwOPRIeHh49GuumSIZ6kc1cZoQtchWkoyZyVg
	MJBnFVZupalsVOruJa1GbrSiXeTCzO6tW5xfelnRrJ7AColuv7MgECsgooz3XTgXU5DtckG5jm1MR
	vcF8bIaTDScAhKzmuA6DNDqMkoVUc6sw0Ab/bq/sR2/IX5tIwC9pQiheey2P3YavkWdQn6WClP8kO
	0SFl9m1wsXZQE1Kvhw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tQdbS-007F0L-2E;
	Thu, 26 Dec 2024 02:27:58 +0000
From: linux@treblig.org
To: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	deller@gmx.de,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 7/7] gpu: ipu-v3 ipu-cpmem: Remove unused functions
Date: Thu, 26 Dec 2024 02:27:52 +0000
Message-ID: <20241226022752.219399-8-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241226022752.219399-1-linux@treblig.org>
References: <20241226022752.219399-1-linux@treblig.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_182819_602218_792DF45C 
X-CRM114-Status: UNSURE (   7.18  )
X-CRM114-Notice: Please train this message.
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

ipu_cpmem_set_yuv_interleaved() was added in 2012 by
commit 0125f21b2baf ("staging: drm/imx: Add
ipu_cpmem_set_yuv_interleaved()")
but has remained unused.

ipu_cpmem_get_burstsize() was added in 2016 by
commit 03085911d7bb ("gpu: ipu-cpmem: Add ipu_cpmem_get_burstsize()")
but has remained unused.

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/ipu-v3/ipu-cpmem.c | 23 -----------------------
 include/video/imx-ipu-v3.h     |  2 --
 2 files changed, 25 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-cpmem.c b/drivers/gpu/ipu-v3/ipu-cpmem.c
index 82b244cb313e..07866b1369c6 100644
--- a/drivers/gpu/ipu-v3/ipu-cpmem.c
+++ b/drivers/gpu/ipu-v3/ipu-cpmem.c
@@ -337,12 +337,6 @@ void ipu_cpmem_set_axi_id(struct ipuv3_channel *ch, u32 id)
 }
 EXPORT_SYMBOL_GPL(ipu_cpmem_set_axi_id);
 
-int ipu_cpmem_get_burstsize(struct ipuv3_channel *ch)
-{
-	return ipu_ch_param_read_field(ch, IPU_FIELD_NPB) + 1;
-}
-EXPORT_SYMBOL_GPL(ipu_cpmem_get_burstsize);
-
 void ipu_cpmem_set_burstsize(struct ipuv3_channel *ch, int burstsize)
 {
 	ipu_ch_param_write_field(ch, IPU_FIELD_NPB, burstsize - 1);
@@ -452,23 +446,6 @@ int ipu_cpmem_set_format_passthrough(struct ipuv3_channel *ch, int width)
 }
 EXPORT_SYMBOL_GPL(ipu_cpmem_set_format_passthrough);
 
-void ipu_cpmem_set_yuv_interleaved(struct ipuv3_channel *ch, u32 pixel_format)
-{
-	switch (pixel_format) {
-	case V4L2_PIX_FMT_UYVY:
-		ipu_ch_param_write_field(ch, IPU_FIELD_BPP, 3); /* bits/pixel */
-		ipu_ch_param_write_field(ch, IPU_FIELD_PFS, 0xA);/* pix fmt */
-		ipu_ch_param_write_field(ch, IPU_FIELD_NPB, 31);/* burst size */
-		break;
-	case V4L2_PIX_FMT_YUYV:
-		ipu_ch_param_write_field(ch, IPU_FIELD_BPP, 3); /* bits/pixel */
-		ipu_ch_param_write_field(ch, IPU_FIELD_PFS, 0x8);/* pix fmt */
-		ipu_ch_param_write_field(ch, IPU_FIELD_NPB, 31);/* burst size */
-		break;
-	}
-}
-EXPORT_SYMBOL_GPL(ipu_cpmem_set_yuv_interleaved);
-
 void ipu_cpmem_set_yuv_planar_full(struct ipuv3_channel *ch,
 				   unsigned int uv_stride,
 				   unsigned int u_offset, unsigned int v_offset)
diff --git a/include/video/imx-ipu-v3.h b/include/video/imx-ipu-v3.h
index 29e142e95ba3..c89574b6f527 100644
--- a/include/video/imx-ipu-v3.h
+++ b/include/video/imx-ipu-v3.h
@@ -262,7 +262,6 @@ void ipu_cpmem_set_uv_offset(struct ipuv3_channel *ch, u32 u_off, u32 v_off);
 void ipu_cpmem_interlaced_scan(struct ipuv3_channel *ch, int stride,
 			       u32 pixelformat);
 void ipu_cpmem_set_axi_id(struct ipuv3_channel *ch, u32 id);
-int ipu_cpmem_get_burstsize(struct ipuv3_channel *ch);
 void ipu_cpmem_set_burstsize(struct ipuv3_channel *ch, int burstsize);
 void ipu_cpmem_set_block_mode(struct ipuv3_channel *ch);
 void ipu_cpmem_set_rotation(struct ipuv3_channel *ch,
@@ -270,7 +269,6 @@ void ipu_cpmem_set_rotation(struct ipuv3_channel *ch,
 int ipu_cpmem_set_format_rgb(struct ipuv3_channel *ch,
 			     const struct ipu_rgb *rgb);
 int ipu_cpmem_set_format_passthrough(struct ipuv3_channel *ch, int width);
-void ipu_cpmem_set_yuv_interleaved(struct ipuv3_channel *ch, u32 pixel_format);
 void ipu_cpmem_set_yuv_planar_full(struct ipuv3_channel *ch,
 				   unsigned int uv_stride,
 				   unsigned int u_offset,
-- 
2.47.1


