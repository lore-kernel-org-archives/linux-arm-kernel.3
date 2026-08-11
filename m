Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C30C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 12:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vW5QGWu8BTDFFV87gdYCqNM0QrJMO5Ieo8Go/wJMx6I=; b=HYOuds2k0l/J9a0LMdAVMaZ8s0
	PzkK5/Kr7hCOfBOM7uFWbSDGmcWGo+0o8HT0q+YAiyBf4LeLnmFsEWKsXszLOUZL41ChVVbhXbwdr
	UlA10nHr+8lRexXhr3ZvttnXH9l0zg6NDB7V7TOqFe0zhsPgSQ4JXyk1gan52z9scQ8Ou2mjf31Kw
	WLyGv2TNXuMPKnVQew2TxPlwM8teRJJOVBr6XOnKe+HeTlsRs8g9v5Knsarm5AJA3DT+5aVsAzRIA
	S+qwUhqkfeB3PQYplEr3HqhlVDQ/Sv/pmqqjM9PL7tPrAK6JHt2vXtL65uXLnP31M1aEdJXojD29x
	bjNn5+RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlTr-0000000E0UX-3l1A;
	Tue, 11 Aug 2026 12:21:19 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlTa-0000000E0It-26wT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 12:21:10 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so2495099b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 05:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786450862; x=1787055662; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vW5QGWu8BTDFFV87gdYCqNM0QrJMO5Ieo8Go/wJMx6I=;
        b=Gv7nHl1BmdHfCp4+IuzmtEQ0ar36buUcAkO2Fkj0n/4tHr/W9xs6XKgLCokKNsYzMG
         MlBFoLnuqdk2UmYTKeYShlBTVLHkaoz/di6HbAqRXMJEzIPJeueP7jW9MPhgBULbRyfs
         NcuPU6BKU2T/frbDXAihi/hjWNmNVwRIKl8tE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450862; x=1787055662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vW5QGWu8BTDFFV87gdYCqNM0QrJMO5Ieo8Go/wJMx6I=;
        b=RKGbqWjIQyNoGvLA8c5pOlYSjh3WXPX4hlgrxASrbPcAtUNSOSlO3hnH95+GFu6+m+
         cLYZUf2rGlJjrQx0k1SaprLdYK4NojvuEEqWuBMXyFnPUpV5AhChwPOf1625RZoDx+1q
         uczFtiBR1ucg3NhlAuYnQyyqnqBx2aB7hkQUfDJEbG8GwjjEfkFJYNT74vQ2PW6vIxkc
         ThSOf0RJdwlB+mI57fCLf5TJRlJleqQNxs94IcM6kJF4aURB4WDCHB2JXeVFftXdGXqY
         UKWi8MCUtjPaXdMow8rotZhV1LltgvFm1y3nLDK7rrkT1w5eN2AYDrRognZaQIPCoUyy
         ncrA==
X-Forwarded-Encrypted: i=1; AHgh+Rp3FuBuDFN/rS2IvjEw9RhkMsg7/paEG9eVHwxFF9jyLQhsDuGlTlGXaywBcDZ73YEqCV/MGPNhKjUP/Mcw8A4C@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6zm4VGLT0tyB2Z6AmKgX7mglOBaDAqpLSlNlz3j5/oZInUxWV
	/efYhFKuG4JV+TUE/Ad/cZ1ab4DLRbZuMy6fFmiXmwGeEcXg6AsIV6E6s8qcSQ+ACQ==
X-Gm-Gg: AR+sD10V8A+AGfZ/M9DW67ijTBrx/Z7a8YvNTum9ZJ/zC/eOjW+8sDaW7r4e9V+TyTr
	AMnI6/x3rInaNwgb0QOHpoDH4C+nRQDH3sh2rgPy62kGstHmioiiZ2ePz9E0XwhABTgDjWfJLTI
	TQprFCKapfXXMFK9VBapRamoWXBENEiWYSvyJTEQEyYEJcGTw/qGHwO3iXxjdOlqNqCCPjODiws
	M64mji+G5gYXWf3Mz+l1NDEkvUKDDwNhpzt86J+euUHUZ1BuFFE0iZOZV/cp1pbDaM1eOesbPM5
	j6mkrnSp4zgRwQvGcSZJwhzgmbmHq9kX41YlPYaHy2fweEzlcDaXShcPgLQyu8lDIepsLMqadOI
	zJnOzbHwMNhNAdm5oI7tf883aeHsAsYH0KWt5g6iAF5af8xXGqf54cswmOswFDnEuBK0mj1iQu/
	TUQjyeR2Z0o8iVZ8Rt/ATZIlaCp77KwMxjZEh6sgEj6haNHgsGEN3Cb2aoVFbVWNS9IYWqyapnR
	aV19fvntQNxNPYecQfpjaOwMjclnieQEIvZZKJbq7KLUQ==
