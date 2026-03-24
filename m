Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782F0F54AB0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 13:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5AwS+cqy4cAKKPRWlRgkDDFxDwgSl6qxYrDkjeel6k=; b=2Tn1q/9NYrss4Tf+V2dIyLs7o8
	o8G4q3RH7YDLDIujft7i+IMYcYNQqPeOiB2LvoqkEGo6GJktJ9fr6ezkhK+sIAZNVzS3w1kBZ01Uo
	1OzxvK4SP0q3v8zahKEMSo16qC087FRMyxWdKhGQeSK42qIdAQHVWQPJugIxZ+KTg+MhYflEgAr/X
	dZ83cCx49dCbiRGPCa84KHOZx2uMKFP+/+6p9tFYVJm6TXydhR4PBeGPki1/YD9DYkgafq1KfitO5
	mzSA/w+jYbThPYUFpon0oRoTUvuusGoUEJRn4j+Oh+J5Rxa9cSGQWYlfVG+ZEsiyCpYTp5Gys5Mb/
	j1N7MojA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52Dh-00000001aOq-0m5l;
	Tue, 24 Mar 2026 13:54:57 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52DY-00000001aJi-3gl4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 13:54:50 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5a281b091c2so1515458e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 06:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774360487; x=1774965287; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O5AwS+cqy4cAKKPRWlRgkDDFxDwgSl6qxYrDkjeel6k=;
        b=U66XVtF0uJs/7tcsZRp7Q+JQLbmEq59I3E48iu+g2mmtKJ4zt++NzjPZwa6uBX8H+s
         RlpHbZX4ILoo0NxENQOfFfU979RQKnJVcMCq49fbII4FlgAivqfzaIQA0PeunCgTo6Hx
         PtPcc+mGq82v3eWUcnWWPGtwhGukcGkU5EEr7bA0ZCKRjDKYDT8tTVAdDAsdWXduew2a
         q9IvJ5mlGa8mK73Atq7pzdPZkhzFGLJBJPD1/60l4aDv0AVMlDO8CSRXNKaiJpoQ9cep
         EznlfMbYok5e9tyc+iM+qLOCTIegAXx8ZsMRP9YVtCaNeV77/Wt0Ak2nhRWN6P/8H1o6
         h5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774360487; x=1774965287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O5AwS+cqy4cAKKPRWlRgkDDFxDwgSl6qxYrDkjeel6k=;
        b=AXPbabqgNNdv1eDHDGAc6zgKE986CS6WHHCKg/ftw3ZnL7tX3c0DSEim3687jIqHgp
         xQO3dR67ljQyCZnI0CHsC6ARUYtjyRDD0YbCFrqFM4ZR1mFyTjx0MiaTrbdcI8bvfYhC
         1GCJ0EwCrL305+blBGpTbCMmPcpaaVxUZqTLFtn6S6DFdbzfzQhh46PalxDl8H9A6S62
         HAzIkCHKcK5FOOHhP+ZXW65Q6dCbGbhZ1DYP6NdRzhdi8iLewled5s7SnmDEGDj+eVia
         Cn/mhtc1QVsWbvaxQJiiBgizbHbrYTq7TcqHZ8cu7a5sLS9lfFzV17RW4Kb5LZfaE+QU
         zReg==
X-Forwarded-Encrypted: i=1; AJvYcCVFvi1jC2PrjWI6+3XWXX3QviVinuJMCWfwGT3r4N3tz+aHhFM3PVZR/re7uKFzSS0SMsfGrd3ds42uRLRtVqlt@lists.infradead.org
X-Gm-Message-State: AOJu0YyG1YWx5ln6TFaDIsy7DIc2xH8sqbC1V8lJywYctgM8Oqfq1jHL
	g5bN9S8XecItcEoytOdkPMU6eZ9RZdfhp8OqW5hAjSDyKSFzJSdLVn8N
