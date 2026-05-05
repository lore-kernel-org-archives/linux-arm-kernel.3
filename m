Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFB2FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ca+XUMwON/y8z0Ya9sLBgz3BNFKT0t9cdvMxmASzxGQ=; b=11O/fKGyhxMA15dCiIE6+JOQ/x
	wGSuZYRklMHYkuivgbSn96JE88jlB6d3HaMJi+Ev9zQv6hiswz353s+GLF9Evj+rSOOLXWIJWc7G7
	0UhYTVPd91XXgnWOwgxY+ciamGiIib8a3WJkNlCTtrAupSwAVdskftbENhocncpx/HJN4q0ahbQwz
	4WMN7GyeH0TyJa5CGyhuBNyZAhzjselXGUxAVcmQa9BHTQrIXWy62opA+PAxJ2fHK0tfgFfQBUcu/
	B1KPjJMPq21rXCjbarByyu2YTpTYXSpPgZqM0Mh24AIJDYkgCmYfC1p3EWoDUXXVFhVVMyOYHEshq
	wQkbimPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDCU-0000000Fuxc-0v4O;
	Tue, 05 May 2026 10:40:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDCS-0000000Fuwr-2iXS
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 10:40:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Ca+XUMwON/y8z0Ya9sLBgz3BNFKT0t9cdvMxmASzxGQ=; b=NGxANIaeKeoPFZMThlVfbw1phG
	ogRBMqqlWCWkf96WH0J1ElRm6qdYDKsZVqQQn/gIYJ2qddAsBhfncNIhf/Z07zvtrxvSo2thwtuvQ
	CGDIvMN1Ih6c1l+yYh3gNGOprNnLjSD6d8WCZLMwM/0lCwbgEUnwuevKICwg/r04lYk9cnHt/Ax/T
	z5HKeJrvCTbe9/dhbYc2+6eMouEWQdWKJ6GzkVSHovIRqRCmpikCSZJGO4qcqJ4LNfd8GfyfG618S
	fyYsqx78BYECUM+U/y0H+GjFV+DfS6RnjePU07ozoWQb226IKBVgz1QHn5WG3jax3/VsgmC/D3ZiP
	b4JB5bfg==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDCP-0000000DECr-2OXo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:40:23 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3658c87160eso30314a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 03:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777977619; x=1778582419; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ca+XUMwON/y8z0Ya9sLBgz3BNFKT0t9cdvMxmASzxGQ=;
        b=IsUMyHyFbX46oGFto2ijAIwdkPvWBl+uHLWLJsCrLWRuMWH+JlCRjws156x7TbIu5W
         d3N8vZYVhQHbzIEfh7MPcJMq3NvhFuQEZqmoJXz5VcXRnbWrP5zF8S7bX4WWt8g56bdl
         JH45ogzePsjMC+qLFvWAERFNiXP8NQCaSsznc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777977619; x=1778582419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ca+XUMwON/y8z0Ya9sLBgz3BNFKT0t9cdvMxmASzxGQ=;
        b=Jt4u4suAvvpWhTzs/YWtqcrMszG/dZEyWqhSPPhOMvPp9omb6yFbnBiYC7+bqXejo6
         MbHKwJNnb1odcad6T4X1X/hkYM5Sf9T66lQ7iGzxXldXXJIKyoLCoHoGPTR/WcO04kTg
         7ML3EppoB3mYowTryGAcG0AnqqfXxEe1nWu5f6yhYyF96AkITnC2AbCoMHQl7QEyuuX3
         YV+TqbeKNH+b1WDPVmngzibJSOCtiU7zdlEQ0rJizobzR4gg8u2XjFXjQCROfPVh4JvI
         SiiZysQldH8CPdp/yBFOr/BYBpO1Ax4u4cc+Dtw9fbV0JFLWHivQJf0yIH1xEEdQu8V+
         tkqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/1vrrA7V+qAnAQw17UhwcC9p1xKFmjtp2QjKVdvsMBz6MtHfahMSiJkcjdsnRTkbCepqx9ST3kPctARbaHugqQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyrxpWAz8eUdPK4y6bEdoAX1d9g3ZczZ8B0HiBAQ+H4hnSr3ovm
	vjY3e9oSsgCYvbUNLKXuCktjlP9hurXeWu0wSBvA4CnYlWcWNBb4prbrgIB36yKenA==
