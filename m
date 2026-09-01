Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868A9C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1m7p93mjLfPxSWMbv3pLNDOYf1eYKvY+H2exLWC6ts=; b=QoXYA5pr7CXyzXlPoMqdJLnjMA
	LPKjQEk7jfpjRkHEewLKDxqSuIeorSLvcFVo4Ugn9GgsnYU56Uk00qkoBc2D7AV4kIiIbDQr9Qzsh
	3jVVtBwRemti8a0M6N0/THpGuK6tHEcOLZ6/6JIIEOATSAZF3SIl4EZvk3QOxL2W5C3oNLwxgGl7/
	ZFz1A57cUz+8x68b+zquePPt3XofVdpHfilmNKVKLDDyNhd0yynKH/IEOirHEMOiKv2neWfCQR4H+
	GoUcKCzkPdDf4YO0UiYilq09ranSFsqYdXeMoV4vDch2xc30UEyi9eSRMBIMlTZgvurjLCv2IUkNC
	5nQRfwDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Tb3-0000000D3be-3kSy;
	Tue, 01 Sep 2026 18:52:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TZq-0000000D1L5-0RQ1;
	Tue, 01 Sep 2026 18:51:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=f1m7p93mjLfPxSWMbv3pLNDOYf1eYKvY+H2exLWC6ts=; b=S31JMAHEkA0tzWlkZ/oplZTb89
	VkDbZLlanGjDo3hagEw3Cq6XSU2wBEA+rLo+RMQc6UzCYJkgLtp6vPJR60LQFnidLAtZ/pQD8GSvK
	dxDX7kh9XUHYoIpxiteie50R96tC5CgD87pfGRwSM/C7hnqyo6QdpRpeyhT0qqz/6mb7dj8ug7rlg
	wELZFImLND9FtDz70gbrBi0CSyV8saGK+HUcK2xki+sp8dZtIFk+NidhgTzgjlGJgofNNoJzk2Sf6
	vP2u4fQiD8cKdLvXFDJwm/FeFDr1oiHN3JmhRbn8PyeiQGqePLt0rAEg7+4eJbIoTC0CIcTtQZZF1
	+xLxRJjQ==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TZk-00000005afN-1Fdl;
	Tue, 01 Sep 2026 18:51:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788288675;
	bh=soG6OH4rGe++2MGJbbJQb1ItRjhRkZ2mAadAs/HdPYA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b87MGsuvSdP6RSwSeM6+07OGqTEDo2mCf7Lao9sglKkDKpaRPlHYmRAhTvgd9Dx3F
	 cCmFaZXjHHcEDXRCPj6dI6nGWQWsc5IVgM2/HYNHEjgtTWOCmzBfPtAZ8OjB6qk0rc
	 ozK+C234lkx88FevJZbqZzVw59Ab2ZnV/J1z00+Gmh2oQFFVInDS/tk0OsfO1UGiIJ
	 hEf0ThEISFF6IPK6oW017/01noZ5yTN0ew51+jstG3FY+ei6BpdIjRkvAKwo1GsLm7
	 L3p7OQhYdwNjGIemksY4DNVNRUB2fdx2l7PV2OPYYEoLb24xJuR9wfHZK08XnnCjQt
	 YJUWJ7AAw+8kw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0F7DF17E3C68;
	Tue, 01 Sep 2026 20:51:15 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 01 Sep 2026 21:51:10 +0300
Subject: [PATCH v11 46/74] drm/vc4: hdmi: Convert to
 drmm_connector_hdmi_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dw-hdmi-qp-scramb-v11-46-bc12954a0688@collabora.com>
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
X-CRM114-CacheID: sfid-20260901_195117_445986_E9A4055C 
X-CRM114-Status: GOOD (  16.00  )
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

Switch driver over to the new drmm_connector_hdmi_init() signature. The
vendor, product, supported_formats and max_bpc values previously passed
as arguments are now provided through struct drm_connector_hdmi_funcs,
together with the new supported_hdmi_ver field.

VC4 needs three distinct capability sets, based on the maximum TMDS
character rate and color depth supported by each controller variant:

  RPi 0-3:              162 MHz (HDMI 1.2),  8-bit
  RPi 4 (HDMI1):        340 MHz (HDMI 1.4), 12-bit
  RPi 4 (HDMI0), RPi 5: 600 MHz (HDMI 2.0), 12-bit

Introduce three drm_connector_hdmi_funcs instances for these tiers and
assign them to the corresponding vc4_hdmi_variant entries. Additionally,
drop the now redundant .supports_hdr field of struct vc4_hdmi_variant.

