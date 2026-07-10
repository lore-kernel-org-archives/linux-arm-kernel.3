Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF42C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 05:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3cJKrkL4EmZUZBGGiHvcgGxTvYQoI2A5b+wNCppHC50=; b=rg3lCJkS+idL9qGbQOIVssT6v8
	yCcKKrrM7iZhIjfDeiwiHrXR8ZryFLWEF7LXAT07RW4o00LLGxcsX/nKsusqcwv1xt6KSqslQrsn0
	tTRIKjbEyqtXV8HTFtImQmn2iloAQ7Of0tYrHmJkJaqEf/YrIKyL55zr8zWB8BqM0cZTPXv20Msa8
	2BFuIr3yPZrXt8euRGWh3+LnlxGkAiAkcnjZ/xRBW9GUBuU5CUQH7KLb/qwYoknocptXx1Z98pSj5
	rXI9VCuFUztaHK76cbcgWtvhlZO2IG7S158K1sL0QiidggLgar+FQzoqykaZbbrWxfTLrLpUC8OU/
	TheXb0Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3Td-00000004AHg-09Bu;
	Fri, 10 Jul 2026 05:08:41 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3TZ-00000004AEH-2j0P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 05:08:39 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-842338c18e0so427428b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 22:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660117; x=1784264917; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3cJKrkL4EmZUZBGGiHvcgGxTvYQoI2A5b+wNCppHC50=;
        b=ZcNsDlqTpUC1bZlhi6X1CrU1TIGs1/GE6ZpNHsLv+b0Lcykihz6gnv3ZbuLxeB5OrG
         sPrI0XdZVW/QzojtlHsz3N+jieZTzKpNkTjCaE2mgvXt1NfbVAOUfvOzSq/svbDOsRBX
         JxS8KW/X9vL7qJ7Tscm1fubHC+zVptdq3k49ap2Lt5A3zm8NEhWpalIoXix1KAuXU1tv
         2KcUd2EVRzR6sV8wBcwdM8F9g+ld/TFsXeNUHukKknuuXl9M/wDGqZsZq+47kBm2Z4Xu
         +FvLfdDKYCpwneWzubihTBB0kF+iaflan6xEqLojwcKVWS8dllcpQVSP3JJk9XsXAWjL
         dj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660117; x=1784264917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3cJKrkL4EmZUZBGGiHvcgGxTvYQoI2A5b+wNCppHC50=;
        b=imB1LpTe+X8++CG2uDjBgSvZNQi3h5VbwAYBdm6Sa7/aTReMjUwyLyJwUPWawUdjVu
         k3U3OBrGl4kbVdbZ/SlywPzRu6rTrRNLJPkIQqNgnFGulC+T5lP8cTiz1V9W33fCX8B5
         0KmtUCeTcnSeR2ZDDFcvpo59Hdc2w1lLT2rbozJbhWvbzZ7XB8ZXbV0SRPYgJoA1xkW/
         Ucl3O8MWH82aYOS4Gc+5ZYzFCDrBGAqd/UpzcDkDtAfDCAHKcIEiY6ulw2T35v3XabA0
         eGgAvUydu5jl1o223fTj9BQF0GYl1Uzy6cLwY2zZACoomwhWBFRdlx+BrL174GpBZCcq
         LzjQ==
X-Forwarded-Encrypted: i=1; AHgh+RqTj3QuOSP9wzGG7N7ZcTJ4Iq9oDNC4JsBE6m5RJLmkkblE24sX4OS5R0OfLPDA7S9CvsfgJtwQNxFKOFbojGhb@lists.infradead.org
X-Gm-Message-State: AOJu0YxPWu9f07/YfUcAcgi21JfcnJExSVxqf43jJjpjQOfx4HDvqJpQ
	wjAtCVtds9PrGiQUZzZt+v1BNfNMVJjifvMds+6pWU6Aj50ixGWbdR+w
X-Gm-Gg: AfdE7clZlBtR9Y7Mm1pySRhxbMr7BgDnCewHS7bzruNy+CwdUnYc+VUybmCdKEH+xeh
	ApGOuf+p3TJ9j1P48Qfkf8p4k9txnfDVT44P6+qAT8MizHWuYdnAoBHRHC1ito3bHiXA+GtFjol
	1fv86R8HHASxefRUjDkXuQIWDaS7cCsCzZK+sLMF8AboUEe/fVpIeEmG3uBxiZyTj8yveimEhMo
	+CX3lHjFoeplB7nkkZaJHHY2gYVHa+dZn0XqALwstGJ9xVWbybXzzyNWS1enjXDSiCsX/X9Ta1Y
	TaZVvvMZleXqORqdYlHUN/bMm4FqVpx9hM2Crza31ZItk3Wre0iP5lxqgFR1V4mDx422Xm7ACaL
	b/wZr7PjCbMIJn9LGMB+GngWIqNcfsHsvqjHPhnAZqIS5vfH4RGF8ZsWS5cLje0VE0LyukP7rx4
	Cda8vxJyVaNBqLwTg8FZ7ypJmoF91TNRzYo+DzoUX5yHlvATg=
X-Received: by 2002:a05:6a00:802:b0:848:5d9b:6885 with SMTP id d2e1a72fcca58-8485d9b6c13mr5853139b3a.77.1783660116798;
        Thu, 09 Jul 2026 22:08:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:08:36 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 25/27] ASoC: codecs: rt712: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:05:09 +0700
Message-ID: <20260710050511.14439-23-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_220837_704862_AE195DBB 
X-CRM114-Status: GOOD (  14.79  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/rt712-sdca-sdw.c | 30 ++++++++++++++++--------------
 sound/soc/codecs/rt712-sdca.c     |  5 ++---
 2 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index 70d661ce2ef2..180ab8f363f2 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/module.h>
@@ -427,13 +428,13 @@ static int rt712_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt712_sdca->disable_irq_lock);
-	rt712_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt712_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt712_sdca->disable_irq_lock) {
+		rt712_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -455,14 +456,15 @@ static int rt712_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt712->disable_irq_lock);
-		if (rt712->disable_irq == true) {
-
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt712->disable_irq = false;
+		scoped_guard(mutex, &rt712->disable_irq_lock) {
+			if (rt712->disable_irq) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt712->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt712->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT712_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
index d6353af07380..2218f9918ae3 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -7,6 +7,7 @@
 //
 
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <sound/core.h>
 #include <linux/delay.h>
 #include <linux/init.h>
@@ -403,7 +404,7 @@ static void rt712_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 {
-	mutex_lock(&rt712->calibrate_mutex);
+	guard(mutex)(&rt712->calibrate_mutex);
 
 	if (rt712->hs_jack) {
 		/* Enable HID1 event & set button RTC mode */
@@ -450,8 +451,6 @@ static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 
 		dev_dbg(&rt712->slave->dev, "in %s disable\n", __func__);
 	}
-
-	mutex_unlock(&rt712->calibrate_mutex);
 }
 
 static int rt712_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0


