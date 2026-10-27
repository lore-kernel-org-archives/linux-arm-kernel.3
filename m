Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CAB606A325
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 21:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H05ZjZ/+;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kJmLJv8k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OiJECdRwrBggLX0qC5GoLm74oh31RZcT2ypnA2Xk9xY=; b=H05ZjZ/+Bgiol2
	FQ/eJqKH4oh3g7pBbKihDmsFMPpx9hAetknqWZX83G3V5jCmWk0fDmcv+IVEnFjmy/ngjxPUecbc4
	UnmAJnhZQFVspcbUpTDUro5H70bo8iHxtYecko0PzUbKy/waxC032+QNVdk4uDNo7gBFHuDMp94Gy
	51mNEu/WrR9h3jHDcUBwHxVn5ex1ufW9hCg+0ft8p+cKDsXP+xmWTm52ZVNmBnTvnSwMs1d+2g2Z5
	QEHi+PU2FS3sr/HgrmWXhSpxoCCKa6AcejGbvpO15+0TXW3DK9JNDXX7SMjbFLmEYvk2+0gFIzaWy
	FqMT8+WOwY0APvrQFL4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLokN-00000005n8G-1WF2;
	Tue, 27 Oct 2026 21:30:19 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLokA-00000005n3x-3sYc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 21:30:08 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-188406bb948so252458c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 14:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793136606; x=1793741406; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OiJECdRwrBggLX0qC5GoLm74oh31RZcT2ypnA2Xk9xY=;
        b=kJmLJv8ko/O4TIyw53MTX+/b4IC/1wJ8xAb23yxffCm/2UITj5L+Mw6NZF92+J4BhD
         BZKPCKfJwHG/hTlxXqh1HhXZzT0N87lTHZN9246CxBgxX7O6QYYakujdoXIxv+mIilAO
         QbWg7RmZZMEW2oKiTBvZoFzrMGuSeWBqLnziuBqYJf1PnvPHf+m+CgemEB06bAmGcIg+
         6NEJJNywI7enO2CEc2141QJ73pGyLMpk1LtFZmFFJ3QRJMuT2ji0V863g2geg5zFsghn
         sG2KItUcRCokWHB5TN3tLp2BL0hLH6ka5zIJIWmHpp1jz46kP0hKWrEw15jKr+fsjryl
         DDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793136606; x=1793741406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OiJECdRwrBggLX0qC5GoLm74oh31RZcT2ypnA2Xk9xY=;
        b=bAMMDp6+fL5wz+KusX4+GT6gAoB/Ha8M1dz/YTUMfR5fzcsAEauKo7Y+I8w5/WVyPu
         zbOOmvgqiNxDt6jHakgzHwXwkKIbwKIcrJWwm1kpAjmakE5JqvH1ixgrxQ2O0C+BPltx
         ekb6Jhh9pi2iEEow3scag/XsFa2yDkg0saQgUl6aJ14gbr1LbBxcrQyydxUPP8I7Ew6k
         Bse2ow0/MpCsW8Y+y0Uu7Zv1enZhEKvgNdInLeeyFjuMX2icxW7CuSpvPjn5AxV2A0x7
         9yAu46MbvTQ/uyh1JLbuwQiiJvlJprwFW4MTZpHS5dk+XgLItEAhm6EITu3w5jYmwY8B
         L3/A==
X-Forwarded-Encrypted: i=1; AKwUvBy1N19uCR0ZSxs1MBCOmtsMSJ9hn+PXaw2mrqwSa++u0oE1nNUmP/cenh1QaA6IY2s35ZBtKohDb+Sv9Gl4BbYA@lists.infradead.org
X-Gm-Message-State: AFq9FYIp/HpX5SWisg7qOqXKUhQpowTMEQH/Ur7EfqNrhQ4typbXsjZ5
	ErVCqBc0NOzMOrUvG8953ZJXr/Flfrwn5S9MsO5FpXd9+Kzv9Ym6HMQf
