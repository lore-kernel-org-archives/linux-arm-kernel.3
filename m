Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC9ACD4F59
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 18:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9uqA4jKYzliYkZko16kXvMFNWZFyXqBx7ysVDcNYMxw=; b=j8xWyvjn2ihQlsbzv2akUc+EDi
	jHzVyWUo1AQ8KRdW05tP/wGbxVz0jVHjt1KMxZxZN8o+Wq2bIkVMeUCif/FUrQsBDjRAkHzbSJM0i
	stxIFedqBFzqUgmfMOimvXcR8gLMcnP501mH3ufueMzKvXrzLIHLuG2Z1LhwWMG2bDTfpp179P8aL
	XbzeGwYv30+0qlCS63CAXZS99I7u2+m0NnqRetzHN70I/S1dzIUnP+FnussSAfcx7s9E870IU7Cvg
	5m8ePDO/E+l5B/WPZxuCfqs6vfRtlr5Y9tNPDvBU+ji3KJZdiMAu56p7nca1BK1qR+zbG2n4VnUcb
	gHIZTetg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2K7-0000000GVJF-0Ozw;
	Mon, 18 May 2026 18:04:15 +0000
Received: from [2a02:6ea0:d71e::15] (helo=smtp.forwardemail.net)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2Jk-0000000GUhy-2v7F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 18:04:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779127432; bh=9uqA4jKYzliYkZko16kXvMFNWZFyXqBx7ysVDcNYMxw=;
 b=x23iHkYnSp9N4fGjxWPvQER1tr2e5or4kxuYs+53aXSgQhC22Ro+itsN8HOzV/UoA2oijMZ2l
 XmTY7G5mdFMfGVQI3CcBNPDSymz4/admD9wWc5LXStA1j58mKLVdTbMUgONmVekMwsOWA0WrB94
 2oDSdKZJzHEl8H1b+7EV0PXHYqoJ6jclBq3BmrOodS71wVpEX6x/LDJo4yQxF25zKy8dLjqYOmT
 Jtx1dL7LaO5ZW8RTk9hEJClLppOY/JpeD7ozH1jdt7ad+y3fHjkvS92dTxBjzxNb9XIXTH2/dWa
 6HSwhzQeqjw+e/segYjdZnvZpmUNUaHo3xPYXrF2zhEw==
X-Forward-Email-ID: 6a0b5485b84dbc72d2274ffb
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
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
	Liu Ying <victor.liu@nxp.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Christian Hewitt <christianshewitt@gmail.com>,
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
Subject: [PATCH v7 22/23] drm: bridge: dw_hdmi: Remove the empty dw_hdmi_phy_update_hpd()
Date: Mon, 18 May 2026 18:01:58 +0000
Message-ID: <20260518180206.2480119-23-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518180206.2480119-1-jonas@kwiboo.se>
References: <20260518180206.2480119-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_110352_921193_AEAD5F95 
X-CRM114-Status: GOOD (  10.96  )
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

The dw_hdmi_phy_update_hpd() helper is empty and no longer needed after
recent RXSENSE and HPD rework, remove it.

Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v7: No change
v6: Collect t-b tag
v5: No change
v4: New patch
---
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 1 -
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c   | 7 -------
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 2 --
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c      | 2 --
 include/drm/bridge/dw_hdmi.h                | 4 ----
 5 files changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
index 8e8cfd66f23b..20d389dbfdc5 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
@@ -78,7 +78,6 @@ static const struct dw_hdmi_phy_ops imx8mp_hdmi_phy_ops = {
 	.disable	= imx8mp_hdmi_phy_disable,
 	.setup_hpd	= im8mp_hdmi_phy_setup_hpd,
 	.read_hpd	= dw_hdmi_phy_read_hpd,
-	.update_hpd	= dw_hdmi_phy_update_hpd,
 };
 
 static int imx8mp_dw_hdmi_bind(struct device *dev)
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 42d630efb875..c596534510da 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1687,12 +1687,6 @@ enum drm_connector_status dw_hdmi_phy_read_hpd(struct dw_hdmi *hdmi,
 }
 EXPORT_SYMBOL_GPL(dw_hdmi_phy_read_hpd);
 
