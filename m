Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889C4C624D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBIseHXEToKSDd8vfH1OSr8InXk4Y+s36aCUDk9Dwsw=; b=ecUG45YU/PVOjFhldlPg0L9FeU
	xmmMRdW8pqzVmE/R3lRjN+TbaW3Dm1PzQ4ikimgB+0jE+1AVd9RsoYJemTncdi5J7sfNj+7hNVFWM
	p67Z7FwrieKIqCFlish/sRcF34mvmNEdel14f/rQg9IVhDpZMxBf/HDnFuZytX8vn7O+hJZaTQ3Qv
	LIMtkmcLVND58PYVvjQu1I4z8fSfAviiBLRqffmGXiocKYrWjv0ffKInt3SyNnoKEWRi+ltTz/QTI
	udDjTMah1kYwASZm1naxUAna6JHfItDAEiSwcbIhfIg5AvYxKHgZCGcIP0TAZLg5Ny9gQLxrTQ2F0
	VYuQEzNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TaR-0000000D2Ld-3bgY;
	Tue, 01 Sep 2026 18:51:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TZb-0000000D151-23ZI;
	Tue, 01 Sep 2026 18:51:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fBIseHXEToKSDd8vfH1OSr8InXk4Y+s36aCUDk9Dwsw=; b=qBEauCcTcbnq0Dogpcmb+e84Qw
	4zUqUvq8u3Mw0vncGDbD0r5HpCM4SV755+rYMseSEQ7EKtGpUTLrKI0451b4Ov9K/mANPbz/bd8md
	K7fshZDF2xQjXZV9BAiuxAPCzvmPjL165CJCqB4BriW8x2tuZC0vKr9TAu/jRvH2oE6NCnea7+rne
	XMSZa2tyLvUKYd0TxOllnesNxEqpiMEW84DeO7w5y1ACT+BuFMBaqirjdrqQv5QcFHGGM/EsMafcG
	PjsHMvFNrjYOnPbdXkRdH44jbtQlp9m8sWrMC7lQfQqQICAh+Rjkz4jmdDf0OsZ2IAjJxf4aZqPLv
	IR1kNGTg==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1TZX-0000000BHMx-3NUe;
	Tue, 01 Sep 2026 18:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788288662;
	bh=F/ORXJLv87LmKmtOIy0lgbR5TcfqZIJa8uHK88OlK5U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=g64yWRPaXMzyx3SbK6m/CRSH9lr5Tok67BePPFP/CO6ZaY86LEbfRj74I25nHNWs+
	 rootH8yt9o+I/bnfpZtUsIAWZsQrG/1QPTGdiz7X9xnBdpFv0zzlfz5n5WzV6IGM0I
	 DUEWuBaKk/b2V5EBHs+noOas0MHr2txR/uiHR0Tnpp5tup73bLny4MVjNCzzWsE6Ri
	 koBAzREPdy6kpK6weKtJIG4gCGUpgsfTS7t9TjqlzYAYR8Rtj5IS5dQNuLQsyFndFr
	 xWsxSF2X9g1Kmp5ofjBcMOo/QV0iDbDFs5tZ0J59kuDyd7nUlJVRVGjM2UK17qrWyB
	 0oeDegdwbdVmA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7AA1717E39B4;
	Tue, 01 Sep 2026 20:51:02 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 01 Sep 2026 21:50:53 +0300
Subject: [PATCH v11 29/74] drm/bridge: dw-hdmi-qp: Add HDMI 2.0 scrambling
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dw-hdmi-qp-scramb-v11-29-bc12954a0688@collabora.com>
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
 linux-fbdev@vger.kernel.org, Maud Spierings <maud_spierings@hotmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_195104_110554_85A1656A 
X-CRM114-Status: GOOD (  18.18  )
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

Add support for SCDC scrambling and the high TMDS clock ratio required
by HDMI 2.0 modes with TMDS character rates above 340 MHz, such as
4K@60Hz.

Hook the bridge into the DRM HDMI connector scrambling helpers so the
sink-side SCDC state and the controller scrambler are updated together
as part of the atomic enable and disable paths.  This allows the driver
to advertise HDMI 2.0 support when HPD is available.

Keep no-HPD configurations limited to HDMI 1.4, since SCDC access
requires a connected HDMI sink.

Modes above the HDMI 2.0 600 MHz TMDS character-rate limit are now
implicitly rejected by the DRM HDMI connector/bridge infrastructure,
making the dw_hdmi_qp_bridge_tmds_char_rate_valid() callback redundant.
Drop it.

Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B
Acked-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 60 ++++++++++++++++++----------
 1 file changed, 39 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 246c4161e627..ee74266b7aa9 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2021-2022 Rockchip Electronics Co., Ltd.
  * Copyright (c) 2024 Collabora Ltd.
+ * Copyright (c) 2025 Amazon.com, Inc. or its affiliates.
  *
  * Author: Algea Cao <algea.cao@rock-chips.com>
  * Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
@@ -751,6 +752,7 @@ static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
 	struct drm_connector_state *conn_state;
 	struct drm_connector *connector;
 	unsigned int op_mode;
+	int ret;
 
 	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
 	if (WARN_ON(!connector))
