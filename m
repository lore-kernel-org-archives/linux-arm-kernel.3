Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFA6606A321
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 14:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J1h0Y0kG;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BNzHhi7J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=S3bCZ0k1sUsBiKGvs8pv4VBiJQLDQGO1508w92UyGOo=; b=J1h0Y0kG7//qL+
	Fispy1Ba1qwf3k9UbpzNcxd+4IrhvDHRpU+c9GTBmT+PX6PzqMncMEOoKR8fCc6225eMpL3umBSm4
	FIwo0itv2RdO0WnwCNt81T9bfEIfUOIhyj3BY2Wu+HTqVpIRAxNx8zQda8JPxNrM55uS4lKsU+VrI
	q7FC6k9CUrY5CFqO4zBYDkL+V4vtc8oHSzIQUWfMIwvpbTaY1ewunmTDOvONP/lGUjYz8N+dyjN+Q
	ZafWM0yaq/anvjk6J48pcdjAfKgClNCbxrIbAQ2+cVlblFPKkEHWjOlFmQTQI9kVqU295Ogw1UYv/
	eXB/tD17ZNUsr7vOO+NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKz9C-0000000171d-2U3X;
	Sun, 25 Oct 2026 14:24:30 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKz9A-0000000170j-0AiD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 14:24:29 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a208d93758so25104395e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 07:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792938266; x=1793543066; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S3bCZ0k1sUsBiKGvs8pv4VBiJQLDQGO1508w92UyGOo=;
        b=BNzHhi7JbSj1zS/jOmRwGxbLYug0zUVjVBMGQUZr4HqWvmK+1dOAk+jS5DzWaO7wEm
         KjO0GO9tMEMwThTVv027JNWgUHPPJRVVknsXPZpZO7xVxwokG7n6l/aC3exFJCvgE++F
         xRb+bEN4dmnKdv2lyXhgomTym3191+orGxy8gQNJ9/tS8waKllrCiNB+w/m/lYQbe/vW
         2eMlpoKdTjgmiPsbY0teIjlxRTagAdsWnjCAaRRplSFAO3hVNzfxpLvqu8DG7nVikKuK
         9PJxPOXJtjetvt9Cj5CITQ9YgpbfUk1gCHnGwVQNTNZW3bcj83jfqJFGaOYqmbnjq29s
         rKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792938266; x=1793543066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S3bCZ0k1sUsBiKGvs8pv4VBiJQLDQGO1508w92UyGOo=;
        b=1sozTDvWTVTXZV4/kXgtUnKIJwvRxATWhIaQyGqjrjLzSW7SIgKVAUILmza9knHift
         poXK4+xf6A9/X8z01PVUuAGPZAvVtihQNm5fc1yO3V7ngR0A7vA8ErFlNIF0RjhRLs+a
         +f0LJwEKOnCaaM6bubAXfL4sXtBcotJOqb1+F/uNaQe1pQpV4fAjPxpiKyQmGIcnirB8
         +JdIOS4qkBhPiEupYalW2GJuaHdLdi3IQzZzlYIKDJ6TfqKzyfohyZPZ1WoAaqgmerD2
         om3MeTgDudpPAKZvcnECi4Z8Qplsu3TCiVILtIh6fJPei+1XkBB5h3FkPV+daPsaD5Ed
         piWA==
X-Forwarded-Encrypted: i=1; AKwUvBzt9sUrw7+5nRSNaib7dkWs1NlNpcY92rWGDNm7C+AjydSlbdEMKHj1sQUZtNWJREfpcuqt9d9ZlZVw235r28dG@lists.infradead.org
X-Gm-Message-State: AFq9FYIJxPCNcqn8AR/pGLLtRQQF1KJN+b0sDi8BvZk/FkHa0eXtJg0y
	9lDQGLzkjFgx9WAPrG+HGA7iEqQ8s30EDGzk4gg7mo2DxYQG2gKrb1/X
X-Gm-Gg: AYBFou0Yz2a/D/teOnl18X3RGvex2x7mdlblKv7Hfw2ZKSVWZkUeVO8lNy8baeN7g4a
	cK28xg77wsM+JDp/ystBcjTix3dYF11OLKoh7gI5/YGOZrRMRX+V3BjDGud15UX2imq3SMonMkl
	FLPVyeB61RfaP7oI9gDYlIaJFrHWDAKvXzXfnSZPD7+RhzNKFOZ9tpo1SEp9jn5Qf7mFYz8fbBZ
	Sh6pV2aDtp7xXb0sPg1StQCin2BUdkm8DQlwCd32+dIS8mrzRQlSaoaAxTlmAJ3vilagOeCynpy
	gv3t+qPj6TKw5HiCW7Z0FNTIlkWLyHkhgKXnsU+1g0IZvbeRLql8rAiyS3uWoDqMk/0EXiQ9LTV
	F8HqVlPf6MX4uV2cbNZFD0nCChtbYXdXc3KwQftKAu8j25TOaTWDGSMlzS1J7NE0bpPeZMEDcfD
	uAqeLK2O6/8PwU25UArgLQy1TeBUVkm/JtY5hx3mkUnJT5WH47iuNf3FHP0XibgKFNv3asj1cLv
	wLwCwsCESXhURwYocwH3yaUFKcNghhmvFAQpP+4eh3cqDi0d8Pm1OddjyhsIRnxee4HF7AW3+B1
	/zuO5tg8/sZ+wQ==
