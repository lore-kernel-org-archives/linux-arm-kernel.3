Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34BF606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 02:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=snyc3frJ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bGrZrfVp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AuJpX+R1ikkgXuJg24CUYJMUBGehOWyuliZWHlt8VIY=; b=snyc3frJsANzEV
	gdayFMzHkhKD5hmeKJyuXuMmfGHZyS1XDC+g0FWTOtR0yiLcHYOMT7v9hn3IplR1suZaDk/pRUigH
	t+T6Om0Xk+VMBGlG6CacDiXsDsg6cslOgiCS80VSvEIh+mv25ONU49+GGyE5ANCZa65C/ChoXcj27
	2PhMnIq4t0PheIvX1XkTnlZdduh1HaRXqvtik1NlNtg+9k/GgCBZ5jUJKidEX/qOuZsnjvQg1tFKz
	2typiNs7urmYRPEfCQM1X30ozfuurDAtbynE9kZ5M5EWtnuf8XSc/4jiekVY8r3hqbzl7APupumXf
	mnWWKBnb4qP8JzmMGl0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLWwQ-00000003e4D-0eU0;
	Tue, 27 Oct 2026 02:29:34 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLWwN-00000003e3L-2KWy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 02:29:32 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so24563395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 19:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793068169; x=1793672969; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AuJpX+R1ikkgXuJg24CUYJMUBGehOWyuliZWHlt8VIY=;
        b=bGrZrfVpX/yOZP9tytLmf/Kjhv9gfx61n7JWxEDop/XmlDebB/ZD6YALsnD1fe4Z1A
         PXt2lVpFdlTMTpJrS3hZT3h7w3JijrxwLa1VLhkmCIcx5hBrI8lZqXu2MOuIyNbEVUBF
         u0oNm/VFG9aNFbEX9y5AZlzTCARS8oTkH/SCgRDUkwHIBByimKg0oW6WXZWVsV4iVdze
         nqdesD6DZWx3qKJBnkCb8OO3pOcP+mTHwjMjOML7Qikzikf07FjjB6ubAf/BjmXNxFhq
         pHZqjaWN8bWPHjFXEhlFWHn53qRoRQUsdq2GM3zcwmRrLkQZbgmE/v81651yOoGJgzdB
         EjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793068169; x=1793672969;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AuJpX+R1ikkgXuJg24CUYJMUBGehOWyuliZWHlt8VIY=;
        b=trW+TC5s4KtFUZZLTRGyC4KKd3z3+4JFRrRZZ5DC+beLu4aY1zVEw6uxnFmnyl3RG/
         5nI/vGSoG/Cz3CHKbkuTa2kLwd9137JcLLapnMFuSs+4WdkvtQjie6180J5SRJxrKP+L
         hsytbdOfO97rc5RIZErSC2PhDAqMDO6GTwBxQJR6XtOHp7D7Hd2egUxL1KUfm14qxnO0
         Kz4Prs5WPDjuRCm97j6p2vkwdsbJ0fvUlO/gVJCCWM4oxnzY4SNZRNb1qfcQBjKiVpcs
         XKp/6NXJkF1l9lpAfOLa2eCesJYH1WCxY+PbFsDQsD4JIRGpkrtpt3519opYLh5KA/fS
         DQiQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+ln9Agy1T2hxWIenw4UmczZG7sBa17fWwqc3Dspv9NtSbm1E800qEHl0mC65SfYI97mqYV8FZPsxaF95OvGJK@lists.infradead.org
X-Gm-Message-State: AFq9FYLOV0aKxItHQFw6K3wexTCw21oX9k30XA5wZX7+kJFUHd5xHV32
	wNcYDyxqHW4ULB7Yfz328eoR3FRcjtj8q5WCrLT6yo4/4iarXJbLyalgwtNQcGiqJl8=