X-Gm-Gg: AeBDievNu80yi9YG+CnC74ZdJ97G59TQwCTG0abwI836MG7vNQD2mgtE4cgPZjQOEEi
	vNQd+YKGX+y0AVOaeVjtGdMCT2UEs86Lz902K4C8xDW2Mkw1QG8KO6rAu1R6qjbDBWyp7/8WTKf
	bN1LxvBN65E5/3Au7B5wINwRCUgFq2qz31TWkUu6I99cXY0cLpV5W51qMuD0Gcn0FfqDIupoE0V
	v86jaW01gMjrju4TfUz5Lj1sKSVFEYHwnW8pzj0t0MvSfDIRGXkhlX7Q3b1n3a+WZ0o03+fksx+
	0P3VOBo6Krg58LhgI83hIz9tzz23Dbqav7+9LbB2pZ0xvn7Lgq52Lv9FloQzNJiutlH2ePlHI5u
	iBinBshNvtVTwRAUR7A+ApE8ngFx5lux189pe0wqBmx1/i9RTxfrgBen0ZZLvLxvk6g4ejVA5PP
	mEWeW6qwyRHvud+4GHVBa/Zlf06jCKuicZES5pcEuojNbeGIdwVHEcA8m7uihmGeoLsPbWM4cLd
	jjrfUmpkuZrRFHP3XU=
X-Received: by 2002:a17:902:d585:b0:2b4:5e65:5d0e with SMTP id d9443c01a7336-2ba535db45fmr22307405ad.10.1777977619585;
        Tue, 05 May 2026 03:40:19 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae1e293sm141015395ad.45.2026.05.05.03.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:40:19 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] pinctrl: mediatek: paris: bypass pinctrl GPIO layer in set GPIO direction
Date: Tue,  5 May 2026 18:39:57 +0800
Message-ID: <20260505104003.1811841-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_114021_719084_7D8BBE73 
X-CRM114-Status: GOOD (  17.58  )
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

pinctrl_gpio_direction_input() / pinctrl_gpio_direction_output() take
the pinctrl mutex. This causes a gpiochip operations to need to sleep.
Worse yet, the .can_sleep field in the gpiochip is not set. This causes
the shared GPIO proxy to trip over, as it uses gpiod_cansleep() to check
whether it can use a spinlock or needs a mutex. In this case, it ends
up taking a spinlock, then calls pinctrl_gpio_direction_output(), which
takes a mutex. This causes a huge warning.

While this class of Mediatek hardware does not have separate clear/set
registers, the pinctrl context has a spinlock that is taken whenever
a register read-modify-write is done. Also, once the GPIO function is
selected / muxed in, further GPIO operations do not involve pinctrl
operations or state. The GPIO direction and level values do not require
toggling the pinmux or any other pin config options.

Switch to directly calling mtk_pinmux_gpio_set_direction() in the GPIO
set direction callbacks to avoid taking the pinctrl mutex. Drop the
.gpio_set_direction field in mtk_pmxops to signal we are no longer using
the pinctrl GPIO layer for setting the direction.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This was

    pinctrl: mediatek: paris: Directly modify registers to set GPIO direction

Changes since v1:
- Dropped .gpio_set_direction field in mtk_pmxops
- Call mtk_pinmux_gpio_set_direction() from
  mtk_gpio_direction_(output|input)()
- Updated commit subject and message
- Link to v1:
  https://lore.kernel.org/all/20260427021021.2049015-1-wenst@chromium.org/
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 6bf37d8085fa..23f04b24fd65 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -771,7 +771,6 @@ static const struct pinmux_ops mtk_pmxops = {
 	.get_function_name	= mtk_pmx_get_func_name,
 	.get_function_groups	= mtk_pmx_get_func_groups,
 	.set_mux		= mtk_pmx_set_mux,
-	.gpio_set_direction	= mtk_pinmux_gpio_set_direction,
 	.gpio_request_enable	= mtk_pinmux_gpio_request_enable,
 };
 
@@ -886,19 +885,22 @@ static int mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 
 static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 {
-	return pinctrl_gpio_direction_input(chip, gpio);
+	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
+
+	return mtk_pinmux_gpio_set_direction(hw->pctrl, NULL, gpio, true);
 }
 
 static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 				     int value)
 {
+	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
 	int ret;
 
 	ret = mtk_gpio_set(chip, gpio, value);
 	if (ret)
 		return ret;
 
-	return pinctrl_gpio_direction_output(chip, gpio);
+	return mtk_pinmux_gpio_set_direction(hw->pctrl, NULL, gpio, false);
 }
 
 static int mtk_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
-- 
2.54.0.545.g6539524ca2-goog


