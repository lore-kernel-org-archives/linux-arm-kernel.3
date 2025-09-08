Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F48CCAC586
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GXLcNSM3ychZCxZIN4Cp4NC04/o4PrChSZkGJhWTGXk=; b=XEUi56oOu8CuAZQ4QeDZMNWLsc
	8+HgnETo6snKNt/DAbH7/NBy9c/OAol+bJ0HGA4GIuJ+U0gvXv85WTWHpNDU6mE9Pvlx3CB7NbjND
	WaVzyRNu8urQ3HmNGGNTRS143gL12mvEbGuF5dYybV56j1X73eudMuDT+7yp+LML3zUHXPXmhFG4A
	Zhq5PgotM8R4JPgv5lU9t4/c595TwZAb7zmq2/MYyEesTD1XFVnM0kwubpUCpQtHmyOyDQdpY5tl8
	VJFVmalMR/OYG+FjDlFXiqLGAVYci3vzy6R2Ef76NABaJfgy5cOPaNSTymVeUjLPgbB7AsNeR/sh9
	0rSGll8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvb7F-0000000H3oM-15VG;
	Mon, 08 Sep 2025 12:37:01 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uva8p-0000000GhCb-3mkM;
	Mon, 08 Sep 2025 11:34:37 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45cb5e5e71eso21172245e9.2;
        Mon, 08 Sep 2025 04:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757331274; x=1757936074; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GXLcNSM3ychZCxZIN4Cp4NC04/o4PrChSZkGJhWTGXk=;
        b=aD2X+7H3p1wc9yFx/ph31Jbc+IIANHJ2ELueckeIg41zs+q5QRXVu2rJM1iDQp4DOo
         TuOb/UX72G3JJEQsup+KG2AFSCgCdrJggWiPko3OGblOUOlGueHXa1kdgsoVbeZyHmBz
         23+D/3md+JUF44fIITgn9XDOEPCu2/2zOOG85YMHvNMq94jkHidEi8oTJ23O2uMQ+pR0
         Wa5FAM/HNeCesqm5+nsfCwSKlUWkQfbMGdKh8laxlRHxZhdaBhVlhX5zYi0/I52MUvQG
         0EdKFWX7/oI+bHOBPEqNIBK/krMLL9XnFUyO2o1V8TUOj6JfKZJrvUOSOw8WyFd+ecgr
         t9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757331274; x=1757936074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GXLcNSM3ychZCxZIN4Cp4NC04/o4PrChSZkGJhWTGXk=;
        b=LpTIglphf0dBeeLtpkJ/Vvy2qO68qG3K+IPs6Zp+vJjHVtPhjfZhUcNEvS/dVNVv56
         HXRTgAuGz2TAHigu00pkYyiqKOVVgBe2QxBm5pV/653wujfqllbGqvBuRqxPAQ2gOdOq
         x5sWhNN98s94EymD8vlIb04fyOSeK2hA4IkPWnNCAQdy1FsZMSiKBKI+BGbZv4AQSthf
         I3f9T8EQVS1VCUP2l58ScWI4FSpPWOjS6qirQi/vC2O3AL2ublq+2ZRaJhTUHzxF3UGR
         cl9GwHDPhyEwZfJRm/96hCAKU0dvaJsO+4mXiJDyyrgJ/+lN2fTfJTfQa0186KJOWciL
         3llg==
X-Forwarded-Encrypted: i=1; AJvYcCUFaRpDXXItnDmSJ4kmv05ncxNe+vaHu6LufaL4W5GNhf5UOhpiM2L/liZJPc22ya0lmEpZx39Hw4gvjonEL0c=@lists.infradead.org, AJvYcCUlLuQX8l/7btDwqCbwSEcalK8pvOPWk0Dlld8I3F86Ng7dwTUjtPgmkUTcLJahzbhN+c7hUhnh3T++pMnqbUuE@lists.infradead.org
X-Gm-Message-State: AOJu0YyZfkGRNaIk/niEwB07Aog+BrXyqGOKikVqD+wclTxqfp0XMvLZ
	8HsefjEZjnv+xHmBl36HwxikHgdCJ1RUGCzKgUGkOrYWZc3kfwV4Vtmn
