Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE69C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 04:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Em5RHq8kurLglT2Y/3vN8YPxgrqKKepZuisLHT8U5Q=; b=YXm8Quzt6PFK6FsL2wfWCjuzKL
	IaaZs/1YTD7T2/XuUL/SCdgOmd1DUWQzkvTC1ybww1tMMIThHNuZhkMootcwWaOSfU3kbcpE/C+49
	NG1Ls3JKNwD+wO7y4h6Xgy83vn3X5Z/+2CLM8L6fHrZlpGWrdpC35aH81h1jihSqVNj1l7zYjHrPy
	Oa3/8RPtLIv/UcFdMVUboo7eYPRKbu6as0aKeyN55Kdyg5Skbv/s6tEwD7IduUHcLSW/LDQ6C8vKd
	mlH54yHgw1O+8nnpBpQi/qbGwo36M/uQPbRy1jXXrkgUWWnk+PxQV6FBublsRV1ArHsfcvApPvZSU
	nXWqof+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89by-0000000GtAT-1cdc;
	Sun, 20 Sep 2026 04:57:10 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89bw-0000000Gt87-2XhR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 04:57:09 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747f066d8so6963885ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 21:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880228; x=1790485028; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Em5RHq8kurLglT2Y/3vN8YPxgrqKKepZuisLHT8U5Q=;
        b=JwZwe7oi7uSE0GPOGmJmljCr3rdm++Y4D/dfgTLoqtMIxskSPArbmT5Fn9dat4fHvP
         1jGm9JZDcaibEWALWmBSzhe+1bw6CFpWu5D4/h3INvDkPYON8zy2yAeM/vyQ0IGVf202
         qUOQMly2H/I5V7099wuxMCFxg77F4IHdqwdqHLwxOHp383Jcw68rm1LjSxP0rk5G014V
         b4Mujb5ogWkidLof554WsigFqLefJDsFsoEUp3tDLmVlNNKjH3a0AOsU/urfFy3u6/DK
         zxWGxZPKw7QBod/edC/1TEkmDvBH1FBx6QYUNjcTyV7hxNWmDsUVCqb4YZqKqU0+qZo6
         3Jsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880228; x=1790485028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Em5RHq8kurLglT2Y/3vN8YPxgrqKKepZuisLHT8U5Q=;
        b=WNPsIoGATlhWLPQcB8X6pC3HHsbR74c2RHlGnGgUm+HCK69Z91a7WcedekrkEoRsJ4
         VzpOS9lm6/lQzfmAIUdEU8jEwhQy5nFg+lONhmuGBMQj2QCkLjCEbgULFqlyTKozi4mF
         HzHmQZZus8gIOHoC2n9HDZqb+F4JuRmIv/VjwcdMCZ7Z+CWIJetqb7OBlI2RVJ8/p4vG
         UCO+0dNhz62Awcl6KJ67eJDRdreCvik0VIFBpUHqhMKAKap5yx7uww8TLz6BFgK3LEHp
         8smEgiT5RU71iOTeCJ2gL2Y2sKIHmRqEH3UvFBAHgmGEIpePg4/2wZ1crsTtgGUSd9q+
         L2aw==
X-Forwarded-Encrypted: i=1; AKwUvByRMBLvxgW4t4YAMZiRtvtvinFROv104ynQyT9hwpXd5qfpJMmzSvw5CsXrWOJhsgfVXL+GlEQDy5rUU4IfGdYR@lists.infradead.org
X-Gm-Message-State: AFuF++kDeamWiQsSq4wzFZUDQikzdkGspUBIsM/lB2ifwNl/kHYr5+Ss
	NLhj57NWgRzmfcHhsw/6aGtgRk8xm6evcm1976kqlqlgJoM8aU0FnQUH
X-Gm-Gg: AYBFou0+yzQass/2K2rLQXbrxGBzu/w2CxaqG/+ZjCJGvsshX3ur6iERIBNa9PTCro2
	h1JtgIpOYsbLTDU9eSMP2X8COvtihBx7nqgaJSWTfI3Izk8OQwQkcnn/zBbb7qE688cZpJs3bvs
	5l8OiaOtgnMRZ/QsI6u84ydpDD9/lgxBvPegaHJlFDnQLTqX4YTzti71S74gHN+KxzORtUPA3Zt
	6UHY4SZdZf1bonf5xPpoqClwcYi/GjJUcDd4XKlSdypoNJlmlA0WHNuj6G7QIWturQE85ZwQx/0
	yuZWOW5M9AJi2XY8VcNblULEGsWPASs9y/4uivvb5nup0Q2akXC1HAO2JPLnRGq7AMiQpz5F7n2
	3UbB+ZfjJBuNhpVgV7UYzRtsd9jKhd5i+uqlZdTHlYYiXvCGrTJYlwYCaHBjoh6VwsSVF7UF1eX
	nac2fGDOEwKb41iTJsDQgdAmCWx/yxwVscA2BtMG7+/MZ0EwVamOVsIxNmZRmNwatUecu9msTHR
	Ks0B5qycmZylmgJGoROAPe8St5wRSo2wQa6+lyXKV3hzDYTV4GonMe3J4xLabXo/b8Zcneo/AYj
	07CUlZE1SDIh5ThMdY9p/2lV0doS1Ce5w3Gm35gUuo4ct/s=
