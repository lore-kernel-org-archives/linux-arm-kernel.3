Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E029C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 06:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ahZNFpBmQcYCFe+4l/vw8gEiJ39UflxbVORl1Pl5COY=; b=G1Jj7XljSglK7NqbieLaiiAVj6
	4idj4BRETi9fqbA2DMYjWTTdMV/d1gmL+1uvXt8qRMOaeiG7Emilfb+NCBAxgsYbx97MNxiEuZFnF
	ObFBKGZRMeL2gMr8TCWcq23yaxMgt/317UA8H+qP4JSTaO+tbkWPo7ZELJ2tkNXmj+/EdxTB099/t
	l/D4ARdhiGvnxRP01WcJUhoqOs85XjgY7spBvpYP+/C6xLDvFpYr0qDixKkLzWoJNZuYxpDfeA7Dn
	D+unAk7IefjgBEY6+OmrnJAxZKJ/8NtW1VYdb/R7Qv4kNZcIFGUF5cUNxhcWIQRzFHi55+0ZT0Dpq
	GqxAbffQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS4c-0000000FyGM-31bn;
	Tue, 30 Jun 2026 06:35:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS4b-0000000FyEE-1E84
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 30 Jun 2026 06:35:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ahZNFpBmQcYCFe+4l/vw8gEiJ39UflxbVORl1Pl5COY=; b=dpPvhEaPZsNCx6U0expBlsvA2a
	dZYbHIg1mthkMjNwwXgN01SnGh1TUkmX5hp5oP9qGc1NwuIW4mraGR9DqhdH0g4X//BgzlH3j7uhe
	ydCu8o0l4XfnWheDs4OX5YKTRZgwus1i1oFK2r+b4ILAo8cQuwJ6l9shGG/xbt/d7BXG/7kGz/NyU
	JmHMhcwSYneHrUE43YPUTrRF6ECm5Qe3o7zqiAqFzYioLK6wcvR8TO4gNBAlHjIn35DBcZdSpIiuA
	Yv31Fd5JSANoByw7aBEBv3WqyNCmVbL/gerxjJ61vJHqJK0IF4jW0mRTYlID5iVx+BbmHeBK8XIGh
	DqiVgvwg==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weS4Y-00000001Z9G-1EM2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 06:35:56 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8478fe07f65so798856b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 23:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801352; x=1783406152; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahZNFpBmQcYCFe+4l/vw8gEiJ39UflxbVORl1Pl5COY=;
        b=lN1U9tKpYwP35jwWz1N8wo7L2hZYau+lUkQi5WSnj5MOw7GJftN9w/tqRX2B5uev3f
         8+kc69AcT3PPCVKOhRNBLZgt2gClmlPsAFh+w/C5PGnPTk1EwMfO655lJDRMA17a4/Dq
         5ISn7ichuQ+cPTFNlHpXQD+SEETW9p+wwci2DAWJ9XwIqA4mVMKstAZhVp4+vFUZiCGW
         hRv7LfeRGx29latRAAHBu/+874EcPmAwIStnl4eT4j8gjYbzMlIxpEYW8CMPJrnVdTPA
         ihCqJ8GHXg0N2fq9nfeXfA1OTzJycd5+ZNeG+YuuGEcuvpRkhTJZNdh+CaudvR+voBBT
         /n2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801352; x=1783406152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ahZNFpBmQcYCFe+4l/vw8gEiJ39UflxbVORl1Pl5COY=;
        b=DbMxnOiIUCjREsM+05uI06vQpyna33nQ5nK+NKa8jcC4Cdr4H3CmpEuzLCpzlS4zKV
         hMIZsUFvsmSiMNOTWgfeCLMlta7QXdBEyyTzQM/4gRvj4D7nQbT1pRSbpzg/rcXcGR+L
         4ysYBWtfQ/SXPQ56Ja8W31ukTBy/mYTvwY3JWZlqa2dYDCMNp+Qc9GhFVyhnpzYc16b8
         NgTdCDtSAgK4pq4JApTwbYrSY1BNkJpT/5y1Ql3xaAfp5ll03SnxXx+imcYJ9ErI2ayi
         uG8bI4ymORLpOn1Xnq4R4NX7qn4V3OQQz5BNAZoh5Hzlw65A8aIKWGgOvKLW2j1BIu5E
         hnuQ==
X-Forwarded-Encrypted: i=1; AFNElJ+noXSGWePmJaAfQX2MUd51DbRFAJehSXwEChUdxW1FwyfvYvbINpR2Q0X3bd8tOqtgQiY91x7eRTUCvbWv8mJw@lists.infradead.org
X-Gm-Message-State: AOJu0YzrpKpbwKkpfkeXURpzEoHoRfi9WjEGtOeu2Cuf4GSP5xnFropO
	eHIbt7mwFnJczLz0kU3jY4Gp0dXsm7oc94eMagc5T+FkLmz28jTNH88j
