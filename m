Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFFFCD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 18:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hZiUkfIGiN8nQnQfqNQPTR4hVnEkYNLDTXPMKl0d0I=; b=hgKKkZEU7wW0z+pVHGq5S2N8SG
	PZFb7T/KrWV4ub6YLzsCY0QWx53gTaW/3/q/b1+eSJzXAWZtOLmOVo2gNh8j0lZsfBcUSTXFuQB84
	DgPvRHaXhkgK0cVGgKTZIkkYzLXkmNMYKabrI3WSBk2jjVdMUa0+5EScbBkZo6Bt0HT1fn8Ad4zIv
	g6darno3oyX+UEISbkCuWmiLEihp2oMaMvUbz0C8t2FazTvPuFNrBVV8dyVWjBhU0WONGeErhj12b
	aLf6Qn+P1kg2cSehml+oHY40vNHhJODaHzvam8UFdSZFnH7OLVb2h1QwUiLe9c0lhF4aThaZ2ha64
	5udeZx2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2Jb-0000000GUS4-3cbC;
	Mon, 18 May 2026 18:03:43 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2JU-0000000GUCe-3b6l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 18:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779127416; bh=/hZiUkfIGiN8nQnQfqNQPTR4hVnEkYNLDTXPMKl0d0I=;
 b=GpxA/ofTPszh8XDD2h1fr0Ya2OjQ5Mzt/ZpGrDymGCbcWWJJlHWdcGfA9D/qywIcftvOb99lf
 XMPsq+MhfSzld/em66LRRUYJa7gfL2Sujx5q8ubles0t9oMTosuxefxEfkxRxHQnN8QxffPDXre
 8uyZpNXUmDuHVOjLMWQGHQt56WZ/9MnoS82IdppxejCI/glUMVe7FMMj4bQAOYPr5G3fbeo0YG2
 g+q8VWGzmmI4sGEzZdJaXT/+7weSp59CRvJO8mpGiK1ZTaTpLLSG6xW6AGFtHcc76dFOXbqQSYt
 QXCEinIMIwNBQOCDpKBhhlOeOOtqzBBsYWJ38OF5yjkw==
X-Forward-Email-ID: 6a0b5472b84dbc72d2274f8f
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
Subject: [PATCH v7 18/23] drm: bridge: dw_hdmi: Drop call to drm_bridge_hpd_notify()
Date: Mon, 18 May 2026 18:01:54 +0000
Message-ID: <20260518180206.2480119-19-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518180206.2480119-1-jonas@kwiboo.se>
References: <20260518180206.2480119-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_110337_108644_FD0DC645 
X-CRM114-Status: GOOD (  15.40  )
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

The use of calls to both drm_helper_hpd_irq_event() and
drm_bridge_hpd_notify() from the HPD IRQ handler may cause multiple
hotplug uevents and modesets when the bridge connector is used.

Use of drm_helper_hpd_irq_event() cause the internal DRM function
check_connector_changed() to be called, which in turn calls the
connector detect()/force() funcs to detect any connection status or
epoch changes, and when changed trigger a hotplug uevent. This also
help ensure that EDID and CEC phys addr is updated.

If only a call drm_bridge_hpd_notify() would be used, a custom connector
status/EDID change detection logic needs to be implemented, to fully
match what check_connector_changed() already provides.

The bridge connector detect() func also ensures that any hpd_notify()
funcs are called for all bridges in the chain, so there is not really
any need to have a call to drm_bridge_hpd_notify() here.

