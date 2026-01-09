Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8260ED167F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 10:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDYasl3TO+ykUDgltsiebhB15xiF9vjquBvH4qBcVHM=; b=LUapI6pFesAv/KnMjrNU/dq1Xi
	zjjus3CsL/KcrpxvC7usy8VlhnO0OEbX4SfLBNlybWcChPV0DKRkUXkXkB7rjr5+eHOu24RTaPh5z
	aF4tZMY+x6GBz889ei8MXaTOTuungYAaAsYdTVHk3fpn9dfeyb5Dym5yJLJPRPS9e17ek8KGTtMvb
	2Syj1drN3T2MZwPcxmV31UMC4OC9INy2miAIs6V0e3oJqAUB/xZlsdZTsvkG3lv/+UXgOwTXAatSw
	l5J15npSnM/YU+4vYFCX0sTf3V7l32BweEN/9eUnRdAcczQoZ6vqCBQl2VNsn8Bag57szEhsnFJ+7
	Dj3WeLpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9Le-000000025oU-38X6;
	Fri, 09 Jan 2026 10:04:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9LY-000000025jQ-0RlU
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 Jan 2026 10:03:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=sDYasl3TO+ykUDgltsiebhB15xiF9vjquBvH4qBcVHM=; b=KAyMIfTxHv8DSyTT5UkngY5UhC
	mtNWANP0EkxIqNAyO8A7Ie56JJUeF0hl6Bg53uj96d861r8ug460OU332UT+tGOxX5PRff/gQwUgM
	xJXOsRPsJRRDwy4NbSPER+qiGe0sbo9xZ6UGz6erCEyQZ+D+1Ck5fa38LOyb1hH1Joy2rUHZG+dox
	TCJEJgnrIhJ/q4KLIA0W6GkFfVPbcLUPu8FpksfO/RR7l52lsvj6xXyUzL77wpBMD8d+0a/yqIg8G
	7BM0LJzbsBgNItJ+/z9k+2aTEmReAI3NOi+QnrsOhVDCmGQnKKE+sIb5fLOyrsJmMEJ1+jjR6ClrW
	Mdy8Tiig==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9LU-0000000Gb8x-3F1t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 10:03:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2B7D4C1F6D3;
	Fri,  9 Jan 2026 10:03:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6BAFE60734;
	Fri,  9 Jan 2026 10:03:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47C31103C88D4;
	Fri,  9 Jan 2026 11:03:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767953022; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sDYasl3TO+ykUDgltsiebhB15xiF9vjquBvH4qBcVHM=;
	b=ZJSYFvqhklyH3Vwt24dpnaBUo8OPit1uS9BZYNEbqIBp0HfvE4SbWkyhACiyoS872ce5ot
	Hn5BN62UXidJKbd2f7/wtAoXH141rhnGrFQDsmDvDVaQWopM55T+4Jgc6M4yVx1Wqj5WZQ
	KyteiRTpHK4ob8ILlsfcBPXafKwvl/D9uowH4pMC3GjPKM/MTYto1ArHSbFPJJ2TfjWRfs
	vcRIAPWYY48xjSFr787foREYv2/8pWqgazzHIn1GRe0XLrW5IqaeymG51zNkB5R1+trpCf
	1DswaF+HFw3D/rJ3x3cCdOtICEyhGJdFrbQyxxlXhEatRedBDZ1amnhSf3EOTQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 Jan 2026 11:02:54 +0100
Subject: [PATCH v2 5/6] drm/exynos: hdmi: convert to
 of_drm_find_and_get_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-5-8d7a3dbacdf4@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_100352_874214_9B961FE6 
X-CRM114-Status: GOOD (  11.30  )
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

of_drm_find_bridge() is deprecated. Move to its replacement
of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
is put when done.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 01813e11e6c6..bfcf2fa62fe1 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1779,7 +1779,7 @@ static int hdmi_bridge_init(struct hdmi_context *hdata)
 		return -EINVAL;
 	}
 
-	hdata->bridge = of_drm_find_bridge(np);
+	hdata->bridge = of_drm_find_and_get_bridge(np);
 	of_node_put(np);
 
 	if (!hdata->bridge)
@@ -2096,6 +2096,8 @@ static void hdmi_remove(struct platform_device *pdev)
 
 	put_device(&hdata->ddc_adpt->dev);
 
+	drm_bridge_put(hdata->bridge);
+
 	mutex_destroy(&hdata->mutex);
 }
 

-- 
2.52.0