X-Received: by 2002:a17:903:1786:b0:2dd:c053:b9c6 with SMTP id d9443c01a7336-2ddc053ba3amr47265835ad.23.1789880227909;
        Sat, 19 Sep 2026 21:57:07 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:57:07 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:52 +1000
Subject: [PATCH 13/28] ASoC: card: Let 'fixup_controls' return errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260920-macaudio-v1-13-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3700;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=2WG4d/8EDKjA/Ac+P1A9R66HR3H99W3M7nFvRZ5lYJI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xXbV/kqyabeldw5w2j/zMmctyr9Nt7e4LXyl2qa2
 mN+iVsSHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKnWTGb4H9DXG5xQ1eBqtVFoYY2L8Brh1RZyjQeO3XsbkSDNPeXYd4Z/iu2mXVX
 qp19ZtQiuXdPgxaSWP+vVtKRV37rcbndO7dvPBAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215708_650849_CEDBFEC8 
X-CRM114-Status: GOOD (  18.43  )
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

From: Martin Povišer <povik+lin@cutebit.org>

Let the 'fixup_controls' card method return error values which will roll
back the half-done binding of the card.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc-card.h                 |  2 +-
 include/sound/soc.h                      |  2 +-
 .../soc/mediatek/mt8188/mt8188-mt6359.c  |  4 +++-
 sound/soc/soc-card.c                     | 12 +++++++++---
 sound/soc/soc-core.c                     |  5 ++++-
 5 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc-card.h b/include/sound/soc-card.h
index 1f1e7d45f553..c392e6c4844b 100644
--- a/include/sound/soc-card.h
+++ b/include/sound/soc-card.h
@@ -44,7 +44,7 @@ int snd_soc_card_resume_post(struct snd_soc_card *card);
 
 int snd_soc_card_probe(struct snd_soc_card *card);
 int snd_soc_card_late_probe(struct snd_soc_card *card);
-void snd_soc_card_fixup_controls(struct snd_soc_card *card);
+int snd_soc_card_fixup_controls(struct snd_soc_card *card);
 int snd_soc_card_remove(struct snd_soc_card *card);
 
 void snd_soc_card_set_topology_name(struct snd_soc_card *card, const char *preifx);
diff --git a/include/sound/soc.h b/include/sound/soc.h
index f356b553227d..d638fc69925c 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1005,7 +1005,7 @@ struct snd_soc_card {
 
 	int (*probe)(struct snd_soc_card *card);
 	int (*late_probe)(struct snd_soc_card *card);
-	void (*fixup_controls)(struct snd_soc_card *card);
+	int (*fixup_controls)(struct snd_soc_card *card);
 	int (*remove)(struct snd_soc_card *card);
 
 	/* the pre and post PM functions are used to do any PM work before and
diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 75c90d1d165f..14890af97706 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -1280,7 +1280,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 	},
 };
 
-static void mt8188_fixup_controls(struct snd_soc_card *card)
+static int mt8188_fixup_controls(struct snd_soc_card *card)
 {
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
 	struct mtk_platform_card_data *card_data = soc_card_data->card_data;
@@ -1302,6 +1302,8 @@ static void mt8188_fixup_controls(struct snd_soc_card *card)
 		else
 			dev_warn(card->dev, "Cannot find ctl : Headphone Switch\n");
 	}
+
+	return 0;
 }
 
 static struct snd_soc_card mt8188_mt6359_soc_card = {
diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 282d666dae9e..e4d81329cde3 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -184,10 +184,16 @@ int snd_soc_card_late_probe(struct snd_soc_card *card)
 	return 0;
 }
 
-void snd_soc_card_fixup_controls(struct snd_soc_card *card)
+int snd_soc_card_fixup_controls(struct snd_soc_card *card)
 {
-	if (card->fixup_controls)
-		card->fixup_controls(card);
+	if (card->fixup_controls) {
+		int ret = card->fixup_controls(card);
+
+		if (ret < 0)
+			return soc_card_ret(card, ret);
+	}
+
+	return 0;
 }
 
 int snd_soc_card_remove(struct snd_soc_card *card)
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 06167a198591..2092373698db 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2109,7 +2109,10 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 		if (ret < 0)
 			goto probe_end;
 	}
-	snd_soc_card_fixup_controls(card);
+
+	ret = snd_soc_card_fixup_controls(card);
+	if (ret < 0)
+		goto probe_end;
 
 	ret = snd_card_register(card->snd_card);
 	if (ret < 0) {

-- 
2.55.0


