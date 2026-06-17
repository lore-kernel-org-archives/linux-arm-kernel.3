Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20047CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8SpJk+YV05owTMk/l4yBZn7d6rPDuNymeMNQ+5MR+ME=; b=rmgF1bO8KUhbGwxmffHcC/lmnw
	ioTI3df8Y3V4fU9JbHeUisJFrsNKNzx9KjJWXut5tfE3JFi6SZjlpzdN6cBRaDrd6ELnKEp/ZaSVT
	Z6jbls+z5MQ17P0OoE2/N3AyJrAe3Mfj0whdNyPWBvmPSReC5KwETQyqQA0m69fu8ORPjlU1KpLZp
	jTXv9uOznDF8xVwzQnGMT8hXQZbd05Vh/EuaY9MbLvqxOlqe+gkBI7q83XEx9VPkU+LCUwMZcds5w
	zanazLEkuY77Acxaf5kPF+snTHPNzkC8dAihFFcHETjCeRGUKeoYbW3tyDWF0wFZcivR1x+XpAmd4
	1oWEZ90w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZngM-0000000H8hV-39UZ;
	Wed, 17 Jun 2026 10:39:42 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZngJ-0000000H8fY-1Nl6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:39:41 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so2729778eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692779; x=1782297579; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SpJk+YV05owTMk/l4yBZn7d6rPDuNymeMNQ+5MR+ME=;
        b=CpJKJ9ZjtJHsp5uxRkT6t8WNPmrT4yKvMGlN1c1hKOmDWz2RVk4c++D3uBusQvy2ki
         fJ9uJQ7p9Fic7fwTWyrG2zJcWIBgSfR+wuRCWJXFbzTuLlOYlGvYGDCpeKXS4K1Gzvzb
         ldJdIyGIb7NAx57IqDotyNpYUp2mxmtm4CYHwNr5DdnmwtcBhi+0mHNU3UzGtOAcJr5z
         fZ8SOj8tH+wuEHSMmI3p9mi6ZPsgC7w0FlPyC+P5UjTHQSPWmFyAqhcNuenn9Qe/OtHe
         FoQEtV0QPewc9C+gogd+y4X61qyDS2bf7FEMCOKzsyYzw2kTqF3o+OBZgTMt6bQwBnYn
         Vm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692779; x=1782297579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8SpJk+YV05owTMk/l4yBZn7d6rPDuNymeMNQ+5MR+ME=;
        b=Ttxw6syCvVTxuB4+USJ7PnJpEjAwvdki8VHSS6EVIzfiTZlAw3OzSGMrJIiP60g1lB
         mREI/UwvsWpAc9KGvLW41di2rZ3GRgoqG71SIRo4S40k0ss2f2QmhAtHNnE4v3iT5nvP
         77fs5CkodNnIn7yuPbPLYEOmm7Boowg4I9DkhX4i5tCADiP/3BEe7AmZWOJmvypzZ1MF
         GkbNaTB7x0+Yc/tVkgB4yv/VWvmaKfGVgtn+6Bc6GCd/7olHZfgqLHsOM8jiC3pD3efu
         OUbKpTxWXyz7CGs/MnaFyWsrc63Fk7xRNLGfOjlW32dauw7IkNZLCJ1LRfCtMozVAYCK
         Q8CQ==
X-Forwarded-Encrypted: i=1; AFNElJ+y9ybcRkjJZXr9XLoz1EKnvZPE9bXomlvDpf4VKcT2cnDIrdlV7wO45dGi9Se3LK8FL7cUlxmDn1U83XVA/cnv@lists.infradead.org
X-Gm-Message-State: AOJu0Yx70dnkMuQT0P2rjRXL8VBmvBJngU7x4qcdmBwO+N2WdJ6dk9uU
	MFn+QH46J4u5lN24ATs9BoGvRsmuE1l1kwUaiFmbh+UdnK50fFRz7U9e
