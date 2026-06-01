Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF79CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 22:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6dVzvwV0tFoRMF1CNTYM/ecDBo69J6YlfjtDSBwfY4=; b=ziTRuRZJdeU1KCUJk6kh3n4jj4
	usof/SPHQdUjhx3OevISZZ8wQnVOLrZl3i03iYT9k7rSYqgRcsWqqDcwIiZPkffkIuRc7y7Iecmzm
	IQ8K/bbLbqlNzzbQnhwHc3d+TR9C5uiDcLaD3ihj77K1Y9gBN6vQ5nx2lZwF1v2YZwsp+6t7VyWwh
	DJfYMdR1OZHddr2JCR4imnEj9ZtMDQSi6sgMWIB+GmSZXcqZR882VqWe5XiIMTHPv8dLP5lw5cOM5
	0SeYBE/Q+3arWF5ebIBVTrOqaeG9qpU//rkBVenKguB2wVrElimBPwG7xmfMd+el9SQttww7ieP9x
	Yyym/XxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUBOK-0000000BzDH-1wSB;
	Mon, 01 Jun 2026 22:45:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUBNu-0000000ByFa-0Oxg;
	Mon, 01 Jun 2026 22:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780353924;
	bh=6E6xBHA62toRrtBV3Ev5KvntPSsFKRs99+xMXbjyuoQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nlUMAZ60TVPo06oxGnTNteoKT3WR8494Q5u/aZrUkBYtaUs0iXWDBlNrdbJr4mR7T
	 3LlDlncWg5gbq0V+oiGwIujhxyXNs+CHmZOw33RUAUlEDc0/FJcmPWWd1NV62kvMb7
	 4d1B/uWJOKkesqCdAhINFb5rc0W1DI3Xhq/Q9fMC8A0obKCKCOXiUwv2fJk+ajlr19
	 eDI2cRjEBiA9O3AjlBQC2ffePQPmCRvgSIqUg4vI4HqTTu3tz8J4I9vbaTsPrrNw4U
	 LwzDbH7xVg95ajxAuFSrlL2/Bq/HMwOwbqr0DHQoiM9cYPuS9v4awqcQCScxKjAYjR
	 yotESvqGfJMYw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DAB9A17E0E3F;
	Tue,  2 Jun 2026 00:45:23 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 02 Jun 2026 01:44:18 +0300
Subject: [PATCH v7 18/30] drm/rockchip: dw_hdmi_qp: Drop unnecessary
 #include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-dw-hdmi-qp-scramb-v7-18-445eb54ee1ed@collabora.com>
References: <20260602-dw-hdmi-qp-scramb-v7-0-445eb54ee1ed@collabora.com>
In-Reply-To: <20260602-dw-hdmi-qp-scramb-v7-0-445eb54ee1ed@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Daniel Stone <daniels@collabora.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_154527_527328_F7BDA6C0 
X-CRM114-Status: UNSURE (   8.52  )
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

Remove superfluous drm_simple_kms_helper.h include, which has no users
in this file since commit e1f7b7cbd74c ("drm/rockchip: dw_hdmi_qp:
Switch to drmm_encoder_init()").

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 46df5abe31a4..8d64b76a1aa5 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -24,7 +24,6 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "rockchip_drm_drv.h"
 

-- 
2.54.0