X-Gm-Gg: AYBFou1uXTtctxh9Auc9DSh1PeDC9oB0sHyjml6cqkgKuO05UZNcZIZSfm7JLPbj9Qh
	Je7rBtHzIvitvfTWdeYwSWzBfxYfkOP+XYT4H5yzpiG7wYy4WBfFZZb6H3EHiD3p6qpbnSYmELN
	coAJjwwpXzNjhevWOpGLhxcsfKZ6071XxVRrY89rcqtgIOu9gufN80hdRzhOzvJGZf6ftLt3gTR
	GVXafV2BKmKmHgtAFbVzD7iMRPn03BRgv2psc5L3HblVgjqgeGcO4EIQy58+j1QzDSEJCUiLrBO
	sz7dg/Ewaf/scEbzwBPUtjQ7L/yt8H0xPjWi739NbPgDRqezcgLs/lV3dDEf7maiKnj3AlPdc43
	QdbHt+6Yh2OId1Jc+Xh+r/5NrkAf8w8NGitRD70SL/bPvgkA23aoMCwUiUxixN06ndx5AmYdTL0
	o0ZDmvcJMj19W4WJOVNu7FzI3uwbNgk0iX91FD2/6R1t+sOrJR3+j8gRucF/G51N1r/shEcCAZJ
	L8lWxihB9vCIy03u1LOxKlNavjuLeO/50IdGZvfFkNXkwnuDxgdzFBQQV+ANcG5nrb0vJZg7u4n
	kFQSgA1mtflRYiU1i1B+MwsUeWY0oLXUSarWtngARvL1
X-Received: by 2002:a05:701b:250e:b0:15d:f053:18b6 with SMTP id a92af1059eb24-1a6cd77ed7fmr527467c88.9.1793136605933;
        Tue, 27 Oct 2026 14:30:05 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:9958:9525:7799:82b5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6d7ed488fsm723725c88.7.2026.10.27.14.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:30:05 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 27 Oct 2026 14:29:56 -0700
Subject: [PATCH 2/4] ARM: s3c: crag6410: drop unused CODEC_GPIO_BASE
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-crag6410-module-swnode-v1-2-2f885799b6ad@gmail.com>
References: <20261027-crag6410-module-swnode-v1-0-2f885799b6ad@gmail.com>
In-Reply-To: <20261027-crag6410-module-swnode-v1-0-2f885799b6ad@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_143007_017711_EFC9F79E 
X-CRM114-Status: GOOD (  13.25  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

No consumer references codec GPIOs by global GPIO number anymore.
Remove .gpio_base initializers from wm8994_pdata, wm5102_reva_pdata,
and wm5102_pdata so gpio-wm8994 and gpio-arizona use dynamic GPIO
base allocation (-1), and drop the now-unused CODEC_GPIO_BASE macro
from crag6410.h.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/crag6410.h             | 1 -
 arch/arm/mach-s3c/mach-crag6410-module.c | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/arch/arm/mach-s3c/crag6410.h b/arch/arm/mach-s3c/crag6410.h
index f39ea2ca7a75..1fc7a8598c76 100644
--- a/arch/arm/mach-s3c/crag6410.h
+++ b/arch/arm/mach-s3c/crag6410.h
@@ -14,7 +14,6 @@
 #define BANFF_PMIC_IRQ_BASE		(IRQ_BOARD_START + 64)
 
 #define PCA935X_GPIO_BASE		GPIO_BOARD_START
-#define CODEC_GPIO_BASE			(GPIO_BOARD_START + 8)
 #define GLENFARCLAS_PMIC_GPIO_BASE	(GPIO_BOARD_START + 32)
 #define BANFF_PMIC_GPIO_BASE		(GPIO_BOARD_START + 64)
 #define MMGPIO_GPIO_BASE		(GPIO_BOARD_START + 96)
diff --git a/arch/arm/mach-s3c/mach-crag6410-module.c b/arch/arm/mach-s3c/mach-crag6410-module.c
index 471a1ea967e6..6443c816d111 100644
--- a/arch/arm/mach-s3c/mach-crag6410-module.c
+++ b/arch/arm/mach-s3c/mach-crag6410-module.c
@@ -217,7 +217,6 @@ static struct regulator_init_data wm8994_ldo2 = {
 };
 
 static struct wm8994_pdata wm8994_pdata = {
-	.gpio_base = CODEC_GPIO_BASE,
 	.micb2_delay = 150,
 	.gpio_defaults = {
 		0x3,          /* IRQ out, active high, CMOS */
@@ -249,7 +248,6 @@ static const struct i2c_board_info wm1277_devs[] = {
 };
 
 static struct arizona_pdata wm5102_reva_pdata = {
-	.gpio_base = CODEC_GPIO_BASE,
 	.irq_flags = IRQF_TRIGGER_HIGH,
 	.micd_rate = 6,
 	.gpio_defaults = {
@@ -287,7 +285,6 @@ static struct spi_board_info wm5102_reva_spi_devs[] = {
 };
 
 static struct arizona_pdata wm5102_pdata = {
-	.gpio_base = CODEC_GPIO_BASE,
 	.irq_flags = IRQF_TRIGGER_HIGH,
 	.gpio_defaults = {
 		[2] = 0x10000, /* AIF3TXLRCLK */

-- 
2.56.0.307.g5fe7bd680c-goog


