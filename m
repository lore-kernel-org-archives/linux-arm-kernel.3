Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6744C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0OG6DPfx8cghAxN+mmKvSd2C01G7nJ+tvgQRro5Ux44=; b=bNy+OW5fobX0nWEXNqA3hPA25Y
	rhCwIO0SIowo3B0avhxhUW/940y5fMXgn8TdvyGMMQMNbZTnRcuMbwizmEQ9HB3bYbcp00MQLFXeN
	qxiT0d15LGeb2ozb84sSGDPBx7J2gsYMLkUzP1ReOQgKmu5eIhF5Bw5J3TCbog5mEuyt7VZ2fskC8
	CoEpUSaQlrr3Qyujagr/3QKr50bOtVnhPBuDh1920DK0gR0R/wFR1jkNt0X2cocFlORUQUAG1d9+2
	CovvkCVJMiZRN3k+6xlxfOvKOJiNeidgzELt2adOo35ekqkp2RGG8hlETR7Wols8BWi5W/kNLDZXW
	gMAhW/5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TbD-0000000D3sQ-172c;
	Tue, 01 Sep 2026 18:52:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TZs-0000000D1MH-41iM;
	Tue, 01 Sep 2026 18:51:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0OG6DPfx8cghAxN+mmKvSd2C01G7nJ+tvgQRro5Ux44=; b=KTis4Vg1Q1zXBQckaFe6zsSdVp
	0i/o/Kr8NFj5HDRzJG5lS5e4l6cJD/II+IBLYJK0pHD6oMcWl1WKsLgvTSthFRZLcEEJUq0GJ28cr
	M+R9iBaEFLmTR6UgLKBLzHx7BRGnXTA6G8BC3DNsI15QE4+oy+oVPHrFQNpzxyr7lIpnbeTYd9Hu3
	Mj22r2hajBwLjdZskqHzajOiB6704P4J2gNNjNi9EBIMt0xDkN9AKKMbMWB3ZsbMC9XbDsrCV+Xn4
	aggi/Dvz+4/PuxDJ8soRsOGeCPyW9BdNMGbujLYjmAJ1Mjf1lnzq8E7TJXvGfuy3mvJ2WDkV1kO0z
	yg/rX/mQ==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1TZp-0000000BHYv-3fgy;
	Tue, 01 Sep 2026 18:51:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788288680;
	bh=9ULxXAJ8Lgf9TVfLmpWCFcvW40GpvaJh+iJkfEerDYw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dIctpRAQoiG69X0o4pnh6hUlZznNakZMsVMx/PQqn7QpfOIcvUjBYXGqq9map+tAC
	 0a8IGYPL4TM8X4P9TM5cyqswNhCPELserhcjhAW3rEr2j+F/ls/pIsu6qNtTLAdzIW
	 yKwxGICO/4gamiPdsn7s9YXyiFsqtnfmb1gzzkBczuBvgOWTbMwWzVM6GEBTwRHQBv
	 W4sZGv4JfqLcx1V0p3RqXaaecmm/aNFvQ8eexM9nml4FBM4m3G2RQYvqU89BHc6yNw
	 fzzUP0lctPRzfYQN6Li37q2DtWjcQtxUFf2GRKrWRE9UWNj4amM69x+b9zgiuDkeMX
	 NgqMUBbawukSw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1E37F17E3C79;
	Tue, 01 Sep 2026 20:51:20 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 01 Sep 2026 21:51:17 +0300
Subject: [PATCH v11 53/74] drm/bridge: ite-it6263: Advertise HDMI 1.3
 capabilities
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dw-hdmi-qp-scramb-v11-53-bc12954a0688@collabora.com>
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
X-CRM114-CacheID: sfid-20260901_195122_078485_2E03622C 
X-CRM114-Status: GOOD (  13.04  )
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

Bridges using DRM_BRIDGE_OP_HDMI are expected to provide the supported
HDMI version.  This is not enforced yet, but will become mandatory once
the migration to the caps-based HDMI connector initialization API is
complete.

Advertise HDMI 1.3 support for IT6263, covering the 225 MHz TMDS
character rate currently documented by the driver, which is within the
HDMI 1.3 limit of 340 MHz.  Additionally, keep the stricter 150 MHz
effective mode limit by setting max_tmds_char_rate from
MAX_PIXEL_CLOCK_KHZ.

The existing .hdmi_tmds_char_rate_valid() hook checks both the pixel
clock and TMDS character rate.  Since the bridge only supports 8 bpc
RGB444, these are equivalent for supported modes, making the 225 MHz
TMDS rate check unreachable once the 150 MHz pixel-clock limit is
applied.

drm_bridge_connector_atomic_check() invokes
drm_atomic_helper_connector_hdmi_check(), which rejects modes whose
computed TMDS character rate exceeds the connector's max_tmds_char_rate
before invoking the driver's .tmds_char_rate_valid hook.  Since
max_tmds_char_rate now carries the existing effective limit,
it6263_hdmi_tmds_char_rate_valid() is redundant.  Drop it.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/ite-it6263.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index 550999491086..e8e0197171e1 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -738,20 +738,6 @@ it6263_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 	return input_fmts;
 }
 
-static enum drm_mode_status
-it6263_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
-				 const struct drm_display_mode *mode,
-				 unsigned long long tmds_rate)
-{
-	if (mode->clock > MAX_PIXEL_CLOCK_KHZ)
-		return MODE_CLOCK_HIGH;
-
-	if (tmds_rate > MAX_HDMI_TMDS_CHAR_RATE_HZ)
-		return MODE_CLOCK_HIGH;
-
-	return MODE_OK;
-}
-
 static int it6263_hdmi_clear_avi_infoframe(struct drm_bridge *bridge)
 {
 	struct it6263 *it = bridge_to_it6263(bridge);
@@ -821,7 +807,6 @@ static const struct drm_bridge_funcs it6263_bridge_funcs = {
 	.detect = it6263_bridge_detect,
 	.edid_read = it6263_bridge_edid_read,
 	.atomic_get_input_bus_fmts = it6263_bridge_atomic_get_input_bus_fmts,
-	.hdmi_tmds_char_rate_valid = it6263_hdmi_tmds_char_rate_valid,
 	.hdmi_clear_avi_infoframe = it6263_hdmi_clear_avi_infoframe,
 	.hdmi_write_avi_infoframe = it6263_hdmi_write_avi_infoframe,
 	.hdmi_clear_hdmi_infoframe = it6263_hdmi_clear_hdmi_infoframe,
@@ -883,6 +868,8 @@ static int it6263_probe(struct i2c_client *client)
 	it->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	it->bridge.vendor = "ITE";
 	it->bridge.product = "IT6263";
+	it->bridge.supported_hdmi_ver = HDMI_VERSION_1_3;
+	it->bridge.max_tmds_char_rate = 1000ULL * MAX_PIXEL_CLOCK_KHZ;
 
 	return devm_drm_bridge_add(dev, &it->bridge);
 }

-- 
2.55.0


