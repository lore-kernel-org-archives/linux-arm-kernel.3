Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D77D58E48
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 02:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPp4rqmor4aB2PCAetYan6hsDfGcu08LGlQPnz1RyHo=; b=TCQ8WNfLOZMQfj/nw+3l6LcE1o
	X/uG5bvtPFN+GiWK1YC4EAEpHAyltE4ruon6tJO4lc7X3dqKycAWocrqq/ANUopVgYtfDEk+mJtsx
	XEhKfYerSQpU/OMEa+iiYm0uw+kc1VZgZIC3/x5sRrSms6KU6b+iK7cPeFc6aPPx9tCpkkF9S2Lgv
	8aVEKBeK4rDDaQsA84pjaWW8YU3ARB8vWm2LM6BvNrgZ9/jYLzZu7F+6/XE1SuIRGK4HMkRCyAtvF
	0WfwFZAowJR4BFd3vaXh/1SMo7N6IzuOZ7BoFdvnQywUClbkL17sVEGuwyXNoUSBdOZO8DZyPkDwT
	c0PG0HoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwsiP-0000000C5n6-0Kya;
	Mon, 02 Mar 2026 02:08:57 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwsiN-0000000C5m2-1T6R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 02:08:56 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3598e7155bbso232504a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 18:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772417334; x=1773022134; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPp4rqmor4aB2PCAetYan6hsDfGcu08LGlQPnz1RyHo=;
        b=DNVwOR1wWBXoqBHatzYQOkhmyDogB8Q5Tt+NCV+CQGSADBvioh+Vi2QSxWkoJKUveq
         aa/++EiLpKlKuJrDyI78eH1RUVBFvR5yDp1cOi+azDT1LQioY7K2EVx0ARCZ3WbEGVW7
         9Y8aTgqKGeUJXRGcYNfDcSTzjYVkTsgLr3ZSDtYarh+fxh96F7KusAyrQobzhvVp7Tll
         TIwATqLGomUKsbveWBfKDFJoA9l1GC0YlB/kTSxc5llSHUfg/rTQGFAC/4ZtdgM98Lfy
         TPfhb0twT70pP4OATx0YYSHudsjU72DIRixey+mz0qt2zpgifkfKFSWHPohsKDyC4Pqg
         tG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772417334; x=1773022134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bPp4rqmor4aB2PCAetYan6hsDfGcu08LGlQPnz1RyHo=;
        b=DhDIt0VJqcfDJX/WCWK7W3lFaJ0CwHdlH/zRlWBMDWXqkoJpqf/I3SCAbovCkqxvmj
         OlF+ZbgC3s2Kto3VbbXTOFFRtGdKh1Bww8FriBIpzQT1IyDqnQnHMpaT7bMFYf6Hk/L+
         0pFSDKZIpqXCsZUTKZBJkx3RYa5CwdIv+fSFZCd7Q/ysSvuCWvNBvf988P0SwsuM2H0D
         JjiHc8KPLetpnECSeBpfJFOaHT8E1mzRm/jM4lc4DAb4OEloMxZccv28Q1U6zcXICTRP
         FRo/rqL/z7K8rCVG098GRY+/Slv3IqS5nFQigX5vGBtXTTv8HApM+mvNLeP+fBQv4lMq
         TW5g==
X-Forwarded-Encrypted: i=1; AJvYcCWUasoiCIaQNGMNwzvaklSuq7sgh5YaGXaPx/cmNCCT6bPKvj6WEerpBVCLqdZ6wY7R/KSUuoo9br2tGlQeSNQ5@lists.infradead.org
X-Gm-Message-State: AOJu0YyfCgRQnMea/rN7en3UP+kv6SP/thCvzMyjwmeUklEeBqqjqBal
	eZPjAGEldxuw33Cq73bugkC09lMwAy36t+6Tg7Y4jbgNQ5PLpzCE6Bp6
