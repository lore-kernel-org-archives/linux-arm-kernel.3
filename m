Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46634D3ABF4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 19:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VQMnATqh+SGGYH0r7raKXS0Fsq0x/ZjmMKT6ggo6pts=; b=NxpPCRik1ZPgv39bKij/V69qGP
	HFwIIfBS+Rsk/EZifyuUKkrvQteQx7FjL9lErzHo/Hn5mBR0ZUpPXd6j6FPjLKJVoWDCoalXbfQv7
	gBI/3jSJuKBiISEJvebbSJFfBr7KqpxSvtPfcA732jd2ZZBQLfGPkKYgjXlgkHVhcLgt441yWZ8T5
	Qcni5mTz65DNFa8TXoh5h1rib62ORXXhNyA9pLtI/9vrrJVmIYPIOAp4Hjhy5mfs3Kt3KLx/Yf2Iy
	/zdSMt1qLoMniAMdoIDpYuyOWB34HdAhXtH+JxxjGWTxVmcDBhBICr9onf7JolK1jupb68dL+gBd+
	agQuhHTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZyc-000000012Ie-2Cqu;
	Mon, 11 Nov 2024 19:21:30 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZwo-0000000124j-2ZZO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 19:19:40 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7b154f71885so399107985a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 11:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731352777; x=1731957577; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VQMnATqh+SGGYH0r7raKXS0Fsq0x/ZjmMKT6ggo6pts=;
        b=XH1420pJ7utD3ghqm12G6Ng9+WZb7O2Gp5ddRaOBOgTEl/RGbOGH5cMFIx5UBO5x5J
         LPIS/4jtmAnTU+gWf0g+kmHT4nFMpPO4ovocUXrHvohv5b0+KcVgAJ/N3kjBpyVDVNXK
         qtLo19IaTpKlnAYw2sQPPkH+J6wX0Xb0kmqFToZExyD4StlxC0ysVdQd1wztqjNOAgAF
         tWrfTbAiKRjiXpqumQVrGKvLNQPmfP6ofePXttRhzjOIQLdrCabZvgP5RalEmyc1PsLq
         isvIFI8fCV1EmljUJkP4w5M6fXlUsq2kGbu8Vll3CTdsLN4wBsIhympOIzz/fJJ68r1Z
         pqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731352777; x=1731957577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VQMnATqh+SGGYH0r7raKXS0Fsq0x/ZjmMKT6ggo6pts=;
        b=I6G6jaUBJl6zFQFBmqGvViEijehIg5wnBNEf6haZugd+2Tw97h1wq8BJQKWFIphAb5
         jOVqt+mgaNGSSlvEcOseJo8nOlA2ykLpaGi0fWI/o2P0QWS4twvGOTzYzLhe1di7YoLR
         getjpRNQVqwaOlJDxgCAMQ+0moRISMLi2b9KTf5NF0lKoPCRA4RDDoEaTbv+w7YZnHt4
         Yt2+atE+EM8OAwaN1kY5SFFDAMH34gNVy3EYyaoU11dyH1rdpdonl+5trHZt/W1r3TmZ
         iqmIJjC88Rm/ckLHG43tnXVfqtj7gWvo9QvagCp2Fdp52889paKSIJeWqpr2obE5uQmN
         Csaw==
X-Forwarded-Encrypted: i=1; AJvYcCUBNKpCKx1vwtSbIW0kStlpPoduEztB1J7nzYQ5MREs38C349BR59UbcR0C6z/CVP27VkXC0RoGyn5nvXsnR4fy@lists.infradead.org
X-Gm-Message-State: AOJu0YxrweTj3bRgPsHz3o5Fyf1Qy4l8/xtJ1hczJZSd1ik4mqGYSsqx
	hbdCMgNM++9Uxfl2IW8ofgzA5jEi2I7s69ZZDZbHzrGoRH6IqFxv
X-Google-Smtp-Source: AGHT+IEcOVSl3jFobC5PUujK1odI1lKT7irYGmOBBfsWM2du/Qe8Rbme5AUeOm0Ku5j48EPEYBDbjA==
X-Received: by 2002:a05:620a:1787:b0:7b1:49a4:d1e2 with SMTP id af79cd13be357-7b331f2e94amr1783569085a.54.1731352776900;
        Mon, 11 Nov 2024 11:19:36 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b32acb30d0sm524995885a.94.2024.11.11.11.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 11:19:36 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	u.kleine-koenig@baylibre.com,
	tgamblin@baylibre.com,
	fabrice.gasnier@st.com,
	benjamin.gaignard@linaro.org,
	lee@kernel.org,
	linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH v3] iio: trigger: stm32-timer-trigger: Add check for clk_enable()
Date: Mon, 11 Nov 2024 19:19:34 +0000
Message-Id: <20241111191934.17231-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_111938_677376_AAE45A07 
X-CRM114-Status: GOOD (  16.98  )
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

Add check for the return value of clk_enable() in order to catch the
potential exception.

Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v2 -> v3:

1. Simplify code with cleanup helpers.

v1 -> v2:

