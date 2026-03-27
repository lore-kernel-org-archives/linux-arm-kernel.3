Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B4210BA431
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 06:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tXMwiY4jfkntgcj70RB19+Q8su/PxmKSW+o9I8NPDTk=; b=y3Uxe1rzVCbBtbv4bzp9q6DFlc
	3K7PuEAcCReID9cow3v0b62kGJsF/l2f1YWfyMjoSFp4zO9wV1I7slGbycRefyBo9HeJBlLMJOg8r
	0czcO26IXiFHd81QWFgHaMu0n0WL8CrXF5QRfDreq2EhPIxaV2+5uAKPPSRCFHd9B5vnz1LJY4x6b
	Ze7kn0Ntl8lMeoCiKUPsdl2yOiJRD5SXt1Fc4hUW3wHAwVlgCI7QWqKQrMmvikF3TCJaEkkOlE/Zv
	ByS+oAm3SXu7GhSGcrDCS/z56Efn3CL2vYyab8+QjzVOu9U14S5qdyuexgQ0Mf9/gjI4yqrlB4P0U
	eSJn8zgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w61AD-00000006qqX-2CoO;
	Fri, 27 Mar 2026 06:59:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w61AC-00000006qqR-2I9f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 06:59:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C9AE66132F;
	Fri, 27 Mar 2026 06:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71901C19423;
	Fri, 27 Mar 2026 06:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774594762;
	bh=+uYAGgoOPo8bLq2pJEoGgnHWXNq5+Y92SxzPmrm3lx0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=rUIMEOJRSYCB7RucQGG4PaxxD/Gxp+WS5WI2qbdgQUR2Tezsv5UaPTu5Sccjew3BX
	 /STHbYE7fN8R2g8rR/pcnMiqRXxf2EEhaqdzOyCCgBt2XP7lxC+8yh/N1f9oXGJr/5
	 dscnBFVUJrH1CyUTBjLG0OqxI+Vgs/9eEgtVn0zoxpDmQ8MBd+9Q9FCB2GE4cyIPlt
	 HERoddZgvkEx2+vGkrdfTxBaIFLj7XQ+k8K6tGE1mFvY1E/fGMwDNqDZwX7hLh7n+o
	 qLemUUVgm38RIIn76yV/h9dcnjRaXAmDvvjzhhORqyMhSDW6LXLWIosxV7zJJ7/4Xy
	 S+yHbeaC+gZvw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6098610BA435;
	Fri, 27 Mar 2026 06:59:22 +0000 (UTC)
From: Andy Chung via B4 Relay <devnull+Andy.Chung.amd.com@kernel.org>
Date: Fri, 27 Mar 2026 14:59:16 +0800
Subject: [PATCH] ARM: dts: aspeed: anacapa: Enable MCTP and FRU for NIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-dts_enable_nic_mctp-v1-1-5b5c05f4442c@amd.com>
X-B4-Tracking: v=1; b=H4sIAMMqxmkC/yXMQQrCMBBG4auUWRtoU5KAVxEJSfqrIxpLJopQe
 ndTu/wW7y0kKAyhY7dQwYeFX7lhOHSUbiFfoXhqJt1r24/aqamKRw7xAZ85+Weqs8JognHWxMF
 ZauVccOHv/3o675Z3vCPVbUXr+gP88bJ9dwAAAA==
X-Change-ID: 20260327-dts_enable_nic_mctp-e35a5765b176
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Andy Chung <andy.chung@amd.com>, Andy Chung <Andy.Chung@amd.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774594761; l=3825;
 i=Andy.Chung@amd.com; s=20260327; h=from:subject:message-id;
 bh=nPjZUWkxYiROesPBYSRnJtyY+ooYKRCOwqAAXx0E5II=;
 b=426Yu7gf6eNtDB2/x526jYc4Z1JqYnU4txLYevBKxAhEn8zHWmwRTqtXFJAuEiVW5EmT0Xyud
 qS5QpdP/rNHDPpoqYK3BCbkLuAfO8zBi5AI7c0GwHoMl+hQ/Ps7C6nE
X-Developer-Key: i=Andy.Chung@amd.com; a=ed25519;
 pk=X2gaHRnhU2q5hvMjkC6xmIcC03vKNvHY9CQRdsj9ecM=
X-Endpoint-Received: by B4 Relay for Andy.Chung@amd.com/20260327 with
 auth_id=696
X-Original-From: Andy Chung <Andy.Chung@amd.com>
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
Reply-To: Andy.Chung@amd.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Andy Chung <Andy.Chung@amd.com>

Add the mctp-controller property to enable frontend NIC management
via PLDM over MCTP.
Also add EEPROM device for NIC FRU.

Signed-off-by: Andy Chung <Andy.Chung@amd.com>
---
Add the mctp-controller property to enable frontend NIC management
via PLDM over MCTP.
Also add EEPROM device for NIC FRU.
---
 .../dts/aspeed/aspeed-bmc-facebook-anacapa.dts     | 67 +++++++++++++++++++++-
 1 file changed, 65 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 221af858cb6b..138b081be049 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -584,38 +584,67 @@ eeprom@56 {
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
 			#address-cells = <1>;
 			#size-cells = <0>;
+			mctp-controller;
 		};
 		i2c10mux0ch1: i2c@1 {
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
@@ -661,38 +690,72 @@ i2c10mux0ch7: i2c@7 {
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

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260327-dts_enable_nic_mctp-e35a5765b176

Best regards,
--  
Andy Chung <Andy.Chung@amd.com>



