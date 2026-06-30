Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478FFC43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 06:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jvHEcHt0Pv/b75XSblH4phF6+1Nj638qki4oB9IDwxk=; b=aejw1hdhHOtZRhJtNhvZOpUs18
	yV/2FYAK95v+/IgitfZxiCZb7zooGkEiTD/qkIGBo8+PwZc2gmXpHcKIv0PUZojt5PYGmBWwKTLoW
	RZFYqXvzVWd+lrGcANDRIe4w8VKjokZKJpJd17Ve05FmgdEhJcqBn1aqpMXkm+oO7QDOr3MmV0wSW
	v+P0M8Q0IX+L/MT1Eov442zutAzMFqgFqMpWlcn+PIcp2RjQpmkpi0WQOJRAjGRZGO4whsC0a1PNi
	bW2lypBJRmlq40Umuk18HnEQhA7Xr4KNLUp9S5niUy1k5IaC8CvxprM2F1S2+Mra0PN+SUCafbbtb
	2uX+NZQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS7M-0000000G0i9-3jTo;
	Tue, 30 Jun 2026 06:38:48 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS7E-0000000G0c6-1VIx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 06:38:42 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8478a25f268so1051657b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 23:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801520; x=1783406320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvHEcHt0Pv/b75XSblH4phF6+1Nj638qki4oB9IDwxk=;
        b=ktVdRmxbM4gvoLn8V1MQD24kHWy/niLDMRNijMDsfpNB+Q327FdgD4CD+4yfq9bOrg
         lUXXhloVLrRcHn+wbNqaKT/7o4O7E2tSJtpgaMhbQWPXZvVSjGe1niAEI/PEd2q57K9y
         i8lD3VYuqUiy5JMY8af1bi7jQL7itDptOABO8nR8sTwLI4Djdtx0rcxKrciJRvhm3guc
         oFGDYGmgFwrNgFVYg/GDnkR2ns693HYFe95St/0tzXXGb68hvx6OJLRoVxEvu+A26Mxl
         vvADdlUuy9mfaLc1P4/bdirEZg74Sbo8flmgdJ9JR2+jyq90oxi3S4QnMvbt+iDMLk9R
         RNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801520; x=1783406320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jvHEcHt0Pv/b75XSblH4phF6+1Nj638qki4oB9IDwxk=;
        b=Q9ieySDO76maMboFXqv8ZZCEtVqPrHx7ElS+jDwdunyCTde+AMMsKdcvcVw/wzmSfV
         b5wMLveNjGceXBkYqC0Xh1stgYX/Ipxc0DbLYHJnU9JvkPdJPvux/u5zBNG+/PFxDNpn
         5Pn9BvBfWLHW+2jxVwn2ItUnk5k0tqkblDmxNyDzLiBySlNrknEwxjSK1ngpEUmEirhu
         1LL1kaACkNGQHN+I4m1PgfU/3OM9BBNV8TmfXwFGO7veyJwsPEKec1wkqta6wS6pp5Iq
         am9uH8/zk8r01SsFDtUBNgwnpaQie+kx2RkxQ43CRqpgL7fIc4L/0Kq9jlmJBF6NBBAD
         +eDw==
X-Forwarded-Encrypted: i=1; AHgh+RomO1lKvgA3mrWhqu/0oUYki2glxyHne9RrDwmjpWUIglT87pKcFXFwhDDSRTsdAJclp5Vn25e2uROFYIDeABgG@lists.infradead.org
X-Gm-Message-State: AOJu0YyDLQ6CsQAr9q0krRsnCjXdzj2USybejrwGAwYWg88+Df3h7Nul
	KSWj3p0vBJBysNndsMOH+Mbd6g2qIJLt1kL3T5i6lDgTM7OhoGlwSzn0
X-Gm-Gg: AfdE7clDIxZq2rIOrlnNVyDbAXwICXLaRuWN9x4J6ynzHMc8Xr5NmcS+tkp6Y7R7qU8
	VgXllSCwt/dotzh/qjqOj/JN4LI0lhOBtX4uPQ+v8nbhXDmnrQYgvbnPFB/oVVUpulA12Ijd/Sh
	NYrbAmX2tUkuloUoifAxcDnBXt27PCl1w+WvsYbSGtI9P0tFI7rQX3ADNBAmyfZhrrofy7oFX3s
	bS81XEwvKyM0/6UthHnq9Z1EWvQIo1JWXxbkqqqEvupQBW0iOdnYRT6pXO0V0CY5EI6HDSkeAgw
	AMjAyTcAgJdvGsRiWOKlv4PLLRHwyOU1Zd+1anYBIl/qVC0YNlwydAHrMfLgFOpDlwq9mTka77V
	fq7kHpR+5oagB6yUWI9tvALwYRlCWecews3VTS2+EQS7+hzScfQuJgqLXx5i3JxCOdSl1yXbalj
	oipBWEAFPHwS21gd5UNnSS/MQOH1xpIKyWTbIvt2v+8vLgKU0=
X-Received: by 2002:a05:6a00:44ca:b0:845:d285:3b67 with SMTP id d2e1a72fcca58-8479f26f9b7mr1978158b3a.51.1782801519609;
        Mon, 29 Jun 2026 23:38:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:38:39 -0700 (PDT)
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
Subject: [PATCH 25/27] ASoC: codecs: rt712: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:47 +0700
Message-ID: <20260630063449.503996-26-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_233840_410458_32615C14 
X-CRM114-Status: GOOD (  15.26  )
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
 sound/soc/codecs/rt712-sdca.c     |  8 +++-----
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index 2787524c796e..e784e8b7d167 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/mod_devicetable.h>
@@ -428,13 +429,13 @@ static int rt712_sdca_dev_system_suspend(struct device *dev)
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
@@ -456,14 +457,15 @@ static int rt712_sdca_dev_resume(struct device *dev)
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
index 4796fce084ff..5ab1d3961409 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/bitops.h>
 #include <sound/core.h>
 #include <linux/delay.h>
@@ -79,7 +80,7 @@ static int rt712_sdca_calibration(struct rt712_sdca_priv *rt712)
 	int chk_cnt = 100;
 	int ret = 0;
 
-	mutex_lock(&rt712->calibrate_mutex);
+	guard(mutex)(&rt712->calibrate_mutex);
 	dev = regmap_get_device(regmap);
 
 	/* Set HP-JD source from JD1 */
@@ -126,7 +127,6 @@ static int rt712_sdca_calibration(struct rt712_sdca_priv *rt712)
 	/* Release HP-JD, EN_CBJ_TIE_GL/R open, en_osw gating auto done bit */
 	rt712_sdca_index_write(rt712, RT712_VENDOR_REG, RT712_DIGITAL_MISC_CTRL4, 0x0010);
 
-	mutex_unlock(&rt712->calibrate_mutex);
 	dev_dbg(dev, "%s calibration complete, ret=%d\n", __func__, ret);
 	return ret;
 }
@@ -403,7 +403,7 @@ static void rt712_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 {
-	mutex_lock(&rt712->calibrate_mutex);
+	guard(mutex)(&rt712->calibrate_mutex);
 
 	if (rt712->hs_jack) {
 		/* Enable HID1 event & set button RTC mode */
@@ -450,8 +450,6 @@ static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 
 		dev_dbg(&rt712->slave->dev, "in %s disable\n", __func__);
 	}
-
-	mutex_unlock(&rt712->calibrate_mutex);
 }
 
 static int rt712_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0