As the callback members are identical across all three, factor the
shared initializers into a VC4_HDMI_CONNECTOR_FUNCS_COMMON macro to
avoid duplication, with each variant adding only its distinguishing
max_bpc/supported_hdmi_ver fields.

Note that HDMI 2.0 cannot be advertised at this point, since it requires
converting the driver to common scrambling infrastructure. This will be
handled separately, hence temporarily use HDMI_VERSION_UNKNOWN for the
related hdmi_funcs instance to skip generic scrambler and TMDS rate
validation, and continue to rely on current driver-local implementation.

No functional change intended.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 93 ++++++++++++++++++++++++------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  6 +--
 2 files changed, 56 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 6bd5aa77538e..a03e50e8afcb 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -510,7 +510,6 @@ static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs =
 	.mode_valid = drm_hdmi_connector_mode_valid,
 };
 
-static const struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs;
 static const struct drm_connector_hdmi_audio_funcs vc4_hdmi_audio_funcs;
 
 static int vc4_hdmi_connector_init(struct drm_device *dev,
@@ -518,22 +517,13 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 {
 	struct drm_connector *connector = &vc4_hdmi->connector;
 	struct drm_encoder *encoder = &vc4_hdmi->encoder.base;
-	unsigned int max_bpc = 8;
 	int ret;
 
-	if (vc4_hdmi->variant->supports_hdr)
-		max_bpc = 12;
-
-	ret = drmm_connector_hdmi_ini2(dev, connector,
-				       "Broadcom", "Videocore",
+	ret = drmm_connector_hdmi_init(dev, connector,
 				       &vc4_hdmi_connector_funcs,
-				       &vc4_hdmi_hdmi_connector_funcs,
+				       vc4_hdmi->variant->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       vc4_hdmi->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422) |
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444),
-				       max_bpc);
+				       vc4_hdmi->ddc);
 	if (ret)
 		return ret;
 
@@ -1722,28 +1712,51 @@ vc4_hdmi_connector_clock_valid(const struct drm_connector *connector,
 	return MODE_OK;
 }
 
-static const struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs = {
-	.tmds_char_rate_valid	= vc4_hdmi_connector_clock_valid,
-	.avi = {
-		.clear_infoframe = vc4_hdmi_clear_avi_infoframe,
-		.write_infoframe = vc4_hdmi_write_avi_infoframe,
-	},
-	.hdmi = {
-		.clear_infoframe = vc4_hdmi_clear_hdmi_infoframe,
-		.write_infoframe = vc4_hdmi_write_hdmi_infoframe,
-	},
-	.audio = {
-		.clear_infoframe = vc4_hdmi_clear_audio_infoframe,
-		.write_infoframe = vc4_hdmi_write_audio_infoframe,
-	},
-	.hdr_drm = {
-		.clear_infoframe = vc4_hdmi_clear_hdr_drm_infoframe,
-		.write_infoframe = vc4_hdmi_write_hdr_drm_infoframe,
-	},
-	.spd = {
-		.clear_infoframe = vc4_hdmi_clear_spd_infoframe,
-		.write_infoframe = vc4_hdmi_write_spd_infoframe,
-	},
+#define VC4_HDMI_CONNECTOR_FUNCS_COMMON						\
+	.vendor			 = "Broadcom",					\
+	.product		 = "Videocore",					\
+	.supported_formats	 = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |	\
+				   BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422) |	\
+				   BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444),	\
+	.tmds_char_rate_valid	 = vc4_hdmi_connector_clock_valid,		\
+	.avi = {								\
+		.clear_infoframe = vc4_hdmi_clear_avi_infoframe,		\
+		.write_infoframe = vc4_hdmi_write_avi_infoframe,		\
+	},									\
+	.hdmi = {								\
+		.clear_infoframe = vc4_hdmi_clear_hdmi_infoframe,		\
+		.write_infoframe = vc4_hdmi_write_hdmi_infoframe,		\
+	},									\
+	.audio = {								\
+		.clear_infoframe = vc4_hdmi_clear_audio_infoframe,		\
+		.write_infoframe = vc4_hdmi_write_audio_infoframe,		\
+	},									\
+	.hdr_drm = {								\
+		.clear_infoframe = vc4_hdmi_clear_hdr_drm_infoframe,		\
+		.write_infoframe = vc4_hdmi_write_hdr_drm_infoframe,		\
+	},									\
+	.spd = {								\
+		.clear_infoframe = vc4_hdmi_clear_spd_infoframe,		\
+		.write_infoframe = vc4_hdmi_write_spd_infoframe,		\
+	}
+
+static const struct drm_connector_hdmi_funcs vc4_hdmi_connector_funcs_hdmi12 = {
+	VC4_HDMI_CONNECTOR_FUNCS_COMMON,
+	.max_bpc		= 8,
+	.supported_hdmi_ver	= HDMI_VERSION_1_2,
+};
+
+static const struct drm_connector_hdmi_funcs vc4_hdmi_connector_funcs_hdmi14 = {
+	VC4_HDMI_CONNECTOR_FUNCS_COMMON,
+	.max_bpc		= 12,
+	.supported_hdmi_ver	= HDMI_VERSION_1_4,
+};
+
+static const struct drm_connector_hdmi_funcs vc4_hdmi_connector_funcs_hdmi20 = {
+	VC4_HDMI_CONNECTOR_FUNCS_COMMON,
+	.max_bpc		= 12,
+	/* TODO: set HDMI_VERSION_2_0 and convert to common scrambler infra */
+	.supported_hdmi_ver	= HDMI_VERSION_UNKNOWN,
 };
 
 #define WIFI_2_4GHz_CH1_MIN_FREQ	2400000000ULL
