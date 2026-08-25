Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35532C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 04:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O3x3zvQVHa95aIkNqH4RuqCyE87uGo0+4gPg8D8l4X4=; b=cwT0MDlQ2m8Rc0IkWa3HkfzYbo
	G1oy3j9p0h4L1mv7G9O6yVFRye6E9/xKGrLIvFItDoWEAwTWovc06BAVyAN/FgZnmzopx0FWj1lJG
	5LzmLgIQQOQbFjAw251iKQhnL6u01RHJfh1dCnHzsQowxLGGl4dd7WquG0cCAr3bDUCbw1A14idri
	yWujni1ChZd32Hy8BTOc5YlMdN0cGEel6jlEeP/wWjKGtaWXHhqWUiRJg10Q7jK/MJyoNfTrwLMoc
	jpO3lOC1ua+dZ55u2m9VPYVmnBfCOBOo8/83rR7y3ciQmbjw5tI2Se03bkG+WdSNTHiOEd+5w7vFy
	d9unkVQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyir5-000000008Fg-2QpA;
	Tue, 25 Aug 2026 04:33:47 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyiqx-0000000089Z-0kk2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 04:33:40 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cbee846deecso4870985a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 21:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787632418; x=1788237218; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O3x3zvQVHa95aIkNqH4RuqCyE87uGo0+4gPg8D8l4X4=;
        b=AHgq5PyCIsj8qOdm8OcMVXVdnvcnjYWJYnrGOUug11XE00eoL12srlxZrBT5aigXiE
         1G8iGo43tTuMEvyEI6nAMOW2vf1s1QwQpyZ0WTnl6ufYCo/oVg+fggnxPKASGGKFYcJm
         RTHGvTTmTWWxG05b3wJCbUAd6ZvuFq342N9Wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787632418; x=1788237218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O3x3zvQVHa95aIkNqH4RuqCyE87uGo0+4gPg8D8l4X4=;
        b=NOmCOEoIKy2GYQeNLgaBmR+ge8TTMrEQ0PcYjdC1mVD0eGtUM0uojD6hPArAm4xYs0
         HZ07DtWnGR+F6q+S55UEgUO9ZfgknaYE+TLL94AjjH7H/hVvQBzAWxOXcWX5gEcJyeLp
         EMvfl+iHY8sXdgGfCzcmr2SMhKgzRLqVQ1LbxkZlYgKY6g0gtgEu/P1Hd2iFGUeolCj9
         h+LtoYDCKVsYSceDTr+2N98bdnkHVzqhU7tHhwEFAh0UsvL0kmQDuVBr0cwX70Z9RP5d
         cLs0Kw+iOhY0KIIimbx0z2VsCUBwf87p2JxnVV8CM3oEZWGHwxsHIVWawP2zMkXLkCXz
         DMxQ==
X-Forwarded-Encrypted: i=1; AHgh+RrzvGTnwNuHRemUIbxJ0PPMIx9+bAeyD3JYPx2odv1O8AcYEZflHs1RFlOnxZBz1albg9aUlvB5nXGcTcpGZ04U@lists.infradead.org
X-Gm-Message-State: AFuF++mZrfKfQ5SwePMxVw0quOMOiYztBVKEVq2Zd3rDef0KvSKmnfjw
	MmzsHCpnrpV2s26hxiDVhjxHBkSOk1WVN7s2xPywsXJnH2AX51IqA4eV+UTG+BO8YA==
