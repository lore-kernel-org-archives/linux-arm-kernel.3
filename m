Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3202606D80F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qdTF3i1/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=HOlF8LGk;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gPeIAGjP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DkVqZCyEHTkw0fLy5AgelSQiyen6kTUwAZLAvdHj+5g=; b=qdTF3i1/d8eKpl
	pG8NORXj9nHVF6FG52+8GT4bc6bK46CN8vKhNs5MTuhTSngZFJ9VmqWVWM1OEDTs6amAq8J+E4vAj
	M5awZFag1T4nUA+yqkQRmUjPzY3gZV+O/mmIPjRjxBIopZu/bPyfYhT0YTButnnf3aL0gM5zD6wNb
	UiBQt5Rg0V2iKPlUevCA5ZjkdXNn9ZVDQFpdjMRwEu2xQbIPiqJx1bQDQ7RkzUEq1oBKTGaojYjPD
	omEaXG5kjkOSOgxZv68DnH9NOXZrlg/KSin5U7gotRqXpWQti26PG38xzjfF0H8kAFYL6eXrK160V
	udrJVU8tckORN2ucIfpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO99P-00000001Myo-2xAn;
	Tue, 03 Nov 2026 07:41:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO993-00000001MXJ-10ql
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 03 Nov 2026 07:41:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=DkVqZCyEHTkw0fLy5AgelSQiyen6kTUwAZLAvdHj+5g=; b=HOlF8LGk+OYKXpaoUfLalzZSgJ
	ZVEbPjhBDHfYUFdeUHtl8/90t3rDIrULwdLOgBFGnvE+kzr59xu9lnYgvqoJINJAN02Zmczde9i5N
	XSS1LF0MuAyfLXWtOAgAMLaYhc6cJB9XpkPB5srwdIK1NEQDwXqA3EZP/NntC2lGBPo2XVLhEaDpN
	elywwMxQ2ENHCv/ED1NXoSsIruJzUK3rPdpZ5qDYoeFRSvocxcjnO6GLC4WyKk9+llyyH2lhM6UQa
	L+N0kvFIObHtEgy2md7r+k0sP3ONx4V9Tqc0Ok0ZT3ALOSUYM6xnIHXm1JlGqEPzsU3arPLSqYzS9
	rKd/MlzA==;
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO990-000000007WS-2PXx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 07:41:24 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso1866944a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 23:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691679; x=1794296479; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DkVqZCyEHTkw0fLy5AgelSQiyen6kTUwAZLAvdHj+5g=;
        b=gPeIAGjPNZkmnuwoVH7TiINTaT44PYQzFxfUehhDivd6AduJojMPmyfrz6urq6MpLB
         GGYxAXn6U7ykpNP+M+xiSe6Ot7C9rKtDJNa47pdT1T5u2py6k1wzjbrcxjEHrHIrm2EA
         YLV+JFAa5Wa9hUXLufwFVRL0uEUrSX+cVOEbV/Dlfpx419z7/rQ2akkdlQpTa4zegY4P
         3h0kOUoE7JFXyaK+Dijj+p2lIG40E5z8bWSCuOXNl91KTCGoJuBmotwZIXPYnhpqZMTp
         3LbmCB1dp8c0XXx2230PpnjikVQubL3joQKweLdJ0fGbP/FpcUjkVXcikeYputqq5sYh
         oTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691679; x=1794296479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DkVqZCyEHTkw0fLy5AgelSQiyen6kTUwAZLAvdHj+5g=;
        b=jHv8EiuptOrbcsBN9DlcQr5q1VP2kpkNrq/xNpS8cvxKyPizQg6EHlD7G2jQHHBigI
         T2jLINw9XOmpZjaPUlHpd8Rb5BVxWjvnrU8QKwjc/b0LMpONSQhLZtJII5mOjkYiglMb
         NapW+DTXJybaq2md0LUPb4oHgOhder+OCvMvn5QGFG/QoU349bf7h/cKbkn86NP7rsjk
         Z5gcinKKJcntQFrJGKT7car3g9TKBsGKJ5861FRaXfaZeFNns4JdbKSKIVc8suD/HSiP
         YDnbMrkbwuwH+zoTQ+MvbWgXs6BXkOqupxJPL39ZFYGvWlcijkKwXEgUjgXCePn4VNVG
         aoQQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5cJKMnlETaWvBBEmoJd5aw5oaEX0rH5Wr6AcPDXB+9h6miWFGg2rGfT6JlU/jr5FflAhCwqNyvm6Unypc4z8V@lists.infradead.org
