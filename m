Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE21606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 02:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cfsS6bt8;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mE6aV1Sb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=onJ9qopBB2j2Cgb6Ett7zzhP9v/di/tu3NzVy6YdsQI=; b=cfsS6bt8qNEIjKZY61RmB/YQA+
	QBOIGt83F3RZG2/AWqDIP/HQFnpEPwTAo2ZgbeuN9lZWbDXqRHrw4gGSrIMLFZaF1uQCwpYOIycR+
	UoHSlPhN43/qE9vCX0UkKiDjG2AYFCtjwJEnUO8e2JHsXUd3nUoXCEYjZXMrFMyxD7zu9VW89yd7C
	rorBWd8TLAC6O4KWEDvKfvmIZ1sgI+T6xc6a+/HzU15HP/vp5xOM8m2PcNtWdR2J0Mz2sjyXBA5ot
	V7GsQ+G1jlD3xcQ2JH9QPJPUIOxtX5tA3n/JuqBwIlRjBIf/KUbpvJBqd08IVM1rkCtq/6xbUAona
	Ixz6qDJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMyo4-0000000Cs3I-3mZi;
	Sat, 31 Oct 2026 02:26:56 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMynw-0000000Cs0o-1blM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 02:26:49 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-703be215729so635884eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 19:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793413607; x=1794018407; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=onJ9qopBB2j2Cgb6Ett7zzhP9v/di/tu3NzVy6YdsQI=;
        b=mE6aV1SbJyL5XhhTvRYRyDIg/nGiITmloFenkE80P4ib0Mbaf3q5NYdKV0hr5uCyji
         RwKICn7XvHzlRW/hMIFDp7rjRqAH5FDBLH2AQt6ibQAa8Wm9/KwoKLNVz9pV/tguoM3k
         zcm6NqzPbFSyCllKnT/r2MCR+bIO3OjmlqpI9m8JJ0OHAqFmXpB6qNJ3CWPfZZWVDZqs
         0ytKf3xYSvWGdxgYhH5YqP/wWOqfWF8vb3jUy5//0euMX6lQTr8NH4aRllbjb4GA9leM
         ObFdjleZDItKiPCXVv12YzuYV1s1nzJIJowNgCF17tHMXhppVWglOlWIbgkj49zeVyMr
         elpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793413607; x=1794018407;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=onJ9qopBB2j2Cgb6Ett7zzhP9v/di/tu3NzVy6YdsQI=;
        b=VRcqU5xvl47ikZJMCGWo/YGbY4Vi31Pf93AVU/0pZmjqE643Gq8FGmvE1sGIzRH2vw
         wy4nqXGzwFhR6Q0yTiKGOmEUvdUt0hzPqDG+9UYUra8HdZOCeIrZD8Egsk8FLuwyRlJJ
         5wx2pBzcAkZp46PRHrvzmDukBWfpGKgmwYRtsXcdWoOF0Iqig1GoWR7DSthsDT2XSkJO
         n4nHUwq45IKjJJnkYRs/ZUxe5CdVqXDPIbMbdgFoq+1NcePUzqnQQDWNUkV/bf6Fhr9H
         l4jC6Xjp8xxSCSmzZg16H3qA30/EUFQr/DxuvRg5QyJ1Azp2e5MJnOHFAStd2QuigQJt
         ifGA==
X-Forwarded-Encrypted: i=1; AKwUvBwE1ozQFZrOsbaO9Foz/v6n7OHGppmj2kvws01/c8XrETcbRS7hnZBeRKd1tKakbtAzt81TOpnpjYasd6UILMro@lists.infradead.org
X-Gm-Message-State: AFq9FYIJ1/LlGYKdqEIZpgz9eqY37f4qlV3Gk8+G+UccmFI8+qbZNh8s
	J4ayr6XLEo0gIJM6H6wbDdbKhXp2+gKMcjt4V/05PcGJ9KZQg+I3PDXl
X-Gm-Gg: AYBFou20wnG2qc0iUHMSv0Ov9/azmu46ZohY6gED99g2VsEwfZGaUpADHLMsUf9xgvv
	mxFXz37twSX9OsbuFa5j8bdtIrDElp15tiVZCZihqyAs/DrmdwKxJenb6m1jhmrXQ6Zvk98fZa7
	rwhXSu7lsuMdiuuzUVlZMg4j42HTC9791EQtDUqCCmNFJqyoMKCoKs/1wr4yQScKe+DbQ1fGFCz
	kP0Cn9DElFiO3AteahwJfIH3qyinTeEzHLo/DGBF3XIvPLDNTuqzC9kTMhCpGY5U9N+hRGgQiHW
	aqiODphynV3GyI6AfYz6ELvoBMkrd/6QUPyHayWSeLYo+UEZ+DfWk3l53DuPbo5v33c2OD6UNUM
	fh5twZVsiOYrDM44aZLLgfESVIreqFy6gzDPVRDTP9oR//didBr4pEvwFAZMCMyp1OhoczScJhm
	yq4bzfT3oVcBzs1evO+lpRogyIvNCLVDh1z6Sask/m5IZw7JBVxfoggl/yJ4SyMxgEaxIGsM4cB
	Haw2xnD3tMYTmcoMt/Ov829dwSVVVBeB5FwsWFxQ9GDqHoBmdrGycyIKhu/KfK1zqjEGbwGIyTR
	ErB2DJqDMA5MFsQDQFbI/EUftYZ+ApIokKzp9jejXtRPXIZA7bVDu3gWYlfeMaMCyuZ/Y7EnTHD
	5Fr7S3g==
