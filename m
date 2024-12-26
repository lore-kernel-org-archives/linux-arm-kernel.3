Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E44FE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 02:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m4Osx6Hdy9KSW372q7wGp80UoBpNogxBOIxeaPz8X+M=; b=1Id0HaNMgCYQRyHCBLQlLN8Oa7
	utG4caG7RCewaCTBW1VsQ2VaoXrp+e5qWoCZrK7u3zgniu7qbslXsG/N35lt28/+jlkDFq9dpbuZb
	BfJGB/eLZAJEBwzWCZvYc0+de2duzidJ/whwuiR8AWJS/KERsg5UIMSDpLKe/awb7i4Xk3xNT6Jxm
	Gx1paxblvjhx9Jk9bAqxZ565Y3p4WOKr1j8gHTUoZZuO+AttVkGEi2HuDnPFGVCDgHvbzLn1trcf3
	T1d1MCbnelU2suyDSWaWYcFpyGc1/2lPiaoPPQFPS0Q9eU92e7EDpH+IfSvrWZ6joJ2xjAp3tWTxw
	zlBMikYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQdcx-0000000EyAc-1s1i;
	Thu, 26 Dec 2024 02:29:31 +0000
Received: from mx.treblig.org ([2a00:1098:5b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQdbl-0000000Exxz-23Di
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 02:28:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=m4Osx6Hdy9KSW372q7wGp80UoBpNogxBOIxeaPz8X+M=; b=WYfQSZgV7n/+3+Pd
	KmWCyewhwvPkrUihSLAvKQe6lvM5B+2jwmuShNU77PeeE0hgZSF3OeHuJ54E0apajjhoLnm7eiYHa
	FkY9DIDWmnbx4OlniJqZzQl5xFAxI4G4cNiSq5duToEDjjuSJxlyKiBc2KDIpZkxb+SofwKJR29hl
	E0l6PLzOvuyHHvCnEJZFphJ3LKWgA250kg//KiIvnZkRu/uTdNUazkWjDR8vJZM4p8AkWgLZtxo/o
	Ue5eJeslQo3MHPwoXsQ6lSqq0QOIsJUBBangZzu+Yk/Q4EOgjg/9Q1lDLkuPhN2vFe9K1DsKb3Xzk
	ISzCMPjbVwpE/PO5BQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tQdbP-007F0L-0G;
	Thu, 26 Dec 2024 02:27:55 +0000
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
Subject: [PATCH 2/7] gpu: ipu-v3: Remove unused ipu_rot_mode_to_degrees
Date: Thu, 26 Dec 2024 02:27:47 +0000
Message-ID: <20241226022752.219399-3-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241226022752.219399-1-linux@treblig.org>
References: <20241226022752.219399-1-linux@treblig.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_182817_617236_F58129B5 
X-CRM114-Status: UNSURE (   6.92  )
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

ipu_rot_mode_to_degrees() was added in 2014 by
commit f835f386a119 ("gpu: ipu-v3: Add rotation mode conversion utilities")
but has remained unused.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/ipu-v3/ipu-common.c | 32 --------------------------------
 include/video/imx-ipu-v3.h      |  2 --
 2 files changed, 34 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-common.c b/drivers/gpu/ipu-v3/ipu-common.c
index 947323f4a234..a8570e1bdf28 100644
--- a/drivers/gpu/ipu-v3/ipu-common.c
+++ b/drivers/gpu/ipu-v3/ipu-common.c
@@ -165,38 +165,6 @@ int ipu_degrees_to_rot_mode(enum ipu_rotate_mode *mode, int degrees,
 }
 EXPORT_SYMBOL_GPL(ipu_degrees_to_rot_mode);
 
-int ipu_rot_mode_to_degrees(int *degrees, enum ipu_rotate_mode mode,
-			    bool hflip, bool vflip)
-{
-	u32 r90, vf, hf;
-
-	r90 = ((u32)mode >> 2) & 0x1;
-	hf = ((u32)mode >> 1) & 0x1;
-	vf = ((u32)mode >> 0) & 0x1;
-	hf ^= (u32)hflip;
-	vf ^= (u32)vflip;
-
-	switch ((enum ipu_rotate_mode)((r90 << 2) | (hf << 1) | vf)) {
-	case IPU_ROTATE_NONE:
-		*degrees = 0;
-		break;
-	case IPU_ROTATE_90_RIGHT:
-		*degrees = 90;
-		break;
-	case IPU_ROTATE_180:
-		*degrees = 180;
-		break;
-	case IPU_ROTATE_90_LEFT:
-		*degrees = 270;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(ipu_rot_mode_to_degrees);
-
 struct ipuv3_channel *ipu_idmac_get(struct ipu_soc *ipu, unsigned num)
 {
 	struct ipuv3_channel *channel;
diff --git a/include/video/imx-ipu-v3.h b/include/video/imx-ipu-v3.h
index 0bb1d714cbf5..8870f65c9a8b 100644
--- a/include/video/imx-ipu-v3.h
+++ b/include/video/imx-ipu-v3.h
@@ -484,8 +484,6 @@ enum ipu_color_space ipu_drm_fourcc_to_colorspace(u32 drm_fourcc);
 enum ipu_color_space ipu_pixelformat_to_colorspace(u32 pixelformat);
 int ipu_degrees_to_rot_mode(enum ipu_rotate_mode *mode, int degrees,
 			    bool hflip, bool vflip);
-int ipu_rot_mode_to_degrees(int *degrees, enum ipu_rotate_mode mode,
-			    bool hflip, bool vflip);
 
 struct ipu_client_platformdata {
 	int csi;
-- 
2.47.1