X-Gm-Message-State: APuU4Z/ccgN6oYo81V0q0uL+uY5tQfWALEeZBc15lJj48Ded8PohNh/N
	3hm87ZhxExCeTTsqVEMPhSZXtORbH1NQ0KkAD4HmW6ug3nZDoNdtneEB
X-Gm-Gg: AYBFou0a8hvXYcM/LvA0lYPLDV9MVjCjf7n+unlEVQzxE5IP7jusf30TEJBY3x3rOrN
	VLwnm0HUl9s4+9n48NYMolaQdsfpgN/cu8LnLsR07Gklx6Z5Wi6cMu0LtLp/sc36goey0Kh+Pw4
	6w/a/qJFXfMk91ooLhaqWKIrER0530oXek755cYBSzAdYDMkfDIODKeTKXV7lXn4VeRi6fNQQwu
	CDRwb7qNIq0Ks+S/enKP5L4O3bgY1aFTt5gvp+bHeVOamVRCreDRafAxBsUeax6D2IOIHND3q6R
	yYLgcafMq5R2l/cbHIIM5XfYFnfnmLvY4WlDjc6unQmwvZxTw9JqxbQeZjJXhiCKt47GO+PdEfo
	KXR+OWnG49eW63RAah3JcuVBbF0HA1eDQo9DyU4uJsabjOVksspKJLsA+QbBweB/xwOeR27Bfyi
	jht+Xjdwlz/JWYfy+NyjGWmbw91Qp0pYdiWPHjSyAxbi7LWCBAEkRLYoXj3yx8pyL08DRYPxzkd
	//onfupy7grAWTjRx2TTJa0Ral3nmvL1sMejFXBz3cz1VfnjceK0bdzfaktyLvj1nMqW5V5HF7C
	840g6lmUL2zCloWsZlZXOi9S4i/Bbit4Q/mQLbKAq/cDxaDywqMh3Hst8zkPr9OrXhx+VVgvddr
	yIMgSvwX0U5kF31DrMieIKpLgZXkaU2pkHJUzA3T/AgKsahadkuQJexNX8ualVkjIVhHDyNZtkr
	aFvDw=
X-Received: by 2002:a17:90b:1d0a:b0:3ac:d39d:ee4f with SMTP id 98e67ed59e1d1-3ae897f6e87mr9311929a91.44.1793691679407;
        Mon, 02 Nov 2026 23:41:19 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:19 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:56 +1000
Subject: [PATCH v4 08/22] ASoC: tas2770: Add compatible for TAS5770L
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-8-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=758;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=69WolvDz8NBwzZIcSNN8FfeWXOxg6F1Zc88rX6gr6IA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8/JT/yQMm+dq82UlFMPTp/2dY06tJip9pvC6e8Tp
 nCaxhnc75jIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEy1TQbDf5dT0nnf72fPOLBj079/H7k1rpdmX7u6dl1j6XIjR4djR6oYGXqmvg1
 +8eCK2cYJOaER62doThWo8+3ycjEK+na7YN3RfVwA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_074122_552872_F24F9557 
X-CRM114-Status: GOOD (  12.58  )
X-Spam-Score: 0.1 (/)
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

TAS5770L is an Apple-specific variant of TAS2770 found in a number
of first-generation Apple Silicon Macs. Add a compatible for it.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 67ff2dd949be..57de75115450 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -987,6 +987,7 @@ MODULE_DEVICE_TABLE(i2c, tas2770_i2c_id);
 #if defined(CONFIG_OF)
 static const struct of_device_id tas2770_of_match[] = {
 	{ .compatible = "ti,tas2770" },
+	{ .compatible = "ti,tas5770l" }, /* Apple variant */
 	{},
 };
 MODULE_DEVICE_TABLE(of, tas2770_of_match);

-- 
2.56.0


