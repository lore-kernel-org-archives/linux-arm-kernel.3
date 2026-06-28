Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7C1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 20:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jI+CNHsKpYCs05jd7k7dZKD6GHKhGOknPODjslrM5lk=; b=BzZ2kgS/ANHOt/YP1/fMIk+YwS
	MAlx82ZrpqSAZ6oq0D1VnkVAA+FMca2JjOyE2rXEXMXZdKZMoLRSQuSbAfx4oL0cLzPdDuI4OzFqd
	+BW/qG8Diu1W6s7XM59aFn3rB1ejI4oO8lqzOyCpykNnu3xk8EQ5iSPSSR/D2KM5cva2376tXs1Xh
	Gg00fA5BdF1mC4LUTcDF6KCtfYXoebl6294ObVUBbvamneGzkRYaZXq0ax4sDjygFas52tE+7s7u/
	ro8ddXLfnhwVHdseaNn48dwz7Ggc1HMIGv9EWBfNvplF39XZAckxvTUawdzKspFBc8hgjdHSe1Zjh
	8R2buclQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdwYS-0000000DNWH-3YcK;
	Sun, 28 Jun 2026 20:56:40 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdwYD-0000000DNOy-32Wc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 20:56:26 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4720f3bf164so486661f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 13:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782680184; x=1783284984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jI+CNHsKpYCs05jd7k7dZKD6GHKhGOknPODjslrM5lk=;
        b=AxsBIb1iaWn4ExDzNWpr5VBfoss8Jmz9SIMTuo3MVZ/+l6PSHCHa9c5j2rjwwl5u+L
         RxYtMFFGafHKT5HAWoqYZa7Trlm2o1r2sk6rvmrV7HqrddhBwsv7lk9t+ocS2VZ6QtZC
         OC+QSXbk5k9y7Aw/CIX2jKU/87RIKPE6kPBuFuCKniP/Jxf0rYcZVoRinn8L04U+b86S
         kOC8iSQ7N+aRe3Dnwg3QfMtFABdkJMRHOInA8quLU6oB1iYtQl3rbROTqsJ5gN01W1WW
         MsdsIxSV8PUiMODf0eGLFhbghnpdGqDrEAMyB6R10D92RvqaooZsCnhALwSe0+2ER3sZ
         WCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782680184; x=1783284984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jI+CNHsKpYCs05jd7k7dZKD6GHKhGOknPODjslrM5lk=;
        b=m6GUqaLj2s8FCb5CyMEc/xI79uLefolt5QQokN6p2opG1niMgZsBFo+11EdSlzUeVi
         o6rc79oPwTOCfr9Zraf/r89FzGiuQkMU79bm2MFkcDGZTEEwNyDB9/qdrMrNTzKFyl7q
         UcmFF+EegrZbo88RLx7QIi0wcNW6CPAyOzPG7YY65oaxTx3/KvnjQYB6pn3uBXJHwN+8
         MURcpAwyNvnJRwdFAEpLlLmqF50460A/CmsuI6t16DKtX4N2ESpLv3wGZ9UPMVJjOOt3
         +QJ8jB7Nfp6gtwKQZ3egTlCw+2H7ys3YSN3EYTt5EhmNSg3f2hM1mE4S2Jl2ti5Xd4mQ
         8IDw==
X-Forwarded-Encrypted: i=1; AHgh+Rpr8cVW3FQNus3NyAWR2O9hr33fIKyr50RHyuKsivP+ofpEZnWM5CFyvuyDWapKK7D7ZXRxkaaRurpAYVGT8ENT@lists.infradead.org
X-Gm-Message-State: AOJu0YwI2g1ualm8wn8grDQvQQITwS2uuQF6gJMKfccoL71v1jEtQBN6
	AODQL8DerZSVmm2kVf59DOo5Da6Z6MU7B246HducL/w4vqtkTHDR80Uf
X-Gm-Gg: AfdE7ckjeRiRxcr+vjJcWIY/GfqDOUv3f/hJLJq4ATrgIawlzQwoanmFSW3n2npVwCF
	xD1v1dX95EhBwHxonDH+l5imJNvFFSAhzSYwSIkRejspv5DEaJQAEi42YUuTZBmjdcMgv7E060w
	7MjHJWgUAlW9fyybW6nKZHfHCAYrYJgp6XF6B/vj9Bl/g0mw7owh64BUqpwRwR7KAn2Brl4GRp1
	iTKWWCRagYME663/pBJZUkoKLH2al4PIKuhtonjvpfKvhifgXrXosQL5llWWc4HWX4c/TJoouUY
	EuM3YqRkKobXsCGzikNMNwmLY+zj/7b8UpFKdyhE33mO9H0efUbMTNtSFt4q8cFKs5lDf4ETflL
	TO0pMDziiN+zVHTKiz0ZbU8FMWGPrgu5OnZG7n2DN6SVj1IPNvTT2V2JHbWXbp+n8QxLihfkFHy
	DjBdEh4L+IfevdnBrdV/2BEW5Ehp27iBP9glcTL8ZGVVhHinnpJnPCcUe9VW89mWEjA6CHz5HUH
	Tcr84/y9N2eXp1MrLZDO3nKhw==
X-Received: by 2002:a05:6000:2686:b0:472:1424:fc7c with SMTP id ffacd0b85a97d-4721424fda4mr6746824f8f.10.1782680183683;
        Sun, 28 Jun 2026 13:56:23 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f86c34d76sm19448910f8f.3.2026.06.28.13.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 13:56:22 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 4/4] arm64: dts: am62p5-var-som-symphony: add TPM support
Date: Sun, 28 Jun 2026 22:56:08 +0200
Message-ID: <d3ac1ce507b48f8debc8857814be00600b5a14f9.1782680023.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782680023.git.stefano.r@variscite.com>
References: <cover.1782680023.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_135625_801923_B388FF91 
X-CRM114-Status: GOOD (  11.94  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add the ST33KTPM2XI2C TPM device on the Symphony carrier board.

The TPM reset signal is driven through a PCAL6408 GPIO expander, so add
the corresponding GPIO expander node. Configure the RGB_SEL board signal
through a GPIO hog to keep the board in the expected configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../dts/ti/k3-am62p5-var-som-symphony.dts     | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts b/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
index 5c41647ff43f..8fe8ec903d3d 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
@@ -293,6 +293,28 @@ &main_i2c1 {
 	clock-frequency = <400000>;
 	status = "okay";
 
+	pcal6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "lvds_brg_en";
+		};
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		label = "tpm";
+		reg = <0x2e>;
+		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
+	};
+
 	/* Capacitive touch controller */
 	ft5x06_ts: touchscreen@38 {
 		compatible = "edt,edt-ft5206";
-- 
2.47.3


