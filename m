Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBAFC624C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 07:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lkkm1waPZ+HrT9oYZpgc7xZ9xBFanNK2vNiOpJD6Fs8=; b=PrHq+y41eP+WP2Obt0aMOwOH43
	UZY6PZxnnULrot1iaZFqzxiz/fRsiifxgBBBkEv5N38fcJhi65+zTi039OQe1cg25GYKc+Yt4OhY4
	SolQkzN7+UWGSzukPlKeo2muHs3jP0U+AMbGHnLTAbZyKQxB85w5q3S+iR8An7FvOZW3GpWmstZM1
	QKTQjweupgveEmbc4yAGytOpCQgkvwoZFJaEMMozF4YDNIGRZrrtU0ddADyQonBJXi8SK8nNH0WXv
	t34RzXi9LoGGB+1eWnIc7ODqcXCgCdLqjqNSkmX80dSLkY643hzlbpJyz6GUZ+mZ4EX0MnEMYeJWB
	gcB1o6yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JFv-0000000BADS-3RU7;
	Tue, 01 Sep 2026 07:50:07 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JFt-0000000BAAj-1fBv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 07:50:06 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2d944747d41so17065755ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 00:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788249004; x=1788853804; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lkkm1waPZ+HrT9oYZpgc7xZ9xBFanNK2vNiOpJD6Fs8=;
        b=azaSL/zu9bi15PaJRhw4SZPWPVivFWdV3eJk8ezn/j1RjAxmkPktlPgpVLsBwJx6wp
         GNDmLlwkfRljikwP8lM+CKRYnx9qRGDsg8kM8kWGXA8OTwJePyjSU7FiPKrMu3qpp0yK
         c2arn/XlHHNgZZY9IJGFhNa38tYRcBfX2p4a4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249004; x=1788853804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lkkm1waPZ+HrT9oYZpgc7xZ9xBFanNK2vNiOpJD6Fs8=;
        b=Emgw8XoAmPpFIxcWVTlCCFGKzBrtsOor4S9mRWPkrIHcR34gfn5za6z6fE2ThA7X4s
         aXxiohtrFOdP8XODrxAgf4amr/bs+Xuv13ItQhxrhmmIhgMBcByhAcrNxCZXHt6PBIM3
         g0rnRLQoWK+BdVhj34Rlvqpz+A+WVXzEAuqWqWd9xuzK6Mmln+IEO2SR17hZQry3XmR0
         ZSFgBdLUID68mcVWxcDOrtwGZjWLiF8EakhFtRPFfhGmYG4oLcTf+5Og+yZJolPJHtND
         1R7NAlA7yF9Qur6K++AOlmWvz93p1Pp4hOK3uQOJuSiQzDbARoWjdbvh0D9+xLS2uh9E
         0XiA==
X-Forwarded-Encrypted: i=1; AKwUvBzVEoUNDCVzk0bjLOTWZ4C/q847BFgqWiCuuLJZWskrkhV03cwUkR3CYIJ0H6ZbM82oj3XLfgSrB/v6Acb/7NFT@lists.infradead.org
X-Gm-Message-State: AFuF++lTA9scMvmkqzNj88mX1auO6ZdZ4DIomOx7SA9OmEQxZWTuaHpp
	qHMSedwwxtqw4JjckhvZU1NPugi8Xlj9D4QLq/h7iNcziLr1ZiOgTamzKXXfE2t/bg==
X-Gm-Gg: AYBFou0RrSt0R1l2bPXlCT9WR+v+u/2rSzr24Mg7DdR9fVOQAciaY+nZOe/a30a2bvm
	wm591rjKkBsxIZb37bE1uwI3POPsOoB3O+SAZj3o1R5Dp9mmfah57dXZ0cXOLSMwvvZ7vjRourb
	fLe9TvxHT+O3GtceFw58hWsumPWkob4SDno8W8neGEf8+YcjxWAIVXsfDrszp/ENFt9zlVsuaRx
	BHJiA37GGdiR2K8GpBEASVQRdgWIK8B7rMnx6ENWTwBXPHkq4fzIHO8jsT6QD4Y6ZBL01qC6QqZ
	dqeBu7sF8/zswYHn6oibw06TRObpBcIAlv+DuaBYLHYaCjCOuVtlYHuzUeLb+ls6l3Qw93ze87m
	FWmnzQlu8NE7PrbV4QvE9s3tQCE64XtrDCLcgpvrzrEj9vQtWZ/od82bAMhgKhb6O4hvjRQinIM
	5kc6W03yBm75hP2SDbzIKTtb2878fUKqHLZ+73C/sfvZEG0lM8oVI170RHCsG8Yp8cE/ODe8aDz
	3aJNZBnJQTyOCqtVYoDKjAps2/EieLhQOgqjwg57R2AXg==
X-Received: by 2002:a17:903:3d0f:b0:2d8:d4ce:7e3b with SMTP id d9443c01a7336-2d95d5fc28amr40543015ad.16.1788249004522;
        Tue, 01 Sep 2026 00:50:04 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:8cf:6df0:9c4e:f5e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b699sm48142515ad.59.2026.09.01.00.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:50:04 -0700 (PDT)
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
Subject: [PATCH v6 4/8] i2c: of-prober: skip post-power-on delay if powered on sufficiently long
Date: Tue,  1 Sep 2026 15:49:22 +0800
Message-ID: <20260901074930.764550-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
In-Reply-To: <20260901074930.764550-1-wenst@chromium.org>
References: <20260901074930.764550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_005005_446171_26085F75 
X-CRM114-Status: GOOD (  19.29  )
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

On some devices the I2C component is powered from an always-on power
rail, or the power rail has been left on by either POR defaults or
the bootloader. By the time the prober probes the device, the device
most certainly has finished initializing and can respond. There is no
need for the delay.

In such designs, the system integrators tend to work around the delay
to avoid the boot time penalty by simply omitting it from the device
tree and the component prober. This is undesired, as the device tree
is not fully describing the hardware.

Switch to the new regulator_enable_and_wait() function that makes sure
a certain amount of time has passed since the regulator supply was
actually enabled.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Switched to new regulator_enable_and_wait() API
---
 drivers/i2c/i2c-core-of-prober.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 6a82b03809d4..f9f3c0ef93ff 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -18,6 +18,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/stddef.h>
+#include <linux/time.h>
 
 /*
  * Some devices, such as Google Hana Chromebooks, are produced by multiple
@@ -226,13 +227,11 @@ static int i2c_of_probe_simple_enable_regulator(struct device *dev, struct i2c_o
 
 	dev_dbg(dev, "Enabling regulator supply \"%s\"\n", ctx->opts->supply_name);
 
-	ret = regulator_enable(ctx->supply);
+	ret = regulator_enable_and_wait(ctx->supply,
+					ctx->opts->post_power_on_delay_ms * USEC_PER_MSEC);
 	if (ret)
 		return ret;
 
-	if (ctx->opts->post_power_on_delay_ms)
-		msleep(ctx->opts->post_power_on_delay_ms);
-
 	return 0;
 }
 
-- 
2.55.0.897.gb25b4bd76c-goog


