Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE86E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 12:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EOiX4crFqNs9gEIrhVXrHiO5ip88JrNxPsu4lZh+erE=; b=AY9ViVmGqRBe5e/DzBHSIDVa2Q
	Ie8AMoOE6w6sw4bDriMpKptakc5wrS2cdowxsD5jBgsysXXvKkNGGPIKDuQcq32q/4KouHsFJIqAY
	yodDXPaz16fyhPCgBTS3Oxm6tI7LqBVXx6jlERWNNw1Ixbz52jlaqr3V+Dql0GgnpeTZ44OmKwJUs
	lRAJXOt2BtCz7a2CUcR18/A4ECywwX7q+SPRb73V9m7rpGFFHxjuAW8c1zxM4onccAJ5476wujboB
	/df0zYH02LxKzhAXu6nQh2g2dWsvh29VHgjDyLh5v2MJY2VY3/7p2JXvOO8JAtXgUp1u69GeIz+BW
	4PydbmYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWx7j-00000002fma-2RTW;
	Sun, 12 Jan 2025 12:31:23 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWx6R-00000002ffK-1bYY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 12:30:04 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3eba583fbe8so1017212b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jan 2025 04:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736685001; x=1737289801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EOiX4crFqNs9gEIrhVXrHiO5ip88JrNxPsu4lZh+erE=;
        b=TC29ZSWjP9RRTrrJtmzrEr0083mtQkE5X+oBj+hzODDfR6xHKM6vJFOHYgl1RwGv2i
         dn0VEKAYk4OTQjK2JeuEe6INS8xOZ7fsxC/wc2KJZPgiNyc5UYdlXxHTou+eOj/UAPSE
         dIWzh6NTveeK6ZT2bY7hQNUqgo/wrdclKVbT6P7MAJiWjsckdbnIrnY+4+fqMQAMtdKI
         qfm5ED6YAmXfTzAhudUCypadc5lzB5OCmIRSmJoa5NwlTVQkVO2Jd6GQzE72mwqoU08z
         vckQfRbUtSYGbZEOr8qGAn0AIEZb97eUqjvrPL8pwdskUxGRmyptFwAI2jLxz7E8JqSZ
         xzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736685001; x=1737289801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOiX4crFqNs9gEIrhVXrHiO5ip88JrNxPsu4lZh+erE=;
        b=mkSTNHU0of+ZlqOpzZKwJ1qW71KQZao0BP4l28AwecWm2T+szvyhQZjsNhvH2Rln7U
         dALGAaf1hpmC01QFsXPatWNHBrCE1CxDLpYNQDSS09ei0ZDfDIaUj7rUYigPXMO0++Wb
         o/S4xZ+RPdPDkp9f2VHTwRf7gkelXCLhj/K+nuh7wReOmqOjwDT1ek19Qt9dOp1m49MY
         O2uBuRut7AouNMyV4GltqGb5h2YHHbHbEJekqbCAxodD/ovtUyxU2DIcpGoa00AFlcZn
         zApiZTef4r6aLiDg0wzQKzh51/X41E2FZS+b02qZsrTyxD1I3HUJ8TGQB4zspvqXDCfN
         nnVw==
X-Forwarded-Encrypted: i=1; AJvYcCWmN0GStWrkhLynoPCzSwKSItmy3agmLl8yPXepgP+O9Q22W540Xy17b0zs7DzBFo3OKzc5nrYWvF1SRC9TL4PF@lists.infradead.org
X-Gm-Message-State: AOJu0YyAiPnaT+9TSOOC1mq7BC8x0M3wOK8FyN8Cm80taIQgRRESL7Sk
	iBVIL6WgmS47PlqdkOA0x+AqtAgDUZKLJ2SVxvp0kBFpETwGTojB
X-Gm-Gg: ASbGncuQXDuZPJsfgRCJ0zJRI/+bhY+kwtn7BB177isIQLDR0Nlfd4UFY0qcYP4z7WQ
	kfwECmtPwCC/yn6BidLJm85nDtWzRyi2k7pMG3ViAq4Ew0EPMrtJx4fKyKnNPVu6knTRiCEx5sm
	jURZTvT4A40lNrnyNL6KVrzrszDam5V4F1V0HP5Gxzokzwp1JWk0SXMWv2sjtMdp+9ZXpkRdKoj
	GJH1acXQpJVahHJ6DGjA+fx9mA+VzvB7fZRNDXfKFxNyryPcmdjiTfHH6EU875MIkXz5Q==
X-Google-Smtp-Source: AGHT+IHUMa7cT6Nz+jMGSMZwZ5HGk0gv+giMFYc59Vdedh64PI165/u7NrAV0tRuTmem/Cd8rrEn1A==
X-Received: by 2002:a05:6808:1922:b0:3eb:59f2:329c with SMTP id 5614622812f47-3ef2ec6c76fmr8758189b6e.3.1736685001618;
        Sun, 12 Jan 2025 04:30:01 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8c53:b609:d83:9568])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f037653ff2sm2196609b6e.13.2025.01.12.04.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 04:30:00 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/2] ARM: dts: imx5: Fix the CCM interrupts description
Date: Sun, 12 Jan 2025 09:29:38 -0300
Message-Id: <20250112122939.988309-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_043003_426497_4DB5EC4A 
X-CRM114-Status: GOOD (  11.66  )
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

From: Fabio Estevam <festevam@denx.de>

On the i.MX5 chips the peripheral interrupts are represented directly only
by their interrupt numbers.

The CCM nodes are not following this format and cause the following
dt-schema warnings:

ccm@73fd4000: interrupts: [[0], [71], [4], [0], [72], [4]] is too long

Fix it by passing only the two interrupt numbers.

Run-time tested in on an imx53-qsb board.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx50.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx51.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx53.dtsi | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx50.dtsi b/arch/arm/boot/dts/nxp/imx/imx50.dtsi
index 1b6f444443dd..f0b12a70f614 100644
--- a/arch/arm/boot/dts/nxp/imx/imx50.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx50.dtsi
@@ -338,7 +338,7 @@ src: reset-controller@53fd0000 {
 			clks: ccm@53fd4000 {
 				compatible = "fsl,imx50-ccm";
 				reg = <0x53fd4000 0x4000>;
-				interrupts = <0 71 0x04 0 72 0x04>;
+				interrupts = <71 72>;
 				#clock-cells = <1>;
 			};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx51.dtsi b/arch/arm/boot/dts/nxp/imx/imx51.dtsi
index cc88da4d7785..2bfb6baa67fc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx51.dtsi
@@ -458,7 +458,7 @@ src: reset-controller@73fd0000 {
 			clks: ccm@73fd4000 {
 				compatible = "fsl,imx51-ccm";
 				reg = <0x73fd4000 0x4000>;
-				interrupts = <0 71 0x04 0 72 0x04>;
+				interrupts = <71 72>;
 				#clock-cells = <1>;
 			};
 		};
diff --git a/arch/arm/boot/dts/nxp/imx/imx53.dtsi b/arch/arm/boot/dts/nxp/imx/imx53.dtsi
index 845e2bf8460a..b7147cc7a316 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx53.dtsi
@@ -598,7 +598,7 @@ src: reset-controller@53fd0000 {
 			clks: ccm@53fd4000 {
 				compatible = "fsl,imx53-ccm";
 				reg = <0x53fd4000 0x4000>;
-				interrupts = <0 71 0x04 0 72 0x04>;
+				interrupts = <71 72>;
 				#clock-cells = <1>;
 			};
 
-- 
2.34.1


