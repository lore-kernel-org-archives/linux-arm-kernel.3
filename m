Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55CEC36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 11:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FclWDOpQYZIOEMCx+3mDgK8c9fGIMqHvQ2gE2LcXKrg=; b=LSwgY95FX4FCKOdd9uYV8qKTbB
	myPyd0dkJbECYNsnasXtVA0c/pSq8hk0mjWluQ2l9RMfrtaEEot3dylylH7GwIhDR/3JNiAj16Uf9
	F5xV7LTmTlUkJYzaViOSwPEsiC6wAYNtCPelifuN4uFGe+krUZNni129BNBfm7DykqfozcL7fTAFT
	kBIEgYQE6ooWQJQZvgVZ1YhxVsv9KEUQaSvmYlT2MgaBPUA4IU6PYuTZ+t1yhZkzlcd3lhpIhZ+q7
	52sHNC4NVVjg/1EgNj0rIEFa6Dop7ZavS4Z3oapV7NVbIN9Ze03LGqCwcymU1/RyY0OhF9zfeVfE2
	HsTXpxDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twgGD-00000002yCb-0TpL;
	Mon, 24 Mar 2025 11:46:29 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twgEV-00000002y72-3If4;
	Mon, 24 Mar 2025 11:44:44 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2264aefc45dso64078465ad.0;
        Mon, 24 Mar 2025 04:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742816683; x=1743421483; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FclWDOpQYZIOEMCx+3mDgK8c9fGIMqHvQ2gE2LcXKrg=;
        b=O+cC9b8LyoA8kalqPA21hCwnkle0b/u2bLzb6S/DA/BAzcJ4LrcIjERlX3RSOqUYn/
         JO78gBg6G9uOvrV4RQJm8SRSVbA9dVpOYc1pjTiJioqEQAEV4VM9FyxS8oCEE7iXfjx/
         p0/mX1lAZRokovrsppNmu1LoQKo/obJYSGSF0yQIOxxVtJ63V39VNaZk7LEJOSKxR4Vw
         bbKIc0//5hmFUcW8Ii+tjNU+iR3+DYvla0/Bx1K8O1aIK6F5OxMRddO4Y/0kNVfQx67S
         /StwPoULCMiLat+go4d98r4iAZrckc38kJ0wd33FwTI1V4H33fkPiPN+3gOVs+mps9ZG
         NpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742816683; x=1743421483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FclWDOpQYZIOEMCx+3mDgK8c9fGIMqHvQ2gE2LcXKrg=;
        b=TScStRRAbKYEx9kRnPuc+GPccpS3dNvu+RKtQzSEhZVaPGatwIEmRfUoTL/zF8fTXo
         uj6t6hVlOvcUkzIzqci0MOhoyoV7pf3c3YWSiLHCyf3/lzCBOOhz2izxLASkG6MPytry
         Orvvr6J7GAOzyF7p7sz/DTM7BgfpL44jVnpPrVMJRkPX5TGfSyWBT/6vQmzIxRTQCu80
         EL+7pa6nGMS764zqLhP7lGolD9qaldCIref6tpqedcd5MrNACefTrxOvR1E4krjph9Kk
         GZd+1P/6GkedPWnDD0rAeEM+wx2QzjuaQGt7OwJjHQiyNpddrAsVeGHXbhM59FgP9oWq
         a+Zw==
X-Forwarded-Encrypted: i=1; AJvYcCUQD0sXyGijCMOYR5CXQIiGLIaTeC9Rl+7VI3oL0zKbelxNTvkPPCxazbPbBWjITnYvfPRsXk1vWf40bLL6CnQ=@lists.infradead.org, AJvYcCVaLyBpRK/gH2OCcBH34YFPVOc1tpZZz+PSGB0olMRq8rA579xLd1jUX8If3O54YuF5wkA0BPzBmTtBV8IjEj0e@lists.infradead.org
X-Gm-Message-State: AOJu0Yz++dA+F5aqS4I5ozYCK8m2cC6+IGp3MYMtbWKslLJD4kVXOYfc
	9V69No9FZuY2e/hkg5gUMeo73CXAVLpxC9FN7DTZu+fh307d33kW
