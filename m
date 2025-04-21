Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840FDC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 20:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQ3M+bxooYYic4r0LufR96nrU2z3BmGWMkGOU6zDDn4=; b=vGmu0LVC9qKZpmJ0LXFfJfyDY0
	BU/qO7yqVI34D17p0TSiDphSSLV9h9CHEVE17wLepaATK7hy7vlnzqafJ0XpQj9yLBimmyDx1XSto
	kR8DnEdwXsvKmlB1mvCO61XOD9jRfk5egzOlPuPpeuGedSVc7fvKH5QTDmy7VnVqpdCGqmraS+lq4
	KLbykBr1Dl3AaCgKRl3bT8TeJ7A8Eiubuugw007AJY3F8l4rcCjVYGyY1iG3ftrvcO3VOJWQ9Gvr+
	aKT5y2EhNuxwPh79U1JXjOsIRsmrf5+DuxOmbact3AtfPbCLMqoDjlRkYObTs22B33g9rIacjaOEB
	VdBa24eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6xZk-0000000555G-1Sgp;
	Mon, 21 Apr 2025 20:17:08 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6xW3-000000054cu-0i3j;
	Mon, 21 Apr 2025 20:13:20 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso6420089a12.0;
        Mon, 21 Apr 2025 13:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1745266397; x=1745871197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQ3M+bxooYYic4r0LufR96nrU2z3BmGWMkGOU6zDDn4=;
        b=OFsv5z17qIJvVElahsdtpE2hqS9d977BUH0gmnSsKRZayjjmYnEYPHYfezi7pH+oFW
         D4/IPhb4SjcJp3C8fMQj41UcqwzzqYuxm+/8sxCiMz8ZmqVzQp+XyFfedsmazsFDRuUp
         5ccOlKrfUUel6ZhliaOLcZ4GsTI3ApSmNf3JuaLLz0LNN6cuPKCRtNWqkaRqErvS0ygn
         sa3quEqfBhGU3VTwpe3D3IJavlVlMSXs7tdY1IWQpaoc/jNg8NTFtltPYcU/x/2jsTNz
         NfHfckIfRYwAzZPTTE8AgcJvZg8OB8BRHtsi7GdI0/c8vkeQ9waEzf6K5SQN2r+1siyN
         I82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745266397; x=1745871197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQ3M+bxooYYic4r0LufR96nrU2z3BmGWMkGOU6zDDn4=;
        b=HJecxt39PpoJmJptTha559rtumeSiYdGpkw3GWWPWSRELiclsdF9LjlgwlZWx+x0CQ
         c6dZ6YFIs3Wez1L2VBQ/dqHI/gyYxexsUj0BU8aWmQOWIQbOg9dCxUhB2Fu6xLGDFZyo
         OZ3Fz9aAcvhUewI1eKQy4qMaBphhn/RNW0AjZt0xk2ixoXki+6XdILQdpmDQjgnUII96
         yIywju1He9PJRxM4Mb8VirJFYbtE8blYe+mo+jVNASFizLggrYUu18gy2xZufE7mUT+4
         lZgmwGEXiwVxXNkpeIWIY1RX02CotY2eORKc0oaWm0jz7u05ESN9hL5eRClg3/+485jS
         af5A==
X-Forwarded-Encrypted: i=1; AJvYcCUQRI/ko3YOVgTkHw0PRMRpT57HtXf0zZgxnB+squNMDraNNeb5mIPB54w5I3Hp2hrZil8ZNhTgB7UEdAi8@lists.infradead.org, AJvYcCXR9bIj1NnZUtSC8ot0h/+FR4ljNSW+teioFEUr8ABaDgnF5Kkk2qCo54UminfgDXlWBX8wrIA1fz+JL6I9QsVPTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywqo6htbQdcnQVbQ9WMmxUs2kHBGhsrLaygfw8Yaf1vDF92rVX6
	zH52levZ+QfnyaYeXrIAdaMKI+bzIT1uRsX0EkNBHBhhhXO01LI+/wFAHg==
