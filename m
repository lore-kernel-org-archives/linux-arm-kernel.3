Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F64C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 12:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W0rjMz7r89FDG00LgKpSG7rJxKNH2nfPyMU32ONUt3s=; b=OgfsQJQK/NJT6LUgBoq9VblncQ
	EwWspyo2NNoybSPifW0KghF1VqLInwpS1P47ZSeSnTY0YuxEaMIZuh1lw92uwBlMIPXIZJpU7e+5i
	6wezGfFNuYErjOG/DcqUmIqLt/xSC1UxG9Omj7DrNzje2kXE1K2pqaNLT6hOj1vlX9Jn7rpb3J7l9
	XQVAZq8UIAD652vXNVNFWXM2Uzktl2XZs+7aiFOSD5Zehj8L5XB9r66i+Sjcnu8NlXyuMf55vaTw4
	LCfSw824sB463DYBQSpjUzvCsTjGIi50FtOJ/LqyUYR2hOqAZPn0/1RhQV1PmAFmXRQxtFLSA04Cm
	bA2o5W3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlTj-0000000E0OH-08AO;
	Tue, 11 Aug 2026 12:21:11 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlTV-0000000E0FK-1Pqb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 12:20:58 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso2543898a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 05:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786450857; x=1787055657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W0rjMz7r89FDG00LgKpSG7rJxKNH2nfPyMU32ONUt3s=;
        b=QVcA+/xejkqANHuqD6deBy3rB3wf+ox5nIp56o+28MdZ3Xqe2+3lE0Pmosi9I44lcV
         YsUOsGZsImjX8sbxfZJgyeimHcNc92oe/DzocmfmMmN3pa+VpM7nhgB7uIAKeTQ6cVGz
         +6E7fsByZJPTAAAQQn2XDdM5GfK4ayFo+0mgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450857; x=1787055657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W0rjMz7r89FDG00LgKpSG7rJxKNH2nfPyMU32ONUt3s=;
        b=nT3cpEYH+E+tdaPchJUb+ctqIJEQDH37t+B+BO3RXyJp0bzgO4DH9nJZnorr6Em5a4
         0UlW+Q42lLC7gUUT5Gq04TN/vDhV8KjGpZNNiYSFp1Ye90kLciEIk/Iau4GXeGB7TQZp
         D9DzawSTsko6o3SIbQxoHEadFmXwOf0dFcfGwuG2IQc3S2fnXXUnjt6x4ilxjuvPPUKq
         jOtJVmC5slgb4ZQe0VFpSCxirchJtgunog8sLmKj1ImZTp4ly5X7lGnc6KSE1kZzDN5y
         HF1AiN62mgmnQCmwB0cDXKH9Is/vhmUHFz2/TpDqsZ68k94Qp8rKTZpPxXXJr4LVdzHg
         9t+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rph+GQkZmcOdZ417rMJdkF6fWeYKOpFvq6AwwXl0pSH/zOjgDAm/jb8dSRXyQZZIffHmbPUPbG4Z4ct6tr847M5@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0GE9mG7aORjZ3X8pyOx37KtDOaCrCwTRY6TtCMiSsX+frK8cT
	rfdfQ2SAGOyzugCoCSno7KSCwgj6eLkuDEGP7M7eHj0jQ+JbZ0BsnfW5Wgwikt3olQ==
X-Gm-Gg: AR+sD109JlstXwUGuG/lkZAINvy0OswUsMgshiJ45Uprpr+wTx91hllouMidueAODQL
	1GTz7ZUIogz7vnXWYpzHb+x18BdhZv0978fXnEHRl5T8NuSaPIMZlvwJttCwMzD7b+mzv/f5AqF
	o3m6WBgaFi6Ykw/QRp1u9kNIYecui3tbAq/znP423xCBombj8mFPqbPR/oW0NQV+8e5h+GUVgUF
	TZnKiyge5bPpczFSJbwhY91G1Jf2qC8aoR4eVLbfoFWRtn2n7ZWQZYX+6h0IvPYHyhkwNedboFD
	CiqMd1M3Oe6aDVeVig8c3G9ulx7/tmiggZOVy6P7sLj7K/KQrkP7Bncte00VcRV+UPncXxx+TJp
	R4A3UgGY49/BtZbrh/Oxvb8A7J7vBijXQtF1o5TYbfWaQHo2dY48d/POb8PpKuQd8cd8TxpPQce
	waCoaLeTuyRqxAiDzDCOBHzqLr8meDIZfCsYebX3+PyJCJ1l4xCuPCtkBh182xqF8ZvrBy7L/Vg
	hIA2ica5TBN09RJxOiIprwZSmOVtvRr+28k34NwUCnWaw==
X-Received: by 2002:a05:6a00:32c3:b0:845:40d1:87fa with SMTP id d2e1a72fcca58-84fa873632emr3028343b3a.25.1786450856753;
        Tue, 11 Aug 2026 05:20:56 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:12e1:df26:6add:1ea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9574e9dsm662454b3a.54.2026.08.11.05.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:20:54 -0700 (PDT)
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
Subject: [PATCH v4 5/9] i2c: of-prober: skip post-power-on delay if powered on sufficiently long
Date: Tue, 11 Aug 2026 20:20:05 +0800
Message-ID: <20260811122011.3539250-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
In-Reply-To: <20260811122011.3539250-1-wenst@chromium.org>
References: <20260811122011.3539250-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_052057_428411_BC90EB42 
X-CRM114-Status: GOOD (  18.65  )
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
2.55.0.679.g6767b8d81c-goog


