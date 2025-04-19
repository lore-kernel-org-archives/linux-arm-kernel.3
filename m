Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02260C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 21:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wxYKThiSP5CpC8ECIauIBDHNEvnQh43dWazKFIWJZDU=; b=XTKUaKVA8loMNdnSovPfHSx10n
	eXzavga1zUxzwq5XQYdYWv3qcDUSfN8R2CAczPEZFmaEeCmJTPm2LM41KhSik11SR9EF2cCgkTd+d
	aGom9mUDn3+0oBe2lj+rdx8SnmHX7QkXltK1usncogn/UMye8qxyWTrrcBUY9RYhMDq9ssFTuii2N
	4AQyH6KTdn2rc1b/gVp2bi7P8A0B7HSoxc+eNnsL62Seo7CfMdeEjbyAMzArKgiKQjKsGDmFfDaC3
	O1DMeQYx7F2bK7PYljXb19Dw8piKrBH7cMlbNcr0NyrKWx3tczt/Ex2e3ww4bF89UeqIQ7WfB8L+5
	EZlWC5Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Frs-00000001qAS-2t82;
	Sat, 19 Apr 2025 21:36:56 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Fpx-00000001psg-2iIW;
	Sat, 19 Apr 2025 21:34:58 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5f4b7211badso4191875a12.2;
        Sat, 19 Apr 2025 14:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1745098496; x=1745703296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wxYKThiSP5CpC8ECIauIBDHNEvnQh43dWazKFIWJZDU=;
        b=fKnz6XvrmQcMnjKQZL3mxXk5zMFEkZO65vHRRBmZBRSbWIPaKQpTU3OPjBbQjWEgUx
         3xtfgXZQvuKwxgceTnsW4t/2aRgtTBN4xI1xrC9X01Q4glpAmSveTZEUdD6c2MGYxEhU
         Q3gh44hBRd1TEAUptTvVNGypo7CNw6WJ9wZNrJA1vS9cWmphqI8aJDrz0OC6BeQV6q7r
         MnV09apD/9Fgo7sA8q/8QZVGVtVbTC/ScaqRYhkathl1rdSfhkbd1Jpu1bczRhTkvzGM
         XgATd0tkOyksJF6drmzixtLWdURuD2/PSuOfZyIzXirL+yQ8/7RL5EYZijRhm0PoaUGH
         Kc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745098496; x=1745703296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wxYKThiSP5CpC8ECIauIBDHNEvnQh43dWazKFIWJZDU=;
        b=NDBtq4ZZaFM80HSVKV/dfNtYBCr4SzV01im/5cXeWnTzXWmH+pki1WFhdOXM430SNJ
         7/8JaQwIY6JWF2SuACxiv5V+X+LwVB5UrvYOTrEwZmFbQQqLKvCyKxxb3s/3w4otneev
         jTdi/fBQFzOehKWw3xIUfiI3gHJ2DQ+y0OQtQIWQh6hpInrlSJXF8SHWmMagAL4I3x/F
         VonshtoqgPvUZ7Uh6Dwg3GBQ+tOH7h0sKY592rDLuD4hk8QbQr2pEDzKBvD/G/BwQuVT
         NCJRSh/S/FGYu1ZW0v03ECC+sZAevqhtYtUW8UlgX+jZcZU2GjtfzdHvHybpFNHZRTSm
         s+ew==
X-Forwarded-Encrypted: i=1; AJvYcCU5pDDUVkgg7U4FpZQP8m7dqeFhmFTDMB+YLUi5RagI2xk/zPKFt/bX1oJqF+0JsADqhZPTgtNoT8t2tp5Y@lists.infradead.org, AJvYcCWSzSV8DttaGLK33VQJS0XJSw6KabjUDNHIsNi1vVB5OttLj5zCHiFKkBCei1juJ+HEP8JIApfsL6GX7u5wIvet3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YycGLSWTn6Y5VBDWwXoLWn3B/dT9eBJGNoyQJx10gSOYRo/n+2E
	fXjIeaWC4q5rPQOWZsnQhm3WnfdVLNOQvaBt0CT2X1VXp7uWQRCH
X-Gm-Gg: ASbGncvX/9UXb0BQOoLf0NdFC/FI/+dHRE4ciJXwVSPWaTgUn0fKGpxx0P+xTjuWBJ6
	tiGM13S8sBBpT0Pim8YKf3hkm9iX40ffjU3vSonOVW5KZXEiD/q++peb4dnueX1t+nSUOwB09n1
	7nA3FlWBy/Yes5QakSQ9xyO14GW6gmGDO/naSDhDES03Pw6cb1UOrTvyWoOKX5RGBfCynrVosTL
	3HO3h3wDQ0bBpUaYo55YHL+sUB8+Q3R2rx+sicYSqslrDlsM6WCO12FgCT73Z1M4MxubOpBEn5U
	V63+SDppS3fTigJwIP9rpfCPfORjQkuOvcehl962nLNQjMJEOb0hqOs9OhFG4Xx/KiSUPGM/dFE
	5aAWIDwVHcQaNTcJ4wDa5WHRREdi0KC8DoBHcN86C7g+dqaVklwp7johy/1elYbeJaA==
X-Google-Smtp-Source: AGHT+IFu9MAPI6bhOcadFv7sdrdXp++L30ws8oMOqAOpHPkw1HcqkypIEaEE/ckknmH+OoGsiLtYkw==
X-Received: by 2002:a05:6402:5204:b0:5e5:edf8:88f2 with SMTP id 4fb4d7f45d1cf-5f628603ad4mr4778873a12.23.1745098495728;
        Sat, 19 Apr 2025 14:34:55 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b1ff-f000-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:b1ff:f000::e63])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5f625852a55sm2660022a12.66.2025.04.19.14.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 14:34:54 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: jbrunet@baylibre.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ASoC: meson: meson-card-utils: use of_property_present() for DT parsing
Date: Sat, 19 Apr 2025 23:34:48 +0200
Message-ID: <20250419213448.59647-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_143457_687512_8350090B 
X-CRM114-Status: GOOD (  15.02  )
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

Commit c141ecc3cecd ("of: Warn when of_property_read_bool() is used on
non-boolean properties") added a warning when trying to parse a property
with a value (boolean properties are defined as: absent = false, present
without any value = true). This causes a warning from meson-card-utils.

meson-card-utils needs to know about the existence of the
"audio-routing" and/or "audio-widgets" properties in order to properly
parse them. Switch to of_property_present() in order to silence the
following warning messages during boot:
  OF: /sound: Read of boolean property 'audio-routing' with a value.
  OF: /sound: Read of boolean property 'audio-widgets' with a value.

Fixes: 7864a79f37b5 ("ASoC: meson: add axg sound card support")
Tested-by: Christian Hewitt <christianshewitt@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 sound/soc/meson/meson-card-utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index cfc7f6e41ab5..68531183fb60 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -231,7 +231,7 @@ static int meson_card_parse_of_optional(struct snd_soc_card *card,
 						    const char *p))
 {
 	/* If property is not provided, don't fail ... */
-	if (!of_property_read_bool(card->dev->of_node, propname))
+	if (!of_property_present(card->dev->of_node, propname))
 		return 0;
 
 	/* ... but do fail if it is provided and the parsing fails */
-- 
2.49.0


