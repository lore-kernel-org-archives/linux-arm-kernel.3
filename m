Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10600606A338
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 16:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=osBZxHCa;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RGmYFh03
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=M1SoM7Xac7RXZwO+FnicXP4wRxU5w10jY+RMIW4NnkA=; b=osBZxHCaKo1LEw
	cw31maiS5gaHzanojEcp17NfY8q3bLQWiuDJtjknpwFYgwr5oj0rO6yTrBePLEgXpNsM9HO4yM9Xd
	wuFxcPF4H+s704vCyTYHC1M2NMJYLmrX/n4qin3iBBKiEm7enaKCEwWYECtVwd2X/CoYbgDhWxxCP
	gqx0iLy4kCBZY3HBO8UyoBkIJfUJObXBxUlPpuhtueiAWvDuvjmZJBRWg8O8cHTL15FLyzlhCvHjj
	OgwliKDpCfUIE8uaeE3MgT3zii4bhSV9P+WcDqsYu5/oI7brVQGMbi1OUSpRAP8vA5XNJ5/cv5TDr
	b3QSf4ewWfdC1rXpsbWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpXH-0000000C8Cs-3zQk;
	Fri, 30 Oct 2026 16:32:59 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpX8-0000000C88L-47iQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 16:32:53 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso9715125e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793377969; x=1793982769; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M1SoM7Xac7RXZwO+FnicXP4wRxU5w10jY+RMIW4NnkA=;
        b=RGmYFh0370HhfZZ5rhzNx6hcIPYYDQxYKJr0NVkHCPpFatohS5DrW0HqLf2VaKqgjk
         mNFbdcQJ2Nd4o+ACGy3uU06VXMoZWi7jw03HzLBFbPjSASjgcNsB5KV219IdWhirViPy
         V1KFRSmJvRb3WvOJPSaHne2fiXwR6dEX6t7Sev1kN/a/23GImJOu0BXSIgqS6fVlX+OF
         xRr2yZfy/ggc7EQsHSVgaYE1kM8/1mDLxpSzuu3ZZ/raME3yOqPeCEyoKfZ37TqbrpyI
         j/0WDLE5/+O2VqEzU5zRuYAMHIuKqjPO84AJrh/aBC0+wmGQV+ZYERxvjTjjdLhp4NNQ
         6Edw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377969; x=1793982769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1SoM7Xac7RXZwO+FnicXP4wRxU5w10jY+RMIW4NnkA=;
        b=Yh2Akl7Hsji9rBqCl2puTZIBdj3+CjuNqypdXMgR0cOhZmJvMoKnRTvBdc9B6T3agE
         ha9Fn1rPLV9M4YbwDO9P7ft7ZF2cDPYWE9AZ7w9Np1F4wMIy5gE0fehJjGzGHq4UXx3Y
         wJWJQWSmDsVRFEouzsOv6zqbHrwbAmxAUjvib++7apJ98WwRAaHFZFwDtG7plK48cJUi
         Hvf4wMqZPo5lJ2MzW83Ll2uzpgOxUTl3n599M7rlgixJaI3ikEGyhoZlx9frZIwcMypn
         ZEoo4aPETTW/7LyvBfobgZUgR+Rgd11dAGB03FXr0QX9Yt0WJgW5jnF6ZwJSUin/SigA
         QCSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtFxxrgt3W+AuAm/VuGuXrbo7llCb+iyPo7ftpAFpqSbW2WQLzpTHktPEWHo6qSv0aWU6E5m1gMQptZqT8qChN@lists.infradead.org
X-Gm-Message-State: AFq9FYJhud7eCeAqiwpycGBXycdBKeW6dSrqedBJhEn3xebYJuiKc+Ex
	T5X9qC2E9H+gVxwSnEa9I4v3VZmj2WIGHRTkEqSVXWBL4TdVbzmBwuTwcjhBO0Bz/cY=