X-Gm-Gg: AYBFou21UXOja3+BioxnSHZfxQKWdqd0cLjX1TCaTzd59eOVLFkcuE6/PqdRNwt05xA
	5zsdPlc9Rb74CUiYNYcxBqDaiP92McIUKcndvnpRfdv6jkj2d7ZWffVP/7tFLRiXe8X6aYxtRvS
	nKzu2nh/p7lyBRnr+78JfwdbsFh0CsjWVw6C1kGYxhXqYhD04qaUhRZi+E7JsnxhMbUgwOwbskr
	JwAiyyyvIIbu5aFGmbqSq0A4hqMIs8BBv8gDySQZlZfVfOdvVHlAxKJHSQVUUJu282TxfH8bKLh
	fwRoROuR5d7ecN4QK/7KzFScaLrcvrMF0I/uV8Y3qK2B5uAdfmeUg8L06MAbLpe/9HxXnPynxIz
	7jEwIsOpN/kjpQjZF1QoZ1CwdxdjeTjyBoUYOc4Aaws7I/khyQoeHSDJGJ34emM9f5S6CLwpBOI
	R7dDXHMYTRDVOtX67NHn7gOJoqsQUvo1n95tCqnc5aLy6T9LY8IxKD8KaBTzRfvvTfmCWfC/EXX
	vw1zsyw7p9Dis7A1CuEvQh1kE3aqvhGjl2jMcTBVIXBh/jdOXBqgR0RK9Q3A/8FU+HGSMPN0hFW
	vZnTSDPzNBaKhPgC65rOOL1PE0QNXDuskSOUotK4nuUPGexUZWI8/JEy1uO3ZhER+R1IuhJjBQe
	KX7bbgSo4GPcXQa1xslmv2ocP/XZcLzxKKQb6mLa2
X-Received: by 2002:a05:600c:3b8a:b0:4a2:d:5ccc with SMTP id 5b1f17b1804b1-4a35ac99e81mr157824335e9.10.1793068169174;
        Mon, 26 Oct 2026 19:29:29 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-117-118-122.95.117.pool.telefonica.de. [95.117.118.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f305sm18341906f8f.3.2026.10.26.19.29.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 19:29:27 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] pwm: atmel: Fix arithmetic overflows for long periods
Date: Tue, 27 Oct 2026 03:27:55 +0100
Message-Id: <20261027022755.52912-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261016161221.16553-1-kmehltretter@gmail.com>
References: <20261016161221.16553-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_192931_625401_DACE757E 
X-CRM114-Status: GOOD (  21.40  )
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

atmel_pwm_calculate_cprd_and_pres() first multiplies the requested
period by the clock rate in a u64 and only then divides by
NSEC_PER_SEC. The product can overflow even when the quotient and the
resulting hardware configuration are representable.

For example, at 12 MHz a 1600 s period has 19.2 billion clock cycles
and fits with prescaler 3, but the intermediate product exceeds U64_MAX.
It wraps and the driver programs a period of about 62.8 s instead. This
remains broken after changing fls() to fls64(). The duty-cycle
calculation has the same overflow.

Use mul_u64_u64_div_u64() for both conversions and use fls64() when
deriving the prescaler. The multiply/divide result cannot overflow if
the clock rate is at most NSEC_PER_SEC, so hold the clock rate exclusive
and validate it at probe time.

The reverse conversion in atmel_pwm_get_state() can overflow too: it
multiplies CPRD or CDTY by NSEC_PER_SEC and then shifts the u64 by the
prescaler. Convert the scaled clock ticks with the overflow-safe,
round-up helper instead. Explicitly saturate values that cannot be
represented by the u64 nanosecond API, rather than relying on the
architecture-specific helper's quotient-overflow behaviour.

Fixes: a9d887dc1c60 ("pwm: Convert period and duty cycle to u64")
Cc: stable@vger.kernel.org
Reported-by: Uwe Kleine-König <ukleinek@kernel.org>
Link: https://lore.kernel.org/r/atnHHaOwTkI78_tc@monoceros
Suggested-by: Uwe Kleine-König <ukleinek@kernel.org>
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Changes in v3:
- Use mul_u64_u64_div_u64() for the period conversion as suggested by
  Uwe, and for the analogous duty-cycle conversion.
- Fix the corresponding overflow in the get_state() conversion and
  explicitly saturate results that cannot be represented in nanoseconds.
- Hold the clock rate exclusive and validate the rate bound required by
  the arithmetic.
- Rebase onto v7.3-rc7.

Testing:
- Built an ARM zImage with clang 22.1.8 and W=1.
- Passed 14 host boundary tests, 53 oracle-checked SAM9X75 QEMU boots,
  and all 20 PWM device-model qtests.
- Passed 89/89 checks on a physical SAM9X75, including overflow cases.
  A 69.175-second period measured 69.210 seconds between interrupts; no
  kernel errors were found.

 drivers/pwm/pwm-atmel.c | 46 +++++++++++++++++++++++++++++------------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/drivers/pwm/pwm-atmel.c b/drivers/pwm/pwm-atmel.c
