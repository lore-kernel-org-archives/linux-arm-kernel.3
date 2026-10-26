Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28861606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 16:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nbtWNW1H;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kEPTjgt7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=c6EuVLjw7aLVrQNqvXTXfqYTtqWjy0bjr6R8GsvXIw8=; b=nbtWNW1HzUgoMI
	7RkxzBjDW9cXnrziF+MRDLhMu4nLCSswkTHeqEop4CvkQtz829JwY4pM+3UzKzpX7Tkoq5IyEV8zc
	LH6xPQr7hZxBmhq6dxgsmyA0pI05Qt6kOsBUMaULjzv7jFftzEtLROte8rT5HES6v7RFUJgt+Dihx
	PSjLo8DGTvjlgjVGFsIuCFPB0cuqi7Bxv8ucPJdVkmyt81grLplqRBGr+SakjgGjrI29rkHFNj3lR
	BRlaGbpI72GjRF/N8JtWIDOLo1bHLLzkWH496BxG3j4aLe/4L8DdF5V9V735CrWMEDT9lSaZuCe8g
	HbS/NSYnCsoF9kI9qKeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8n-00000002oQc-0a25;
	Mon, 26 Oct 2026 16:01:41 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8c-00000002oIh-0WR7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 16:01:31 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c315869241fso401834366b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 09:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030488; x=1793635288; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c6EuVLjw7aLVrQNqvXTXfqYTtqWjy0bjr6R8GsvXIw8=;
        b=kEPTjgt7AL+4rJKVwxT8Nfh6Zx0gqywO9e4sFO6RdmhRkhdn4p2dM2mrTVQA8HnqoS
         LYeSGlG6f0FtlsP0QfqDOSCI4sHnPP6OL+7iIHlWcmoSx3sCMsf3da63upFJB+VSLuP/
         sT3Xm3w4PW36mV3iVEEkWUyOLPzWHP5p/qG6zf+guilqZ9ga224v1UQhKbZQ4tCdew0D
         s68rsWz5jk0adm/dp8nO7FaH7ocU8kWzwSNEh/WOv8iHqnH20MBIxrjqtfprTIjDvXHj
         zPGkGRdVEf10Vh57v5kaDsB2yzDKijGmdL1P+QpqMK2M61eaqus8r2+FFIpDZtJTt0XK
         BzYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030488; x=1793635288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c6EuVLjw7aLVrQNqvXTXfqYTtqWjy0bjr6R8GsvXIw8=;
        b=MbFdP1ZGPCilqwgursPxVO9OuPA+H2vPRlGAgO04py6bxtKXNASmqn3219s5AzXb0F
         65tvH/3AZDSoJSGSJ/5PIQo4XkZ+0SBbxuqqqNlT4p19BaF59gyf8mDb+5gaoBODMVeA
         fi5DNbcGqHnafw8E5nxXfoWq5L3py/zI7S945uh0419HJOc7i+bV4c8IwY7oGiNgfs2U
         m8wxMoWtrnsLXURa9osqVVX4BgBVm6PlFBff9yBIsVTiGITND0Lwq+RVKzN5mYzKieMy
         Z/7e6gQTLtmIdiJ8ZusWOCnTXbIZtnV786dR/GdXWVJYPO3DFigZq+7JFeaihhywLyud
         OGSg==
X-Forwarded-Encrypted: i=1; AKwUvBx3MhgnlCzOFcngwl3FrfX5BFadRP+ajUg5s7ymJpKJu1VyVZ5Y62kwj5KoXNDwvJls3XNt36czosLpJm7Xfn3o@lists.infradead.org
X-Gm-Message-State: AFq9FYJ9OOhznU5qy6dzqcE/hJ7WSrP0hvobpDQeGiV3xjdWHbRZmQOt
	ETSG4yh5f7H7AuBOnukfZoF6qyZDMwU5bD82X2xl2huHi7Iyaj0TNB2xHIaVAQNhZt4=
