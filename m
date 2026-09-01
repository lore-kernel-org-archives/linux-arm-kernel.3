Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E9EC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1qYKgpCzW3pWOgHlzHo3NVS8ab8ohBIip5EjEap8GUg=; b=YJeQCwvNYPU3YyZbvCUTQty57q
	lhg1APdbLv6pg/faAydJlgTnoUwn4Msq9mx6lHVeG84gHjGQwBYC0sMjZVtMcgq1Rpzum/C0Aand7
	o8OJeXP798MyHlcBkdn6hC8Iz8ErCz8LxBhGcv90622tr0Fy+QlCX6Vw0a1wCWKQuxoPI3RmQn74x
	vXqp7W8lmlWcf8YBYnMP3bBFRWxv4dC4/bhW4yl3pMsfYlcXlm4hffkqooVWCTqV0iETAW+hY6o6N
	axXKZBBX+TLwCgEqOZLUtEbvwa3ZV8WU7DBJPXcx5wnQZWXddhJV5N5MnhZEl5k9Qk0RKaFHmZJpk
	86sZE/Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Tbp-0000000D5BI-2pxR;
	Tue, 01 Sep 2026 18:53:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TZu-0000000D1MR-3UCF;
	Tue, 01 Sep 2026 18:51:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=1qYKgpCzW3pWOgHlzHo3NVS8ab8ohBIip5EjEap8GUg=; b=Na6QkuvHt72aoUIrCva5iDn531
	NZb9kkSpdkxyyFt6OniBWMw9eGSghsK5w+EQsGyrjznaLlb5AxyUtsbe6dEtZMMAhGZW7VvbJXi0y
	O/7C4OVUm04ccOwzkLkrARS4s3M9tOkIXEquiAVPiDXl5asd9U98vV+WHmQegx0r7PPMdA/JCAllt
	q0WHdYdhMxRl+3gFzkrIxPbVeZuY/SYc8RPSKzjcxAqzoM58zhy+lgGhUA+v47N0DPs7r9m7ZUzxM
	+SrXQH6WsoaE1uTuVn+R30uWFEBYLu5210Qpic/XqbhhKfO9LUvb17h5aWsIIoG6qDipq/OF/rOkk
	N3qwqcfA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1TZr-0000000BHbG-2IT7;
	Tue, 01 Sep 2026 18:51:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788288682;
	bh=lZUSDt3QSXeFHF6VV6Oc9j8qitYrzw5Nsf6oI2hLSn0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ls9nlQpnLqPTXQcg89AYQ6rxTbLiRLtJ1kMmTqWladWfS/RbOyvkx5a45wiBHVx5I
	 fBRmwnL802tyz1RaJMscAzZiax/5HvDoGiWQT4KCx+3aFpg4avHTyQjI2NlkWD0LKE
	 K2r+W3ltMnRJHVTJ+x4ZHX8WBwqYdPscWBS9VU6xrcIm4ooqWZApU/kHsTGxYiYUB0
	 seefaTRZA9lNnydjbM1jDOR5KyOG9hVNSFPUc14+HLWBvXlsqeWdRn1veFNZ3iFP0B
	 NN4KQZx1Whw78XCY4vOEBMtlXcbsh9LqNgrJCqimMhH9ZEvef6Sb2bYZGo0zORo3TP
	 wZTa0xJOj/DPw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4E34D17E3C85;
	Tue, 01 Sep 2026 20:51:22 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 01 Sep 2026 21:51:20 +0300
Subject: [PATCH v11 56/74] drm/rockchip: rk3066_hdmi: Advertise HDMI 1.4
 capabilities
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dw-hdmi-qp-scramb-v11-56-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>, Helge Deller <deller@gmx.de>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-fbdev@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_195123_748651_FF8E3AF7 
X-CRM114-Status: GOOD (  12.27  )
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

Bridges using DRM_BRIDGE_OP_HDMI are now expected to also provide a
supported HDMI version.  This is not yet enforced, but will become
mandatory once the migration to the new caps-based HDMI connector
initialization API is completed.

The RK3066 HDMI TX supports HDMI 1.4a, as described in commit
f84d3d37b7fb ("drm: rockchip: introduce rk3066 hdmi").  However, the
driver does not currently enforce a maximum TMDS character rate, it only
filters non-CEA modes and excludes VIC 1 (640x480) via the .mode_valid
callback.

Advertise HDMI 1.4 support for now so that modes exceeding the 340 MHz
TMDS limit are rejected by the core.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index f28d6a883e09..f748700b0ba6 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -14,6 +14,7 @@
 #include <drm/drm_probe_helper.h>
 
 #include <linux/clk.h>
+#include <linux/hdmi.h>
 #include <linux/mfd/syscon.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -712,6 +713,7 @@ rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Rockchip";
 	hdmi->bridge.product = "RK3066 HDMI";
+	hdmi->bridge.supported_hdmi_ver = HDMI_VERSION_1_4;
 
 	hdmi->bridge.ddc = rk3066_hdmi_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->bridge.ddc))

-- 
2.55.0


