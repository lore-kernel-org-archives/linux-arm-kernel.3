Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4211075273
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 07:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m9rP/6T8wS0WFvkiIQi5p+4aXm4qKKkCjrdy98mzVxk=; b=McCV15DBMivVeymYrIAfBt5vNr
	f2ZQpAtHb9TH5uFHu612HLI2PQx0PsMZXbbBE3AC318AHnAxA9Vng88UYy5odkpFl/NENffZsfjEH
	+2jUMDMImMwOCTSQ41X2aJ4vVJG9ZH4jzskw6SKrjd/97GdpD5pg/CYgb1WIA/9OMx2A6mUGuoUo7
	QfDUdEE/VMmdOYI1o9JYI5qU8FJMQUql+ETv2+Uy7pWgRNnR3EsvSzkF6Y2kPXXqhm6NxYKnMZ/mS
	VHS2b9xesbLs7TLqXrz3yr7Zy2NgZ17aKyS2/HoIn4V0OCvm3QExddAwDdIl3oJfI08dWW37RHF5+
	Fd3kEjLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w389S-0000000ABVL-2Tmb;
	Thu, 19 Mar 2026 07:50:42 +0000
Received: from mail-m1973176.qiye.163.com ([220.197.31.76])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w389P-0000000ABUX-2jrk;
	Thu, 19 Mar 2026 07:50:40 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 37887442a;
	Thu, 19 Mar 2026 15:15:31 +0800 (GMT+08:00)
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
Subject: [PATCH v11 09/17] drm/bridge: analogix_dp: Remove unused struct drm_connector* for &analogix_dp_plat_data.attach()
Date: Thu, 19 Mar 2026 15:14:44 +0800
Message-Id: <20260319071452.1961274-10-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260319071452.1961274-1-damon.ding@rock-chips.com>
References: <20260319071452.1961274-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d04f30f5903a3kunm86e540ee3965c1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR0aHlZCS0NLQhhKSR9JGE1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=dOSZjoemegWiJ68g5i7MrVN30wKGX8mJsfuBHlEGgTXn0BkWt8qLlwcO4ZQ8EhU9DFVJf8bXmK6XeiBN3l0fy+aKKKdFmrxf+oIIR1Om8XA3B8j5Wqc5x9y7a9QZCZpr3iD0y7br7VeZ/B2sJARUMvzykAzGTJqH662anU8/I0Y=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=m9rP/6T8wS0WFvkiIQi5p+4aXm4qKKkCjrdy98mzVxk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_005039_876647_B1B38ECA 
X-CRM114-Status: GOOD (  11.82  )
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

For both Rockchip and Exynos sides, the struct drm_connector* is
never used in callback &analogix_dp_plat_data.attach(). After
applying drm_bridge_connector helper, this parameter will no longer
be used at all.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-----

Changes in v11:
- Add Reviewed-by tag.
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 2 +-
 drivers/gpu/drm/exynos/exynos_dp.c                 | 3 +--
 include/drm/bridge/analogix_dp.h                   | 3 +--
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index b0bc96693fdb..3efd910ea463 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -991,7 +991,7 @@ static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
 	 * point after plat attached.
 	 */
 	if (dp->plat_data->attach) {
-		ret = dp->plat_data->attach(dp->plat_data, bridge, connector);
+		ret = dp->plat_data->attach(dp->plat_data, bridge);
 		if (ret) {
 			DRM_ERROR("Failed at platform attach func\n");
 			return ret;
diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 1eeb0b15f99a..71a00ee97782 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -70,8 +70,7 @@ static int exynos_dp_poweroff(struct analogix_dp_plat_data *plat_data)
 }
 
 static int exynos_dp_bridge_attach(struct analogix_dp_plat_data *plat_data,
-				   struct drm_bridge *bridge,
-				   struct drm_connector *connector)
+				   struct drm_bridge *bridge)
 {
 	struct exynos_dp_device *dp = to_dp(plat_data);
 	enum drm_bridge_attach_flags flags = 0;
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index 3301392eda5f..3428ffff24c5 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -33,8 +33,7 @@ struct analogix_dp_plat_data {
 
 	int (*power_on)(struct analogix_dp_plat_data *);
 	int (*power_off)(struct analogix_dp_plat_data *);
-	int (*attach)(struct analogix_dp_plat_data *, struct drm_bridge *,
-		      struct drm_connector *);
+	int (*attach)(struct analogix_dp_plat_data *, struct drm_bridge *);
 };
 
 int analogix_dp_resume(struct analogix_dp_device *dp);
-- 
2.34.1