X-Gm-Gg: ATEYQzymvnSniz6g9Xb41bcaWxgMYCo7NZsjYpUaVAeCL59mg4msaHAv/J1eoDF/Pxd
	5r/SJWZX9dAEvWmZpEsAa/gmWCewbLrWjStqRkMDGhnDct0lZltMiwPkyasuotNhqseMHOYjiPj
	d9szmrbQzMuyslybNA6nTL2NyllRq+QyiAS+WlscWL4d0sE3yp3fctTGpMOnB9/xwZB7MeistYi
	sNZCHOTwYUC02SDXkLmDM4POgJ1ZXR1tl/2OdJwxjhW+0lQsK/Hxl2WY3BIPA3eslWPEEPJwrHu
	bcmMX35ZTFGkQ2199SDnKcwE+w/sdLtIM5bEhCUtJE6nTj8u4deTQtAEk1kCKgtJ6zFdGlAT59t
	2aA8wDjNOS5MpXO4tL5ErimuTYccJX0Nne6Zm8gpcTTNurZ7QNk0IMfWHiuGjnmeLHn8gZfTaDX
	r3O1zRC/AWpAkqVvPX46xvlbOYwo7bBNYvwLgNKK0nFJ/uX7uNUOnW+f5E9NpsM7BA0mZrnndov
	HFbF/HCVQVOafA4xDOB
X-Received: by 2002:a17:90b:314e:b0:359:849a:7357 with SMTP id 98e67ed59e1d1-359849a750dmr3044128a91.20.1772417334443;
        Sun, 01 Mar 2026 18:08:54 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35987523629sm2764697a91.7.2026.03.01.18.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 18:08:54 -0800 (PST)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: andi.shyti@kernel.org,
	ychuang3@nuvoton.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	zychennvt@gmail.com
Subject: [PATCH 3/3] arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC
Date: Mon,  2 Mar 2026 02:08:22 +0000
Message-Id: <20260302020822.13936-4-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302020822.13936-1-zychennvt@gmail.com>
References: <20260302020822.13936-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_180855_392364_D55E59FC 
X-CRM114-Status: GOOD (  11.10  )
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

Add I2C controller nodes to the MA35D1 SoC dtsi.
Also enable the I2C interfaces on the MA35D1 SOM board
to allow communication with onboard peripherals.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 14 ++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 65 +++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..2a8f0fd90ded 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -98,6 +98,14 @@ pinctrl_uart16: uart16-pins {
 			power-source = <1>;
 		};
 	};
+	i2c-grp {
+		pinctrl_i2c1: i2c1-pins {
+			nuvoton,pins = <1 10 12>,
+				       <1 11 12>;
+			bias-disable;
+		};
+
+	};
 };
 
 &uart0 {
@@ -129,3 +137,9 @@ &uart16 {
 	pinctrl-0 = <&pinctrl_uart16>;
 	status = "okay";
 };
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index e51b98f5bdce..36bd19e37b57 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -17,6 +17,10 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		i2c0 = &i2c2;
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -372,6 +376,66 @@ uart15: serial@407f0000 {
 			status = "disabled";
 		};
 
+		i2c1: i2c@40810000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40810000 0x0 0x1000>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C1_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C1>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c2: i2c@40820000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40820000 0x0 0x1000>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C2_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C2>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c3: i2c@40830000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40830000 0x0 0x1000>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C3_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C3>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c4: i2c@40840000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40840000 0x0 0x1000>;
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C4_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c5: i2c@40850000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40850000 0x0 0x1000>;
+			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C5_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		uart16: serial@40880000 {
 			compatible = "nuvoton,ma35d1-uart";
 			reg = <0x0 0x40880000 0x0 0x100>;
@@ -379,5 +443,6 @@ uart16: serial@40880000 {
 			clocks = <&clk UART16_GATE>;
 			status = "disabled";
 		};
+
 	};
 };
-- 
2.34.1


