Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D40CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 07:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FGe2kCYyrBIF4DaoEyXhe9vc0rRZs52BhYtoGcoY0gY=; b=mf3YiEuGml0UROpfjXdhkcf+hU
	J+tjF3VaMIr9DRos2v/4spQUKpyVfpB4j+NmXH7mp46CVrH1hJiqsnCYEHlUMW4RzBIoU0/U9tb0P
	pYDRDAEVMUw/MrsVUEm4argu580qCtBDw9wsWA6i8mfsqbhz4MLuS9O9jkpF5CK16S93DMPr07pAK
	T40FDNfXR+5oKCYXjGQWKIuCeR6bxCm5mCbhNhdbtApD5N6KP8ByHJXT7i05P/LhX87CBufAhfuXl
	5zRSBkJlE2SFh6Io0J52zfXGkVWnlviQxiSXgyx6FIW0q7jr38f/FJ42S3yJGvO93jp4CmX5tSuxQ
	a3ezTVug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFDO-0000000CXfH-1RS3;
	Wed, 10 Sep 2025 07:26:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFDM-0000000CXbJ-0rSc
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 10 Sep 2025 07:26:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=FGe2kCYyrBIF4DaoEyXhe9vc0rRZs52BhYtoGcoY0gY=; b=reQDh6T85jRZ0xSrJDieBtAfsi
	oieR2JZ7UO9egismtV1lLFGkMNp8deKO8Bh07KzNXHF6DUWnx6K3IQju5WPSVHL2H3S8sbyuADmmE
	nKWzrCtTqLoRbMZzs8EjCtYxU9bLPBTyo8t/pLfI3XsovtYQ7ybVhtLvckzs5xer9i7y3kiGKjr06
	ottmKzP2T+zIASqvIIci40DPlo+Td1+rXU2fvEU29q7C/XAkenu479nsbimKJk3d375IxiskNg/mt
	9CpMAbVAF7s7hPQInbwwjgS1VfT+SrWzaG/kNvnlxd+sYa+vR02ZsNk2P64e4j42fu4LrlN5g7n8O
	WigcXe3A==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFDJ-00000005l77-0Gb7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 07:25:59 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45df7dc034cso3525065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 00:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757489155; x=1758093955; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FGe2kCYyrBIF4DaoEyXhe9vc0rRZs52BhYtoGcoY0gY=;
        b=A2I/ShIhrlupe63eWZNW5yN8RH9EKURC3fqSVv0z1oNHC1g7Jo+r9Yy3WUEW5b86W6
         eGV3wg7yRxDT/JYHEvLWSBvCl3G0SgbzBKRPH2/dD8DZGF4ywkWY6uMpOAo5NIZmcCMl
         qEyWPc5+/xclHo0oi4PjuJJWRnhM5rZMLqjL/GVUjvc1oyeLT4PkA13BEmSIzkGTEeLq
         7Dsf85v/N4xDvZYnYSuxRS396OeWlVHKF5ZXEiikA9l1hvthUsM3NRVPGnyITY1y03k8
         tZiFJAVfFyObgzBXb/zb6guqOkT8yGvxIOstBCi5klGlxdMiW9ZzT1zumoWXqLW/Y2iK
         vfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757489155; x=1758093955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGe2kCYyrBIF4DaoEyXhe9vc0rRZs52BhYtoGcoY0gY=;
        b=R6pvSQ/Ad8b9CeMLiDb6qVevFrFLSNIAk+9+IZOFJhkenXI0PouG6X2aBwNuqN0JdI
         dfTMcz93U6m0kxTVpLewuOFnqKWD4tRxUpLzcFIX1ym4CPyqNjzABLInTdAsmq6UpS5a
         EvlCd+kt7wuVtHHNDuaHl2QPsD+cEIFGLhpBLchJwmWS8lR6gb7xEwmM6emAHCoumKmq
         JlL5vAxcFB1NExHzYjPmsOQKb/Oq/9eJMAxHKOZuj2k6IGFlsHlb4sQvGGCo0v7Lncwt
         J+Dpct1tb6yRIdMfQw43B43n7mejh6QjKO6SL+MW6OfJW6fvB4rUkJAy7d/LJdO+cCDI
         f1pg==