X-Gm-Gg: ASbGncv9qzkyZIIfPoIRjugEWE41Fvww6JOI/WwTUvMsJemV8j28dtUhyUwYR/fk3t6
	yxgzYqh2iuoAcqN2ktxoaVyBuFzcUSJcNsIwWlaFsGWkZNwAgPzUETik4P4hmiFvxyWV6yCcL2z
	4UiB3noWk5mLppbHQhuGV/t704WUsUH9FRR4CvBAt/SG3djiGd2VC7qyKUIOh3kXRVLrLkdBeZm
	5JHlb3/P8STeWvJ6hYHMedjUKOvPy6nWNA7OoSaAmfqbsTH//4r1IojkaskvXsTFXLg1YE1D0Gz
	QcS7S/JwGOd3u8b+r4VvwG58eoViCA7/dzmV76CHSHGVV2IepNZ+ODpVQf+1P/jGhTDe9YTNgus
	Hv5atTZ7HdhxIGQNUlpJyU7RvPP3Mu+Q0utSaKnAj4+uXhkSIeF/gYvu2i5xJ6OEK+XEe2VgTVY
	na
X-Google-Smtp-Source: AGHT+IEaYd+jxjizAP2cVKjHkYaRIFui46Kp2EDtjubhkBoNX1u0J2KrystqnAigLWaQ0WwVYnx50w==
X-Received: by 2002:a50:ab11:0:b0:5f6:44de:d977 with SMTP id 4fb4d7f45d1cf-5f644dee040mr5106066a12.1.1745266397171;
        Mon, 21 Apr 2025 13:13:17 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a503-5900-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:a503:5900::e63])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5f62557a547sm4955447a12.22.2025.04.21.13.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 13:13:15 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org
Cc: neil.armstrong@linaro.org,
	christianshewitt@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH RFC v2 1/2] Revert "drm/meson: vclk: fix calculation of 59.94 fractional rates"
Date: Mon, 21 Apr 2025 22:12:59 +0200
Message-ID: <20250421201300.778955-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250421201300.778955-1-martin.blumenstingl@googlemail.com>
References: <20250421201300.778955-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_131319_206968_85238BDD 
X-CRM114-Status: GOOD (  12.65  )
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

From: Christian Hewitt <christianshewitt@gmail.com>

This reverts commit bfbc68e.

The patch does permit the offending YUV420 @ 59.94 phy_freq and
vclk_freq mode to match in calculations. It also results in all
fractional rates being unavailable for use. This was unintended
and requires the patch to be reverted.

Fixes: bfbc68e4d869 ("drm/meson: vclk: fix calculation of 59.94 fractional rates")
Cc: <stable@vger.kernel.org>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpu/drm/meson/meson_vclk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index 2a942dc6a6dc..2a82119eb58e 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -790,13 +790,13 @@ meson_vclk_vic_supported_freq(struct meson_drm *priv, unsigned int phy_freq,
 				 FREQ_1000_1001(params[i].pixel_freq));
 		DRM_DEBUG_DRIVER("i = %d phy_freq = %d alt = %d\n",
 				 i, params[i].phy_freq,
-				 FREQ_1000_1001(params[i].phy_freq/1000)*1000);
+				 FREQ_1000_1001(params[i].phy_freq/10)*10);
 		/* Match strict frequency */
 		if (phy_freq == params[i].phy_freq &&
 		    vclk_freq == params[i].vclk_freq)
 			return MODE_OK;
 		/* Match 1000/1001 variant */
-		if (phy_freq == (FREQ_1000_1001(params[i].phy_freq/1000)*1000) &&
+		if (phy_freq == (FREQ_1000_1001(params[i].phy_freq/10)*10) &&
 		    vclk_freq == FREQ_1000_1001(params[i].vclk_freq))
 			return MODE_OK;
 	}
@@ -1070,7 +1070,7 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
 
 	for (freq = 0 ; params[freq].pixel_freq ; ++freq) {
 		if ((phy_freq == params[freq].phy_freq ||
-		     phy_freq == FREQ_1000_1001(params[freq].phy_freq/1000)*1000) &&
+		     phy_freq == FREQ_1000_1001(params[freq].phy_freq/10)*10) &&
 		    (vclk_freq == params[freq].vclk_freq ||
 		     vclk_freq == FREQ_1000_1001(params[freq].vclk_freq))) {
 			if (vclk_freq != params[freq].vclk_freq)
-- 
2.49.0