X-Gm-Gg: AfdE7cmgEKVSg4XxP+YSBHGKtBI7UR1Bt7ZFeg0uymVrZTXVC5l0IbBCENcbqCSrhY2
	dRD0qTgknkJrPDnJF2x2W9MnjY6kdl7+W2h0l86ubykRlcqyyaBiIBaDAa0RSLJuiT7qBbFbota
	IZd0517Bv+Ls/hYeIBJKsp6uH4VzOhe4eplLdCEGxT3zIA8JaEcaxCBUIsb/VU3apGGPhj82MyH
	eN8HTkUcFghb5Xfk4u2H8lJRh4vLCQLtOC5CmXO9PiKoqs9WhSZHA5RteEfLtCBc+3qj63ODYaK
	G99CE0xu4MgNcxKClc1wH4i99MqilWgvEgbFCIKKITjDawQKLJzYm/nGpAVIM1zcIgyjbytexVS
	XQxOcOp5dJ9gfs0Le+hsCqFKqtScx1F7v1jpCjOzraVr9jh3c47OtKHZ6ze3kdXJR96qf+XYKO1
	foMhjQwLQMotFu9vA/qAq8Cd2n3mtEa2MUMJxsVjjrzWtfTe24MrNALoB8Cg==
X-Received: by 2002:a05:6a00:8cb:b0:845:d2e3:263b with SMTP id d2e1a72fcca58-8479f2b77b8mr1944498b3a.53.1782801352542;
        Mon, 29 Jun 2026 23:35:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:35:52 -0700 (PDT)
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
Subject: [PATCH 06/27] ASoC: codecs: fs210x: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:28 +0700
Message-ID: <20260630063449.503996-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_073554_530758_5C023203 
X-CRM114-Status: GOOD (  17.88  )
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
 sound/soc/codecs/fs210x.c | 87 ++++++++++++++-------------------------
 1 file changed, 30 insertions(+), 57 deletions(-)

