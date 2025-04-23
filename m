Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F532C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 11:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZvxsiEPvdpb5l2WB/p6Z/my19eCAalsXZfsDJGPws1k=; b=XxHViN8w3LGbSU8bCXVgeBIzmm
	RAFr4lxgpDkGs1MloOz9uo74+tTg5ejjieI7jMj7vnzN3Mxib1z3kHqZF6/3GhCA9w++DOrkaBplM
	RLPc4c0Am26N+w68CJAlNpcIMv0yVDGdfyf3Pc2jd9PTpOHpxPJHQHe3G1Z5rfbBrqcfYOEGslR3N
	+5iHK2D9e+NQzdeJaQS75RXvrLM7xCtt9tpm7s3CeF2roncFmVL90DToUJnLQ3rrcM0JOU8/JjXtW
	NCJgFKyfaZdbVfxmNiof7enP2v8g+SEeEyOV5kSKoGer4mV+cVMU59Mw7zrDKWDan+A+OolU9dxzs
	L+Rwd6Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Y6k-0000000AK1K-1G1j;
	Wed, 23 Apr 2025 11:17:38 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7VO5-00000009ibT-0S0A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 08:23:22 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so3828212f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 01:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745396599; x=1746001399; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZvxsiEPvdpb5l2WB/p6Z/my19eCAalsXZfsDJGPws1k=;
        b=a0C66j6RZv2yJDJuNIRdaHfKUpctHqVOTmutM2HrkT02Mm7dytigAB/EfHEc25fVKZ
         JhxrK/jL9gaRIpuRZTB+Umyjh27vFg8G1ELN6yKfFIJgCLB9Hjy1WRS/yvnvPF3H2rp1
         js3uf4LeBfsiQlQOwYlfHWQ5k3ngZ70xf1Lvusbtgj9Sm47pVN6Ri/JFa6P4NsZtgR/u
         Bx2OfYQgdwn7j2J/QbrrLLSxMWUpdJd+mWFKoEmkD76onDX2xD+mh453PmnYB57GYvJc
         1P9qj5y/ItRoo7i1hVayM5GiCofru35tJSmxHEl2lUmc/ThGhCkaO/7/KcxovqMJXCzs
         MSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745396599; x=1746001399;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvxsiEPvdpb5l2WB/p6Z/my19eCAalsXZfsDJGPws1k=;
        b=c5q5A0BroDgMeKXkY4ZI2rtXiKFPIORj8UwStPH+UIKc0fFsCgX4UhRfOW74P7nJQ+
         BBlb+XnhqUWpDEJJIG/S53HAOOOlTVJn1G4of1VmZSyyXtZOf8eA9a37/yz8rYfe/ZNE
         FLLQsR6tp4gt2LxQIKSuK7yJamj+HQrbgIy1pWn3clSYOrQNQjGEncWtjVNuoBYDgeJ4
         gkYimeW3m9g7YhyNw6VRzxdwp6N9lx519NwQo2wvabhLJVbR5/74MotD5BegNPT6II8f
         Q53J3uLumnQFCiRvqSeLWRmfgEwED6QXvy+0x+XqTMu0ZTbIm+qcqy79Za+Q31TxVQK0
         mcOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/ODDg/pf7A2qQ3JIIOWdCxq0RQMMBhxeGlwjo6wE2zrNqg9Fm0Jvs1JUqhhTMdfLmqsbkLJCMSkaMO54CDEW7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7zF7VO14e7fxQCpQUnum9QOqI4wYFLp4G4P3iR0yQY+E3EST4
	wHndFujln9h6AkPgAcCXXHE4mLir2fOIIMZDgzgCvzBcl7gJpQHtOinYxP0MXDQ=
X-Gm-Gg: ASbGnctRu8EfZk5TTBL30b5XsilFXfgpCQB9u+5UctNTjz+r0543BUHRzpEZtEg00EJ
	EDvQV+MplqklMklqG1c7A7hkW1nIeBY/p7em9YDjkP2F2XcZdRyBfUnNtJ01Oy91lRJV8KDDZrf
	2ro4tJGu+FiaOxYJMxBZy4WEsCss0CRcjBDT38zJ0+KRQFJ7iiJRxGbJU32ckIyWISrpUaGHiE7
	VqZpp3jF8FiU2arLHMbFj6AYhcfgNeud4Fsy+Hq69gV/NssC/VYr1EFp+VTMG+IY+fYtKdmRWxn
	okshI0m67nW0PQZymUDxBIEL8NV87l3stLp37zdlw0YB3w==
X-Google-Smtp-Source: AGHT+IEelUJ/5v3FltvPfU2HhobryVrZIBwS3AI8/YV8yIZfhl1ShQPfo3U4FD8Ljf8SiRZZYW9GyA==
X-Received: by 2002:a05:6000:2510:b0:39c:30f9:339c with SMTP id ffacd0b85a97d-39efba5a84dmr14374721f8f.28.1745396599114;
        Wed, 23 Apr 2025 01:23:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-44092d4707csm16964585e9.40.2025.04.23.01.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:23:18 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:23:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] pinctrl: mediatek: common-v1: Fix error checking in
 mtk_eint_init()
Message-ID: <aAijc10fHka1WAMX@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_012321_158363_43A54F49 
X-CRM114-Status: GOOD (  12.75  )
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

The devm_kzalloc() function doesn't return error pointers, it returns
NULL on error.  Then on the next line it checks the same pointer again
by mistake, "->base" instead of "->base[0]".

Fixes: fe412e3a6c97 ("pinctrl: mediatek: common-v1: Fix EINT breakage on older controllers")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 7585de11854b..8596f3541265 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -1018,12 +1018,12 @@ static int mtk_eint_init(struct mtk_pinctrl *pctl, struct platform_device *pdev)
 	pctl->eint->nbase = 1;
 	/* mtk-eint expects an array */
 	pctl->eint->base = devm_kzalloc(pctl->dev, sizeof(pctl->eint->base), GFP_KERNEL);
-	if (IS_ERR(pctl->eint->base))
+	if (!pctl->eint->base)
 		return -ENOMEM;
 
 	pctl->eint->base[0] = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(pctl->eint->base))
-		return PTR_ERR(pctl->eint->base);
+	if (IS_ERR(pctl->eint->base[0]))
+		return PTR_ERR(pctl->eint->base[0]);
 
 	pctl->eint->irq = irq_of_parse_and_map(np, 0);
 	if (!pctl->eint->irq)
-- 
2.47.2