X-Gm-Message-State: AOJu0Yx+FiqAX/Lo7Am0iuscp85jh+frmXnDl/NDsdchrxjptFjUSgyA
	iRhQBkYdv+o3w3D1+n9DdBCSuTHVIE08cQjAXYuShvdPUQsYeR3yR4n6BHcWmjPAQ04=
X-Gm-Gg: ASbGncvjjPmGAz3yjVnGe8u4LFmVJudcYOWyaCh0qqK9do6Q/BlWGNlL7S8TOa6dY5o
	XYqXY5AXaI9Lp8h9sK87vENMKkB2hBUIKz1r+Y9JVxg0MW+O4Hg9tLZI967I1WdJLUUIWUUSRhA
	OvsQFOU6KAgr/Z/ObduP6+duMHXIIgxVXnowxHmxIea99f9j8tEDPuhKSEA154U06rmNeRNI1a2
	Yn/fSrCUG9oqPVqW4LYyx4IsUZQSJXYRJNQ+YDEn47dPJ0YdPRhKjjZF7TBeEprQP7wpB5LrmZe
	hDhG42wnbA7orxl3sG8fJ7yJf5ryMN1+VQgIRbQPAVYAw2tY07GhMeJ84IPh1EFc7PSpxv/1VUF
	QLsXvXvNcYJzAOD2xETQ50YRbu+rN
X-Google-Smtp-Source: AGHT+IFKukxuWQbV3GQkjDT5tJO7ETqBsVAR9QXCb3Q6hoLg7Ipuas1CKAmh+SOgrGuDOECJ9CxThg==
X-Received: by 2002:a05:600c:4ba2:b0:45d:f650:376f with SMTP id 5b1f17b1804b1-45df65037a8mr16159965e9.23.1757489155474;
        Wed, 10 Sep 2025 00:25:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8236428sm16729825e9.24.2025.09.10.00.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:25:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:25:46 +0200
Subject: [PATCH 2/3] pinctrl: use more common syntax for compound literals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
In-Reply-To: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
To: Lee Jones <lee@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, 
 Hoan Tran <hoan@os.amperecomputing.com>, Yang Shen <shenyang39@huawei.com>, 
 Imre Kaloz <kaloz@openwrt.org>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev, 
 linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3691;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=tWDuSmRqjBxh4PCbBXZnSady6kuFU8Rp72hLJEvwTyY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSf8QZSyHCR/xAEwQhF3yXvsq3FFB2Sm0TpBi
 tTuwCsYkxeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEn/AAKCRARpy6gFHHX
 cjLEEADOrejKydnAO7p85xcuEBK/60vbBbndYaZrZm7VhXvcHChD6etGR9x/gUym2NKntRzIFsL
 hAXVhRuugK9dp6StaYPOv0NzNg2DHcw92GeNV1ULDNv/30mZ9sw+dy7U36UDGUF/KoiRIAm8iba
 +5A4dTlF2MpVWXQ2GwUyGaIareKlqy3x20YM/2GK9plb6g1DEexAqB49SWARBjv54DYfFP2IRu8
 2fwwsm62dpHpqSVvggXPlROV0Q8f7t4uHPGU2pXh+8o0BG1Ajkg/btvLzTMjCCcK/jRyQp9IbEK
 /JBENsMRS1/eBdlhuZJDv9okaKfAXrSadQlX2eGOZ7J5/9MjqLU8C6uO3xxT4NIP9H8H/Do7C/0
 5FskCXqtSsbFOlbGaDuFD3c5GBgoYSX4bzC45Ulqmdu/oBRgtjFtjalSE/oil8BkOnp0fNYY2L4
 alFoFFiKMyRYIv4AQN6JH5r+KVvxbCOLCQnjHkYs8E7KAYKIbd4YgSYOfqS5YMhNhcUyfU6RmqP
 KSBeRYlyoKiaeo7oU7kZid60qvH6K/JPXDowfDz6OhK8a7ptCBzSF5md7/9/z0huGOcZB7nimGk
 EdU2rJBoEaNl4MGY9Md2JqQEkgsF2omrEVhjvDKeAQKX0ALrzTW7a1k3U9SLIK/rulrTObN7XHB
 yIXBeQDJ0g933cg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_082557_354803_1B222812 
