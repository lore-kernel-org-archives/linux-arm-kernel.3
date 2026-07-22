Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A349FC44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 15:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjH32xT9kymbzg8TtgSYxjNOPiY3/CYPvrbKmjgJSUU=; b=h+EG2vTUHVBFCdqHmfCnj3KEwl
	8abL+BHrl0ywYFBV9POGbNzG9F0uUrzJvl4xTUomrkQCAHHl19awrU3FnywnF030LeJzwc43RkPVz
	8gAT5E96QNELs+CTZD2MpEvWVVzaj3ioYQP3mSCgsv6fgRucPwNrHGBBclZFuMv9dJL+pz+uWZT5P
	yLf2ipf33mCVUOpCyea8tJimvzqiY4Nk1cOGuNmqGPNfoDe1GG+NeEgUTJuyK/pMVDNMosg3x50MC
	KO2ttutOtk+z1LGNevVDB/KmiyQD7HS6xu7FW0rYqvvT1KZdA7lCcfkyjlrrAMdwNnle7qCCDa2jC
	3astoBUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZ97-0000000CEMP-06p3;
	Wed, 22 Jul 2026 15:46:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZ95-0000000CELX-3Cla;
	Wed, 22 Jul 2026 15:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PjH32xT9kymbzg8TtgSYxjNOPiY3/CYPvrbKmjgJSUU=; b=RbY8fopR4sIqDYVf1zVK4wjEPW
	903QtTxNMhxCzxIz2NjObz7UYyrPIpM3yinmKkSb2wRf83vf9g14OULcOa6EwiqexzCwcLxHZt2uJ
	RdzZdYZlYYxflMz60ZJPFOIOlGSBuSjP6sMS13iiEXYGLvSSzf/mjBv0ehaVAN0FLq+Ke7j92C/CP
	b29MI0MW/M1vhIO5dcFmiKZF4p4oQgkD4CTPUaxEscXEYkTY4IbQdQRAiVkssYoXm5KgpYUTUKT0S
	HdEqOkGIsYsVnlXC3y2QHeatP0bxZ0Zs/GNx/OhV+xcp18Gl0llC/aLN8q3bwcnxoRH75wf/XBIad
	WRuuc2/Q==;
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmZ92-00000000y7L-0BwR;
	Wed, 22 Jul 2026 15:46:06 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wmZ8v-000000006ba-2fbo;
	Wed, 22 Jul 2026 15:45:57 +0000
Date: Wed, 22 Jul 2026 16:45:54 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hermes Wu <hermes.wu@ite.com.tw>,
	Allen Chen <allen.chen@ite.com.tw>,
	Pin-yen Lin <treapking@chromium.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v5 03/11] drm/bridge: it6505: unregister DP AUX adapter on
 bridge detach
Message-ID: <a472535bc291e77aee5cae71ea2a26d695511fd6.1784717129.git.daniel@makrotopia.org>
References: <cover.1784717129.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1784717129.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_164605_063145_8EEC06E9 
X-CRM114-Status: GOOD (  11.97  )
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

The DP AUX adapter is registered in .attach() but only unregistered
in i2c remove(). Unbinding and rebinding the DRM device while the
i2c driver stays bound registers the adapter a second time, which
fails. Unregister it in .detach() instead, and also on the .attach()
error path, which so far leaked the registration.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v5: new patch

 drivers/gpu/drm/bridge/ite-it6505.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 6fcf2dc03d16..ff6471d3ef7a 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3091,6 +3091,7 @@ static int it6505_bridge_attach(struct drm_bridge *bridge,
 		ret = it6505_use_notifier_module(it6505);
 		if (ret < 0) {
 			dev_err(dev, "use notifier module failed");
+			drm_dp_aux_unregister(&it6505->aux);
 			return ret;
 		}
 	}
@@ -3104,6 +3105,7 @@ static void it6505_bridge_detach(struct drm_bridge *bridge)
 
 	flush_work(&it6505->link_works);
 	it6505_remove_notifier_module(it6505);
+	drm_dp_aux_unregister(&it6505->aux);
 }
 
 static enum drm_mode_status
@@ -3652,7 +3654,6 @@ static void it6505_i2c_remove(struct i2c_client *client)
 	struct it6505 *it6505 = i2c_get_clientdata(client);
 
 	drm_bridge_remove(&it6505->bridge);
-	drm_dp_aux_unregister(&it6505->aux);
 	it6505_debugfs_remove(it6505);
 	it6505_remove_notifier_module(it6505);
 	disable_irq(it6505->irq);
-- 
2.55.0