@@ -761,14 +763,20 @@ static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
 		return;
 
 	if (connector->display_info.is_hdmi) {
-		dev_dbg(hdmi->dev, "%s mode=HDMI %s rate=%llu bpc=%u\n", __func__,
-			drm_hdmi_connector_get_output_format_name(conn_state->hdmi.output_format),
-			conn_state->hdmi.tmds_char_rate, conn_state->hdmi.output_bpc);
 		op_mode = 0;
 		hdmi->tmds_char_rate = conn_state->hdmi.tmds_char_rate;
+
+		ret = drm_connector_hdmi_enable_scrambling(connector, conn_state);
+		if (ret)
+			dev_warn(hdmi->dev, "Failed to enable scrambling: %d\n", ret);
+
+		dev_dbg(hdmi->dev, "%s mode=HDMI %s rate=%llu bpc=%u scramb=%d\n", __func__,
+			drm_hdmi_connector_get_output_format_name(conn_state->hdmi.output_format),
+			conn_state->hdmi.tmds_char_rate, conn_state->hdmi.output_bpc,
+			connector->hdmi.scrambler_enabled);
 	} else {
-		dev_dbg(hdmi->dev, "%s mode=DVI\n", __func__);
 		op_mode = OPMODE_DVI;
+		dev_dbg(hdmi->dev, "%s mode=DVI\n", __func__);
 	}
 
 	hdmi->phy.ops->init(hdmi, hdmi->phy.data);
@@ -783,9 +791,13 @@ static void dw_hdmi_qp_bridge_atomic_disable(struct drm_bridge *bridge,
 					     struct drm_atomic_commit *state)
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
+	struct drm_connector *connector;
 
 	hdmi->tmds_char_rate = 0;
 
+	connector = drm_atomic_get_old_connector_for_encoder(state, bridge->encoder);
+	drm_connector_hdmi_disable_scrambling(connector);
+
 	hdmi->phy.ops->disable(hdmi, hdmi->phy.data);
 }
 
@@ -820,24 +832,24 @@ dw_hdmi_qp_bridge_edid_read(struct drm_bridge *bridge,
 	return drm_edid;
 }
 
-static enum drm_mode_status
-dw_hdmi_qp_bridge_tmds_char_rate_valid(const struct drm_bridge *bridge,
-				       const struct drm_display_mode *mode,
-				       unsigned long long rate)
+static int dw_hdmi_qp_bridge_scrambler_enable(struct drm_bridge *bridge)
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
 
-	/*
-	 * TODO: when hdmi->no_hpd is 1 we must not support modes that
-	 * require scrambling, including every mode with a clock above
-	 * HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ.
-	 */
-	if (rate > HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ) {
-		dev_dbg(hdmi->dev, "Unsupported TMDS char rate: %lld\n", rate);
-		return MODE_CLOCK_HIGH;
-	}
+	dw_hdmi_qp_write(hdmi, 1, SCRAMB_CONFIG0);
+	dev_dbg(hdmi->dev, "scrambler enabled\n");
 
-	return MODE_OK;
+	return 0;
+}
+
+static int dw_hdmi_qp_bridge_scrambler_disable(struct drm_bridge *bridge)
+{
+	struct dw_hdmi_qp *hdmi = bridge->driver_private;
+
+	dw_hdmi_qp_write(hdmi, 0, SCRAMB_CONFIG0);
+	dev_dbg(hdmi->dev, "scrambler disabled\n");
+
+	return 0;
 }
 
 static int dw_hdmi_qp_bridge_clear_avi_infoframe(struct drm_bridge *bridge)
@@ -1213,7 +1225,8 @@ static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
 	.hpd_enable = dw_hdmi_qp_bridge_hpd_enable,
 	.hpd_disable = dw_hdmi_qp_bridge_hpd_disable,
 	.edid_read = dw_hdmi_qp_bridge_edid_read,
-	.hdmi_tmds_char_rate_valid = dw_hdmi_qp_bridge_tmds_char_rate_valid,
+	.hdmi_scrambler_enable = dw_hdmi_qp_bridge_scrambler_enable,
+	.hdmi_scrambler_disable = dw_hdmi_qp_bridge_scrambler_disable,
 	.hdmi_clear_avi_infoframe = dw_hdmi_qp_bridge_clear_avi_infoframe,
 	.hdmi_write_avi_infoframe = dw_hdmi_qp_bridge_write_avi_infoframe,
 	.hdmi_clear_hdmi_infoframe = dw_hdmi_qp_bridge_clear_hdmi_infoframe,
@@ -1341,13 +1354,18 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 			   DRM_BRIDGE_OP_HDMI_AUDIO |
 			   DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME |
 			   DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME;
-	if (!hdmi->no_hpd)
-		hdmi->bridge.ops |= DRM_BRIDGE_OP_HPD;
 	hdmi->bridge.of_node = pdev->dev.of_node;
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Synopsys";
 	hdmi->bridge.product = "DW HDMI QP TX";
 
+	if (hdmi->no_hpd) {
+		hdmi->bridge.supported_hdmi_ver = HDMI_VERSION_1_4;
+	} else {
+		hdmi->bridge.supported_hdmi_ver = HDMI_VERSION_2_0;
+		hdmi->bridge.ops |= DRM_BRIDGE_OP_HPD;
+	}
+
 	if (plat_data->supported_formats)
 		hdmi->bridge.supported_formats = plat_data->supported_formats;
 

-- 
2.55.0


