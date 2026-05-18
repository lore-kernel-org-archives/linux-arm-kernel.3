Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672D1CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 18:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pRDjhi4A67HVrKb8G93iuKDjCCMCnoa34s8OGiHVDR4=; b=Gav9pL7xFkZpl2icfMD0et/u8q
	7i19QOMEn6faiDDaY3B6+XKwK0f3b6bOCOHh4jNsoX0DuL/WgNcAmM4Q7ku3MAUiF2H0bHngvUs1j
	M13L2UFXE7oLu912viBgJnq0o1sHhUdVThAhVDoYIhLR4rwnexQ3EHTn803JCT0csn8TKM7uQJUhG
	1kNsRQiK/rf7Hp7GHdxtppJbZOwXbagem0v9oKUczMgPdxaG2qT7Gz0yYImvqcqT45yDT/AaIyc/o
	DzxHWeAd5dUoBhM+JBZQ8LFg8FY36h5cbkMMoXT/79KLtrqgcQQGH7qyYNH0gnwdCle+tMy39tAGk
	cZAj3W9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2TV-0000000GX2H-13uS;
	Mon, 18 May 2026 18:13:57 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2TS-0000000GWzk-0sCp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 18:13:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779128025; bh=pRDjhi4A67HVrKb8G93iuKDjCCMCnoa34s8OGiHVDR4=;
 b=EyUZiQuQfHY/BICTSNalXAgZMwg+d6+SdhIHyjVsxJ0Xecp8nbl6BJW6InkLi+AMRQTaemsJx
 FkfEA/a5TnmqD4A++jWrLL9i7V6errS9qwS4BHvsONMxcdfUL3uyl/jNCBXL5uK4B8PxG2unjf3
 ZJhKfdbFnoJoXJpWjNaK0+In5xDplSijxBij1XMzUX5w9FH1DcLSQscRiO+SZpdGfIIVvUaAWVp
 ncyz8AQNyDi2JJ0QbwNgnHjLjON9ZrvmWYdzF5A5H64XpzpOO9SA+Sh4jsuxJsGTips+iiEjSiO
 pg9Wc3ZjuQ1X5/sI01723fLYnl6FkufBiAkrdy6sXb0g==
X-Forward-Email-ID: 6a0b546ab84dbc72d2274f59
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Liu Ying <victor.liu@nxp.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 16/23] drm: bridge: dw_hdmi: Update EDID and CEC phys addr in bridge detect()
Date: Mon, 18 May 2026 18:01:52 +0000
Message-ID: <20260518180206.2480119-17-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518180206.2480119-1-jonas@kwiboo.se>
References: <20260518180206.2480119-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_111354_284667_AFCE8DF1 
X-CRM114-Status: GOOD (  12.04  )
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

Update EDID and CEC phys addr in the bridge detect() func to closely
match the behavior of a bridge connector with a HDMI bridge attached
and the dw-hdmi connector.

This change introduce a slight delay to the bridge connector detect()
and get_modes() funcs due to multiple EDID reads. This is an acceptable
added delay to help ensure EDID and CEC phys addr always are correct.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v7: Update commit message
v6: New patch

This is a temporary change until dw-hdmi is fully converted into a
HDMI bridge in a future part of this multi-series effort.

The patch "drm/bridge-connector: Use cached connector status in
.get_modes()" [1] can help remove one unnecessary EDID read until
dw-hdmi is fully converted into a HDMI bridge.

[1] https://lore.kernel.org/dri-devel/20260426-dw-hdmi-qp-scramb-v5-3-d778e70c317b@collabora.com/
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 37406555af7b..0c4388e7aa5e 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2947,8 +2947,17 @@ static enum drm_connector_status
 dw_hdmi_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
+	enum drm_connector_status status;
 
-	return dw_hdmi_detect(hdmi);
+	status = dw_hdmi_detect(hdmi);
+
+	/*
+	 * Update EDID and CEC phys addr to match the behavior of a bridge
+	 * connector with a HDMI bridge attached and the dw-hdmi connector.
+	 */
+	dw_hdmi_connector_status_update(hdmi, connector, status);
+
+	return status;
 }
 
 static const struct drm_edid *dw_hdmi_bridge_edid_read(struct drm_bridge *bridge,
-- 
2.54.0


