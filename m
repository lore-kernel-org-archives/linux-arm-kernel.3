Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BEC107526F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 07:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ZOi30iqvElH92jG4uV8QMY3iphYINqvrpBWAIBZe3M=; b=V8wVlIf9W0oRz5qIFT6cgzYNa5
	jByy3TZiNgwgHIp/LqZfQQL0Ybzt1T6AL+j3mDsl2s7KI0BRkLhK6yygtDUpTSPw5w2JFgVwd0B18
	EheKJG1SL/vBPYYwU/5nGrJY6xRvJFJQjJ6egW9bb69dWZ+FLIJiAaTljPLZDyAmurNdwXQU3J4VP
	TBs9spol/MICC9wWjjDYLOle6bfLGFxf4KGU2OHV7IiZcanpu8Ng4AsY/wZEWhJFvGQCeDwYjxpaX
	MvTOmCrxEzH3pZFxwWoOUgtizgIZb+dhoex3Nq4sxUsvstSMpwTTh26QujlkKhZO8Sf2LUxF9zs9+
	uqPIgesw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w37gH-0000000A8PO-2Wki;
	Thu, 19 Mar 2026 07:20:33 +0000
Received: from mail-m49237.qiye.163.com ([45.254.49.237])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w37gC-0000000A8MO-1VWf;
	Thu, 19 Mar 2026 07:20:29 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3788743e1;
	Thu, 19 Mar 2026 15:15:18 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	victor.liu@nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	jingoohan1@gmail.com,
	p.zabel@pengutronix.de,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	alim.akhtar@samsung.com,
	dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com,
	nicolas.frattaroli@collabora.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v11 04/17] drm/exynos: exynos_dp: Remove unused &exynos_dp_device.connector
Date: Thu, 19 Mar 2026 15:14:39 +0800
Message-Id: <20260319071452.1961274-5-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260319071452.1961274-1-damon.ding@rock-chips.com>
References: <20260319071452.1961274-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d04f2dea503a3kunm86e540ee39650b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkhLGlZLHUIaSEkYHRpLTUpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=UbrcHe3JVxBV1RtITZvFkPmWh+OWfVHH7m5K+6e/361JlpmlM4CNmkoRGTylYM4DVCc0XbBacjf777JUllMBQhQD5FEbjLH8R4lJH0KwU5CO6GgfzaDjiW+NFbBJU9fIApFxZamXHPDDExuB4Bv9IDGCxqZ1xXCpxdtBagHZ6co=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=0ZOi30iqvElH92jG4uV8QMY3iphYINqvrpBWAIBZe3M=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_002028_593778_D0E3613F 
X-CRM114-Status: UNSURE (   9.54  )
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

The &exynos_dp_device.connector is assigned in exynos_dp_bridge_attach()
but never used. It should make sense to remove it.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)

---

Changes in v5:
- Fix the 'drm/bridge' to 'drm/exynos' in commit message.

Changes in v9:
- Add Reviewed-by and Tested-by tags.
---
 drivers/gpu/drm/exynos/exynos_dp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index f469ac5b3c2a..e20513164032 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -35,7 +35,6 @@
 
 struct exynos_dp_device {
 	struct drm_encoder         encoder;
-	struct drm_connector       *connector;
 	struct drm_device          *drm_dev;
 	struct device              *dev;
 
@@ -102,8 +101,6 @@ static int exynos_dp_bridge_attach(struct analogix_dp_plat_data *plat_data,
 	struct exynos_dp_device *dp = to_dp(plat_data);
 	int ret;
 
-	dp->connector = connector;
-
 	/* Pre-empt DP connector creation if there's a bridge */
 	if (plat_data->next_bridge) {
 		ret = drm_bridge_attach(&dp->encoder, plat_data->next_bridge, bridge,
-- 
2.34.1


