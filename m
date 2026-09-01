Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E1FC624C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 07:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJzWbza2zag3QhFxPq/teShXqDf76npySrhO2+9Jdis=; b=VKhtNb9UANxTDrxbtDRF+b7RdD
	XwWHxWwuVxcCedvt6WLTH9kYaooFt1rNAuVzlyPqol1HNQKTS29+gj+dDGB+PK8CxzSBFe6KBeLr0
	0G3LHz0hqs3KYsAjqSvoN1fP3lbcwag4B3ApBsFbl5jTmq7r8XT8sKrlNzrjzwizjba4oIyKX/87h
	BRHBxl9L+7CGotMfhQiaN7203yb1hHVfnax0A1sGQVDJnxr65zW26IAGmXlackbV1Gr5dktRQNZ49
	G1rC5+zYlsO1bICHdNUQR36HJoCcpe1hIGdJm1cyFkl4fVrLoEaUYtiRZag1HUjCxi8C0fJ6G9CsG
	Iyu5OR7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JFs-0000000BA9u-2Ixs;
	Tue, 01 Sep 2026 07:50:04 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JFp-0000000BA6I-2Pl6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 07:50:03 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2d7195706f1so43951975ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 00:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788249001; x=1788853801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJzWbza2zag3QhFxPq/teShXqDf76npySrhO2+9Jdis=;
        b=obqyvsT8rWyD+G+8PsE+pUGs9Hgy6JjdMf5O50jeYIgO5f4piyLK/nRBusKEMKbRTZ
         B0uWcjKf01h58zEc0kHST0I+hFARIRLeCHPwUgTJ138G+S6kaseq2QM8NAj9VjqsvsFs
         weNNHPPJUCxHlbO4xLGTigBW+5bco589ZR3G8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249001; x=1788853801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wJzWbza2zag3QhFxPq/teShXqDf76npySrhO2+9Jdis=;
        b=NlzU3Wwe3UA2YrSfVS1U4yP+pBqC+th6YZwp8Nyd5rn0gOa6l+6hKLQor7/aSmgggR
         7Ocj/f5x27DEEqkwrDy5AhX+8iqcvOuRbSdOBOC8mqFALY0YL4xFiPzZ5UqbFTOy0YEl
         n2iqqQCHYKFBKZIpgNzOuuJOJikIQZohTctVLGzxSzMdGXr28NX2ze3XzotmgssKAzJF
         edBqgnmDoWFDZM+Bk2ciqrtCJmCG/KggZvmkkhVGSg0yKSGl2dQbh5HNIpAUkQ2Bzw4q
         27gl68XAtvth2g7K6I8kVlMDrP0vF1sLha+ZpPY4SgBp1aBkAkifubdJtL7W/CqAgvep
         JutQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0IVK+hpJ2sT0yJUEL9YOZquBTLBrNliNOsMF22gxYQnHKsTeG+m3Ei4NgFLoLk3jxpMzRXW3KgzHdaEfPpep7@lists.infradead.org
X-Gm-Message-State: AFuF++mC/of8TQp/VhVrfWATTj9S3JXmFlwsOxgsCBdCNpaXT0+TbfWL
	Y67kQLJT+PAJbGExKBWQ1g8Z2lJ77tO1+hGzj1bchxbpIW32vFNtWf3e0IAUxoKrcQ==
X-Gm-Gg: AYBFou0q5m6ME5mmzDbuh2bTrL4f0yjH1lEnQnOzBCLOxvOQ1obJGG6vTHdTi7REMUs
	BIlbGTWODu/KviQLemwp5C4mlXdc/NFN8VQ/ygg8Fc9pKcHdyxfjb6RmweiiLi2OWrdc1V1Zu0r
	B2Fm7hPNuGM9lmalB3BZsn1tjZc3QxIq8EsSoOWIAP818n8J0Y2KJ6H+XjX2ouVLz+1I+gZsmwy
	9ih4QAai1UiLmou4HrCTpAW9zBlvddBAlcTxQGjEWziWASJnfQ9DadE2c8/OTmJU1OevUbfHHg2
	52s7gGEy9sjJ8rVftTQw1WNY2CYh57dN9NvDxz9xdVrAgz2rljKoUn1n7EfVUX5VrMhBdcTHh8X
	0+r/aLEC30rj/DubYiqmNHWhf89pzB5AHDbNwfq24wVEwonjDKExSufRErqDqOyUK27P2/DERyz
	ImzOCPW3LYLUkiO7hIjgUqm8c0lrfEOz3rnDrU0igfWbcuFOWp9eDSs3qbLeJoQI4eWEYxNw2Vx
	V9A6bbyxlv7je3wpOBGjaDEKRwnma1G63+3qSYXDLC8Kg==
X-Received: by 2002:a17:903:3d0e:b0:2d8:d4d7:f055 with SMTP id d9443c01a7336-2d94a930d44mr91456335ad.22.1788249000970;
        Tue, 01 Sep 2026 00:50:00 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:8cf:6df0:9c4e:f5e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b699sm48142515ad.59.2026.09.01.00.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:50:00 -0700 (PDT)
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
Subject: [PATCH v6 3/8] HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently long
Date: Tue,  1 Sep 2026 15:49:21 +0800
Message-ID: <20260901074930.764550-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
In-Reply-To: <20260901074930.764550-1-wenst@chromium.org>
References: <20260901074930.764550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_005001_605520_B173E9FD 
X-CRM114-Status: GOOD (  20.32  )
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

On some devices the HID device is powered from an always-on power rail,
or the power rail has been left on by either POR defaults or the
bootloader. By the time the driver probes, the device most certainly
has finished initializing. There is no need for the delay.

In such designs, the system integrators tend to work around the delay
to avoid the boot time penalty by simply omitting it from the device
tree. This is undesired, as the device tree is not fully describing
the hardware.

Switch to the new regulator_bulk_enable_and_wait() function that makes
sure a certain amount of time has passed since the regulator supplies
were actually enabled.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Switched to new regulator_bulk_enable_and_wait() API
---
 drivers/hid/i2c-hid/i2c-hid-of.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
index 59393d71ddb9..fdaad451e710 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of.c
@@ -29,6 +29,7 @@
 #include <linux/of.h>
 #include <linux/pm.h>
 #include <linux/regulator/consumer.h>
+#include <linux/time.h>
 
 #include "i2c-hid.h"
 
@@ -48,16 +49,14 @@ static int i2c_hid_of_power_up(struct i2chid_ops *ops)
 	struct device *dev = &ihid_of->client->dev;
 	int ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ihid_of->supplies),
-				    ihid_of->supplies);
+	ret = regulator_bulk_enable_and_wait(ARRAY_SIZE(ihid_of->supplies),
+					     ihid_of->supplies,
+					     ihid_of->post_power_delay_ms * USEC_PER_MSEC);
 	if (ret) {
 		dev_warn(dev, "Failed to enable supplies: %d\n", ret);
 		return ret;
 	}
 
-	if (ihid_of->post_power_delay_ms)
-		msleep(ihid_of->post_power_delay_ms);
-
 	gpiod_set_value_cansleep(ihid_of->reset_gpio, 0);
 	if (ihid_of->post_reset_delay_ms)
 		msleep(ihid_of->post_reset_delay_ms);
-- 
2.55.0.897.gb25b4bd76c-goog


