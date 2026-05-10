Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB510CD37B9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 12:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PnDcLXlbaPre88s1ZNqSGlXUJXg3TERiDNCZdw2MtJ4=; b=ovCkPBIhMwqSzvbLXGI9n4c4B3
	rA/Dj6JdPcTETMnhOhy+rj1jlX+H8sN00qqwegrlEpCxtEb9zdrh4gDF5ChZaVYXhcXmX/Zrvr/Uj
	VIBO7sduhF9U5sqEBvxpUBJAtyJtxt9rqQ80r9iUkwB7KLC2BAkq5jSffWchXYBxPDWHf4ts448Ka
	spxyb4sgcW3oQp8d2SXWy0HFvb4q5vGYWgr67bb1A1G64z+2VWHMjj+ALquGQExGXVzWn8BiKudlr
	rarrn0OeVzBgt6tkCFMYH7aMOuMNl5pwP7SHtB1C1v+Yw2sQwVFVTvgIRIIrIa+vEU3kdu6Cc+ySg
	BGyvGnAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM3U4-0000000Aje7-1XkV;
	Sun, 10 May 2026 12:42:12 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM3Tz-0000000AjX3-3T2f
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 12:42:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1778416912; bh=PnDcLXlbaPre88s1ZNqSGlXUJXg3TERiDNCZdw2MtJ4=;
 b=R4ZF45VQbAoc8/Lql/IQhbqKit4T76yJw9VA5yKfsNhfmeoHrjwIL136hECVvH+xA0OKr3TYn
 5fkiDG6hrEUWSHsxKYi43k27x9MxzQKXNOqv6sqcimlEGAdvXtd4fNjLH7XEH//TERbFEjBcpIx
 i6n3TvndqyVQnlwKXdJSr5ZHca8/0KviBUPmmbpxVOqdIQuO5zLxI2d2XSWkW/HuhzNOa5gTv4q
 lbD44fhgGePiqJhlLLjgnr3jHXJ9+ZL9gZSwynMI46+7zMYW0Vs1/ma4UXTO60NhKD8QU8HbSye
 JKzU2oJrAIPR+PM/nZ3DSnMbHzSFDcGi1nwv8yJyBrZQ==
X-Forward-Email-ID: 6a007cf70d91f03a31a0bb1d
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.8.0
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
	Simona Vetter <simona@ffwll.ch>,
	Lucas Stach <l.stach@pengutronix.de>
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
Subject: [PATCH v5 02/21] drm: bridge: dw_hdmi: Only notify connected status on HPD interrupt
Date: Sun, 10 May 2026 12:40:46 +0000
Message-ID: <20260510124111.1226584-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260510124111.1226584-1-jonas@kwiboo.se>
References: <20260510124111.1226584-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_054208_321025_151817B8 
X-CRM114-Status: GOOD (  14.59  )
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

drm_helper_hpd_irq_event() and drm_bridge_hpd_notify() may incorrectly
be called with a connected status when HPD is high and RX sense is
changed. This typically happens when the HDMI cable is unplugged,
shortly before the HPD is changed to low.

The original intent of commit da09daf88108 ("drm: bridge: dw_hdmi: only
trigger hotplug event on link change") was to signal hotplug event at
correct interrupt states.

Based on the commit message the intent was to trigger hotplug event:
- when HPD goes high (plugin)
- when both HPD and RX sense has gone low (plugout)

However, following interrupt state changes can typically be observed
when the HDMI cable is unplugged:
- RX interrupt:  HPD=high RX=low  -> triggers a connected event
- HPD interrupt: HPD=low  RX=low  -> triggers a disconnected event

Fix this by only notify connected status on the HPD interrupt when HPD
is going high, not on the RX sense interrupt when RX sense is changed.

After this a connected event should be triggered when HPD=high at HPD
interrupt, and a disconnected event should be triggered when both
HPD=low and RX=low at either HPD or RX interrupt.

Fixes: da09daf88108 ("drm: bridge: dw_hdmi: only trigger hotplug event on link change")
Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v5: No change
v4: Collect r-b tag
v3: Update commit message
v2: New patch
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index d3e6a6562870..b7bfc0e9a6b2 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3157,7 +3157,8 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 			mutex_unlock(&hdmi->cec_notifier_mutex);
 		}
 
-		if (phy_stat & HDMI_PHY_HPD)
+		if ((intr_stat & HDMI_IH_PHY_STAT0_HPD) &&
+		    (phy_stat & HDMI_PHY_HPD))
 			status = connector_status_connected;
 
 		if (!(phy_stat & (HDMI_PHY_HPD | HDMI_PHY_RX_SENSE)))
-- 
2.54.0


