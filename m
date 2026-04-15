Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA01F419A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 13:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUJELJUz1O9IxhGCscm3K2eyC5/sipvwiOllk5WFaS8=; b=uR/2gXLfsoCXijJc2SV5kk/dxO
	65vvwUwP4NQqZ5oOwZG+myNZ0W9UftBSNdLVLcInSyELsF7t9R6hNiYnDo0aWwuPXGRFd/fwLsrAP
	peRnaE9tEygw7WqidNOcXnhpOb3Wkl6NcrMsnUTW2z7pWWmbv6DDhoeGcfMXc7VT2yt3s0vEFhGN8
	MeEKghKhntdIc4BtNIpsNlU5uNdSBZ2fyQ4bijqIdX9fh8VA6GvIQH5qLAetJvbaQKmV5C2pw1tAd
	iI4vEwf1zj0iEd1OaUm2wq9WDyTxtfJym0CeiDe/h1MHk1IhTw+W/BvuVtzwnAG//NaWYNS8j4hNW
	eAO7wCNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD00t-00000001AXJ-0Rki;
	Wed, 15 Apr 2026 13:10:39 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD00r-00000001AWt-1Bcl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 13:10:38 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2b2494440f3so22963065ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 06:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776258636; x=1776863436; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kUJELJUz1O9IxhGCscm3K2eyC5/sipvwiOllk5WFaS8=;
        b=S6naGVqc0AJWdRu63gEv6MKmsdJ2dA8s0D81I/tkRDL79mUaqZnFOJcjTJ+oAkF6/l
         pJEgkqksmt9hTWWiTv88lJoXGx73qS5Gwlzn8JWPkKGtrgivMTbTmL6z7gF0YBsQ2O7S
         8C6I3rCGkAbqGhy4Uk7klcfjdRmYm5AB5catnghg47KfAc32LLhP7Be1Cq/pZjleicFq
         wvPjne4kriFskj+yYq/2zqzSHmi9zoiveBseFBtB7UFLObem3RpomD7p8AijVY+jIrEd
         hhNHuenXUOH1ngvcz3wLAd3FElFV+FnMp2CrUydZ04ZHq/54OH3loN66l7/EJ+nyRugn
         Vr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776258636; x=1776863436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kUJELJUz1O9IxhGCscm3K2eyC5/sipvwiOllk5WFaS8=;
        b=QImYD8Uf31qCTlohIkYLyCqzaAAT/oSIqxws4p8lDWjyBRQCNW0zBhTzf6QZw7BE2S
         7zvO9auLDJ5911ZztLQFTYtezgTEJeKMtPZtrIFW9svC25jVWYAqmvUov2zi1btUw/Gr
         vwYvTaEX3SDEFewm1vQ9gD5HXq2E3DwQmcVP3M9gtcMmJGRW9bqCpddJgXqCyxz1Aijl
         j/MPLpuWATRAy9ZD0ZLiwVBS+bF8nrpq8spZ7eKHoaivtukRy6ht6vdXATWKmyLV9hhQ
         VnAsuh93Mtjwp/qWxmd2i3DJGDX1JGbr7V9T6zjUGhip6vvYTYHSET8gC+Mn3fo7f9Fo
         0SrQ==
X-Forwarded-Encrypted: i=1; AFNElJ/eAhZ3Tas9tR7P2vdW9H8pIHHQ0ZLSauf4rw6V2DsGsjWaVotOIRgUlDYSnmI15W3+5LUW+IDd0NH60iCNUrvT@lists.infradead.org
X-Gm-Message-State: AOJu0YxQBBNyuv+RHI0ysLDtNO8/MVJMq16uaMBhXqKKdCezVqZEe52s
	VEqZKx3niz/J3KY5q8iqnjEcC+Eza82fEyIiUPlNyStHJhRZ6kkjIobp
X-Gm-Gg: AeBDievLlbeTT92IDaUFX2wYCOo/nSx4xWOmU8d4agLcm3laQBiGJYIw9ZUYuCo9m34
	orJyg/3Ww2N4ZV6/sU3IMZNFFCKes6GwCGiGgx8J/ulsSWkZ4KlxBDNZaeqFlc0BzaWDTuKjzrz
	8Y/nbpMevTS+BdtB5qPZdgnSZiSIPkcBQIGlJWxzctb5JrDTCekiC70i7QuLAwAejnrRrUXfOLO
	uZElb16puz/ClOTNC7q2BzpVOJX1eaCSUufmizI/gC9g7XE3iHq2UaMw01aUsYHJkekQkxZi2FK
	F1ll4LNF4+BrLNpSaUgWim7shxm1qj+OfppVv54cXBHvn4BMPmhUpBx//8leBL70M8zef7zTamh
	n43IYG/J/ogt/YveSsfC5CMYjkLGTwNRrpz8woxH8JnQyGBmz60WiJiGc8g+EmPQq/UPk7Y8gLv
	sC3KI9Ut5aq4Qpwj8Xo3aD/IlxYMdXV4xNizs61hs2dOMDUnKlbgQM/7tdwEfQTPHC2V3mBgM08
	XDSAP7d8JafZMLO/WWi/l0QKsvDOZE=
