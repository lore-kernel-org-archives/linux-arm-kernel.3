Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F43BE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 02:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8oqYD/B3UMlO69nH16a4qOpq5t9+uPPTLogH0zzGwks=; b=J3R2V/b2AUwX2ojwsbV5PqIiI1
	78rsqJef8lqbsW17ayEeOncMco88ML5odbQ0O0TFbW9YuvoAZ9rlelqmr9Kdj6rTlGpHFeAAHiISj
	YhpHoqeKyNphx+gPcjHmJ92S7VzapBObN6VSt0TrN0a1MzutkBLmyzt2QLbwXwVnYW6ck6TBWTQGT
	3LBA4w6NcRoewkfcJpeDEmpAvsD+g4DTVtf+d+z/1XIbWubaZiVVGjxICWk/THKLohIwXtacn2Xua
	+n2Q/dp6AQtTq7Yt/g4aCYPgAvKW9N2P5jkAJ9Rib/GW8zqMGFgwtgSx2bMZSt+Nx91eK4vHIdYSn
	PWN1q69Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQdju-0000000Ez6Y-04ag;
	Thu, 26 Dec 2024 02:36:42 +0000
Received: from mx.treblig.org ([2a00:1098:5b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQdbn-0000000ExzH-39BT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 02:28:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=8oqYD/B3UMlO69nH16a4qOpq5t9+uPPTLogH0zzGwks=; b=Eevo40RWUifZuus8
	s48V+jvzoplAN44z3+2xITvRxcWrZODQotuSNCN8wjQZybqro18vPFkZgTbEAYY235W6LwC57qM0D
	dpOdCBNN7PDJKRu9/yia/r984fVZljCpIJLXNEbIa71EQfRv66ll2UPeFeYN6r0XcLzuJBuEFjcAA
	Orxi5NXo7PFbANyaAqxZDDIkL70ou2H+gmTU/LBgBb6NSDiUE61Mf4r4ZqSijCM3VZLWZAHJngA5B
	8p/Lx6Sm+y23DjoDBG5Lqwcc08wY5/4H6y/CDracxO4tbiTPnV4PXOIv2htKKk8EMyo0q2EH1hoj3
	XQQRX5RXR+LOz2Lmog==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tQdbO-007F0L-17;
	Thu, 26 Dec 2024 02:27:54 +0000
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
Subject: [PATCH 1/7] gpu: ipu-v3: ipu-ic: Remove unused ipu_ic_task_graphics_init
Date: Thu, 26 Dec 2024 02:27:46 +0000
Message-ID: <20241226022752.219399-2-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241226022752.219399-1-linux@treblig.org>
References: <20241226022752.219399-1-linux@treblig.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_182819_832131_A4B332B8 
X-CRM114-Status: UNSURE (   8.74  )
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

ipu_ic_task_graphics_init() was added in 2014 by
commit 1aa8ea0d2bd5 ("gpu: ipu-v3: Add Image Converter unit")
but has been unused.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/ipu-v3/ipu-ic.c | 73 -------------------------------------
 include/video/imx-ipu-v3.h  |  4 --
 2 files changed, 77 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-ic.c b/drivers/gpu/ipu-v3/ipu-ic.c
index 846461bac70d..acd76ecc5221 100644
--- a/drivers/gpu/ipu-v3/ipu-ic.c
+++ b/drivers/gpu/ipu-v3/ipu-ic.c
@@ -321,79 +321,6 @@ void ipu_ic_task_disable(struct ipu_ic *ic)
 }
 EXPORT_SYMBOL_GPL(ipu_ic_task_disable);
 
-int ipu_ic_task_graphics_init(struct ipu_ic *ic,
-			      const struct ipu_ic_colorspace *g_in_cs,
-			      bool galpha_en, u32 galpha,
-			      bool colorkey_en, u32 colorkey)
-{
-	struct ipu_ic_priv *priv = ic->priv;
-	struct ipu_ic_csc csc2;
-	unsigned long flags;
-	u32 reg, ic_conf;
-	int ret = 0;
-
-	if (ic->task == IC_TASK_ENCODER)
-		return -EINVAL;
-
-	spin_lock_irqsave(&priv->lock, flags);
-
-	ic_conf = ipu_ic_read(ic, IC_CONF);
-
-	if (!(ic_conf & ic->bit->ic_conf_csc1_en)) {
-		struct ipu_ic_csc csc1;
-
-		ret = ipu_ic_calc_csc(&csc1,
-				      V4L2_YCBCR_ENC_601,
-				      V4L2_QUANTIZATION_FULL_RANGE,
-				      IPUV3_COLORSPACE_RGB,
-				      V4L2_YCBCR_ENC_601,
-				      V4L2_QUANTIZATION_FULL_RANGE,
-				      IPUV3_COLORSPACE_RGB);
-		if (ret)
-			goto unlock;
-
-		/* need transparent CSC1 conversion */
-		ret = init_csc(ic, &csc1, 0);
-		if (ret)
-			goto unlock;
-	}
-
-	ic->g_in_cs = *g_in_cs;
-	csc2.in_cs = ic->g_in_cs;
-	csc2.out_cs = ic->out_cs;
-
-	ret = __ipu_ic_calc_csc(&csc2);
-	if (ret)
-		goto unlock;
-
-	ret = init_csc(ic, &csc2, 1);
-	if (ret)
-		goto unlock;
-
-	if (galpha_en) {
-		ic_conf |= IC_CONF_IC_GLB_LOC_A;
-		reg = ipu_ic_read(ic, IC_CMBP_1);
-		reg &= ~(0xff << ic->bit->ic_cmb_galpha_bit);
-		reg |= (galpha << ic->bit->ic_cmb_galpha_bit);
-		ipu_ic_write(ic, reg, IC_CMBP_1);
-	} else
-		ic_conf &= ~IC_CONF_IC_GLB_LOC_A;
-
-	if (colorkey_en) {
-		ic_conf |= IC_CONF_KEY_COLOR_EN;
-		ipu_ic_write(ic, colorkey, IC_CMBP_2);
-	} else
-		ic_conf &= ~IC_CONF_KEY_COLOR_EN;
-
-	ipu_ic_write(ic, ic_conf, IC_CONF);
-
-	ic->graphics = true;
-unlock:
-	spin_unlock_irqrestore(&priv->lock, flags);
-	return ret;
-}
-EXPORT_SYMBOL_GPL(ipu_ic_task_graphics_init);
-
 int ipu_ic_task_init_rsc(struct ipu_ic *ic,
 			 const struct ipu_ic_csc *csc,
 			 int in_width, int in_height,
diff --git a/include/video/imx-ipu-v3.h b/include/video/imx-ipu-v3.h
index c422a403c099..0bb1d714cbf5 100644
--- a/include/video/imx-ipu-v3.h
+++ b/include/video/imx-ipu-v3.h
@@ -445,10 +445,6 @@ int ipu_ic_task_init_rsc(struct ipu_ic *ic,
 			 int in_width, int in_height,
 			 int out_width, int out_height,
 			 u32 rsc);
-int ipu_ic_task_graphics_init(struct ipu_ic *ic,
-			      const struct ipu_ic_colorspace *g_in_cs,
-			      bool galpha_en, u32 galpha,
-			      bool colorkey_en, u32 colorkey);
 void ipu_ic_task_enable(struct ipu_ic *ic);
 void ipu_ic_task_disable(struct ipu_ic *ic);
 int ipu_ic_task_idma_init(struct ipu_ic *ic, struct ipuv3_channel *channel,
-- 
2.47.1