diff --git a/sound/soc/codecs/fs210x.c b/sound/soc/codecs/fs210x.c
index 5f381fe063e8..87ae2a154462 100644
--- a/sound/soc/codecs/fs210x.c
+++ b/sound/soc/codecs/fs210x.c
@@ -4,6 +4,7 @@
 //
 // Copyright (C) 2016-2025 Shanghai FourSemi Semiconductor Co.,Ltd.
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
@@ -770,9 +771,8 @@ static int fs210x_dai_hw_params(struct snd_pcm_substream *substream,
 	if (fs210x->devid == FS2105S_DEVICE_ID && fs210x->srate == 16000)
 		return -EOPNOTSUPP;
 
-	mutex_lock(&fs210x->lock);
-	ret = fs210x_set_hw_params(fs210x);
-	mutex_unlock(&fs210x->lock);
+	scoped_guard(mutex, &fs210x->lock)
+		ret = fs210x_set_hw_params(fs210x);
 	if (ret)
 		dev_err(fs210x->dev, "Failed to set hw params: %d\n", ret);
 
@@ -789,15 +789,11 @@ static int fs210x_dai_mute(struct snd_soc_dai *dai, int mute, int stream)
 
 	fs210x = snd_soc_component_get_drvdata(dai->component);
 
-	mutex_lock(&fs210x->lock);
-
-	if (!fs210x->is_inited || fs210x->is_suspended) {
-		mutex_unlock(&fs210x->lock);
-		return 0;
+	scoped_guard(mutex, &fs210x->lock) {
+		if (!fs210x->is_inited || fs210x->is_suspended)
+			return 0;
 	}
 
-	mutex_unlock(&fs210x->lock);
-
 	if (mute) {
 		cancel_delayed_work_sync(&fs210x->fault_check_work);
 		cancel_delayed_work_sync(&fs210x->start_work);
@@ -816,15 +812,11 @@ static int fs210x_dai_trigger(struct snd_pcm_substream *substream,
 
 	fs210x = snd_soc_component_get_drvdata(dai->component);
 
-	mutex_lock(&fs210x->lock);
-
-	if (!fs210x->is_inited || fs210x->is_suspended || fs210x->is_playing) {
-		mutex_unlock(&fs210x->lock);
-		return 0;
+	scoped_guard(mutex, &fs210x->lock) {
+		if (!fs210x->is_inited || fs210x->is_suspended || fs210x->is_playing)
+			return 0;
 	}
 
-	mutex_unlock(&fs210x->lock);
-
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
@@ -852,13 +844,11 @@ static void fs210x_start_work(struct work_struct *work)
 
 	fs210x = container_of(work, struct fs210x_priv, start_work.work);
 
-	mutex_lock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 
 	ret = fs210x_dev_play(fs210x);
 	if (ret)
 		dev_err(fs210x->dev, "Failed to start playing: %d\n", ret);
-
-	mutex_unlock(&fs210x->lock);
 }
 
 static void fs210x_fault_check_work(struct work_struct *work)
@@ -869,15 +859,12 @@ static void fs210x_fault_check_work(struct work_struct *work)
 
 	fs210x = container_of(work, struct fs210x_priv, fault_check_work.work);
 
-	mutex_lock(&fs210x->lock);
+	scoped_guard(mutex, &fs210x->lock) {
+		if (!fs210x->is_inited || fs210x->is_suspended || !fs210x->is_playing)
+			return;
 
-	if (!fs210x->is_inited || fs210x->is_suspended || !fs210x->is_playing) {
-		mutex_unlock(&fs210x->lock);
-		return;
+		ret = fs210x_reg_read(fs210x, FS210X_05H_ANASTAT, &status);
 	}
-
-	ret = fs210x_reg_read(fs210x, FS210X_05H_ANASTAT, &status);
-	mutex_unlock(&fs210x->lock);
 	if (ret)
 		return;
 
@@ -990,7 +977,7 @@ static int fs210x_effect_scene_get(struct snd_kcontrol *kcontrol,
 	if (fs210x->scene_id < 1)
 		return -EINVAL;
 
-	mutex_lock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 	/*
 	 * FS210x has scene(s) as below:
 	 * init scene: id = 0
@@ -999,7 +986,6 @@ static int fs210x_effect_scene_get(struct snd_kcontrol *kcontrol,
 	 */
 	index = fs210x->scene_id - 1;
 	ucontrol->value.integer.value[0] = index;
-	mutex_unlock(&fs210x->lock);
 
 	return 0;
 }
@@ -1018,7 +1004,7 @@ static int fs210x_effect_scene_put(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	}
 
-	mutex_lock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 
 	/*
 	 * FS210x has scene(s) as below:
@@ -1028,17 +1014,14 @@ static int fs210x_effect_scene_put(struct snd_kcontrol *kcontrol,
 	 */
 	scene_id = ucontrol->value.integer.value[0] + 1;
 	scene_count = fs210x->amp_lib.scene_count - 1; /* Skip init scene */
-	if (scene_id < 1 || scene_id > scene_count) {
-		mutex_unlock(&fs210x->lock);
+	if (scene_id < 1 || scene_id > scene_count)
 		return -ERANGE;
-	}
 
 	if (scene_id != fs210x->scene_id)
 		is_changed = true;
 
 	if (fs210x->is_suspended) {
 		fs210x->scene_id = scene_id;
-		mutex_unlock(&fs210x->lock);
 		return is_changed;
 	}
 
@@ -1046,8 +1029,6 @@ static int fs210x_effect_scene_put(struct snd_kcontrol *kcontrol,
 	if (ret)
 		dev_err(fs210x->dev, "Failed to set scene: %d\n", ret);
 
-	mutex_unlock(&fs210x->lock);
-
 	if (!ret && is_changed)
 		return 1;
 
@@ -1061,12 +1042,10 @@ static int fs210x_playback_event(struct snd_soc_dapm_widget *w,
 	struct fs210x_priv *fs210x = snd_soc_component_get_drvdata(cmpnt);
 	int ret = 0;
 
-	mutex_lock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 
-	if (fs210x->is_suspended) {
-		mutex_unlock(&fs210x->lock);
+	if (fs210x->is_suspended)
 		return 0;
-	}
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -1087,8 +1066,6 @@ static int fs210x_playback_event(struct snd_soc_dapm_widget *w,
 		break;
 	}
 
-	mutex_unlock(&fs210x->lock);
-
 	return ret;
 }
 
@@ -1219,11 +1196,9 @@ static int fs210x_probe(struct snd_soc_component *cmpnt)
 	if (ret)
 		return ret;
 
-	mutex_lock(&fs210x->lock);
-	ret = fs210x_init_chip(fs210x);
-	mutex_unlock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 
-	return ret;
+	return fs210x_init_chip(fs210x);
 }
 
 static void fs210x_remove(struct snd_soc_component *cmpnt)
@@ -1250,15 +1225,15 @@ static int fs210x_suspend(struct snd_soc_component *cmpnt)
 
 	regcache_cache_only(fs210x->regmap, true);
 
-	mutex_lock(&fs210x->lock);
-	fs210x->cur_scene = NULL;
-	fs210x->is_inited = false;
-	fs210x->is_playing = false;
-	fs210x->is_suspended = true;
+	scoped_guard(mutex, &fs210x->lock) {
+		fs210x->cur_scene = NULL;
+		fs210x->is_inited = false;
+		fs210x->is_playing = false;
+		fs210x->is_suspended = true;
 
-	gpiod_set_value_cansleep(fs210x->gpio_sdz, 1); /* Active */
-	fsleep(30000); /* >= 30ms */
-	mutex_unlock(&fs210x->lock);
+		gpiod_set_value_cansleep(fs210x->gpio_sdz, 1); /* Active */
+		fsleep(30000); /* >= 30ms */
+	}
 
 	cancel_delayed_work_sync(&fs210x->start_work);
 	cancel_delayed_work_sync(&fs210x->fault_check_work);
@@ -1287,13 +1262,11 @@ static int fs210x_resume(struct snd_soc_component *cmpnt)
 		return ret;
 	}
 
-	mutex_lock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 
 	fs210x->is_suspended = false;
 	ret = fs210x_init_chip(fs210x);
 
-	mutex_unlock(&fs210x->lock);
-
 	return ret;
 }
 #else
-- 
2.43.0