X-Gm-Gg: AfdE7cmSOYmbj8g9Ojplx9OC9W+Zb3kWbPBBtzM0VM+U40TNikL2Hg5wbzPpmVamkbB
	VjHXVTwCjc1fd/kHi1qJjh29zXbfB1egTmkvUUP46DKFDDSj82PARam0bFhYL94vc6YEAtHLtwz
	uVRnTp7OUivAkeI+uifpuSIR/OV3Lf+X9qxeHuKzhGMn6ngfolntovRxe+B9BKw2IVnh1sxfd/f
	SvTZImXjNk+/wlSMfbH9tvYuOeiokYDhqpd97I4o78prI7NO/qOzlrkCmMn7nOQ+hPrR0G7eCnj
	NaAwRYxBrfWVdeNeMqFuFUe+RUjL1ZHX2FXcp451aQCxQzJKlp0/aertMZz02lfmXHG8muNJiWo
	0OdQVVKYO2nrfX2wfZPihhWd218mL9ty+LSxvzRG44laUSTZEQ+182vOuFK5I3BuFzJCPsy4qyO
	pxjUz0He1ju11kZ4lUux1JhuoP5gyhQg2psyRx7MkCiBTVuSQ=
X-Received: by 2002:a05:7300:a497:b0:2c5:50fe:c795 with SMTP id 5a478bee46e88-30bca0ed5a2mr1720604eec.29.1781692778532;
        Wed, 17 Jun 2026 03:39:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:39:38 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 42/78] ASoC: codecs: rt5645: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:59 +0700
Message-ID: <20260617103235.449609-43-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033939_382780_CF3CBF54 
X-CRM114-Status: GOOD (  14.22  )
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
 sound/soc/codecs/rt5645.c | 161 +++++++++++++++++++-------------------
 1 file changed, 80 insertions(+), 81 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 8a9af260e5f7..4a74b90bd3f6 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3325,93 +3325,92 @@ static void rt5645_jack_detect_work(struct work_struct *work)
 	if (!rt5645->component)
 		return;
 