X-Received: by 2002:a05:6820:1c84:b0:6dd:696d:b21f with SMTP id 006d021491bc7-714f24e7c6bmr2638903eaf.2.1793413607382;
        Fri, 30 Oct 2026 19:26:47 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167984dsm1438390fac.1.2026.10.30.19.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 19:26:47 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: [PATCH] pinctrl: sunxi: preserve A733 firmware voltage modes
Date: Fri, 30 Oct 2026 22:26:45 -0400
Message-ID: <20261031020640-263f7b05-a7s-pinctrl@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_192648_431945_4FC765D7 
X-CRM114-Status: GOOD (  13.91  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,T_SPF_TEMPERROR
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The A733 voltage-selection fields are two bits wide. The main controller
uses a separate VCCIO field at bits 25:24 for PB; the older one-bit
handler instead writes bit1 when PB is requested. A733 R-PIO also
differs from A523: its documented table has SEL at 0x340 and VAL at
0x348, without the A523 control register at 0x344.

Stop using those incompatible layouts on A733. Select BIAS_VOLTAGE_NONE
for both controllers and give A733-R its own descriptor, retaining the
A523-R descriptor and behavior. This preserves firmware voltage modes
when explicit bank supplies are requested. It does not implement dynamic
voltage switching or choose among conflicting manual AUTO descriptions.

The public October 14 discussion recommends this conservative treatment:
https://lore.kernel.org/all/20261014183516.172060-1-vinicius.eduardo.pedrosa@gmail.com/

AI assistance: Codex:gpt-6-astra.

Suggested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Assisted-by: LLM
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
This implements Vinicius Pedrosa's recommended conservative approach
for both A733 controllers, including a separate A733-R descriptor:
https://lore.kernel.org/r/20261014183516.172060-1-vinicius.eduardo.pedrosa@gmail.com
It avoids the disputed AUTO encoding and does not replace that public
discussion with a claim that voltage switching is solved.

The standalone base is official commit
d89e1d186ec9271bf78e62771779e9fc03bf0fc3 plus Pablo Mazzini's three
IRQ-bank v3 patches:
https://lore.kernel.org/r/20261025142412.112216-1-pmazzini@gmail.com
The IRQ changes are prerequisites, not part of this patch's diff.

With the separate A7S DT v2 and its PMIC/bank supplies enabled, two
final-candidate RAM boots preserved the main and R SEL controls and
PF supply selector across kernel handoff. UART0, R-I2C0/PMIC and
read-only MMC0 traffic worked, including after unused-regulator cleanup.
The firmware's PF high-voltage path was verified before each boot.

A regression harness exercised 60 A733 no-read/no-write cases, the old
main-handler wrong-bit counterexample, and the unchanged A523-R
handler behavior. Both changed objects built with W=1. A523-R hardware
was not tested; its behavior is retained and checked by the regression
harness. No analog voltage, UHS or dynamic voltage-switching claim is
made. The read-only VAL observations are not precision measurements.

 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 20 +++++++++++++++----
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c   |  3 ++-
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
index cffc1e53eef141cf5f00ec37435af0f8f6a94b45..1cfd8118435066b403f8b9b0b3725e849643ff84 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
@@ -30,17 +30,29 @@ static struct sunxi_pinctrl_desc a523_r_pinctrl_data = {
 	.pin_base = PL_BASE,
 };
 
+static struct sunxi_pinctrl_desc a733_r_pinctrl_data = {
+	.irq_banks = ARRAY_SIZE(a523_r_irq_bank_map),
+	.irq_bank_map = a523_r_irq_bank_map,
+	/* A733 has two-bit voltage modes, without the A523 control register. */
+	.io_bias_cfg_variant = BIAS_VOLTAGE_NONE,
+	.pin_base = PL_BASE,
+};
+
 static int a523_r_pinctrl_probe(struct platform_device *pdev)
 {
+	struct sunxi_pinctrl_desc *desc;
+
+	desc = (struct sunxi_pinctrl_desc *)of_device_get_match_data(&pdev->dev);
 	return sunxi_pinctrl_dt_table_init(pdev, a523_r_nr_bank_pins,
-					   a523_r_irq_bank_muxes,
-					   &a523_r_pinctrl_data,
+					   a523_r_irq_bank_muxes, desc,
 					   SUNXI_PINCTRL_NCAT2_REG_LAYOUT);
 }
 
 static const struct of_device_id a523_r_pinctrl_match[] = {
-	{ .compatible = "allwinner,sun55i-a523-r-pinctrl", },
-	{ .compatible = "allwinner,sun60i-a733-r-pinctrl", },
+	{ .compatible = "allwinner,sun55i-a523-r-pinctrl",
+	  .data = &a523_r_pinctrl_data },
+	{ .compatible = "allwinner,sun60i-a733-r-pinctrl",
+	  .data = &a733_r_pinctrl_data },
 	{}
 };
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
index 3ebe926a1bc6ba75716f13804db718174b4be229..e2cd7a431af7bc5ec47e8f5719ab11c22b461658 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -27,7 +27,8 @@ static struct sunxi_pinctrl_desc a733_pinctrl_data = {
 	.irq_banks = ARRAY_SIZE(a733_irq_bank_map),
 	.irq_bank_map = a733_irq_bank_map,
 	.irq_read_needs_mux = true,
-	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+	/* Preserve the firmware-configured two-bit voltage modes. */
+	.io_bias_cfg_variant = BIAS_VOLTAGE_NONE,
 };
 
 static int a733_pinctrl_probe(struct platform_device *pdev)

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
prerequisite-patch-id: 85db03df3394cdcb2780a0da122a74b2c1fe220d
prerequisite-patch-id: a3e883da50bf03e8f522444def66fec7f996ffbe
prerequisite-patch-id: c6889699a6dc13c336ce4cf4659e21b551e9a9fc
-- 
2.53.0