-void dw_hdmi_phy_update_hpd(struct dw_hdmi *hdmi, void *data,
-			    bool force, bool disabled, bool rxsense)
-{
-}
-EXPORT_SYMBOL_GPL(dw_hdmi_phy_update_hpd);
-
 void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void *data)
 {
 	/*
@@ -1716,7 +1710,6 @@ static const struct dw_hdmi_phy_ops dw_hdmi_synopsys_phy_ops = {
 	.init = dw_hdmi_phy_init,
 	.disable = dw_hdmi_phy_disable,
 	.read_hpd = dw_hdmi_phy_read_hpd,
-	.update_hpd = dw_hdmi_phy_update_hpd,
 	.setup_hpd = dw_hdmi_phy_setup_hpd,
 };
 
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 0dc1eb5d2ae3..7136e713df2e 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -413,7 +413,6 @@ static const struct dw_hdmi_phy_ops rk3228_hdmi_phy_ops = {
 	.init		= dw_hdmi_rockchip_genphy_init,
 	.disable	= dw_hdmi_rockchip_genphy_disable,
 	.read_hpd	= dw_hdmi_phy_read_hpd,
-	.update_hpd	= dw_hdmi_phy_update_hpd,
 	.setup_hpd	= dw_hdmi_rk3228_setup_hpd,
 };
 
@@ -449,7 +448,6 @@ static const struct dw_hdmi_phy_ops rk3328_hdmi_phy_ops = {
 	.init		= dw_hdmi_rockchip_genphy_init,
 	.disable	= dw_hdmi_rockchip_genphy_disable,
 	.read_hpd	= dw_hdmi_rk3328_read_hpd,
-	.update_hpd	= dw_hdmi_phy_update_hpd,
 	.setup_hpd	= dw_hdmi_rk3328_setup_hpd,
 };
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index 4fa69c463dc4..2ac99b8ce8c4 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -221,7 +221,6 @@ static const struct dw_hdmi_phy_ops sun8i_a83t_hdmi_phy_ops = {
 	.init		= sun8i_a83t_hdmi_phy_config,
 	.disable	= sun8i_a83t_hdmi_phy_disable,
 	.read_hpd	= dw_hdmi_phy_read_hpd,
-	.update_hpd	= dw_hdmi_phy_update_hpd,
 	.setup_hpd	= dw_hdmi_phy_setup_hpd,
 };
 
@@ -395,7 +394,6 @@ static const struct dw_hdmi_phy_ops sun8i_h3_hdmi_phy_ops = {
 	.init		= sun8i_h3_hdmi_phy_config,
 	.disable	= sun8i_h3_hdmi_phy_disable,
 	.read_hpd	= dw_hdmi_phy_read_hpd,
-	.update_hpd	= dw_hdmi_phy_update_hpd,
 	.setup_hpd	= dw_hdmi_phy_setup_hpd,
 };
 
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index a612b9fa6dbb..10013b8d3adb 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -118,8 +118,6 @@ struct dw_hdmi_phy_ops {
 		    const struct drm_display_mode *mode);
 	void (*disable)(struct dw_hdmi *hdmi, void *data);
 	enum drm_connector_status (*read_hpd)(struct dw_hdmi *hdmi, void *data);
-	void (*update_hpd)(struct dw_hdmi *hdmi, void *data,
-			   bool force, bool disabled, bool rxsense);
 	void (*setup_hpd)(struct dw_hdmi *hdmi, void *data);
 };
 
@@ -213,8 +211,6 @@ void dw_hdmi_phy_gen2_reset(struct dw_hdmi *hdmi);
 
 enum drm_connector_status dw_hdmi_phy_read_hpd(struct dw_hdmi *hdmi,
 					       void *data);
-void dw_hdmi_phy_update_hpd(struct dw_hdmi *hdmi, void *data,
-			    bool force, bool disabled, bool rxsense);
 void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void *data);
 
 bool dw_hdmi_bus_fmt_is_420(struct dw_hdmi *hdmi);
-- 
2.54.0


