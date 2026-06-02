Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17647CD6E6A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 13:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQED88Vy62af70/e/Yo+SKKTpHIWPlP36uYG4ItaDbI=; b=h0Bj9bO+7LwSGRjADK8l0q6MYx
	6E6WcOe645dbr38IFlnyD6Fu4FXgmkwUM6kNsCyAfcllJtaDbsaRLAGRDRR3erFIwnpLgBr1P8wCL
	32HIVyOXIKQOp3MOkKTu1AWkQXjN75mtuY3heTmYUTDuiuf1j8FqAgvnHxM8HipQNXshpnQXmG0WZ
	lwr4fzpg3AxeZF3Wb+7uxNxzvSVORgCJ3FSHAjUp4A6GPNvVZv8BbvHfAC8vsmnNC+yMVBZ1ZbVS2
	DFojua3auQo90Y1JJywS6wCcYAxU2bBjSB6i1OfQTSPWAjX7cizIcU3MCpX9f00f8Kqa6nVkImDFx
	Ivq8S1Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUP7G-0000000D5ok-2v3D;
	Tue, 02 Jun 2026 13:25:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUP7D-0000000D5kQ-0ucP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 13:25:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 37CF044608;
	Tue,  2 Jun 2026 13:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1072BC2BD05;
	Tue,  2 Jun 2026 13:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780406705;
	bh=oRZu3eePph574LLYQBblinNrMaZQAY/xVnLsaIDWonU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=auBI5YapL5RRPxAszptq9runs2dn6/qEFl+Syjykq3zlU5/H0nkQS2luD1KYCCOK/
	 TA/FiJruchto84fIV7PSQED1nNe0qjVyhQDrTh1PC/QtHf0mQLRyRW39xSnNwB2N4I
	 lzQycfY7Je1Ped7LB9mxotyyTkwMwvyFEzd3POSqKwRad5G/Wr3LzsJoZCXtN8V65n
	 iDHCo7tKqDFD5L75+HZROOL9sC5Bo3g/tz7wIBIp+iOAFSjVlonaYiGOOPZdGY+kuY
	 YN4HhxF+1GlVsLhokr0AeRVCQhkYIZTlB6RqIkK9tA1mxJ1X8YSIxly4eX9fUiziUC
	 bexwePYD/OqQA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 021A5CD6E60;
	Tue,  2 Jun 2026 13:25:05 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Tue, 02 Jun 2026 21:25:03 +0800
Subject: [PATCH v3 8/9] ARM: dts: aspeed: anacapa: Enable MCTP and FRU for
 NIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-anacapa-devlop-phase-devicetree-v3-8-7c93c5df8d9b@gmail.com>
References: <20260602-anacapa-devlop-phase-devicetree-v3-0-7c93c5df8d9b@gmail.com>
In-Reply-To: <20260602-anacapa-devlop-phase-devicetree-v3-0-7c93c5df8d9b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>, 
 Andy Chung <Andy.Chung@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780406700; l=4631;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=kVrgdeyIILumAIqglDCa0K5zOenzetqMl+AfMwM1Ya4=;
 b=vrx/Pv6lGMAarGPzLbHcM8iiWG3M3J5vKfNJ0+D4MQZWFHQZINR/1+6BAtKn2yCa8ugglxR5B
 dMWPYeQuf6yAu2zzDv2bdnu7d5rigjtSBpDw8z17Olys/2mY07WFakF
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_062507_423430_E8D251F3 
X-CRM114-Status: GOOD (  10.11  )
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
Reply-To: u8813345@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Andy Chung <Andy.Chung@amd.com>

Add the mctp-controller property to enable frontend NIC management
via PLDM over MCTP.
Also add EEPROM device for NIC FRU and reorder the I2C virtual bus
index accroding to the system silkscreen index.

Signed-off-by: Andy Chung <Andy.Chung@amd.com>
---
 .../aspeed/aspeed-bmc-facebook-anacapa-evt1.dts    | 98 ++++++++++++++++++----
 1 file changed, 80 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