X-Gm-Gg: ASbGncu8iNk99KVw+xDvK8TNFCb3iKoErLcsysN7o1vxQaAfk6qtAWJI6bkHzELCU6X
	nXiBBEWDlXvG7cUZGC1B6CTdhTZ0GTJLnvMDITUy2Vr1aVU5Py7g1+JJNX1p0Qa/MggOPOpaYrs
	tMWikEP42tNKWhNDE+tHY9G6JhSIYoTO4GaiCScey/R45SxsM7H7kJw7woS1/PIWQQnXH1CBflJ
	5DeD9QK5QqzBI/fth0XrWONzz8TkP/1m53qfBO2du8QpKz1utJvnaKwVg5K6vfdgLFz7JX1i2hc
	94QJa65mU6XRokXgguTppACfCjE2+B0aV6GKDhQwnHs1hKItM3GSN4gS
X-Google-Smtp-Source: AGHT+IG0hePrJhwSgn3rCtEA92WDnZVJ/VYMDjPzw/eThcvEnlBPxwvaFn6CraVYwHOXq4RoU8sdHw==
X-Received: by 2002:a17:903:292:b0:220:c813:dfcc with SMTP id d9443c01a7336-22780e08cf6mr223591475ad.40.1742816682459;
        Mon, 24 Mar 2025 04:44:42 -0700 (PDT)
Received: from ownia.localdomain ([156.226.172.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f3b242sm68618715ad.41.2025.03.24.04.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 04:44:42 -0700 (PDT)
From: Weizhao Ouyang <o451686892@gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Heiko Stuebner <heiko@sntech.de>
Cc: kernel@pengutronix.de,
	linux-can@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weizhao Ouyang <o451686892@gmail.com>
Subject: [PATCH] can: rockchip_canfd: fix broken quirks checks
Date: Mon, 24 Mar 2025 19:44:16 +0800
Message-ID: <20250324114416.10160-1-o451686892@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_044443_823811_D0CFC2B1 
X-CRM114-Status: GOOD (  10.64  )
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

First get the devtype_data then check quirks.

Fixes: bbdffb341498 ("can: rockchip_canfd: add quirk for broken CAN-FD support")
Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
---
 drivers/net/can/rockchip/rockchip_canfd-core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/can/rockchip/rockchip_canfd-core.c b/drivers/net/can/rockchip/rockchip_canfd-core.c
index d9a937ba126c..ac514766d431 100644
--- a/drivers/net/can/rockchip/rockchip_canfd-core.c
+++ b/drivers/net/can/rockchip/rockchip_canfd-core.c
@@ -907,15 +907,16 @@ static int rkcanfd_probe(struct platform_device *pdev)
 	priv->can.data_bittiming_const = &rkcanfd_data_bittiming_const;
 	priv->can.ctrlmode_supported = CAN_CTRLMODE_LOOPBACK |
 		CAN_CTRLMODE_BERR_REPORTING;
-	if (!(priv->devtype_data.quirks & RKCANFD_QUIRK_CANFD_BROKEN))
-		priv->can.ctrlmode_supported |= CAN_CTRLMODE_FD;
 	priv->can.do_set_mode = rkcanfd_set_mode;
 	priv->can.do_get_berr_counter = rkcanfd_get_berr_counter;
 	priv->ndev = ndev;
 
 	match = device_get_match_data(&pdev->dev);
-	if (match)
+	if (match) {
 		priv->devtype_data = *(struct rkcanfd_devtype_data *)match;
+		if (!(priv->devtype_data.quirks & RKCANFD_QUIRK_CANFD_BROKEN))
+			priv->can.ctrlmode_supported |= CAN_CTRLMODE_FD;
+	}
 
 	err = can_rx_offload_add_manual(ndev, &priv->offload,
 					RKCANFD_NAPI_WEIGHT);
-- 
2.45.2