1. Remove unsuitable dev_err_probe().
---
 drivers/iio/trigger/stm32-timer-trigger.c | 64 +++++++++++++----------
 1 file changed, 37 insertions(+), 27 deletions(-)

diff --git a/drivers/iio/trigger/stm32-timer-trigger.c b/drivers/iio/trigger/stm32-timer-trigger.c
index 0684329956d9..9fb4f7eefa86 100644
--- a/drivers/iio/trigger/stm32-timer-trigger.c
+++ b/drivers/iio/trigger/stm32-timer-trigger.c
@@ -119,7 +119,7 @@ static int stm32_timer_start(struct stm32_timer_trigger *priv,
 			     unsigned int frequency)
 {
 	unsigned long long prd, div;
-	int prescaler = 0;
+	int prescaler = 0, ret;
 	u32 ccer;
 
 	/* Period and prescaler values depends of clock rate */
@@ -150,10 +150,12 @@ static int stm32_timer_start(struct stm32_timer_trigger *priv,
 	if (ccer & TIM_CCER_CCXE)
 		return -EBUSY;
 
-	mutex_lock(&priv->lock);
+	guard(mutex)(&priv->lock);
 	if (!priv->enabled) {
 		priv->enabled = true;
-		clk_enable(priv->clk);
+		ret = clk_enable(priv->clk);
+		if (ret)
+			return ret;
 	}
 
 	regmap_write(priv->regmap, TIM_PSC, prescaler);
@@ -173,7 +175,6 @@ static int stm32_timer_start(struct stm32_timer_trigger *priv,
 
 	/* Enable controller */
 	regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
-	mutex_unlock(&priv->lock);
 
 	return 0;
 }
@@ -307,7 +308,7 @@ static ssize_t stm32_tt_store_master_mode(struct device *dev,
 	struct stm32_timer_trigger *priv = dev_get_drvdata(dev);
 	struct iio_trigger *trig = to_iio_trigger(dev);
 	u32 mask, shift, master_mode_max;
-	int i;
+	int i, ret;
 
 	if (stm32_timer_is_trgo2_name(trig->name)) {
 		mask = TIM_CR2_MMS2;
@@ -322,15 +323,16 @@ static ssize_t stm32_tt_store_master_mode(struct device *dev,
 	for (i = 0; i <= master_mode_max; i++) {
 		if (!strncmp(master_mode_table[i], buf,
 			     strlen(master_mode_table[i]))) {
-			mutex_lock(&priv->lock);
+			guard(mutex)(&priv->lock);
 			if (!priv->enabled) {
 				/* Clock should be enabled first */
 				priv->enabled = true;
-				clk_enable(priv->clk);
+				ret = clk_enable(priv->clk);
+				if (ret)
+					return ret;
 			}
 			regmap_update_bits(priv->regmap, TIM_CR2, mask,
 					   i << shift);
-			mutex_unlock(&priv->lock);
 			return len;
 		}
 	}
@@ -482,6 +484,7 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
 				   int val, int val2, long mask)
 {
 	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
+	int ret;
 
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
@@ -492,21 +495,25 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
 		return -EINVAL;
 
 	case IIO_CHAN_INFO_ENABLE:
-		mutex_lock(&priv->lock);
-		if (val) {
-			if (!priv->enabled) {
-				priv->enabled = true;
-				clk_enable(priv->clk);
-			}
-			regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
-		} else {
-			regmap_clear_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
-			if (priv->enabled) {
-				priv->enabled = false;
-				clk_disable(priv->clk);
+
+		scoped_guard(mutex, &priv->lock) {
+			if (val) {
+				if (!priv->enabled) {
+					priv->enabled = true;
+					ret = clk_enable(priv->clk);
+					if (ret)
+						return ret;
+				}
+				regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
+			} else {
+				regmap_clear_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
+				if (priv->enabled) {
+					priv->enabled = false;
+					clk_disable(priv->clk);
+				}
 			}
 		}
-		mutex_unlock(&priv->lock);
+		
 		return 0;
 	}
 
@@ -601,7 +608,7 @@ static int stm32_set_enable_mode(struct iio_dev *indio_dev,
 				 unsigned int mode)
 {
 	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
-	int sms = stm32_enable_mode2sms(mode);
+	int sms = stm32_enable_mode2sms(mode), ret;
 
 	if (sms < 0)
 		return sms;
@@ -609,12 +616,15 @@ static int stm32_set_enable_mode(struct iio_dev *indio_dev,
 	 * Triggered mode sets CEN bit automatically by hardware. So, first
 	 * enable counter clock, so it can use it. Keeps it in sync with CEN.
 	 */
-	mutex_lock(&priv->lock);
-	if (sms == 6 && !priv->enabled) {
-		clk_enable(priv->clk);
-		priv->enabled = true;
+	scoped_guard(mutex, &priv->lock) {
+		if (sms == 6 && !priv->enabled) {
+			ret = clk_enable(priv->clk);
+			if (ret)
+				return ret;
+
+			priv->enabled = true;
+		}
 	}
-	mutex_unlock(&priv->lock);
 
 	regmap_update_bits(priv->regmap, TIM_SMCR, TIM_SMCR_SMS, sms);
 
-- 
2.25.1


