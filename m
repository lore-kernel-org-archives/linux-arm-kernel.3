Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442A2C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 12:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7AY/BjzRkfyU3t+6SOkz7/qVT24RkrhiWULr6d4aAG4=; b=gVljLQsjyKnp+W/ClUtIPOk73Z
	EUC35Pzopuw1mVIu8PEMlpVHVqeuYZgmCSsqZBGTfVUSzS7vjBA7gqOxpzijlm7e7YbW1b05mvGD5
	KkxIcmxTS55o83ApQnRiR2YCh/RbSgQx89AldoHHsfDA0N1qQpRFYzqcwIt67BZCnQNpAHceEKfM/
	h9fEbi5kMhk8kD7vKyV6dfY8M3SPWDtT15DsPruRJPrbprPpgqOSrANbakJ5Wub57VABLkIDrFjZC
	bPbIIYI2P6YP8dgyZH0f14752mDOP6rloYbQCOVi3nCpJh4li8c5aSC1nhPeIHZhRHto1tAJ3VnaB
	7Xqd2h+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlTQ-0000000E0BB-17xE;
	Tue, 11 Aug 2026 12:20:52 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlTL-0000000E06J-3o0O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 12:20:49 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso2016563a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 05:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786450847; x=1787055647; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7AY/BjzRkfyU3t+6SOkz7/qVT24RkrhiWULr6d4aAG4=;
        b=l88x1R58VkI9E2vUvkIZBkm2d886qQruM5HwEbap4ZlEX9YCSzeQWomlcAsH2P9uhj
         u6d5H+ps/dmVLQv7npmj4Hz0iz6z7bXlj4PaoF8vwzaZGB5YbK3x5CFxmP3r+JbjkKdZ
         tiqu9oLwS9GT3gBWRcr9NcDC0c3TTO6lR8/f0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450847; x=1787055647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7AY/BjzRkfyU3t+6SOkz7/qVT24RkrhiWULr6d4aAG4=;
        b=JNa7ANSNzwDRv3u/F4/L+tYcbvgoNGLLnrsJ3t/TtR/cPjozWgUDpCrBK6SUlodEB+
         XrHqiE6w/Os4oBMSkbBlFmEWeO0LB/sO/ySNhC/TqcVj2Vf3BpeEBUfe+DaDn6TO2XAZ
         3oWLjtKVQNQ4FTfeu9XIjyaKSi03uoCHgy3GT0+SNsdXZv5VZBGOeAumQNqc1qQOf1Rw
         MLlTIIs8NqQi+/6/7M+emn5d8hI0lbLKacxETwGEXy3yAzJlmh/mHU0CcOcCLqvMILmb
         cpMqmhHcQA2qQsi408mnFgLEWUIc9D0Kd74Syn8Rnhm4JvMXIYbiThBvSZrqs0v26ObX
         riBA==
X-Forwarded-Encrypted: i=1; AHgh+Rqdx6Pk78epOn0FlEisO8wEC9H5L2Q0e9d6UG7e7iAnjIWWPQmyksN+mjC/itNKBGN9RDjkzHFAzQ+GX6dYro9n@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ7KctOl8McY0CezIGAhdcV3ecDX374o5WKHJ3I1IbhCgu+G0W
	RuFEK/8hGr4nIn8xnPu+7X4ZfrK/g+T2YO9W7pAupdifRkZiWhwJv8uQZQ3yF6qUMA==
X-Gm-Gg: AR+sD12kY8JzGrd9MhvPLu4p7TAgqK+u1plRPcyyIGuXy8MKA9niQk0A3/xvQtKtMeu
	a31iqJO2c/L8kllneprp6lCUG7kOrVC9FwlF015ul1fHAmf4DxQ5lzWSKOhpT1aMODtZNgAZJSj
	vqgZKy4hukLUfq19jEZFSbEGNixpMzaYkvu39fwbXmLBAQiTlie12vNRj8qg3gdkjGpjqfDdrxz
	8aENQ3j4iOEeHBFasg2/Giz11oGqSAKbktdAjPB5I4x/gvmbVvA+32SX5NmA3jeCrKYj3/K0TdF
	U1Jn8I5yP3qqM1XTCTqX8ZunZT3nbYBGqM85IEnjIPAjOkg/2oXFI2EEDA/FxTLUn1zimKZhueJ
	xV3zyox9onpQ1XMmuiSEmM8bAfD6zKlQxqqJbX500He/kkGsmO9vw8VoUEjWsh4VIUXt7slG8tz
	9F/CcmB7a+dtMdu9JbgMb2xgLoOSFDztAGwxMzzlMdHT9gL48dzcgcs/24D47Nb0RkB75DcnxZD
	y0EkKzotS3/bOBbWbMvUwrO5SBY8YE5wHkjqHqB7prlwA==
X-Received: by 2002:a05:6a00:6ca1:b0:84e:89a:b8ec with SMTP id d2e1a72fcca58-84fa86ab177mr2896532b3a.11.1786450847047;
        Tue, 11 Aug 2026 05:20:47 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:12e1:df26:6add:1ea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9574e9dsm662454b3a.54.2026.08.11.05.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:20:45 -0700 (PDT)
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
Subject: [PATCH v4 3/9] Input: elan_i2c - Wait for initialization after enabling regulator supply
Date: Tue, 11 Aug 2026 20:20:03 +0800
Message-ID: <20260811122011.3539250-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
In-Reply-To: <20260811122011.3539250-1-wenst@chromium.org>
References: <20260811122011.3539250-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_052047_955243_15BDF534 
X-CRM114-Status: GOOD (  18.12  )
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
index 9f024a435dbf..77885930bf9e 100644
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
@@ -1250,7 +1253,7 @@ static int elan_probe(struct i2c_client *client)
 	if (IS_ERR(data->vcc))
 		return dev_err_probe(dev, PTR_ERR(data->vcc), "Failed to get 'vcc' regulator\n");
 
-	error = regulator_enable(data->vcc);
+	error = regulator_enable_and_wait(data->vcc, ETP_POWER_ON_DELAY_US);
 	if (error) {
 		dev_err(dev, "Failed to enable regulator: %d\n", error);
 		return error;
@@ -1406,7 +1409,7 @@ static int elan_resume(struct device *dev)
 	int error;
 
 	if (!device_may_wakeup(dev)) {
-		error = regulator_enable(data->vcc);
+		error = regulator_enable_and_wait(data->vcc, ETP_POWER_ON_DELAY_US);
 		if (error) {
 			dev_err(dev, "error %d enabling regulator\n", error);
 			goto err;
-- 
2.55.0.679.g6767b8d81c-goog


