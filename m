Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925D2C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 07:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7iH2zA1ruu4tS3rL/ntmqLvjt6Xg4qydbdtr1Vk28d0=; b=NzLZ0wAAce/6smTI6zTI1uPvXO
	uCQg1f0D/nye09TRu1pZiuwbUiegLKN+l8Pp1G3VXNzwH1SMYEDMA8xn6Fu1Rf5evptVxxNDMKg8j
	rTphxhHrwgyruZ3xsGFklVp1gjNqW9ZiuAIGq9AuLb88KNURd2G+jUgBPx10kHvl5JBxr1WVp7us2
	huOmvhuz68CBVFqft1muslvl4zTWVSF1+Ahx/Clv9ZTqxDXSpY2iE2U5shA5Ms9FjqyxgJbhLcJX/
	lCjz9KyBywfMfxbIz658p5vfhRl6AbsUwqrpZSazIcJvEWzsteh7WyPQcsTUkjPJetdabefuyjXSZ
	o8ABLWZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5JD-00000008i9P-0WHN;
	Tue, 21 Jul 2026 07:54:35 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5J0-00000008huZ-3tsm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 07:54:24 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2cf52d15d88so25884155ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 00:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784620462; x=1785225262; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7iH2zA1ruu4tS3rL/ntmqLvjt6Xg4qydbdtr1Vk28d0=;
        b=GLfabADQQ5EyRJxonW3OJtTeIhJG5cBpx5gHQjqjQUxTeDNPohOQPWDLgVBpyzGlS0
         z2UCiW5MMAaAXfDbSMf5b7YZ5JASSoKfQqdEWBwkSEZozh6k5oP/f1ig+kojZcdQGVa6
         ogq9+im/3eA6JQpBADA6F6BL6cHMlhjWE56lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620462; x=1785225262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7iH2zA1ruu4tS3rL/ntmqLvjt6Xg4qydbdtr1Vk28d0=;
        b=UfqtCnGx95k4jwlZtthBxayGTfHKqAvbmDrs61DIweu1wisHSrwbsUjso7kZVLlqp8
         QU2aqr/KlbrJfCCf3td88dCDCRjEbCqkND8pgb//7jyDu6yO84nEONeXTz+k3Hh+bXIl
         aSLcSRjf9Z4GALHZngMaptN8MKVH4divjNFBXh5UNmWGxSBAUgRlfSYXSBkfBRf9xCa5
         EAw7f2iCd+hdGwWzp1z+SukmUbfZyHsL/3NCbya4aCKBTdhGyI93N4ZKDuIUi5sPm7cu
         XHRhqkJlqT+sis9SfzrixLa895W6k7W2+WjbUyqKYuZWVEFTbUCVD2DXihXC9c/p1Z1z
         yyBg==
X-Forwarded-Encrypted: i=1; AHgh+RpembjT2IIME8KpmsKmUCsQU5FSQg9NuyKC+CGR81HGQLZDAvYxAhVBwOA9YIOmM2UyIwbnTsmOeut7wdRKOvIm@lists.infradead.org
X-Gm-Message-State: AOJu0Yx44TuYy2CObA4yn62P6KBJ50RAciV90la+ZAiIg567UD3Kxv16
	gvprRI8TpBeUpeVsndxEHWBc6MvJ9FNkvWM4drA3+8n446QKTnG2dzXMSK3umpSF4w==
X-Gm-Gg: AfdE7cmkrc8lJ+vRaLuqWUEdAtLCDavTu5bGkv8q0tugTuy9rRx6lAq6o2nGTsiOkNg
	tVXjFxVNKEGXqnCwOGt1LghEnwuiL+IVFRsnXGrulyZvXQhIup0LwnqOKqIkU57ArPJOz013B/Y
	j1odcsxKtBZFc601tNvOxdDQXI4fRTHH+GSj+Gtg1KKR2EZ4ngEE36BfCc4YsS/Fn4M5BTbj8V2
	i+VO8CKZSTKFEaI+T+t/+R19cyA+velbomN3w1Wa3YE3QfKvNM1uU0oLgZqW/rid86VPY6xiqY+
	Pt28sedP+CM3j3YP1BfCe/Cd4szcIUW4TlZwNdda8Mnfcdm3RaWqGuVGtcclijtpRcEepltriYD
	YlDLursXV4bbH6uViXTF4PbbJ756CdHOwQQHyyrxvwtobM00Q7rxTypm3XNp0I7tDcrz1lW2DsC
	tzyHNx5eWrh57SP1eIm4Uvr4PgVk89vQl3NRFs2B5DU8Ff63TP3yFzJka+K0M=
X-Received: by 2002:a17:902:d586:b0:2cc:df15:91f5 with SMTP id d9443c01a7336-2cf34a2a314mr196331925ad.44.1784620462223;
        Tue, 21 Jul 2026 00:54:22 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f705sm70724175ad.15.2026.07.21.00.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:54:21 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/9] i2c: of-prober: Defer regulator_disable() on successful probe in simple helper
Date: Tue, 21 Jul 2026 15:52:20 +0800
Message-ID: <20260721075226.2347933-7-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721075226.2347933-1-wenst@chromium.org>
References: <20260721075226.2347933-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_005423_524955_E18F1DC1 
X-CRM114-Status: GOOD (  20.92  )
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

Wait a bit of time before dropping the enable refcount on our end so
that the actual driver has the opportunity to catch and increase the
refcount on their end. The 100 ms delay was arbitrarily chosen.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
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
2.55.0.229.g6434b31f56-goog