With both calls there is two hotplug uevents, two modesets and a total
of four .hpd_notify() calls (using a bridge connector):

  dw_hdmi_irq(): EVENT=plugout
  drm_helper_hpd_irq_event():
    dw_hdmi_bridge_hpd_notify(status=2)
    [drm:check_connector_changed] [CONNECTOR:46:HDMI-A-1] status updated from connected to disconnected
    [drm:check_connector_changed] [CONNECTOR:46:HDMI-A-1] Changed epoch counter 1 => 2
    [drm:drm_sysfs_connector_hotplug_event] [CONNECTOR:46:HDMI-A-1] generating connector hotplug event
   drm_client_hotplug():
    [drm:drm_fb_helper_hotplug_event]
    [drm:drm_client_modeset_probe]
    [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:46:HDMI-A-1]
    dw_hdmi_bridge_hpd_notify(status=2)
    [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:46:HDMI-A-1] disconnected
    [drm:drm_edid_connector_update] [CONNECTOR:46:HDMI-A-1] EDID changed, epoch counter 3
    [drm:drm_client_modeset_probe] No connectors reported connected with modes
    [drm:drm_client_modeset_probe] [CONNECTOR:46:HDMI-A-1] enabled? no
    [drm:drm_client_firmware_config.isra.0] Not using firmware configuration
    [drm:drm_client_modeset_probe] picking CRTCs for 3840x2160 config
    [drm:drm_client_hotplug] fbdev: ret=0
  drm_bridge_hpd_notify():
    dw_hdmi_bridge_hpd_notify(status=2)
    [drm:drm_sysfs_connector_hotplug_event] [CONNECTOR:46:HDMI-A-1] generating connector hotplug event
   drm_client_hotplug():
    [drm:drm_fb_helper_hotplug_event]
    [drm:drm_client_modeset_probe]
    [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:46:HDMI-A-1]
    dw_hdmi_bridge_hpd_notify(status=2)
    [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:46:HDMI-A-1] disconnected
    [drm:drm_client_modeset_probe] No connectors reported connected with modes
    [drm:drm_client_modeset_probe] [CONNECTOR:46:HDMI-A-1] enabled? no
    [drm:drm_client_firmware_config.isra.0] Not using firmware configuration
    [drm:drm_client_modeset_probe] picking CRTCs for 3840x2160 config
    [drm:drm_client_hotplug] fbdev: ret=0

Change to only call drm_helper_hpd_irq_event() from HPD IRQ handler to
ensure that only one hotplug uevent is sent to userspace when connection
status or EDID changes.

With only a call the drm_helper_hpd_irq_event() there is only a single
hotplug uevent and only two .hpd_notify() calls:

  dw_hdmi_irq(): EVENT=plugout
  drm_helper_hpd_irq_event():
    dw_hdmi_bridge_hpd_notify(status=2)
    [drm:check_connector_changed] [CONNECTOR:46:HDMI-A-1] status updated from connected to disconnected
    [drm:check_connector_changed] [CONNECTOR:46:HDMI-A-1] Changed epoch counter 1 => 2
    [drm:drm_sysfs_connector_hotplug_event] [CONNECTOR:46:HDMI-A-1] generating connector hotplug event
   drm_client_hotplug():
    [drm:drm_fb_helper_hotplug_event]
    [drm:drm_client_modeset_probe]
    [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:46:HDMI-A-1]
    dw_hdmi_bridge_hpd_notify(status=2)
    [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:46:HDMI-A-1] disconnected
    [drm:drm_edid_connector_update] [CONNECTOR:46:HDMI-A-1] EDID changed, epoch counter 3
    [drm:drm_client_modeset_probe] No connectors reported connected with modes
    [drm:drm_client_modeset_probe] [CONNECTOR:46:HDMI-A-1] enabled? no
    [drm:drm_client_firmware_config.isra.0] Not using firmware configuration
    [drm:drm_client_modeset_probe] picking CRTCs for 3840x2160 config
    [drm:drm_client_hotplug] fbdev: ret=0

Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v7: No change
v6: Drop the call from IRQ handler instead, prior to use of a HPD
    delayed work to avoid a possible deadlock with use of sync() calls
    in the bridge hpd_disable() ops,
    Update commit message,
    Collect t-b tag
v5: New patch
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 5dacb8a99715..8afc9d240121 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3101,10 +3101,8 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 			status == connector_status_connected ?
 			"plugin" : "plugout");
 
-		if (hdmi->bridge.dev) {
+		if (hdmi->bridge.dev)
 			drm_helper_hpd_irq_event(hdmi->bridge.dev);
-			drm_bridge_hpd_notify(&hdmi->bridge, status);
-		}
 	}
 
 	hdmi_writeb(hdmi, intr_stat, HDMI_IH_PHY_STAT0);
-- 
2.54.0


