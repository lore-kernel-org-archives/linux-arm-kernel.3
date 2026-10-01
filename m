Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1982ECA5FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 01:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Bn1dTh9kl6TMvc22fej/T55VW3YJEqtebNN850Pukk=; b=XAIdF1uIaA8xbNA93i1EFc4w88
	XNPjuM9x3BD+5e3bLud9x0yuTHpJR/YM0fVuyua2NSkfKDqLaLCUbTidcRgwJgcngjOwSz6hhpvb+
	zN9AAZtP2EU1KemnyAeAQGuLfj9rGAyjUA0D1e0tz/mxMqBK1+OfcLTdbD2DjuZ25REVqad2my6o+
	uBXQ4R90DipAU4ZmNLJ5OHGTQDlT3abT/h7rTbsWOsXhrkK9GJBFdm5lMT2eJbl3bPMtCvLfNZv47
	pQnuvdo4cLxoWdEgc6t/qbC1TYE+k7o1rp090a0bmHuAsi5x0YNr+Jb1TuYhTRtB2ktIG3xrHRwim
	IS3p+B/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC5OR-00000007YE9-1CPt;
	Thu, 01 Oct 2026 01:15:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC5OA-00000007Y5R-2yeE;
	Thu, 01 Oct 2026 01:15:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/Bn1dTh9kl6TMvc22fej/T55VW3YJEqtebNN850Pukk=; b=T6ZBA9ZhKTFK/FggZqhVRco2q4
	zZbj44BLjhxDXIuDw51tolFlr3ErBaXRxZWrEnecLEOsrE3zlQgrYlHO1RT4N8cMvJKpChdFQlEbp
	5PNgc5b6MK4dHXuxRGipTxhdZRd3YbiFEy1jasRiR5croPbvwUF+J4SHtXEIy6KrSfOxT3tDNPJ6c
	F7aQyv2cJULpTFj3AMTSkdo2ddpV9zPpWdcZdEjZsDXP46/6CatCZfd6KeY3Mye2pFXyft1+2VAAa
	2iNflVFdJMnJu1HpgDfjn0TSpO458jG5G9xbAxAgY9B3PxeXOgfe9omr5Y+wq9f27PZpaW4VvSolh
	YHK3AWlw==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xC5O7-00000004TrH-124C;
	Thu, 01 Oct 2026 01:15:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790817300;
	bh=trz+pg8TdAmiapUzXFOsDd1JTCIdVAs8CD5I44OX+Hk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=izeOJWKAI6UcIH+uKv09mw3+Ceir8XOZOZUYbLKS6GBbMnG0W1cVjaKwqZpH1i334
	 VAssMy6QGwHjA3L1tn/4v8KWYr3vHP4P8xf/ysOowiJj8/2QCMJTxVNkvllB8z89l4
	 EmkKUnLIO5Qv9RwmQwDkId/b4oUq6era9yer6hiLrFu3W6Y2eXyp62V4WdcIZO0fF5
	 jkIitmTBylHgCo/TW8GWBayz8trDyqLB8rcYDWc+Rdf+TDmMrWVohaNY6wW4vdc6El
	 CRDivybezBOJCxGFHCMlVX35bFQhR92eToUhIRl4mILohBhM6dHBEstECk4qv4bPk1
	 EGwGexRqi6CVg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9E11017E0B0F;
	Thu, 01 Oct 2026 03:15:00 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 01 Oct 2026 04:14:35 +0300
Subject: [PATCH 4/8] drm/bridge: ite-it6263: Advertise HDMI 1.3
 capabilities
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-bridge-advert-hdmi-caps-v1-4-f8806570e243@collabora.com>
References: <20261001-bridge-advert-hdmi-caps-v1-0-f8806570e243@collabora.com>
In-Reply-To: <20261001-bridge-advert-hdmi-caps-v1-0-f8806570e243@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andy Yan <andy.yan@rock-chips.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_021507_782928_4D247071 
X-CRM114-Status: GOOD (  13.99  )
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

Reviewed-by: Maxime Ripard <mripard@kernel.org>
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