X-Gm-Gg: ATEYQzxjJ3pMy1+/CyneqszGlsnYE54LHKi8X3Dwv09Ae4R04d4yq9mdwOCarTA4nko
	dgK2MvTzsCjL6jviyyziJqIZyTvPtZpjjXCY7fdKEr9/dqZl+GigWgpDkabjEwoZmoyDNQdy+8I
	VBD//QDHa55yPiaKHehcqM8iGwRVNbH0Bi48kOiBxQZTcNA+z4a7z+xkwIvLKy4/yoND8QS9XBl
	6AJmDAdh5b6UPa9Oi/rdtnLlIDu+z+aQpBioxnvO8SgKHfnVyEnT8B2Y7mLT3VQMkPmyWcUf3Ao
	OZQVVKMJC9kV6DCBPCBaoRTgimeaK3teCcW/2YZib4sXGcwSeWRKtOsQEEdqq5Uz+wZzWC8UTlz
	OC3Xjl1MNO5TCHwTAqHWeN8AlzVSIM65lM1QFGbh9KZ07yZQy+6BgeM+A4JDmsYSHRKJ2EAPGOj
	clzA2anGZ86V7wybELbZrr6m3cQXp/pPH2KD8K5llwtohnvjAE0guRxgwLZZ7DsGxgaJAbiAwYO
	Z5JotM=
X-Received: by 2002:ac2:46e8:0:b0:5a2:86bf:39aa with SMTP id 2adb3069b0e04-5a286bf39admr3361995e87.2.1774360486576;
        Tue, 24 Mar 2026 06:54:46 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207454sm3162823e87.48.2026.03.24.06.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:54:44 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 24 Mar 2026 14:54:17 +0100
Subject: [PATCH v9 3/5] i2c: davinci: calculate bus freq from Hz instead of
 kHz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-i2c-mux-v9-3-5292b0608243@gmail.com>
References: <20260324-i2c-mux-v9-0-5292b0608243@gmail.com>
In-Reply-To: <20260324-i2c-mux-v9-0-5292b0608243@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3233;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=vsSIa0c3XvGrZdSaP0ssvqDlYgrE1wL3DrKCmY5NXO8=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpwpeXnuFJFWzexXqw09JiHF2NlDfub0tdgNkAy
 JmNB8DycneJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCacKXlwAKCRCIgE5vWV1S
 MozOEACOJ2bpbAAilgam5B/hfpEicuTdw7nYs4wdBsggK24iT7bbb1s1mO1+BGuTP51q6MKlptY
 SpQQzE26PEk5T9v/sEa1on45fHW3qPqwi8leQ30vBk4+lJlfWXJCXuZ7lwvx3/5dC1jNXM+psTr
 Ii/NhpwlYN20GV3NWfLDKRi0f7Yn66t1kcPmLiQ/fpVqlN118+xXwBkdVzqYKdPMbkrBuzXqh8V
 MAx5HBdeqGVR9y/gMmWKclBLWBZ0fT4D9mHGI8a2NcMzJDgvBUN9Da100swKoWerXTXC4E1BXwA
 3GbOt3pVW9Gg/JhhF2aSlOz2kW4Oz2T6TQsRk5UfDmAHIrNkeEdwLfv9EHHkCfFXuPbMAsjRgim
 FAn3jDtVCbZHB/n4iiPCChGPo7QkqXdAfk2MlQC6OSKGNtvfLOG3IV5MOKmzevxYcFgqBgpKBiR
 e4S+JVQ9sofJTt4b0jFxpraujpKmAnUoe9JTtqNEo9fMWAxZZywZtp224UzpWWZv0It9rNfsgGv
 MLoafcSTorixc3gva745S5KlCMoWgA7y2kXehEdwBhpNk9x53P9clEVLXBbOy8Vo7aVlPEPDTbY
 zCNMSk7iOwhcmJV1SYdwM84btVVf1bBPdbMENP/+2dUOn69Zt4MjL4Xl7o9pmyrjRWYYlJpilQq
 /Nj5lSnT6J0B6Pg==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_065448_962372_0FF18C3D 
X-CRM114-Status: GOOD (  19.60  )
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