X-Received: by 2002:a05:6a00:e1b:b0:837:f79d:909 with SMTP id d2e1a72fcca58-84fa889d2a0mr3074138b3a.39.1786450861717;
        Tue, 11 Aug 2026 05:21:01 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:12e1:df26:6add:1ea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9574e9dsm662454b3a.54.2026.08.11.05.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:21:00 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/9] i2c: of-prober: Defer regulator_disable() on successful probe in simple helper
Date: Tue, 11 Aug 2026 20:20:06 +0800
Message-ID: <20260811122011.3539250-7-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
In-Reply-To: <20260811122011.3539250-1-wenst@chromium.org>
References: <20260811122011.3539250-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_052102_808263_70CEB457 
X-CRM114-Status: GOOD (  22.56  )
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

When a I2C component is found, it's device node is immediately enabled.
This triggers device creation and driver binding. The prober will hold
the regulator enable reference across this part. If the driver probes
synchronously, then it happens within this window. On the other hand,
if the driver probes asynchronously, there is high chance that it
happens after the prober's cleanup function was called, in which case
the regulator would have been disabled when the driver's probe function
is called. This would then require the driver to wait 100 ms for the
hardware to reinitialize, even if the probe function was just a split
second late and the regulator was disabled a few milliseconds ago.

Recently, some of the drivers for the component that are targeted by the
I2C OF component prober gained the ability to skip waiting for hardware
initialization if the regulator was left enabled. This happens when the
PMIC has them on by default, or if the component prober left them on
after probing the component.

Tests on the Hana Chromebook showed that if the prober and trackpad
drivers are both builtin, then the time between the prober enabling the
device node and the trackpad driver asynchronously probing is between
5 ms and 30 ms, though sometimes there are outliers exceeding 100 ms.

Wait 100 ms before dropping the enable refcount on our end so that the
actual driver has the opportunity to catch and increase the refcount on
their end.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v3:
- Added commit message section showing average delay needed
---
 drivers/i2c/i2c-core-of-prober.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index f9f3c0ef93ff..68c929b16b06 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -235,11 +235,23 @@ static int i2c_of_probe_simple_enable_regulator(struct device *dev, struct i2c_o
 	return 0;
 }
 
-static void i2c_of_probe_simple_disable_regulator(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
+static void i2c_of_probe_simple_disable_regulator(struct device *dev,
+						  struct i2c_of_probe_simple_ctx *ctx,
+						  bool defer_disable)
 {
 	if (!ctx->supply)
 		return;
 
+	/*
+	 * Wait a bit of time for async drivers to probe and increase the
+	 * regulator enable count. This allows the drivers to check and
+	 * skip waiting for re-initialization.
+	 */
+	if (defer_disable) {
+		dev_dbg(dev, "Deferring regulator disable\n");
+		msleep(100);
+	}
+
 	dev_dbg(dev, "Disabling regulator supply \"%s\"\n", ctx->opts->supply_name);
 
 	regulator_disable(ctx->supply);
@@ -356,7 +368,7 @@ int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node,
 	return 0;
 
 out_disable_regulator:
-	i2c_of_probe_simple_disable_regulator(dev, ctx);
+	i2c_of_probe_simple_disable_regulator(dev, ctx, false);
 out_put_gpiod:
 	i2c_of_probe_simple_put_gpiod(ctx);
 out_put_supply:
@@ -401,7 +413,7 @@ void i2c_of_probe_simple_cleanup(struct device *dev, void *data)
 	i2c_of_probe_simple_disable_gpio(dev, ctx);
 	i2c_of_probe_simple_put_gpiod(ctx);
 
-	i2c_of_probe_simple_disable_regulator(dev, ctx);
+	i2c_of_probe_simple_disable_regulator(dev, ctx, true);
 	i2c_of_probe_simple_put_supply(ctx);
 }
 EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_cleanup, "I2C_OF_PROBER");
-- 
2.55.0.679.g6767b8d81c-goog