X-Gm-Gg: ASbGncu8VaRbgjFA/cKc9u+TsLdvyLet9yHt7pA6rFC89u8wT8uz8ZBYAj47vQJ2fBh
	rkYA4pFFO40fa0/quKW9KRC6Pj5F+O1iA20nCJc2XSiZvUbQ2VPqdlWnDHHYvm5Sfco3t4QJ4kd
	FYBupvpnJQPgxvcfU5PScItyekNWSo/V28A7TYD4yZ0HrHwlbcAn0wcoUQMW7Yng322tGtUFPUA
	Nj1rwQG4/eX2MhSi4H8BE7g4M27cQDwEAR7/Ks9wyDQc7/kAHuZZgTNDBbmOjsNCkVhbJNZKBgt
	SvwgDj2LrkZqfgeZbibBLLdNtFor+5lcDcDiVkjfWCFrOwKyCa0q2wHH38HluGuDSbdnz6YVcI9
	RmV1jllhgvDPs8fAySmqwgh4jEVUnH1gJ1zQeOG9pxfj8XY/RQnMtFF+KYx81bosAnWoG6p+7Eh
	03gVwe/A==
X-Google-Smtp-Source: AGHT+IE65v8+Ze9QoGiKEzVRs4PA/d6RSnFM8u9pykGyKL2SGyoWipwe/h1BnWw8QIYeMI70RMST6A==
X-Received: by 2002:a05:600c:4708:b0:45b:7782:b4a3 with SMTP id 5b1f17b1804b1-45ddde8289amr62827505e9.14.1757331273790;
        Mon, 08 Sep 2025 04:34:33 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45de18f4824sm84683505e9.10.2025.09.08.04.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 04:34:33 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] pinctrl: airoha: fix wrong PHY LED mux value for LED1 GPIO46
Date: Mon,  8 Sep 2025 13:34:24 +0200
Message-ID: <20250908113425.31002-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_043435_940399_48D9803E 
X-CRM114-Status: GOOD (  13.32  )
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

In all the MUX value for LED1 GPIO46 there is a Copy-Paste error where
the MUX value is set to LED0_MODE_MASK instead of LED1_MODE_MASK.

This wasn't notice as there were no board that made use of the
secondary PHY LED but looking at the internal Documentation the actual
value should be LED1_MODE_MASK similar to the other GPIO entry.

Fix the wrong value to apply the correct MUX configuration.

Cc: stable@vger.kernel.org
Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 5d84a778683d..f7f8fd2f35fc 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -1752,8 +1752,8 @@ static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN3_LED0_MODE_MASK,
-			GPIO_LAN3_LED0_MODE_MASK
+			GPIO_LAN3_LED1_MODE_MASK,
+			GPIO_LAN3_LED1_MODE_MASK
 		},
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
@@ -1816,8 +1816,8 @@ static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN3_LED0_MODE_MASK,
-			GPIO_LAN3_LED0_MODE_MASK
+			GPIO_LAN3_LED1_MODE_MASK,
+			GPIO_LAN3_LED1_MODE_MASK
 		},
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
@@ -1880,8 +1880,8 @@ static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN3_LED0_MODE_MASK,
-			GPIO_LAN3_LED0_MODE_MASK
+			GPIO_LAN3_LED1_MODE_MASK,
+			GPIO_LAN3_LED1_MODE_MASK
 		},
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
@@ -1944,8 +1944,8 @@ static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_2ND_I2C_MODE,
-			GPIO_LAN3_LED0_MODE_MASK,
-			GPIO_LAN3_LED0_MODE_MASK
+			GPIO_LAN3_LED1_MODE_MASK,
+			GPIO_LAN3_LED1_MODE_MASK
 		},
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
-- 
2.51.0