X-Gm-Gg: AYBFou1Dk0URh6WqfSgyh7JxySLHZ8H8lBBMFZwNamV3jfztUmOMYWkc2xMaAlObUiF
	JJZ8TRoH+UCacLo2d918lpXDLb3qhodjlK2eyqtuoggojT4LgSBc3OuVyOGWmt2UO+oKAv2np1J
	x/Z2H742xksrq14AeR5/MZOSPXrQbSvmKKTIuLRdkNgK7yNJ7JLOj2UStD2osU+/VGkLpCt9s1X
	c//x574uGpLqfqpQUNHXsGktd8UQDh3AOEy2tJJfyPDd2li24uPiJoH9RGMhq2ZmHpKxD0aqYcM
	pCiI3ehDZJwtX86QwHqj7LCOjWCQZP0UaAsj6TdhRkhRwWqCwL2jqjhBIxaPgiDvq/ILvSrHCHl
	VkgZh2cRqaj07iFC37lNW7yY02SYvaPlWTWsv1HhVO3tOMBDOyYUBc+IgMI225yq/9pr+3SMS/o
	NHhuCaZlsrUEvmqiTS2M+0VqjgxJ5ujIjRgWTOy4qm3AK+RvBSOjsPXdcKM2LleRxJknlcRCePF
	Rlrac5JpjkicYYBN2q9bw4s/IKSX/DbDKAj8a6+V8g+1qlwHOiyTIliB4BnLXET/wpwvYu1DXHf
	e2aNhko9m67kRitucKiUfzZiTJUPpRrUpupA
X-Received: by 2002:a17:907:6088:b0:c46:9ca9:f524 with SMTP id a640c23a62f3a-c46bde7a7fbmr786701066b.32.1793030487883;
        Mon, 26 Oct 2026 09:01:27 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:27 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:22 +0000
Subject: [PATCH 05/15] thermal/drivers/samsung: acpm-tmu: Implement
 .change_mode() callback
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-acpm-tmu-fixes-v1-5-0637431b7268@linaro.org>
References: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
In-Reply-To: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Juan Yescas <jyescas@google.com>, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=5675;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=w2ecfEB/xX3PndCX8EcUnYllde5x9JugkBdWgmk2zsc=;
 b=eRDnPhWbxd6q7jd4dlxppZcodrM59EH+3xuhEo1aKtKeDKGb6bDzFcr34WgVTeS3FyUuFlVDG
 Ahojv5tTVdQBKBQvdN+e1CXDzcZrHo/4kEqzUqSXDjfuBD2436BRJbC
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_090130_212526_AF4AA3CE 
X-CRM114-Status: GOOD (  18.80  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Because acpm-tmu did not implement the .change_mode() callback and
instead enabled the hardware sensor manually after registration, the
hardware sensor state was out of sync with the thermal core:

1. Disabling a thermal zone (e.g. via /sys/class/thermal/thermal_zone*/mode
   or thermal_of_zone_unregister()) only set tz->mode to
   THERMAL_DEVICE_DISABLED and stopped software polling, while leaving
   sensor->enabled true and the ACPM TMU sensor active in hardware.
   Consequently, crossing a trip threshold still fired the hardware IRQ
   and ran acpm_tmu_thread_fn(), where thermal_zone_device_update()
   returned early without updating the trip window. Direct sysfs and
   hwmon temperature reads via thermal_zone_get_temp() also continued to
   resume the device and query ACPM over IPC on a disabled zone.
2. System suspend/resume paths in acpm_tmu_control() unconditionally
   toggled all registered sensors without checking the thermal zone mode
   or current hardware state. As a result, acpm_tmu_suspend() issued
   redundant disable IPC calls for already-disabled zones,
   acpm_tmu_resume() unconditionally re-enabled zones that had been
   disabled via sysfs prior to suspend, and suspend error recovery sent
   redundant enable IPC calls to sensors that had not yet been disabled.
3. devm_thermal_of_zone_register() enables the zone and triggers an
   initial thermal_zone_device_update() before returning. Because
   sensor->enabled was still false during registration, the initial
   acpm_tmu_get_temp() call failed with -EAGAIN and scheduled a retry,
   requiring a manual sensor enable and a second
   thermal_zone_device_update() call in acpm_tmu_probe().

Implement the .change_mode() callback to manage sensor hardware state
transitions directly through the thermal core and record the requested
zone mode in sensor->mode. Update acpm_tmu_control() to only toggle
sensors whose zone mode is THERMAL_DEVICE_ENABLED and whose
sensor->enabled state differs from the target state. Drop the redundant
manual sensor enablement and thermal_zone_device_update() call from
acpm_tmu_probe().

Fixes: 50a2c5d4062a ("thermal/drivers/samsung: Add Exynos ACPM TMU driver GS101")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/acpm-tmu.c | 59 ++++++++++++++++++++++++++------------
 1 file changed, 40 insertions(+), 19 deletions(-)

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index 55ee97218f47..69793fce3bf1 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -68,6 +68,7 @@ struct acpm_tmu_sensor {
 	struct thermal_zone_device *tzd;
 	struct acpm_tmu_priv *priv;
 	struct mutex lock; /* protects sensor state */
+	enum thermal_device_mode mode;
 	bool enabled;
 };
 
@@ -188,9 +189,12 @@ static int acpm_tmu_control(struct acpm_tmu_priv *priv, bool on)
 		if (!sensor->tzd)
 			continue;
 
-		mutex_lock(&sensor->lock);
-		ret = acpm_tmu_op_tz_control(sensor, on);
-		mutex_unlock(&sensor->lock);
+		scoped_guard(mutex, &sensor->lock) {
+			ret = 0;
+			if (sensor->mode == THERMAL_DEVICE_ENABLED &&
+			    sensor->enabled != on)
+				ret = acpm_tmu_op_tz_control(sensor, on);
+		}
 		if (ret && !err)
 			err = ret;
 	}
