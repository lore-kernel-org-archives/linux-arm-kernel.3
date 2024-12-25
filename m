Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345ACE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 18:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zdTB7pc5WS+HFB9gmP4+v5jC0oRIwy5wOUzdsemALV0=; b=qiMpax8iUe2QQ+b2FaMCBAQ/zf
	Fy31tbAjELwwTKf5IoIevVcJo7eUN/YdilMIEt0BsMnvZEQkODzpi1qOZ++mNtXTRXjbRpD9JTiys
	VwrW8i8DD4PZu/eOmutk8YGhzM7UlrSibuVJjo4vzaQLmUo1qMAeV2pEfTg5/Yk46NUVtPKx6gSFE
	525ZjhJxDFHXg4aIn8RNaXY4vczQCdFUV77KF+ltsmRHFhE57zEiVjvipicYyBOEh3+I94Sqo8Ob+
	oQvEAZcsUAcM8uH20uEFfSaBO0QOpTvq/ClfJzBAVnKO1nCo/rI7Q6nXCWAt9MBEgIkgIiNw+rC2p
	pqM77lPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQWOh-0000000ECTK-0SYt;
	Wed, 25 Dec 2024 18:46:19 +0000
Received: from mx.treblig.org ([2a00:1098:5b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQWNU-0000000ECOX-0vDA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Dec 2024 18:45:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=zdTB7pc5WS+HFB9gmP4+v5jC0oRIwy5wOUzdsemALV0=; b=jgbRNH4YyfbuAm/g
	4v8F0JvzwNIMi++L61yAa4LgeHkvSwkOqtxKrOsLsJrHtmnZW25jkGm0iQXwWtdfulk/Q/3fJzgCL
	agVV9L//0tk0VWUbxIR0uqWrg26iwa4QUQluZUi70Gw5qZeNpYsVDCq+tLLPAHucW9KFg1zqDiztI
	1fLX5uxHnyV9EkNBl8WnHR/Jwwueh1sZ7uIze/2KiA/jT5tNDKl8krvLyvHFNRCahziPXVZ2WLEjo
	rKVJ3axgC7WmbMSRCAeCIi/JWuyAvoCgWEIFpnLCb1VFmdTX+ybl/FGS0K0eNS9W4FP3YIUTU9sEp
	itC5M0++hzxtuGEWsQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tQWNK-0078WD-1u;
	Wed, 25 Dec 2024 18:44:54 +0000
From: linux@treblig.org
To: s.nawrocki@samsung.com,
	mchehab@kernel.org,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	linux-media@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] media: platform: exynos4-is: Remove unused __is_get_frame_size
Date: Wed, 25 Dec 2024 18:44:53 +0000
Message-ID: <20241225184453.104368-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_104504_252742_4AEC107E 
X-CRM114-Status: UNSURE (   7.54  )
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

The last use of __is_get_frame_size() was removed in 2013 by
commit 5cfaad64d88a ("[media] exynos4-is: Fix format propagation on
FIMC-IS-ISP subdev")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 .../media/platform/samsung/exynos4-is/fimc-is-param.c    | 9 ---------
 .../media/platform/samsung/exynos4-is/fimc-is-param.h    | 1 -
 2 files changed, 10 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is-param.c b/drivers/media/platform/samsung/exynos4-is/fimc-is-param.c
index 9c816ae3b3e5..443362da8cc8 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is-param.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is-param.c
@@ -204,15 +204,6 @@ int __is_hw_update_params(struct fimc_is *is)
 	return ret;
 }
 
-void __is_get_frame_size(struct fimc_is *is, struct v4l2_mbus_framefmt *mf)
-{
-	struct isp_param *isp;
-
-	isp = &is->config[is->config_index].isp;
-	mf->width = isp->otf_input.width;
-	mf->height = isp->otf_input.height;
-}
-
 void __is_set_frame_size(struct fimc_is *is, struct v4l2_mbus_framefmt *mf)
 {
 	unsigned int index = is->config_index;
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is-param.h b/drivers/media/platform/samsung/exynos4-is/fimc-is-param.h
index 206904674927..10ad02f36fed 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is-param.h
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is-param.h
@@ -994,7 +994,6 @@ void fimc_is_set_initial_params(struct fimc_is *is);
 unsigned int __get_pending_param_count(struct fimc_is *is);
 
 int  __is_hw_update_params(struct fimc_is *is);
-void __is_get_frame_size(struct fimc_is *is, struct v4l2_mbus_framefmt *mf);
 void __is_set_frame_size(struct fimc_is *is, struct v4l2_mbus_framefmt *mf);
 void __is_set_sensor(struct fimc_is *is, int fps);
 void __is_set_isp_aa_ae(struct fimc_is *is);
-- 
2.47.1


