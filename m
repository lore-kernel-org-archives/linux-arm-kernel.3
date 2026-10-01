Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118A9CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 01:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iOkHuwilKtsyOLtDTfYRF6EqSYNR5BWIai86t2pI458=; b=LRR/r249f6mEEtgOJV2s8zDOzq
	UCDoxcNVn0LfVQvguBvnqZqUr4ME6UIRXSK9CwzRkh+B68J6qS/py/tIZlmjQngvQE03e5iShOV0m
	aVReifAfOmjdhSU01NDom7Ki+/hwUpk6E1XInAkHUs+Y5mNa2NT1aMbdUXlWDOCYVurHAUODpLq/2
	rWJ23i3MAfoIR++77OBIbE1dK07jLjiYT0XsNZcDbhLZaRv3NENyalmA0/cfLBpfS3EhCGOqCCMqq
	5kHjBCr8VBol56olV+zs45ScYdEeeURw4m8cYZ0Fn6s9hUVYi2O5a73u6l64PJyy3bnfvyZeq/gSx
	1CS8RY5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC5OR-00000007YFz-3pm9;
	Thu, 01 Oct 2026 01:15:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC5OC-00000007Y6E-1o2O;
	Thu, 01 Oct 2026 01:15:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=iOkHuwilKtsyOLtDTfYRF6EqSYNR5BWIai86t2pI458=; b=Z/Xm2kGVuGeWN2lCLAoejjutFq
	QTbId29gZ6gisokciPHQaJQwIyxT7Q/GY8d/CBOdZchq5bwciFYXDYcD2FoObIV6UgNpPZ6jAQXLO
	fW2rbb8ixpP6y1Kvq0M/9J9ffAmejsVkPQuH3b7aAr018F9lu40Q0Ap/Nzf5gYlVmhu6HwJxDaR3F
	PsG2TXuaq6lmnocK+l0rT/SuDDbOJcJvhTJeOEo/mOH83YRkYExretuRGsMGElEdeq+rmKQ2DKPjA
	sm7Ybll9CYBlFTxIeAlwLQfA7XH3G5A9oW87+2knOh9x7DOOz79RV32whW0FvaKabo02DHTZTPbtl
	FFaNkBSA==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xC5O7-00000004Trn-3yQh;
	Thu, 01 Oct 2026 01:15:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790817301;
	bh=DEEzMm0DwPTts9fJeyzr6Lx1Y2WK+fUg+sFyVp/OT1c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ET6VP+KaNxBQUMXdZD3eI8AfdajsgY6lxW8ghuT7/l/wwq5bjkuFxKB+8bzUKnA6n
	 97G9PHKvIHDpmXk3YjY5Dp6QZs1Sa0LqO0zYzGoS1cPGhvZlF4pkGKegir7ttj0vmj
	 AL4a/kGbezAyB3LmBu+ndbAQwpwrZtlqC32ixTac5/vbSHxv1NUkfs2C0CzN5ax4cd
	 1qJvL8f75wvk/l9KYM+7PIO/wQoon7wvo8UdcqNAd3YHdvVzx3fS6nJMJucHoKjITK
	 qgWHHk4WyXwAwjhQGt+MFlsR0WDPko8P7HJrrkJyFKN0N+eFTUuPQWntcBoo3aK963
	 yQ3cO/UNrcHow==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4DFE417E0D3B;
	Thu, 01 Oct 2026 03:15:01 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 01 Oct 2026 04:14:36 +0300
Subject: [PATCH 5/8] drm/bridge: ite-it66121: Advertise HDMI 1.2
 capabilities
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-bridge-advert-hdmi-caps-v1-5-f8806570e243@collabora.com>
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
X-CRM114-CacheID: sfid-20261001_021508_411685_CAC41207 
X-CRM114-Status: GOOD (  14.66  )
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

Since none of the chip variants handled by the driver can drive a TMDS
character rate exceeding 148.5 MHz, advertise HDMI 1.2 as the supported
version.  HDMI 1.2 allows up to 165 MHz, so set the bridge's
max_tmds_char_rate to ensure the connector limit derived from
supported_hdmi_ver remains within the hardware capabilities.

drm_bridge_connector_atomic_check() runs
drm_atomic_helper_connector_hdmi_check(), which rejects modes whose
computed TMDS character rate exceeds the connector limit before invoking
the driver's .tmds_char_rate_valid() hook, making the max_rate check in
it66121_bridge_hdmi_tmds_char_rate_valid() redundant.  Drop it.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 51fc68ffdf8f..c8d0a26e8e90 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -10,6 +10,7 @@
 #include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/device.h>
+#include <linux/hdmi.h>
 #include <linux/interrupt.h>
 #include <linux/i2c.h>
 #include <linux/bitfield.h>
@@ -867,15 +868,6 @@ it66121_bridge_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
 					 const struct drm_display_mode *mode,
 					 unsigned long long tmds_rate)
 {
-	const struct it66121_ctx *ctx =
-		container_of(bridge, const struct it66121_ctx, bridge);
-	unsigned long long max_rate;
-
-	max_rate = (ctx->bus_width == 12) ? 74250000ULL : 148500000ULL;
-
-	if (tmds_rate > max_rate)
-		return MODE_CLOCK_HIGH;
-
 	if (tmds_rate < HDMI_TMDS_CHAR_RATE_MIN_HZ)
 		return MODE_CLOCK_LOW;
 
@@ -1670,6 +1662,9 @@ static int it66121_probe(struct i2c_client *client)
 			  DRM_BRIDGE_OP_HDMI;
 	ctx->bridge.vendor = "ITE";
 	ctx->bridge.product = "IT66121";
+	ctx->bridge.supported_hdmi_ver = HDMI_VERSION_1_2;
+	ctx->bridge.max_tmds_char_rate = ctx->bus_width == 12 ? 74250000ULL : 148500000ULL;
+
 	if (client->irq > 0) {
 		ctx->bridge.ops |= DRM_BRIDGE_OP_HPD;
 

-- 
2.55.0