-	mutex_lock(&rt5645->jd_mutex);
-
-	switch (rt5645->pdata.jd_mode) {
-	case 0: /* Not using rt5645 JD */
-		if (rt5645->gpiod_hp_det) {
-			gpio_state = gpiod_get_value(rt5645->gpiod_hp_det);
-			if (rt5645->pdata.inv_hp_pol)
-				gpio_state ^= 1;
-			dev_dbg(rt5645->component->dev, "gpio_state = %d\n",
-				gpio_state);
-			report = rt5645_jack_detect(rt5645->component, gpio_state);
-		}
-		snd_soc_jack_report(rt5645->hp_jack,
-				    report, SND_JACK_HEADPHONE);
-		snd_soc_jack_report(rt5645->mic_jack,
-				    report, SND_JACK_MICROPHONE);
-		mutex_unlock(&rt5645->jd_mutex);
-		return;
-	case 4:
-		val = snd_soc_component_read(rt5645->component, RT5645_A_JD_CTRL1) & 0x0020;
-		break;
-	default: /* read rt5645 jd1_1 status */
-		val = snd_soc_component_read(rt5645->component, RT5645_INT_IRQ_ST) & 0x1000;
-		break;
+	scoped_guard(mutex, &rt5645->jd_mutex) {
+		switch (rt5645->pdata.jd_mode) {
+		case 0: /* Not using rt5645 JD */
+			if (rt5645->gpiod_hp_det) {
+				gpio_state = gpiod_get_value(rt5645->gpiod_hp_det);
+				if (rt5645->pdata.inv_hp_pol)
+					gpio_state ^= 1;
+				dev_dbg(rt5645->component->dev, "gpio_state = %d\n",
+					gpio_state);
+				report = rt5645_jack_detect(rt5645->component, gpio_state);
+			}
+			snd_soc_jack_report(rt5645->hp_jack,
+					    report, SND_JACK_HEADPHONE);
+			snd_soc_jack_report(rt5645->mic_jack,
+					    report, SND_JACK_MICROPHONE);
+			return;
+		case 4:
+			val = snd_soc_component_read(rt5645->component, RT5645_A_JD_CTRL1) & 0x0020;
+			break;
+		default: /* read rt5645 jd1_1 status */
+			val = snd_soc_component_read(rt5645->component, RT5645_INT_IRQ_ST) & 0x1000;
+			break;
 
-	}
+		}
 
-	if (!val && (rt5645->jack_type == 0)) { /* jack in */
-		report = rt5645_jack_detect(rt5645->component, 1);
-	} else if (!val && rt5645->jack_type == SND_JACK_HEADSET) {
-		/* for push button and jack out */
-		btn_type = 0;
-		if (snd_soc_component_read(rt5645->component, RT5645_INT_IRQ_ST) & 0x4) {
-			/* button pressed */
-			report = SND_JACK_HEADSET;
-			btn_type = rt5645_button_detect(rt5645->component);
-			/* rt5650 can report three kinds of button behavior,
-			   one click, double click and hold. However,
-			   currently we will report button pressed/released
-			   event. So all the three button behaviors are
-			   treated as button pressed. */
-			switch (btn_type) {
-			case 0x8000:
-			case 0x4000:
-			case 0x2000:
-				report |= SND_JACK_BTN_0;
-				break;
-			case 0x1000:
-			case 0x0800:
-			case 0x0400:
-				report |= SND_JACK_BTN_1;
-				break;
-			case 0x0200:
-			case 0x0100:
-			case 0x0080:
-				report |= SND_JACK_BTN_2;
-				break;
-			case 0x0040:
-			case 0x0020:
-			case 0x0010:
-				report |= SND_JACK_BTN_3;
-				break;
-			case 0x0000: /* unpressed */
-				break;
-			default:
-				dev_err(rt5645->component->dev,
-					"Unexpected button code 0x%04x\n",
-					btn_type);
-				break;
+		if (!val && (rt5645->jack_type == 0)) { /* jack in */
+			report = rt5645_jack_detect(rt5645->component, 1);
+		} else if (!val && rt5645->jack_type == SND_JACK_HEADSET) {
+			/* for push button and jack out */
+			btn_type = 0;
+			if (snd_soc_component_read(rt5645->component, RT5645_INT_IRQ_ST) & 0x4) {
+				/* button pressed */
+				report = SND_JACK_HEADSET;
+				btn_type = rt5645_button_detect(rt5645->component);
+				/*
+				 * rt5650 can report three kinds of button behavior,
+				 * one click, double click and hold. However,
+				 * currently we will report button pressed/released
+				 * event. So all the three button behaviors are
+				 * treated as button pressed.
+				 */
+				switch (btn_type) {
+				case 0x8000:
+				case 0x4000:
+				case 0x2000:
+					report |= SND_JACK_BTN_0;
+					break;
+				case 0x1000:
+				case 0x0800:
+				case 0x0400:
+					report |= SND_JACK_BTN_1;
+					break;
+				case 0x0200:
+				case 0x0100:
+				case 0x0080:
+					report |= SND_JACK_BTN_2;
+					break;
+				case 0x0040:
+				case 0x0020:
+				case 0x0010:
+					report |= SND_JACK_BTN_3;
+					break;
+				case 0x0000: /* unpressed */
+					break;
+				default:
+					dev_err(rt5645->component->dev,
+						"Unexpected button code 0x%04x\n",
+						btn_type);
+					break;
+				}
 			}
+			if (btn_type == 0)/* button release */
+				report =  rt5645->jack_type;
+			else {
+				mod_timer(&rt5645->btn_check_timer,
+					msecs_to_jiffies(100));
+			}
+		} else {
+			/* jack out */
+			report = 0;
+			snd_soc_component_update_bits(rt5645->component,
+					    RT5645_INT_IRQ_ST, 0x1, 0x0);
+			rt5645_jack_detect(rt5645->component, 0);
 		}
-		if (btn_type == 0)/* button release */
-			report =  rt5645->jack_type;
-		else {
-			mod_timer(&rt5645->btn_check_timer,
-				msecs_to_jiffies(100));
-		}
-	} else {
-		/* jack out */
-		report = 0;
-		snd_soc_component_update_bits(rt5645->component,
-				    RT5645_INT_IRQ_ST, 0x1, 0x0);
-		rt5645_jack_detect(rt5645->component, 0);
 	}
 
-	mutex_unlock(&rt5645->jd_mutex);
-
 	snd_soc_jack_report(rt5645->hp_jack, report, SND_JACK_HEADPHONE);
 	snd_soc_jack_report(rt5645->mic_jack, report, SND_JACK_MICROPHONE);
 	if (rt5645->en_button_func)
-- 
2.43.0