The bus frequency is unnecessarily converted between Hz and kHz in
several places.
This is probably an old legacy from the old times (pre-devicetrees)
when the davinci_i2c_platform_data took the bus_freq in kHz.

Stick to Hz.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/busses/i2c-davinci.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index a773ba082321..549fb22cdf4f 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -117,8 +117,6 @@
 /* timeout for pm runtime autosuspend */
 #define DAVINCI_I2C_PM_TIMEOUT	1000	/* ms */
 
-#define DAVINCI_I2C_DEFAULT_BUS_FREQ	100
-
 struct davinci_i2c_dev {
 	struct device           *dev;
 	void __iomem		*base;
@@ -134,8 +132,8 @@ struct davinci_i2c_dev {
 #ifdef CONFIG_CPU_FREQ
 	struct notifier_block	freq_transition;
 #endif
-	/* standard bus frequency (kHz) */
-	unsigned int		bus_freq;
+	/* standard bus frequency */
+	unsigned int		bus_freq_hz;
 	/* Chip has a ICPFUNC register */
 	bool			has_pfunc;
 };
@@ -209,16 +207,16 @@ static void i2c_davinci_calc_clk_dividers(struct davinci_i2c_dev *dev)
 	if (device_is_compatible(dev->dev, "ti,keystone-i2c"))
 		d = 6;
 
-	clk = ((input_clock / (psc + 1)) / (dev->bus_freq * 1000));
+	clk = (input_clock / (psc + 1)) / (dev->bus_freq_hz);
 	/* Avoid driving the bus too fast because of rounding errors above */
-	if (input_clock / (psc + 1) / clk > dev->bus_freq * 1000)
+	if (input_clock / (psc + 1) / clk > dev->bus_freq_hz)
 		clk++;
 	/*
 	 * According to I2C-BUS Spec 2.1, in FAST-MODE LOW period should be at
 	 * least 1.3uS, which is not the case with 50% duty cycle. Driving HIGH
 	 * to LOW ratio as 1 to 2 is more safe.
 	 */
-	if (dev->bus_freq > 100)
+	if (bus_freq_hz > I2C_MAX_STANDARD_MODE_FREQ)
 		clkl = (clk << 1) / 3;
 	else
 		clkl = (clk >> 1);
@@ -242,7 +240,7 @@ static void i2c_davinci_calc_clk_dividers(struct davinci_i2c_dev *dev)
 	davinci_i2c_write_reg(dev, DAVINCI_I2C_CLKH_REG, clkh);
 	davinci_i2c_write_reg(dev, DAVINCI_I2C_CLKL_REG, clkl);
 
-	dev_dbg(dev->dev, "input_clock = %d, CLK = %d\n", input_clock, clk);
+	dev_dbg(dev->dev, "input_clock = %u, CLK = %u\n", input_clock, clk);
 }
 
 /*
@@ -269,7 +267,7 @@ static int i2c_davinci_init(struct davinci_i2c_dev *dev)
 		davinci_i2c_read_reg(dev, DAVINCI_I2C_CLKL_REG));
 	dev_dbg(dev->dev, "CLKH = %d\n",
 		davinci_i2c_read_reg(dev, DAVINCI_I2C_CLKH_REG));
-	dev_dbg(dev->dev, "bus_freq = %dkHz\n", dev->bus_freq);
+	dev_dbg(dev->dev, "bus_freq_hz = %dHz\n", dev->bus_freq_hz);
 
 
 	/* Take the I2C module out of reset: */
@@ -760,9 +758,9 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 
 	r = device_property_read_u32(&pdev->dev, "clock-frequency", &prop);
 	if (r)
-		prop = DAVINCI_I2C_DEFAULT_BUS_FREQ;
+		prop = I2C_MAX_STANDARD_MODE_FREQ;
 
-	dev->bus_freq = prop / 1000;
+	dev->bus_freq_hz = prop;
 
 	dev->has_pfunc = device_property_present(&pdev->dev, "ti,has-pfunc");
 

-- 
2.53.0