X-Gm-Gg: AR+sD12+z/qHJT75diLmBMDC7eEtRBjiDUFk0qJuDPepruqwkOWOvjkbOtVk6fAgMQa
	P2ueAS91eOjnLCFusj0yxWsOaAVMImR2nncFqpM6vBjF5qlwhhR6V03vEKItIeFT4AlbDpZd4YF
	vXX3cHGzQKzw9UehPGs9vPdcMe1Kf5ZJDetNtzyTY2KRO8GdhhZWcwwPdUDePhe6E2v6hwOBo3f
	ftT3t2ZA9RvMSHgTBGpBxiumesMGKElM3u7cQAHgzEC0SiYFXEhhB2hxjAm+xoeI8lDtyO5Ou+B
	XyCpxf+viacRq4OT37ZY2awn39auhlAgAMARXfijgrREnKzpr4m5O9iYT1JJ+Plxhay+oms+73q
	u8gqAY+8m1xJMOtxH0oH89R/EwpXaVJICoGtZkpgAQiBV9/6sOWQQMAxRxidNDOdp2kZAzO8Ttw
	NTwBdN3YPB9j5F7YkV+ITniAthehqfFsvVJWcTM4shSm7fJwvInCYJ+FkHn1W552l21v5nYlr/7
	irRLfGs5wMlxdO8zQ6VqIgsRte0HGurlrhdkcdvnJD1qLA=
X-Received: by 2002:a17:90b:574f:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-396463f1346mr8081145a91.8.1787632418173;
        Mon, 24 Aug 2026 21:33:38 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:a442:9780:24da:cb4e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396458212absm2187823a91.0.2026.08.24.21.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 21:33:37 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/7] Input: elan_i2c - Wait for initialization after enabling regulator supply
Date: Tue, 25 Aug 2026 12:16:20 +0800
Message-ID: <20260825041628.988369-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
In-Reply-To: <20260825041628.988369-1-wenst@chromium.org>
References: <20260825041628.988369-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_213339_521932_FA56B567 
X-CRM114-Status: GOOD (  17.80  )
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

Elan trackpad controllers require some delay after enabling power to
the controller for the hardware and firmware to initialize:

  - 2ms for hardware initialization
  - 100ms for firmware initialization

Until then, the hardware will not respond to I2C transfers. This was
observed on the MT8173 Chromebooks after the regulator supply for the
trackpad was changed to "not always on".

Switch to the new regulator_enable_and_wait(). This makes sure that
enough time has passed since the regulator was first enabled, satisfying
the power sequencing delay requirement. This allows the delay to be
skipped if the regulator supply was already enabled by some other part
of the kernel, such as the I2C OF component prober.

Fixes: 6696777c6506 ("Input: add driver for Elan I2C/SMbus touchpad")
Link: https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Switched to new regulator_enable_and_wait() API

Changes since v1:
- Delay only if the regulator was previously disabled / turned off
- Link to v1
  https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/
---
 drivers/input/mouse/elan_i2c_core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index f5e505edbc33..4bbc6cef8be6 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -36,6 +36,7 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
+#include <linux/time.h>
 #include <linux/uaccess.h>
 #include <linux/unaligned.h>
 
@@ -47,6 +48,8 @@
 #define ETP_FWIDTH_REDUCE	90
 #define ETP_FINGER_WIDTH	15
 #define ETP_RETRY_COUNT		3
+/* H/W init 2 ms + F/W init 100 ms w/ round up */
+#define ETP_POWER_ON_DELAY_US	(110 * USEC_PER_MSEC)
 
 /* quirks to control the device */
 #define ETP_QUIRK_QUICK_WAKEUP	BIT(0)
@@ -1260,7 +1263,7 @@ static int elan_probe(struct i2c_client *client)
 	if (IS_ERR(data->vcc))
 		return dev_err_probe(dev, PTR_ERR(data->vcc), "Failed to get 'vcc' regulator\n");
 
-	error = regulator_enable(data->vcc);
+	error = regulator_enable_and_wait(data->vcc, ETP_POWER_ON_DELAY_US);
 	if (error) {
 		dev_err(dev, "Failed to enable regulator: %d\n", error);
 		return error;
@@ -1416,7 +1419,7 @@ static int elan_resume(struct device *dev)
 	int error;
 
 	if (!device_may_wakeup(dev)) {
-		error = regulator_enable(data->vcc);
+		error = regulator_enable_and_wait(data->vcc, ETP_POWER_ON_DELAY_US);
 		if (error) {
 			dev_err(dev, "error %d enabling regulator\n", error);
 			goto err;
-- 
2.55.0.860.g4b6b3295ed-goog