index 86918523d8..db7a14c66a 100644
--- a/drivers/pwm/pwm-atmel.c
+++ b/drivers/pwm/pwm-atmel.c
@@ -23,6 +23,7 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -183,19 +184,18 @@ static int atmel_pwm_calculate_cprd_and_pres(struct pwm_chip *chip,
 					     unsigned long *cprd, u32 *pres)
 {
 	struct atmel_pwm_chip *atmel_pwm = to_atmel_pwm_chip(chip);
-	unsigned long long cycles = state->period;
+	unsigned long long cycles;
 	int shift;
 
 	/* Calculate the period cycles and prescale value */
-	cycles *= clkrate;
-	do_div(cycles, NSEC_PER_SEC);
+	cycles = mul_u64_u64_div_u64(state->period, clkrate, NSEC_PER_SEC);
 
 	/*
 	 * The register for the period length is cfg.period_bits bits wide.
 	 * So for each bit the number of clock cycles is wider divide the input
 	 * clock frequency by two using pres and shift cprd accordingly.
 	 */
-	shift = fls(cycles) - atmel_pwm->data->cfg.period_bits;
+	shift = fls64(cycles) - atmel_pwm->data->cfg.period_bits;
 
 	if (shift > PWM_MAX_PRES) {
 		dev_err(pwmchip_parent(chip), "pres exceeds the maximum value\n");
@@ -218,12 +218,23 @@ static void atmel_pwm_calculate_cdty(const struct pwm_state *state,
 {
 	unsigned long long cycles = state->duty_cycle;
 
-	cycles *= clkrate;
-	do_div(cycles, NSEC_PER_SEC);
+	cycles = mul_u64_u64_div_u64(cycles, clkrate, NSEC_PER_SEC);
 	cycles >>= pres;
+
 	*cdty = cprd - cycles;
 }
 
+static u64 atmel_pwm_ticks_to_ns(u64 ticks, unsigned long rate)
+{
+	u64 max_ticks;
+
+	max_ticks = mul_u64_u64_div_u64(U64_MAX, rate, NSEC_PER_SEC);
+	if (ticks > max_ticks)
+		return U64_MAX;
+
+	return mul_u64_u64_div_u64_roundup(ticks, NSEC_PER_SEC, rate);
+}
+
 static void atmel_pwm_update_cdty(struct pwm_chip *chip, struct pwm_device *pwm,
 				  unsigned long cdty)
 {
@@ -352,24 +363,22 @@ static int atmel_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	if (sr & (1 << pwm->hwpwm)) {
 		unsigned long rate = clk_get_rate(atmel_pwm->clk);
 		u32 cdty, cprd, pres;
-		u64 tmp;
+		u64 ticks;
 
 		pres = cmr & PWM_CMR_CPRE_MSK;
 
 		cprd = atmel_pwm_ch_readl(atmel_pwm, pwm->hwpwm,
 					  atmel_pwm->data->regs.period);
-		tmp = (u64)cprd * NSEC_PER_SEC;
-		tmp <<= pres;
-		state->period = DIV64_U64_ROUND_UP(tmp, rate);
+		ticks = (u64)cprd << pres;
+		state->period = atmel_pwm_ticks_to_ns(ticks, rate);
 
 		/* Wait for an updated duty_cycle queued in hardware */
 		atmel_pwm_wait_nonpending(atmel_pwm, pwm->hwpwm);
 
 		cdty = atmel_pwm_ch_readl(atmel_pwm, pwm->hwpwm,
 					  atmel_pwm->data->regs.duty);
-		tmp = (u64)(cprd - cdty) * NSEC_PER_SEC;
-		tmp <<= pres;
-		state->duty_cycle = DIV64_U64_ROUND_UP(tmp, rate);
+		ticks = (u64)(cprd - cdty) << pres;
+		state->duty_cycle = atmel_pwm_ticks_to_ns(ticks, rate);
 
 		state->enabled = true;
 	} else {
@@ -487,6 +496,7 @@ static int atmel_pwm_probe(struct platform_device *pdev)
 {
 	struct atmel_pwm_chip *atmel_pwm;
 	struct pwm_chip *chip;
+	unsigned long rate;
 	int ret;
 
 	chip = devm_pwmchip_alloc(&pdev->dev, 4, sizeof(*atmel_pwm));
@@ -507,6 +517,16 @@ static int atmel_pwm_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(atmel_pwm->clk),
 				     "failed to get prepared PWM clock\n");
 
+	ret = devm_clk_rate_exclusive_get(&pdev->dev, atmel_pwm->clk);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to get exclusive PWM clock rate\n");
+
+	rate = clk_get_rate(atmel_pwm->clk);
+	if (!rate || rate > NSEC_PER_SEC)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "invalid PWM clock rate %lu Hz\n", rate);
+
 	chip->ops = &atmel_pwm_ops;
 
 	ret = atmel_pwm_enable_clk_if_on(chip, true);

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.39.5 (Apple Git-154)


