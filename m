Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5292CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 19:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gfAI0HScuKYPNHChmXTZDG5R10CcJ6qrZZTzTYJKqao=; b=RZfkNW/Ql9fr6cbgpRyea3ygJY
	/SXpipoRCKVLDS1WO/wWqEwHLIUkGbr/oLs1s2hXTMDl+aHJ/ygpzKWc+jCxWwLJEiFXIuX6Vo2bm
	A8Z8RGxohg50FiP16n6ruI/W7hqp8J9IuOW/6xjb5C6PYlfCmakndR1b5GV17tNZjRbLmqsYAfzVb
	e2az/pMbUDNZymR3SxQYxZChrxVhqlaZKPsq/cwit8LPwjVugFM4Bb1vMyaRmE/e/wKv3Hx38CWxr
	JnbcluuWBjDKIZ3nl4UsdftKFaZGWfeKW2/IJjfHCDlw/bgZr3RxYmhmhZsdWOM73Xy1wEn9KJl8F
	cD+JS2og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJyiZ-0000000E6hE-0ibU;
	Mon, 04 May 2026 19:12:35 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJyiG-0000000E6CM-17GI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 19:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1777921935; bh=gfAI0HScuKYPNHChmXTZDG5R10CcJ6qrZZTzTYJKqao=;
 b=MzLJlkP9Eo9qA7SZpznxebX5xd78HQnLotPA0baeTP30Z2tJB2xFD5DFEo63fahUFoznGkltx
 Gj5sOBx9G10dexi61giipvlD36XKgKDKdAGCWn8I6RPK55flPsOAQSBeX+WaLPFjV7fSxLZTm73
 3slXBO0P27JB9oLE9ranS8dNo7Z8g/73z7znD+U+NWAXyR3uqp77CYKUZj4wG6cLB4y2Tltdfnu
 Ig7BvwxZaUi59gbbn09uUcZ54i+/NIQIjUO9uSH8X4G/5/3WEloSOKFSidTQGvbhq2BUxDYh9Ax
 0HHRbhO0RwaIWJsUIcfMunvbEijkEw52erkhTiOPULWA==
X-Forward-Email-ID: 69f8ef8804bb1dff846bb9ca
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
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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
Subject: [PATCH v4 15/17] drm: bridge: dw_hdmi: Remove the empty dw_hdmi_setup_rx_sense()
Date: Mon,  4 May 2026 19:10:52 +0000
Message-ID: <20260504191059.275928-16-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504191059.275928-1-jonas@kwiboo.se>
References: <20260504191059.275928-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_121216_471599_B5D2236F 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

The dw_hdmi_setup_rx_sense() helper is empty and no longer needed after
recent RXSENSE and HPD rework, remove it.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v4: New patch
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 5 -----
 drivers/gpu/drm/meson/meson_dw_hdmi.c     | 3 ---
 include/drm/bridge/dw_hdmi.h              | 2 --
 3 files changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index e3ebb0dfdaf2..60b887249eba 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2987,11 +2987,6 @@ static irqreturn_t dw_hdmi_hardirq(int irq, void *dev_id)
 	return ret;
 }
 
-void dw_hdmi_setup_rx_sense(struct dw_hdmi *hdmi, bool hpd, bool rx_sense)
-{
-}
-EXPORT_SYMBOL_GPL(dw_hdmi_setup_rx_sense);
-
 static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 {
 	struct dw_hdmi *hdmi = dev_id;
diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index fef1702acb14..2a8756da569b 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -524,9 +524,6 @@ static irqreturn_t dw_hdmi_top_thread_irq(int irq, void *dev_id)
 		if (stat & HDMITX_TOP_INTR_HPD_RISE)
 			hpd_connected = true;
 
-		dw_hdmi_setup_rx_sense(dw_hdmi->hdmi, hpd_connected,
-				       hpd_connected);
-
 		drm_helper_hpd_irq_event(dw_hdmi->bridge->dev);
 		drm_bridge_hpd_notify(dw_hdmi->bridge,
 				      hpd_connected ? connector_status_connected
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 8500dd4f99d8..a612b9fa6dbb 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -186,8 +186,6 @@ struct dw_hdmi *dw_hdmi_bind(struct platform_device *pdev,
 
 void dw_hdmi_resume(struct dw_hdmi *hdmi);
 
-void dw_hdmi_setup_rx_sense(struct dw_hdmi *hdmi, bool hpd, bool rx_sense);
-
 int dw_hdmi_set_plugged_cb(struct dw_hdmi *hdmi, hdmi_codec_plugged_cb fn,
 			   struct device *codec_dev);
 void dw_hdmi_set_sample_non_pcm(struct dw_hdmi *hdmi, unsigned int non_pcm);
-- 
2.54.0


