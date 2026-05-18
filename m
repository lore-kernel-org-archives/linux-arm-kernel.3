Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13E9CD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 18:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RDtWO1bQ5DXpi9puwzpO7ZNdN3UnLZgsoflq5+aG8Jc=; b=SDVXXKqked0JyHoRU3XqmNzCYD
	R9r2cgTPec5z/dgR3G9bSpasjixqGp7GuZksPfPTzFtwNFz2D1YP1xkzxgP2fGpXiFiinIQ/x0h2j
	lMKYHOcNZuGeKMfb82OZgQ+3N9jrdi2pjyxDStgFEm0EPAC8AiqvblhbqzBnKjf6FoAtcct+tMuiS
	zpzvnwaznUQVKw9M3Z7KPHWx9vZ5ZclscRonQ3HItI/NZ3P9fZAiuf3zBoX5Ow2e2iG2W15S1SS8v
	YKgWcSx6V2NnipVtxoTvZoApG3FWsq1OOn3vq48WqtAk67hIweXceNzvfQZwSeHUdsLdMSmflT1hi
	ByFQxUtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2IV-0000000GSca-2xMD;
	Mon, 18 May 2026 18:02:35 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2IS-0000000GSaj-3990
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 18:02:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779127352; bh=RDtWO1bQ5DXpi9puwzpO7ZNdN3UnLZgsoflq5+aG8Jc=;
 b=hokfrUbvuYC7EDgGTJgrr+BwqAlkrMLJSjb7uu4+DFw3oFOtKj3ZyfSdIx3yoplUc3JGY2WEn
 4i6jXgH/12yxyZ/NPN6T3VRmSbh6ZmjO0PNJGBP3ySlsgFkkoixYbQzkTD4HeU86iGx6Pr1p8z6
 wO5m/BwviAxbHdPgrYZiABkKW6eua/7aWaq475UesNvnPFxx397bhWea6UUfODcGEfjzI56Vtv8
 ue5w3O3Aw1UE0P+yQWHR7N4QM2QfW0ICJjnM0gVmGdQXs+K/akhWB1VuWsPpYLtpK984+fLIZzO
 80wdtRQ8xSaM74ttGDSHBo4JT57BKgNh/RhN/h2iR/Ug==
X-Forward-Email-ID: 6a0b5432b84dbc72d2274de5
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
	Simona Vetter <simona@ffwll.ch>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Hans Verkuil <hverkuil@kernel.org>,
	Archit Taneja <architt@codeaurora.org>
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
Subject: [PATCH v7 03/23] drm: bridge: dw_hdmi: Free IRQ before CEC adapter is unregistered
Date: Mon, 18 May 2026 18:01:39 +0000
Message-ID: <20260518180206.2480119-4-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518180206.2480119-1-jonas@kwiboo.se>
References: <20260518180206.2480119-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_110232_882328_C5FDBE84 
X-CRM114-Status: GOOD (  10.28  )
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

The interrupt allocated with devm_request_threaded_irq() can be
use-after-free when the devres release action try to free_irq().

KASAN report a slab-use-after-free in dw_hdmi_cec_hardirq during unbind:

Call trace:
  [...]
  dw_hdmi_cec_hardirq+0x4cc/0x560
  free_irq+0x48c/0x7e4
  devm_irq_release+0x54/0x90
  dr_node_release+0x38/0x5c
  release_nodes+0xac/0x130
  devres_release_all+0xf4/0x1b0
  device_unbind_cleanup+0x28/0x1f8
  device_release_driver_internal+0x358/0x470
  device_release_driver+0x18/0x24
  bus_remove_device+0x33c/0x4f0
  device_del+0x2d8/0x790
  platform_device_del+0x34/0x1e0
  platform_device_unregister+0x14/0x3c
  dw_hdmi_remove+0x74/0x180
  [...]

Freed by:
  [...]
  kfree+0x1dc/0x5dc
  cec_delete_adapter+0xd4/0x118
  cec_devnode_release+0xa4/0xe0
  device_release+0xa0/0x200
  kobject_put+0x14c/0x26c
  put_device+0x14/0x30
  cec_unregister_adapter+0x20c/0x280
  dw_hdmi_cec_remove+0x8c/0xd0
  [...]

Explicitly devm_free_irq() before the CEC adapter is unregistered to
fix this possible use-after-free issue.

Fixes: a616e63c56ef ("drm/bridge: dw-hdmi: add cec driver")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v7: New patch

KASAN report a slab-use-after-free in dw_hdmi_cec_hardirq when,
  echo fe0a0000.hdmi > /sys/bus/platform/drivers/dwhdmi-rockchip/unbind
on a Rockchip RK3566 device prior to this fix.
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
index 9549dabde941..67a2a242d3ca 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
@@ -309,6 +309,7 @@ static void dw_hdmi_cec_remove(struct platform_device *pdev)
 	struct dw_hdmi_cec *cec = platform_get_drvdata(pdev);
 
 	cec_notifier_cec_adap_unregister(cec->notify, cec->adap);
+	devm_free_irq(&pdev->dev, cec->irq, cec->adap);
 	cec_unregister_adapter(cec->adap);
 }
 
-- 
2.54.0


