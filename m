Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A024C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C62NbbZZXw/kBQhpslyP1gjpT+jZCJgIPo2p22d+QlI=; b=n3UjjX28d5UVqwk0z6tMRoO2L+
	XmnWF8h/2vLukXv68rk/CkgAr6o2i2HYSB9yBYPuEG288fDx4dvjaAosxIv9jmNetMeIJPvnbii0j
	GOMvBuBiZ2CrW9jKs7LykZPmTMfQihcKmPXgBmLtePOD/WW+ZvNFlF8KbZlRpG5sTtQOkw0JwQ4pc
	YQwhvZJvvQZi8FU17RmhGxHkRzgii0UMN4G2LrbpuiMNZDNT/2SWiNK4jez/7stzazvZzT0qr0ZWw
	LfWMKPOTNGQ35JVgomJ2jJD6+y5m0HgId6r1qWcM32ZlHyyRDiQ5SDJ+asdamOJH0YKCsQtfMyT6x
	ES06Yvww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Tbt-0000000D5Iv-3Pox;
	Tue, 01 Sep 2026 18:53:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TZw-0000000D1MW-1bWc;
	Tue, 01 Sep 2026 18:51:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=C62NbbZZXw/kBQhpslyP1gjpT+jZCJgIPo2p22d+QlI=; b=QUOD7jH/RzCN2B7/4AvD/mZlsE
	QT5Sm8i4VDlus+8k7QmXcX+vceALApy3s3ZWW/K6PNqLr9DVGeyqFxd/pomBuFtLfcp5bhAxflmhF
	rixfpw+9usPR4DoXInnBNOVyCsVVo/QtsndZxah4MB03posWJfNaUNRkucMsTPTZAq3l2nYDTZMzw
	7U3o+sz3dlo2slK/EuQZXWDE75MJ9c93J/nRC8LOq/3g+LgspHnoPPx/QpNU37AzbEfGj3p5rWB4B
	tMTwzQEzkLvAjlic8r+7KBDkBGaZ6Nnvw2KH3c37U3ct2aGIg73IcmmnRK6o5lqT+2NK039Z3f5I4
	kIym6kog==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1TZs-0000000BHbd-1OfM;
	Tue, 01 Sep 2026 18:51:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788288683;
	bh=eTwvcHzDahjPYHCtMEH5hOYZ7IvsD5Sh3bBiNe6fI+U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W4Dr2V50fcGATA3BlMN2dZTHzsCTva51cS7g3YJltBdKQqVmNCxpivDne3jYxhAMj
	 IdHzXLDAXcROyA4yKlviV5WVIQDblwOxH0Wul3CzAvAouKKRgpNXRGf7+Wys9+x6pN
	 CoNWo0ru1uTpvCoeT7ULCL8DasrcHW/R4uKDNpqA1ixgCyYaXHDn7aVOpJGNJcjR6t
	 2Xd/Gz07CsmE17BdkCKZZhPknfaLVcKkpSapw/n40M9fOHP8VMXr12YAJ5Kz4aQq2O
	 i3C+aSlTolESSnJkVxj24iwhfHyU2hh8LVkHNAoisVK/c7UQ3FpZ81ZtwhCDko6kpe
	 48dpPv/kbDTuQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0DD1217E3C88;
	Tue, 01 Sep 2026 20:51:23 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 01 Sep 2026 21:51:21 +0300
Subject: [PATCH v11 57/74] drm/sun4i: hdmi: Convert to
 drmm_connector_hdmi_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dw-hdmi-qp-scramb-v11-57-bc12954a0688@collabora.com>
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
X-CRM114-CacheID: sfid-20260901_195124_495217_A2930782 
X-CRM114-Status: GOOD (  15.54  )
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

Switch driver over to the new drmm_connector_hdmi_init() signature and
advertise HDMI 1.2 support.  The vendor, product, supported_formats and
max_bpc values previously passed as arguments are now provided through
struct drm_connector_hdmi_funcs, together with the new
supported_hdmi_ver field.

The HDMI connector helpers infer the 165 MHz TMDS character rate ceiling
from supported_hdmi_ver and reject modes exceeding it before invoking
the driver's .tmds_char_rate_valid() hook.  This makes the explicit mode
clock check in sun4i_hdmi_connector_clock_valid() redundant, so drop it.

No functional change intended.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index d98b6f12a7bc..6f4fe0c8efae 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -192,10 +192,6 @@ sun4i_hdmi_connector_clock_valid(const struct drm_connector *connector,
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		return MODE_BAD;
 
-	/* HDMI 1.0 max TMDS character rate */
-	if (clock > HDMI_1_0_TMDS_CHAR_RATE_MAX_HZ)
-		return MODE_CLOCK_HIGH;
-
 	rounded_rate = clk_round_rate(hdmi->tmds_clk, clock);
 	if (rounded_rate > 0 &&
 	    max_t(unsigned long, rounded_rate, clock) -
@@ -253,6 +249,15 @@ static struct i2c_adapter *sun4i_hdmi_get_ddc(struct device *dev)
 }
 
 static const struct drm_connector_hdmi_funcs sun4i_hdmi_hdmi_connector_funcs = {
+	/*
+	 * NOTE: Those are likely to be wrong, but I couldn't find
+	 * the actual ones in the BSP.
+	 */
+	.vendor = "AW",
+	.product = "HDMI",
+	.supported_hdmi_ver = HDMI_VERSION_1_2,
+	.supported_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
+	.max_bpc = 8,
 	.tmds_char_rate_valid	= sun4i_hdmi_connector_clock_valid,
 	.avi = {
 		.clear_infoframe	= sun4i_hdmi_clear_avi_infoframe,
@@ -654,19 +659,11 @@ static int sun4i_hdmi_bind(struct device *dev, struct device *master,
 
 	drm_connector_helper_add(&hdmi->connector,
 				 &sun4i_hdmi_connector_helper_funcs);
-	ret = drmm_connector_hdmi_ini2(drm, &hdmi->connector,
-				       /*
-					* NOTE: Those are likely to be
-					* wrong, but I couldn't find the
-					* actual ones in the BSP.
-					*/
-				       "AW", "HDMI",
+	ret = drmm_connector_hdmi_init(drm, &hdmi->connector,
 				       &sun4i_hdmi_connector_funcs,
 				       &sun4i_hdmi_hdmi_connector_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       hdmi->ddc_i2c,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       8);
+				       hdmi->ddc_i2c);
 	if (ret) {
 		dev_err(dev,
 			"Couldn't initialise the HDMI connector\n");

-- 
2.55.0


