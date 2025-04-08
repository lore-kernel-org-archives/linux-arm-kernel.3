Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F01C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 06:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ORX98YSk1SNy2hJueg/F5TqpKLL+TPlVQ1FPNGGwME4=; b=GvApV1Vuki++cMH1TrWRVyQBGH
	V71P7wqkGnrFX6biSjCeF7mwEwIHVdQBhjxzWT6DPjHDzoWvxD0EI3LFVwll6SiM4rDCNFSKZoG+8
	HbiQX1xITdMVY9z2t4ltp7rv0kdN0ghkMKchuUJDyFY+w+f1XEUsqMW1orgUoYLr82tEeodAYi8dr
	mWZYQ8Qv9tCxnWY2PavCXFcijPxIFRFfPGLpB+nQFoJtOFC8sklY/h9rMtEEuVKGl9bP5nrpK36Sp
	d6metxJkmJX3DmCkWYVE2fXrFyN7eyM2nYmjl1DQ2oOr7jSCjTDKVrGfSqzawrjTqDjDKPNHeeonu
	RLMyqxlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22Wc-00000002vEM-2gKA;
	Tue, 08 Apr 2025 06:33:34 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22Ur-00000002uxY-0FX9;
	Tue, 08 Apr 2025 06:31:46 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-30c416cdcc0so43482311fa.2;
        Mon, 07 Apr 2025 23:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744093903; x=1744698703; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ORX98YSk1SNy2hJueg/F5TqpKLL+TPlVQ1FPNGGwME4=;
        b=kk38YFhWRiJIlO1nLzMB3Ez65Sw66A1pcz9Jjay6pLNdEamfD4Az1xRN22O0ITsh6R
         K/RpnTghQH9slxjJ6HKuVd2Xd2Etrfjh34Dq+oYHSbVCD1qnt6TxhVqms9CMuHRRwv9E
         8rgJJWk5p0XIt3JibqdCeQY5acUo/A/cRoQE7cbKFZlAvO10osh9LyVGx4vWR2ZJTIWu
         SPIHrNAJtCf72TvxTfYGfNasIlKZJPiwGQyz1LF2v2NMhylLj8Oo2WovzAjuS8Ii1FNu
         31pjoZBt3eZhtBhEbd01s8FZ3PD4aChGb70CWk8K6pFsnypF2t+Ls7x4WfDfyY+SQ9YE
         Ri8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744093903; x=1744698703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ORX98YSk1SNy2hJueg/F5TqpKLL+TPlVQ1FPNGGwME4=;
        b=wCEvV7WQ8fdItTOVHAPzdBEoE/hz2m3zN87R4zsODyzlvK9emdORHxRvkC+GblCKTH
         X68rLWCXwu8wxycG2/TSI6d/zLpnWe6i9SWnOP2RhiUGBhfJVA2aX67cuQA7tv5Xq6qy
         eNdgr1P07E+7gTDWob8xdSYijNukvIBWy2/ofNZDA/Ekqacxpty/r9OYXB8nPDce+s0M
         B71TZZ5/Ty4oh7gKixyJsuXWxjSvvyPctCZRh/Pyf8TAX+Sn3Zw5MSbWpOqQJsRb4jQH
         olgon0q/gnD7fPn2VwPsCGzLcdX/aPZSi48HfhfDXr7ZkBnxlS7zfCDc8Av9dZNRAji3
         7iPw==
X-Forwarded-Encrypted: i=1; AJvYcCVyel2hSmKM48StR/Bzefnt6KvXB8ztuIq+MbuCzro4vBbPrsp1jEozvitIG0GDZI7sxfmbtON2NaPcEOT3bhjT@lists.infradead.org
X-Gm-Message-State: AOJu0YxMbCTWb4WbmPdj9I8QaheALfzJ6Mq7noHyhybKSzaAuwIMBMGi
	oOSQw8OYZUs0J5PvflVTxK//uUuypZK/de6fBOhALZ0jsNQphKqxA/VCNKb3
X-Gm-Gg: ASbGncvmU80vgWiLC4PhYflEYj9YZ8PDLwS27zb+w836xtprQf35tXGcL7YTfLlRdst
	iOLo31TgdrviVM3c00Kiz8aiMavS6tMJpJ1VrHG3U0nODCHS5NlHXJ6KiSSj/Gj0LQVWchsbz72
	BqT1GVGS2bOdQDO5Qmxr/4CQUYsQIKgmSbkpPp87+FljXUbHI1CYWtrLpNM84ivVEnzFD7GJSFO
	DWWhHxNRIAgJ1g/EGLF+2IBnveTuHIwg60aN8S4gtAvX3lxNup60ubNPVntPubs5JuNSbZ4Pvkp
	Xi5T2O0RvaG6dE+yMdJ8e2nFeZdi6Yo1bGos15fha1iYEOtqvXytD9j3R0m9Z03u/yo=
X-Google-Smtp-Source: AGHT+IGVMk4G7cBj7vxqRy8K2XvNzy6mPoK2OkwsHGUDZkSEYRt9KAqJNzY8PIdw+o5TykPCy55P3A==
X-Received: by 2002:a05:651c:1442:b0:30c:1002:faa8 with SMTP id 38308e7fff4ca-30f0a0f0a65mr45654541fa.7.1744093902472;
        Mon, 07 Apr 2025 23:31:42 -0700 (PDT)
Received: from localhost.localdomain ([188.243.23.53])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f03125862sm19141801fa.3.2025.04.07.23.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 23:31:41 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH 1/2] clk: rockchip: clk-pll: Fix CRU_xx_CON2 register usage
Date: Tue,  8 Apr 2025 09:31:25 +0300
Message-Id: <20250408063126.38904-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_233145_100582_83090E9F 
X-CRM114-Status: GOOD (  11.19  )
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

According to RK3588 TRM, CRU_(CPLL/GPLL/etc)_CON2 register
(rate-k value) does not use highword write enable mask.
Lets fix this.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/clk/rockchip/clk-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index 2c2abb3b4210..77ba4d6e7b5f 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -959,7 +959,7 @@ static int rockchip_rk3588_pll_set_params(struct rockchip_clk_pll *pll,
 		       HIWORD_UPDATE(rate->s, RK3588_PLLCON1_S_MASK, RK3588_PLLCON1_S_SHIFT),
 		       pll->reg_base + RK3399_PLLCON(1));
 
-	writel_relaxed(HIWORD_UPDATE(rate->k, RK3588_PLLCON2_K_MASK, RK3588_PLLCON2_K_SHIFT),
+	writel_relaxed((rate->k & RK3588_PLLCON2_K_MASK) << RK3588_PLLCON2_K_SHIFT,
 		       pll->reg_base + RK3399_PLLCON(2));
 
 	/* set pll power up */
-- 
2.39.1