X-CRM114-Status: GOOD (  14.09  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The (typeof(foo)) construct is unusual in the kernel, use a more typical
syntax by explicitly spelling out the type.

Link: https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org/
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 2 +-
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 2 +-
 drivers/pinctrl/pinctrl-equilibrium.c     | 2 +-
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 7f45c2897c3f270430ef7ac34ef064b2e2c58abc..4e8b5e6d1e4d48acba85e8c14e79dfbff6e6f6d7 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -1836,7 +1836,7 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 		if (!pctrl->gpio_bank[id].base)
 			return -EINVAL;
 
-		config = (typeof(config)){
+		config = (struct gpio_generic_chip_config) {
 			.dev = dev,
 			.sz = 4,
 			.dat = pctrl->gpio_bank[id].base + NPCM7XX_GP_N_DIN,
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 920dd207792596055d6f6da9403a9b7516531277..fd4270a8fb734e1452b30dad390a80a50072fb61 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -2329,7 +2329,7 @@ static int npcm8xx_gpio_fw(struct npcm8xx_pinctrl *pctrl)
 		if (!pctrl->gpio_bank[id].base)
 			return dev_err_probe(dev, -ENXIO, "fwnode_iomap id %d failed\n", id);
 
-		config = (typeof(config)){
+		config = (struct gpio_generic_chip_config) {
 			.dev = dev,
 			.sz = 4,
 			.dat = pctrl->gpio_bank[id].base + NPCM8XX_GP_N_DIN,
diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
index 4dd8a3daa83e44b0e2780fedb03ab11fa46a4b7d..ef569525e9c6b00add773258f81b57db38411738 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -1064,7 +1064,7 @@ static int wpcm450_gpio_register(struct platform_device *pdev,
 			flags = BGPIOF_NO_OUTPUT;
 		}
 
-		config = (typeof(config)){
+		config = (struct gpio_generic_chip_config) {
 			.dev = dev,
 			.sz = 4,
 			.dat = dat,
diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index 7e655b0444b359906a6b62e38873d740e1ce26ea..2d04829b29c9976fdebbaa56e6c1407eafa121a9 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -241,7 +241,7 @@ static int gpiolib_reg(struct eqbr_pinctrl_drv_data *drvdata)
 		}
 		raw_spin_lock_init(&gctrl->lock);
 
-		config = (typeof(config)){
+		config = (struct gpio_generic_chip_config) {
 			.dev = dev,
 			.sz = gctrl->bank->nr_pins / 8,
 			.dat = gctrl->membase + GPIO_IN,
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
index a8a4c2eee837ad90581d35822d49ab8e4708a8e8..22d9104499af674c489a5d265c4d7b8ef0edb44e 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
@@ -642,7 +642,7 @@ static int stm32_hdp_probe(struct platform_device *pdev)
 	hdp->gpio_chip.gc.can_sleep     = true;
 	hdp->gpio_chip.gc.names	     = stm32_hdp_pins_group;
 
-	config = (typeof(config)){
+	config = (struct gpio_generic_chip_config) {
 		.dev = dev,
 		.sz = 4,
 		.dat = hdp->base + HDP_GPOVAL,

-- 
2.48.1


