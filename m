Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59271CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 18:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TV52XSycf6wnHw1EkncvtVnQ2hwR4mxv/EgMlgr2HFE=; b=1Tc3F/tK2WoJVILuHZGY8qFKCG
	UoBTeKUSgligdRXg7Wbu5FiaRwITfN4a6oBtj1oCpF9DuAjgdNDFwckP2xXF1CyaeSSb/dcEbAIOD
	7Mv3TqwI/Vu18WGvZPGqAZreBbJfOWGukX9MQ2KEG50fOdbOyHJjr7KxMdTjFPUHMFVacfFQfuOjd
	E0o0C5i+2zo7GxOexZXXrmYhtgsUG3d2PU32pTyywAGSEKGsiQe1Lu91mSK78e6rqYoyeVuc4eFt8
	IblBajTab43r8NnxqdRBt4zorySHIIVgp2Js5Zhmg/n7sHoBqsScyT2x0OSxFls5iuO80Sc5zx1Cb
	yib2k7cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOJvM-0000000BFQr-0Wgk;
	Sat, 16 May 2026 18:39:44 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOJvE-0000000BFAT-1GOh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 18:39:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1778956775; bh=TV52XSycf6wnHw1EkncvtVnQ2hwR4mxv/EgMlgr2HFE=;
 b=yEnxb53oTfUq4lC3tPVJHyIYdearswLeHy3AlF64Ew9OsN1WnNSat9JXJEmp0QQvHqy7JrB56
 G3w6tgrX6CAZB5yszOTX3whmW0VnEq6x8WLECLNCvlzN0y+RA8Dzq5igCQAK8DpUnO9H27p6Bf/
 rUMXFBDdMVW4kwp4N7UgpczIRCx/5ULMh8L/rPCguxEtbaG07U/OzCF9DHPs7TrECgV9qrBaLW4
 sfy0JsZZdyGFuRWDyUec4OZdKyXwJ0Tx5a/MRd4VwM9Ymx8FIBRUMaSjVmyV351V9l+bWVtgUne
 mX1l8r5La9ohd2IYyL6NeSQ+EKmvPjdPnE9q8Scz8nag==
X-Forward-Email-ID: 6a08b9df79c7625f20eeee1b
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
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
Subject: [PATCH v6 10/22] drm: bridge: dw_hdmi: Remove cec_notifier_mutex
Date: Sat, 16 May 2026 18:38:20 +0000
Message-ID: <20260516183838.2024991-11-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260516183838.2024991-1-jonas@kwiboo.se>
References: <20260516183838.2024991-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_113936_914255_DBED14FB 
X-CRM114-Status: GOOD (  10.27  )
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

With CEC phys addr invalidation moved away from the irq handler there is
no longer a need for cec_notifier_mutex, remove it.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v6: Collect t-b tag
v5: No change, cec_notifier_conn_unregister() call moved
v4: No change
v3: No change
v2: Collect r-b tag
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index aae1b890167b..0dd4c823c60a 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -189,7 +189,6 @@ struct dw_hdmi {
 	void (*enable_audio)(struct dw_hdmi *hdmi);
 	void (*disable_audio)(struct dw_hdmi *hdmi);
 
-	struct mutex cec_notifier_mutex;
 	struct cec_notifier *cec_notifier;
 
 	hdmi_codec_plugged_cb plugged_cb;
@@ -2476,11 +2475,8 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
 
 	status = dw_hdmi_detect(hdmi);
 
-	if (status == connector_status_disconnected) {
-		mutex_lock(&hdmi->cec_notifier_mutex);
+	if (status == connector_status_disconnected)
 		cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
-		mutex_unlock(&hdmi->cec_notifier_mutex);
-	}
 
 	return status;
 }
@@ -2542,10 +2538,8 @@ static void dw_hdmi_connector_destroy(struct drm_connector *connector)
 {
 	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi, connector);
 
-	mutex_lock(&hdmi->cec_notifier_mutex);
 	cec_notifier_conn_unregister(hdmi->cec_notifier);
 	hdmi->cec_notifier = NULL;
-	mutex_unlock(&hdmi->cec_notifier_mutex);
 
 	drm_connector_cleanup(connector);
 	drm_bridge_put(&hdmi->bridge);
@@ -2612,9 +2606,7 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
 	if (!notifier)
 		return -ENOMEM;
 
-	mutex_lock(&hdmi->cec_notifier_mutex);
 	hdmi->cec_notifier = notifier;
-	mutex_unlock(&hdmi->cec_notifier_mutex);
 
 	return 0;
 }
@@ -3323,7 +3315,6 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 
 	mutex_init(&hdmi->mutex);
 	mutex_init(&hdmi->audio_mutex);
-	mutex_init(&hdmi->cec_notifier_mutex);
 	spin_lock_init(&hdmi->audio_lock);
 
 	ddc_node = of_parse_phandle(np, "ddc-i2c-bus", 0);
-- 
2.54.0