@@ -3359,7 +3372,7 @@ static const struct vc4_hdmi_variant bcm2835_variant = {
 	.phy_rng_enable		= vc4_hdmi_phy_rng_enable,
 	.phy_rng_disable	= vc4_hdmi_phy_rng_disable,
 	.channel_map		= vc4_hdmi_channel_map,
-	.supports_hdr		= false,
+	.hdmi_funcs		= &vc4_hdmi_connector_funcs_hdmi12,
 };
 
 static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
@@ -3387,8 +3400,8 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
 	.phy_rng_enable		= vc5_hdmi_phy_rng_enable,
 	.phy_rng_disable	= vc5_hdmi_phy_rng_disable,
 	.channel_map		= vc5_hdmi_channel_map,
-	.supports_hdr		= true,
 	.hp_detect		= vc5_hdmi_hp_detect,
+	.hdmi_funcs		= &vc4_hdmi_connector_funcs_hdmi20,
 };
 
 static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
@@ -3416,8 +3429,8 @@ static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
 	.phy_rng_enable		= vc5_hdmi_phy_rng_enable,
 	.phy_rng_disable	= vc5_hdmi_phy_rng_disable,
 	.channel_map		= vc5_hdmi_channel_map,
-	.supports_hdr		= true,
 	.hp_detect		= vc5_hdmi_hp_detect,
+	.hdmi_funcs		= &vc4_hdmi_connector_funcs_hdmi14,
 };
 
 static const struct vc4_hdmi_variant bcm2712_hdmi0_variant = {
@@ -3443,8 +3456,8 @@ static const struct vc4_hdmi_variant bcm2712_hdmi0_variant = {
 	.phy_init		= vc6_hdmi_phy_init,
 	.phy_disable		= vc6_hdmi_phy_disable,
 	.channel_map		= vc5_hdmi_channel_map,
-	.supports_hdr		= true,
 	.hp_detect		= vc5_hdmi_hp_detect,
+	.hdmi_funcs		= &vc4_hdmi_connector_funcs_hdmi20,
 };
 
 static const struct vc4_hdmi_variant bcm2712_hdmi1_variant = {
@@ -3470,8 +3483,8 @@ static const struct vc4_hdmi_variant bcm2712_hdmi1_variant = {
 	.phy_init		= vc6_hdmi_phy_init,
 	.phy_disable		= vc6_hdmi_phy_disable,
 	.channel_map		= vc5_hdmi_channel_map,
-	.supports_hdr		= true,
 	.hp_detect		= vc5_hdmi_hp_detect,
+	.hdmi_funcs		= &vc4_hdmi_connector_funcs_hdmi20,
 };
 
 static const struct of_device_id vc4_hdmi_dt_match[] = {
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 29d461d4ee49..d5ffcc17de32 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -90,11 +90,11 @@ struct vc4_hdmi_variant {
 	/* Callback to get channel map */
 	u32 (*channel_map)(struct vc4_hdmi *vc4_hdmi, u32 channel_mask);
 
-	/* Enables HDR metadata */
-	bool supports_hdr;
-
 	/* Callback for hardware specific hotplug detect */
 	bool (*hp_detect)(struct vc4_hdmi *vc4_hdmi);
+
+	/* HDMI-related connector callbacks and controller capabilities */
+	const struct drm_connector_hdmi_funcs *hdmi_funcs;
 };
 
 /* HDMI audio information */

-- 
2.55.0