X-Received: by 2002:a05:600c:5307:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4a35acc41a6mr66595165e9.35.1792938265782;
        Sun, 25 Oct 2026 07:24:25 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa0bcsm157074265e9.4.2026.10.25.07.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:24:25 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 1/3] pinctrl: sunxi: dt: number the IRQ banks from the first one that has IRQs
Date: Sun, 25 Oct 2026 14:24:10 +0000
Message-ID: <20261025142412.112216-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025142412.112216-1-pmazzini@gmail.com>
References: <20261025142412.112216-1-pmazzini@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_072428_145660_0786124E 
X-CRM114-Status: GOOD (  18.87  )
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

prepare_function_table() numbers the IRQ banks from PA, even when PA
has none. The static drivers number only the banks that have IRQs, and
use irq_bank_map when the IRQ registers do not start at bank 0.

Do the same here, and give the A523 and A733, whose IRQ registers
start at PB, the map they need. Apply the map to the A733 register
layout too, which so far ignored it. This also fixes PK on both, which
was numbered 10 and written past the end of irq_array.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c | 5 ++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c    | 8 +++-----
 drivers/pinctrl/sunxi/pinctrl-sunxi.h       | 7 ++++---
 4 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
index 801f62abc93d..940942bf6f95 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
@@ -17,7 +17,7 @@ static const u8 a523_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
 	{  0, 15, 17, 24, 16,  7, 15, 20, 17, 28, 24 };
 
-static const unsigned int a523_irq_bank_map[] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
+static const unsigned int a523_irq_bank_map[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
 
 static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
index ca82f08a3a65..3ebe926a1bc6 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -21,8 +21,11 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
 	{  0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14};
 
+static const unsigned int a733_irq_bank_map[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
+
 static struct sunxi_pinctrl_desc a733_pinctrl_data = {
-	.irq_banks = 10,
+	.irq_banks = ARRAY_SIZE(a733_irq_bank_map),
+	.irq_bank_map = a733_irq_bank_map,
 	.irq_read_needs_mux = true,
 	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
 };
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
index 50a16f3bd131..9c5eb21a86a5 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
@@ -208,7 +208,7 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 	 * The extra functions will be filled in later.
 	 */
 	irq_bank = 0;
-	last_bank = 0;
+	last_bank = -1;
 	for (i = 0; i < npins; i++) {
 		struct sunxi_desc_pin *pin = &pins[i];
 		int bank = (pin->pin.number - pin_base) / PINS_PER_BANK;
@@ -221,16 +221,14 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 		func[1].muxval = 1;
 
 		if (irq_mux) {
-			if (bank > last_bank)
+			if (last_bank >= 0 && bank > last_bank)
 				irq_bank++;
 			func[lastfunc].muxval = irq_mux;
 			func[lastfunc].irqbank = irq_bank;
 			func[lastfunc].irqnum = pin->pin.number % PINS_PER_BANK;
 			func[lastfunc].name = "irq";
-		}
-
-		if (bank > last_bank)
 			last_bank = bank;
+		}
 
 		pin->functions = func;
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index d09467ed437a..57a1e5e48f35 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -248,12 +248,13 @@ static inline u32 sunxi_irq_hw_bank_num(const struct sunxi_pinctrl_desc *desc,
 
 static inline u32 sunxi_irq_base_reg(const struct sunxi_pinctrl *pctl, u16 bank)
 {
+	u32 hw_bank = sunxi_irq_hw_bank_num(pctl->desc, bank);
+
 	if (pctl->flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT)
-		return pctl->bank_offset + bank * pctl->bank_mem_size +
+		return pctl->bank_offset + hw_bank * pctl->bank_mem_size +
 		       A733_IRQ_REGS_OFFSET;
 
-	return IRQ_REGS_OFFSET +
-	       sunxi_irq_hw_bank_num(pctl->desc, bank) * IRQ_MEM_SIZE;
+	return IRQ_REGS_OFFSET + hw_bank * IRQ_MEM_SIZE;
 }
 
 static inline u32 sunxi_irq_cfg_reg(const struct sunxi_pinctrl *pctl,
-- 
2.52.0


