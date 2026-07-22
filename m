Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E9CC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 15:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JqIJZQ/+kDwvG5VpmXHE8IK2UWWjrkOOueHatfq2e98=; b=1wf5KBVO2jr+1bnBBBF8oK+FPW
	w2nHuBqIuut/WbUma7u/ryVI7ep/u3gBtf1Iy03slyOiPtb6Xtr9Wqa9DqoIIThIndItvhETDLsRf
	ORS1XuiGJYzbngSFqD+FEq1l/z4cPkpg1r+vdC8/qq6xGr5kbfqG35+TwjjXO3J+KsZo0mj+W6Y8I
	/NKp2kN/u4Ah7nY5GXhBBGuhyyTfA7vUQhcZvUG4/Vz4Y/e4tNqm4MQBG+WxQFEnnEDwtjmduO2r9
	esiElhgyUC86uzMzcJYjVxV9nXcMY9O+becALWvazICALRJGxksv/XbNNqhRT5Nw7sPZUig2JXeMb
	/7++o5rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZ8u-0000000CEE5-2qvj;
	Wed, 22 Jul 2026 15:45:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZ8q-0000000CECq-45bg;
	Wed, 22 Jul 2026 15:45:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JqIJZQ/+kDwvG5VpmXHE8IK2UWWjrkOOueHatfq2e98=; b=PEO+nzKwT0t0TVULJoOrN9OoeI
	MNUtqzWZafYnk/QZ4PZQJ6OuyAOpXXLV2/gxbXK7zK15N3pX9ZTBolXyFCUfHFQy7wTuvYo+1Tx28
	PN3GdfcdSOtuVowHCJmWvrgDxD9BMF4OeOibl6pHEUTMhYPTsKDODizobQgbF6mC6ZWVgD8nFiTKQ
	KTo7dGrKeGLIWRXkCc1HTkvZiaD7yFvTvz25fr/Lz17kZZIS50NOXh8VDkQFBm9TsTpBxX0DRS09S
	Y/vF7C0VgGqnSJrlVIP2XMNmNC11Yn1Y7UOFHW/X+daRH5+1SGlg7QvGpTGlEBmZPMubbfqaDiIAS
	gPRg+Qnw==;
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmZ8n-00000000y5F-0t72;
	Wed, 22 Jul 2026 15:45:51 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wmZ8d-000000006aS-3nj8;
	Wed, 22 Jul 2026 15:45:40 +0000
Date: Wed, 22 Jul 2026 16:45:36 +0100
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
Subject: [PATCH v5 01/11] drm/bridge: it6505: quiesce event sources and work
 on remove()
Message-ID: <837efb37cc967fc0bb4371d1051dd33838425d2d.1784717129.git.daniel@makrotopia.org>
References: <cover.1784717129.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1784717129.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_164549_338287_0CFD8045 
X-CRM114-Status: GOOD (  13.49  )
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

struct it6505 is freed by devres right after remove() returns, but
remove() cancels none of the driver's work items, so link_works,
hdcp_wait_ksv_list, hdcp_work and extcon_wq can still run afterwards
and dereference freed memory. Cancelling alone would not be enough:
the threaded IRQ and the extcon notifier stay live until devres
teardown and can requeue the works.

Unregister the extcon notifier and disable the IRQ first, then cancel
all work. Make it6505_remove_notifier_module() idempotent, tracking
registration in event_nb.notifier_call under extcon_lock, as both
.detach() and remove() call it now. Also initialise extcon_wq in
probe: cancel_work_sync() on a never-initialised work item trips
WARN_ON(!work->func).

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v5: serialise notifier registration state with extcon_lock

v4:
 * quiesce event sources before cancelling work; retitled
 * initialise extcon_wq in probe to avoid WARN_ON(!work->func)

v3: new patch

 drivers/gpu/drm/bridge/ite-it6505.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 8ecb43611dba..e9c84e4fb3a0 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2934,15 +2934,18 @@ static int it6505_use_notifier_module(struct it6505 *it6505)
 	int ret;
 	struct device *dev = it6505->dev;
 
+	mutex_lock(&it6505->extcon_lock);
 	it6505->event_nb.notifier_call = it6505_extcon_notifier;
-	INIT_WORK(&it6505->extcon_wq, it6505_extcon_work);
 	ret = devm_extcon_register_notifier(it6505->dev,
 					    it6505->extcon, EXTCON_DISP_DP,
 					    &it6505->event_nb);
 	if (ret) {
+		it6505->event_nb.notifier_call = NULL;
+		mutex_unlock(&it6505->extcon_lock);
 		dev_err(dev, "failed to register notifier for DP");
 		return ret;
 	}
+	mutex_unlock(&it6505->extcon_lock);
 
 	schedule_work(&it6505->extcon_wq);
 
@@ -2951,13 +2954,16 @@ static int it6505_use_notifier_module(struct it6505 *it6505)
 
 static void it6505_remove_notifier_module(struct it6505 *it6505)
 {
-	if (it6505->extcon) {
-		devm_extcon_unregister_notifier(it6505->dev,
-						it6505->extcon,	EXTCON_DISP_DP,
+	mutex_lock(&it6505->extcon_lock);
+	if (it6505->extcon && it6505->event_nb.notifier_call) {
+		devm_extcon_unregister_notifier(it6505->dev, it6505->extcon,
+						EXTCON_DISP_DP,
 						&it6505->event_nb);
-
-		flush_work(&it6505->extcon_wq);
+		it6505->event_nb.notifier_call = NULL;
 	}
+	mutex_unlock(&it6505->extcon_lock);
+
+	flush_work(&it6505->extcon_wq);
 }
 
 static void __maybe_unused it6505_delayed_audio(struct work_struct *work)
@@ -3615,6 +3621,7 @@ static int it6505_i2c_probe(struct i2c_client *client)
 	INIT_WORK(&it6505->link_works, it6505_link_training_work);
 	INIT_WORK(&it6505->hdcp_wait_ksv_list, it6505_hdcp_wait_ksv_list);
 	INIT_DELAYED_WORK(&it6505->hdcp_work, it6505_hdcp_work);
+	INIT_WORK(&it6505->extcon_wq, it6505_extcon_work);
 	init_completion(&it6505->extcon_completion);
 	memset(it6505->dpcd, 0, sizeof(it6505->dpcd));
 	it6505->powered = false;
@@ -3647,6 +3654,12 @@ static void it6505_i2c_remove(struct i2c_client *client)
 	drm_bridge_remove(&it6505->bridge);
 	drm_dp_aux_unregister(&it6505->aux);
 	it6505_debugfs_remove(it6505);
+	it6505_remove_notifier_module(it6505);
+	disable_irq(it6505->irq);
+	cancel_work_sync(&it6505->link_works);
+	cancel_work_sync(&it6505->hdcp_wait_ksv_list);
+	cancel_delayed_work_sync(&it6505->hdcp_work);
+	cancel_work_sync(&it6505->extcon_wq);
 	it6505_poweroff(it6505);
 	it6505_remove_edid(it6505);
 }
-- 
2.55.0