index 29df10697613..5b6ce3c556fe 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
@@ -35,22 +35,22 @@ aliases {
 		i2c33 = &i2c8mux0ch1;
 		i2c34 = &i2c8mux0ch2;
 		i2c35 = &i2c8mux0ch3;
-		i2c36 = &i2c10mux0ch0;
-		i2c37 = &i2c10mux0ch1;
-		i2c38 = &i2c10mux0ch2;
-		i2c39 = &i2c10mux0ch3;
-		i2c40 = &i2c10mux0ch4;
-		i2c41 = &i2c10mux0ch5;
-		i2c42 = &i2c10mux0ch6;
-		i2c43 = &i2c10mux0ch7;
-		i2c44 = &i2c11mux0ch0;
-		i2c45 = &i2c11mux0ch1;
-		i2c46 = &i2c11mux0ch2;
-		i2c47 = &i2c11mux0ch3;
-		i2c48 = &i2c11mux0ch4;
-		i2c49 = &i2c11mux0ch5;
-		i2c50 = &i2c11mux0ch6;
-		i2c51 = &i2c11mux0ch7;
+		i2c36 = &i2c11mux0ch5;
+		i2c37 = &i2c11mux0ch6;
+		i2c38 = &i2c11mux0ch7;
+		i2c39 = &i2c11mux0ch0;
+		i2c40 = &i2c11mux0ch1;
+		i2c41 = &i2c11mux0ch2;
+		i2c42 = &i2c11mux0ch3;
+		i2c43 = &i2c11mux0ch4;
+		i2c44 = &i2c10mux0ch1;
+		i2c45 = &i2c10mux0ch2;
+		i2c46 = &i2c10mux0ch3;
+		i2c47 = &i2c10mux0ch4;
+		i2c48 = &i2c10mux0ch5;
+		i2c49 = &i2c10mux0ch6;
+		i2c50 = &i2c10mux0ch7;
+		i2c51 = &i2c10mux0ch0;
 		i2c52 = &i2c13mux0ch0;
 		i2c53 = &i2c13mux0ch1;
 		i2c54 = &i2c13mux0ch2;
@@ -617,13 +617,17 @@ eeprom@56 {
 // R Bridge Board
 &i2c10 {
 	status = "okay";
+	multi-master;
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
 
 	i2c-mux@71 {
 		compatible = "nxp,pca9548";
 		reg = <0x71>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		i2c-mux-idle-disconnect;
 
 		i2c10mux0ch0: i2c@0 {
 			reg = <0>;
@@ -634,21 +638,45 @@ i2c10mux0ch1: i2c@1 {
 			reg = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			mctp-controller;
+			// BE NIC FRU
+			eeprom@50 {
+				compatible = "atmel,24c32";
+				reg = <0x50>;
+			};
 		};
 		i2c10mux0ch2: i2c@2 {
 			reg = <2>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			mctp-controller;
+			// BE NIC FRU
+			eeprom@50 {
+				compatible = "atmel,24c32";
+				reg = <0x50>;
+			};
 		};
 		i2c10mux0ch3: i2c@3 {
 			reg = <3>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			mctp-controller;
+			// BE NIC FRU
+			eeprom@50 {
+				compatible = "atmel,24c32";
+				reg = <0x50>;
+			};
 		};
 		i2c10mux0ch4: i2c@4 {
 			reg = <4>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			mctp-controller;
+			// BE NIC FRU
+			eeprom@50 {
+				compatible = "atmel,24c32";
+				reg = <0x50>;
+			};
 		};
 		i2c10mux0ch5: i2c@5 {
 			reg = <5>;
@@ -694,38 +722,72 @@ i2c10mux0ch7: i2c@7 {
 // L Bridge Board
 &i2c11 {
 	status = "okay";
+	multi-master;
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
 
 	i2c-mux@71 {
 		compatible = "nxp,pca9548";
 		reg = <0x71>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		i2c-mux-idle-disconnect;
 
 		i2c11mux0ch0: i2c@0 {
 			reg = <0>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			mctp-controller;
+			// FE NIC FRU
+			eeprom@50 {
+				compatible = "atmel,24c32";
+				reg = <0x50>;
+			};
 		};
 		i2c11mux0ch1: i2c@1 {
 			reg = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			mctp-controller;
+			// BE NIC FRU
+			eeprom@50 {
+				compatible = "atmel,24c32";
+				reg = <0x50>;
+			};
 		};
 		i2c11mux0ch2: i2c@2 {
 			reg = <2>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			mctp-controller;
+			// BE NIC FRU
+			eeprom@50 {
+				compatible = "atmel,24c32";
+				reg = <0x50>;
+			};
 		};
 		i2c11mux0ch3: i2c@3 {
 			reg = <3>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			mctp-controller;
+			// BE NIC FRU
+			eeprom@50 {
+				compatible = "atmel,24c32";
+				reg = <0x50>;
+			};
 		};
 		i2c11mux0ch4: i2c@4 {
 			reg = <4>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			mctp-controller;
+			// BE NIC FRU
+			eeprom@50 {
+				compatible = "atmel,24c32";
+				reg = <0x50>;
+			};
 		};
 		i2c11mux0ch5: i2c@5 {
 			reg = <5>;

-- 
2.34.1