X-Received: by 2002:a17:903:bc5:b0:2b2:53f5:463c with SMTP id d9443c01a7336-2b2d5937375mr153330845ad.4.1776258636118;
        Wed, 15 Apr 2026 06:10:36 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.125])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b478292053sm28062555ad.56.2026.04.15.06.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 06:10:35 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 15 Apr 2026 21:10:27 +0800
Subject: [PATCH v2 1/2] thermal/drivers/imx: Fix thermal zone leak on probe
 error path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-imx-v2-1-aeacff9e72b2@gmail.com>
References: <20260415-imx-v2-0-aeacff9e72b2@gmail.com>
In-Reply-To: <20260415-imx-v2-0-aeacff9e72b2@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>
Cc: linux-pm@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776258629; l=3218;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=ev3ap9xj2ci77Th4eddDfPYYKx/SundD/E1tF85e9Oo=;
 b=+vxBo9PAJKnT8BuHhNDuig2ER/6eWGBvDO1I7LbnUtizgMe1i5F9cQOBcODm9AJnTg1aAWUwq
 1H8DhhjRN6hCirqBg5cpRelvYwP9LNh1nY3fBnXUMla33YhJyXSfRaB
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_061037_332178_B8397540 
X-CRM114-Status: GOOD (  15.14  )
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

If pm_runtime_resume_and_get() fails after the thermal zone has been
registered, the probe error path cleans up runtime PM but skips
thermal_zone_device_unregister(), leaking the thermal zone device.

Switch to use devm_thermal_of_zone_register() to fix the problem.

Fixes: 4cf2ddf16e17 ("thermal/drivers/imx: Implement runtime PM support")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/thermal/imx_thermal.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
index 38c993d1bcb3..3729c3eac748 100644
--- a/drivers/thermal/imx_thermal.c
+++ b/drivers/thermal/imx_thermal.c
@@ -216,6 +216,20 @@ struct imx_thermal_data {
 	const char *temp_grade;
 };
 
+static int imx_thermal_sync_zone_trip(struct thermal_trip *trip, void *arg)
+{
+	struct imx_thermal_data *data = arg;
+	int temp;
+
+	if (trip->type != THERMAL_TRIP_PASSIVE && trip->type != THERMAL_TRIP_CRITICAL)
+		return 0;
+
+	temp = trips[trip->type].temperature;
+	thermal_zone_set_trip_temp(data->tz, trip, temp);
+
+	return 0;
+}
+
 static void imx_set_panic_temp(struct imx_thermal_data *data,
 			       int panic_temp)
 {
@@ -679,13 +693,8 @@ static int imx_thermal_probe(struct platform_device *pdev)
 		goto legacy_cleanup;
 	}
 
-	data->tz = thermal_zone_device_register_with_trips("imx_thermal_zone",
-							   trips,
-							   ARRAY_SIZE(trips),
-							   data,
-							   &imx_tz_ops, NULL,
-							   IMX_PASSIVE_DELAY,
-							   IMX_POLLING_DELAY);
+	data->irq_enabled = true;
+	data->tz = devm_thermal_of_zone_register(dev, 0, data, &imx_tz_ops);
 	if (IS_ERR(data->tz)) {
 		ret = PTR_ERR(data->tz);
 		dev_err(dev, "failed to register thermal zone device %d\n",
@@ -693,6 +702,8 @@ static int imx_thermal_probe(struct platform_device *pdev)
 		goto clk_disable;
 	}
 
+	thermal_zone_for_each_trip(data->tz, imx_thermal_sync_zone_trip, data);
+
 	dev_info(dev, "%s CPU temperature grade - max:%dC"
 		 " critical:%dC passive:%dC\n", data->temp_grade,
 		 data->temp_max / 1000, trips[IMX_TRIP_CRITICAL].temperature / 1000,
@@ -724,25 +735,18 @@ static int imx_thermal_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto disable_runtime_pm;
 
-	data->irq_enabled = true;
-	ret = thermal_zone_device_enable(data->tz);
-	if (ret)
-		goto thermal_zone_unregister;
-
 	ret = devm_request_threaded_irq(dev, data->irq,
 			imx_thermal_alarm_irq, imx_thermal_alarm_irq_thread,
 			0, "imx_thermal", data);
 	if (ret < 0) {
 		dev_err(dev, "failed to request alarm irq: %d\n", ret);
-		goto thermal_zone_unregister;
+		goto disable_runtime_pm;
 	}
 
 	pm_runtime_put(data->dev);
 
 	return 0;
 
-thermal_zone_unregister:
-	thermal_zone_device_unregister(data->tz);
 disable_runtime_pm:
 	pm_runtime_put_noidle(data->dev);
 	pm_runtime_disable(data->dev);
@@ -761,7 +765,6 @@ static void imx_thermal_remove(struct platform_device *pdev)
 	pm_runtime_put_noidle(data->dev);
 	pm_runtime_disable(data->dev);
 
-	thermal_zone_device_unregister(data->tz);
 	imx_thermal_unregister_legacy_cooling(data);
 }
 

-- 
2.43.0