X-Gm-Gg: AYBFou3ltiVTy93yK4o69BoQXT+H2ifBIOUCgmX/M4waJYhdzFNFMgyKFC8X3bn5gVd
	LG7Ps9umqsm/lLy2FpijpHS8vuZFVXejXmLQObxuAd1nLGJpQ4ssj9EACjc6qQidQG1H3j45w1H
	6lWIWXrfjpw5zS8RkI8aFDhtgz2do5kb6YpYc5h0medi+MaPZ9FurondGfrRZjuXrQxMuLotodH
	uoRXKAQc2RR2iS50f6nBDqWqdoNlevmdIZTINx21+kKLlcSR8yPNOWJcm+jYgteB7w4y3ujcsH0
	yJ/8bWfmT/ZapYhGMe1VEgXyZeJv06gwWn6bvYX0VS1Gh7pXeGwhdzBETMVt4zwClQkFS/gS+CO
	p2l74IT7RtSprF9lYX+4dWlxxgo1//yqgdNGIpBOgVbG5DBboKuIrs5li8ZeMFN7aI9eMmxFyjb
	f23pTpV2+rhGmzVKU10XX6+unK16/ezMl7G3y5+MMd/Gjg27c6uhK7KenoahChSvU6FA/4+rae+
	5H2dNzEKVSkeoNzsCZgliKZkJhEZtBMoRCiXrQQa5sq6mBXDTyqNDJZ1lz2ZH8HfKgMCx/+OWny
	iGayQMRTLNBowlUkvehVMGGkvZ0bp8aTStkZ8IMTl4K1gcIN
X-Received: by 2002:a05:600c:46ce:b0:4a6:7d6:821f with SMTP id 5b1f17b1804b1-4ac189928e9mr64716115e9.29.1793377968735;
        Fri, 30 Oct 2026 09:32:48 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm45130975e9.0.2026.10.30.09.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:32:48 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 30 Oct 2026 17:29:53 +0100
Subject: [PATCH 1/2] ASoC: meson: card: leave the device drvdata to the
 ASoC card
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-meson-card-register-fixup-v1-1-6474985e94f6@baylibre.com>
References: <20261030-meson-card-register-fixup-v1-0-6474985e94f6@baylibre.com>
In-Reply-To: <20261030-meson-card-register-fixup-v1-0-6474985e94f6@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1398; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0RFe1Fr3NaxVtejZemaL7j5wb6r/Qt9kPR04MlhQsks=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlPjq2bcGOyzGlzq7QHs65mvjjvKLVt7V/Jc+saPA+rS
 /KVXHh/uqOUhUGMi0FWTJGlhrta/J2k1pdZ03Vuw8xhZQIZwsDFKQAT+XKckeHfCw+1YwYd73yc
 ly6uTff6EMXxOD9pR6zZ/iXVhyIet/gwMsxx9l7/94VQvvGk7R2Kpz7UKYtXr1U+sp9nDpOxd6b
 6CwYA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_093251_076881_38C84C44 
X-CRM114-Status: GOOD (  15.24  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

snd_soc_register_card() sets the device drvdata to the card, so
meson_card_remove() gets the card, not the meson_card it expects. The
card is not the first member of meson_card, so the links are read from
the wrong place and remove() crashes on unbind or rmmod.

Get priv from the card and drop the platform_set_drvdata() call that
the card registration overrides.

Fixes: aa9c3b7273a5 ("ASoC: meson: axg: extract sound card utils")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/meson-card-utils.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index f2796dc84fa5..3cdc73b3fe8b 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -276,7 +276,6 @@ int meson_card_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	platform_set_drvdata(pdev, priv);
 	snd_soc_card_set_drvdata(&priv->card, priv);
 
 	priv->card.owner = THIS_MODULE;
@@ -324,7 +323,8 @@ EXPORT_SYMBOL_GPL(meson_card_probe);
 
 void meson_card_remove(struct platform_device *pdev)
 {
-	struct meson_card *priv = platform_get_drvdata(pdev);
+	struct snd_soc_card *card = platform_get_drvdata(pdev);
+	struct meson_card *priv = snd_soc_card_get_drvdata(card);
 
 	meson_card_clean_references(priv);
 }

-- 
2.53.0