@@ -313,7 +317,34 @@ static int acpm_tmu_set_trips(struct thermal_zone_device *tz, int low, int high)
 	return ret;
 }
 
+static int acpm_tmu_change_mode(struct thermal_zone_device *tz,
+				enum thermal_device_mode mode)
+{
+	struct acpm_tmu_sensor *sensor = thermal_zone_device_priv(tz);
+	struct acpm_tmu_priv *priv = sensor->priv;
+	struct device *dev = priv->dev;
+	bool enable = (mode == THERMAL_DEVICE_ENABLED);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	scoped_guard(mutex, &sensor->lock) {
+		ret = 0;
+		if (sensor->enabled != enable)
+			ret = acpm_tmu_op_tz_control(sensor, enable);
+		if (!ret)
+			sensor->mode = mode;
+	}
+
+	pm_runtime_put_autosuspend(dev);
+
+	return ret;
+}
+
 static const struct thermal_zone_device_ops acpm_tmu_sensor_ops = {
+	.change_mode = acpm_tmu_change_mode,
 	.get_temp = acpm_tmu_get_temp,
 	.set_trips = acpm_tmu_set_trips,
 };
@@ -463,17 +494,17 @@ static int acpm_tmu_probe(struct platform_device *pdev)
 
 	for (i = 0; i < priv->num_sensors; i++) {
 		struct acpm_tmu_sensor *sensor = &priv->sensors[i];
+		struct thermal_zone_device *tzd;
 
 		mutex_init(&sensor->lock);
 		sensor->group = &data->sensor_groups[i];
 		sensor->priv = priv;
 
-		sensor->tzd = devm_thermal_of_zone_register(dev, i, sensor,
-							    &acpm_tmu_sensor_ops);
-		if (IS_ERR(sensor->tzd)) {
-			ret = PTR_ERR(sensor->tzd);
+		tzd = devm_thermal_of_zone_register(dev, i, sensor,
+						    &acpm_tmu_sensor_ops);
+		if (IS_ERR(tzd)) {
+			ret = PTR_ERR(tzd);
 			if (ret == -ENODEV) {
-				sensor->tzd = NULL;
 				dev_dbg(dev, "Sensor %d not used in DT, skipping\n", i);
 				continue;
 			}
@@ -481,17 +512,7 @@ static int acpm_tmu_probe(struct platform_device *pdev)
 			ret = dev_err_probe(dev, ret, "Failed to register sensor %d\n", i);
 			goto err_rollback;
 		}
-
-		mutex_lock(&sensor->lock);
-		ret = acpm_tmu_op_tz_control(sensor, true);
-		mutex_unlock(&sensor->lock);
-		if (ret) {
-			ret = dev_err_probe(dev, ret, "Failed to enable sensor %d\n", i);
-			goto err_rollback;
-		}
-
-		thermal_zone_device_update(sensor->tzd,
-					   THERMAL_EVENT_UNSPECIFIED);
+		sensor->tzd = tzd;
 
 		ret = devm_thermal_add_hwmon_sysfs(dev, sensor->tzd);
 		if (ret)

-- 
2.56.0.257.gf7497c7d27-goog


