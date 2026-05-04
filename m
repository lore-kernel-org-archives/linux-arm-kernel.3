Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937E6CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 19:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTGVvk3csWYogsWuMFr9WOSiPdXzW7GvuCbBmKrQ9fw=; b=3E9lhvx365jl4WXGOrG0rRLR3w
	l/bZkrjmL4nVS+zd1I8cv+KqywEPdG4t22u4xeJbIRcSv0miJSQ+tb1OJ9PdlNCGM9Y61R6cGXbJq
	Me8YXB26kiuEtRTW2nU7knHLXFeR2BXddwHDCxRa4f1qdJZ7bHumtQZdwlsEssLZXJ1BmR9dcorTP
	PuOWnbcVsVZ/f11S5wt2CwWyJeMAOVEOj9Kko89Ey3fIhdW0Xa2ppHFqCEV/GMda4UrxcS16PbnWe
	mHUsu038aVKb7EL8IqtQgPnW4ru/x1wI0PNFKdnpqeI1EbkkNxLmitj4WMbjchPJ6cfT+sC2Aa11Q
	6skAbHpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJyi8-0000000E5x7-1Cdq;
	Mon, 04 May 2026 19:12:08 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJyhq-0000000E5Qa-3XxM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 19:11:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1777921910; bh=bTGVvk3csWYogsWuMFr9WOSiPdXzW7GvuCbBmKrQ9fw=;
 b=cQqe+GuC/WsZszLZlSKdlOh3wC4yBL6o7W45Eden3mA1taG29BgwBXwJ2JW2b+Cs3rgNLja2P
 J3VOKvF1A4E4yERD3m9UKnOBxxmGmcPQWVqrUpFn13H42N+Kh6eUdouDGM5u42t4fDtGwodeH9r
 ahNwwBr8lhes4qZbVveevIr/BOE6eDF4Se0kiiqa1oO8iNjKPjP1rscJS4c287/W72s1zO3Uu8Y
 MclGckfZw4nkwsO4MyHW+AAxlgxHXgCf39/an/kumAZ49N+ef3L22v4IFWIsRGSQQ8ihJf/YKCR
 CJlnulkEEhcxMsPZI2wwzhCMW/2TUr5P1D/zW9Iy4/pw==
X-Forward-Email-ID: 69f8ef6f04bb1dff846bb913
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.7.7
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
Subject: [PATCH v4 09/17] drm: bridge: dw_hdmi: Extract dw_hdmi_connector_status_update()
Date: Mon,  4 May 2026 19:10:46 +0000
Message-ID: <20260504191059.275928-10-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504191059.275928-1-jonas@kwiboo.se>
References: <20260504191059.275928-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_121151_050352_2BA859CA 
X-CRM114-Status: GOOD (  10.91  )
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

Move connector EDID update and CEC phys addr handling to a helper
function as a preparation before moving EDID refresh from get_modes
funcs to detect/force funcs.

Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v4: Collect r-b tag
v3: New patch
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 30 +++++++++++++----------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index fc4f255c2a2f..0b56ad7316e3 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2466,6 +2466,21 @@ static const struct drm_edid *dw_hdmi_edid_read(struct dw_hdmi *hdmi,
  * DRM Connector Operations
  */
 
+static void
+dw_hdmi_connector_status_update(struct drm_connector *connector,
+				enum drm_connector_status status)
+{
+	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi, connector);
+	const struct drm_edid *drm_edid;
+
+	drm_edid = dw_hdmi_edid_read(hdmi, connector);
+	drm_edid_connector_update(connector, drm_edid);
+	drm_edid_free(drm_edid);
+
+	cec_notifier_set_phys_addr(hdmi->cec_notifier,
+				   connector->display_info.source_physical_address);
+}
+
 static enum drm_connector_status
 dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
 {
@@ -2483,20 +2498,9 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
 
 static int dw_hdmi_connector_get_modes(struct drm_connector *connector)
 {
-	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
-					     connector);
-	const struct drm_edid *drm_edid;
-	int ret;
+	dw_hdmi_connector_status_update(connector, connector->status);
 
-	drm_edid = dw_hdmi_edid_read(hdmi, connector);
-
-	drm_edid_connector_update(connector, drm_edid);
-	cec_notifier_set_phys_addr(hdmi->cec_notifier,
-				   connector->display_info.source_physical_address);
-	ret = drm_edid_connector_add_modes(connector);
-	drm_edid_free(drm_edid);
-
-	return ret;
+	return drm_edid_connector_add_modes(connector);
 }
 
 static int dw_hdmi_connector_atomic_check(struct drm_connector *connector,
-- 
2.54.0


