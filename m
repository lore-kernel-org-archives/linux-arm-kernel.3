Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F92C624D9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eEHCAxZVgRM7RubSr5HUm1QAGXBpVvDH1gihuAWJgus=; b=ueoMK8ThW8CzemMsSDaceyScbp
	M3iGixrEsoF/Z0tcB98peDwpbYRh3q7myZrThaqJWuBLzTFj5V9O9U4zQRVhgei2+7/P4XsJCb2BH
	jY42j71O0r1yYkncknp1gI9Z9M3jA2pQQB5F/5+Ra5GQcaSFDWB3pFJcDh1ffco6yZlHfRYES3vG4
	82radh1QxhqY0mCFUGlPRNeJdQTseAiOr8VbtWsI0SQTSn+lU5dUVxFXMRDYto3rjTFVn9cZTOgwi
	fp16puzJSo9xprr6g8IlWODLjBdH/zn1+v27wSIC1mQiMCIFaV1hbfHJ3FzqzxUwc/Z9CiXSRyinq
	x2NGTb3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Tb1-0000000D3Wg-41d4;
	Tue, 01 Sep 2026 18:52:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TZn-0000000D1I8-2ewb;
	Tue, 01 Sep 2026 18:51:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=eEHCAxZVgRM7RubSr5HUm1QAGXBpVvDH1gihuAWJgus=; b=bus+FGyEphU+vgrHYPzqdnAAJv
	FUzXSUoLPKLNgF0qlEHe5xDqpethOz5qpoYIeYmWxJG9DZkVlhdpQuSM2yGkmLgvd1jbRZFR67yiF
	n3R8N1nxLI3eonuHF1Sc1MrN0z+TFlqdjPZI3DxU1G0PDF1zYyeisDhLJZlJhfjOrGuWnAXEjdhaN
	K7AUAEsBo9WKQXnNJzxN+Igw+iL42mUgDiMGy2MLnJtwGEriLh/2nFQxksHGZ/bJHqn5qig9mZsPZ
	vPlXiW6UdMNbGrJHULr78e4bAkJBDQJiQlgfECxtVlr5CdS1IpaRXZ4tl2bN1tzK3xgPX8JUNCoe6
	2zltRtjw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TZj-00000005aca-2N5P;
	Tue, 01 Sep 2026 18:51:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788288670;
	bh=rOcaPyCXPILsJJZu+k8FKv3RjoMz7iu1oJUoZ0ESuBw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y+QXInC086neqovXgnrBC3GMAfT2ZBiM+bzOv0uaLbFUcaeFsvxsreIkG8iZb9sT/
	 s3XuuzOGV/DrKoyPAc6m9O5Ij5UEkSibG+sF6vbFENSbQiyFt9D0HksUQ8W68v2mlq
	 zIuBSVnkETwGx+Vqxc7O8HW1h6IGRZxI55QlNWRRNX1KqJR/osQrkUPsGHicE1kIhq
	 2LmzWHipxXfuPb/aQjaVL0UDcQYUYdOfT1NQdAUFGKx6i2Ooqbi6aj+6Y14+cyr24p
	 QDiiWStAaXj5k/AeZ87I812LpqdCg+RZWqIScv5glMgaFra9b9x2liQTYvr6lGyV4J
	 UBraW0+S1k1Ig==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9411C17E3C5D;
	Tue, 01 Sep 2026 20:51:10 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 01 Sep 2026 21:51:04 +0300
Subject: [PATCH v11 40/74] drm/rockchip: dw_hdmi_qp: Use
 dw_hdmi_qp_hpd_notify() for HPD reports
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dw-hdmi-qp-scramb-v11-40-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>, Helge Deller <deller@gmx.de>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-fbdev@vger.kernel.org, Maud Spierings <maud_spierings@hotmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_195115_813984_B1DDE438 
X-CRM114-Status: GOOD (  10.14  )
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

Notify only the affected connector instead of polling all of them, and
ensure .detect_ctx() runs on reconnect to recover SCDC state.

Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 1c547016ee00..f2a1ea8dfefa 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -24,7 +24,6 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_of.h>
-#include <drm/drm_probe_helper.h>
 
 #include "rockchip_drm_drv.h"
 
@@ -398,14 +397,8 @@ static void dw_hdmi_qp_rk3588_hpd_work(struct work_struct *work)
 	struct rockchip_hdmi_qp *hdmi = container_of(work,
 						     struct rockchip_hdmi_qp,
 						     hpd_work.work);
-	struct drm_device *drm = hdmi->encoder.encoder.dev;
-	bool changed;
 
-	if (drm) {
-		changed = drm_helper_hpd_irq_event(drm);
-		if (changed)
-			dev_dbg(hdmi->dev, "connector status changed\n");
-	}
+	dw_hdmi_qp_hpd_notify(hdmi->hdmi);
 }
 
 static irqreturn_t dw_hdmi_qp_rk3576_hardirq(int irq, void *dev_id)
@@ -792,8 +785,7 @@ static int __maybe_unused dw_hdmi_qp_rockchip_resume(struct device *dev)
 
 	dw_hdmi_qp_resume(dev, hdmi->hdmi);
 
-	if (hdmi->encoder.encoder.dev)
-		drm_helper_hpd_irq_event(hdmi->encoder.encoder.dev);
+	dw_hdmi_qp_hpd_notify(hdmi->hdmi);
 
 	return 0;
 }

-- 
2.55.0


