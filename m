Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6524CEFD12
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 21:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7AvG0msAbo2Y83aHAD2fhIUaGZrg+4t+Ti3xDsgkl6M=; b=VCgRleKOkupMkzdmI5qgO5gfHN
	L2QnTen0SYuAT6B0WYUTskYkkU4uaUFeknw8VnJbcDhBBuEJ+c4mdIWGuBqtR1P7l0g4lffaI0GoK
	8v1QNuoldjYxJAlWkiFLzIdUq5P8TomB3Z3phAONxUQ0dgIo6oaJbtKkkvsnRAaGa9BYMlU7JFEYR
	38pRHGKWvy2UsrOgXTkmQ7HvqqTiAClvoYr97cso3za/dVBelLiY0n4aFRIeyK0TStOe+rop56pSJ
	Bmg4NTBOOK8xFJTUFZndgAgbX7dozF3vyWmynYipo+4JnYv8KgKsk0XithP9pkDJ1QThxRxFPeJts
	pkJGXiWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdEen-0000000Ds4v-2CSr;
	Tue, 06 Jan 2026 21:32:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdEek-0000000Ds4X-2fZh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 21:31:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A5EDF43D26;
	Tue,  6 Jan 2026 21:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C3B4C116C6;
	Tue,  6 Jan 2026 21:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767735117;
	bh=c0S+UPILWQZ/bfTmY0vB12LguAXEd/SuBL+v3igeD1U=;
	h=From:To:Cc:Subject:Date:From;
	b=jL0mkEceaEmkQMi7RsnupTDbuwGDxnHWFEKBV4+1cihn6nHCd/hFhNNB1wWCV9Ms4
	 P9jdDj+Wd8VqHCbvQC70qQtN87CwUjSn5VBRysgkS3WD6zj1DvVLO0V/Lcgw6pSbEP
	 7WOfcUjN4vzFaG+RAs3lt5z5OUHopp0yTgnmQ6a91LATBLhEpOpjSiREDn5/pjsm/U
	 xwNjsv+xwgWse8vlOQq1uY5ssLSoyUApBxTrcuVzs5NYxrW44qFLBQXME/MA5qBua5
	 DkO+SWgfJshZc36iavjQOJCw9cBWHO3EBrrQyyBwfgoLj6UngEpB3WZ3vgxOqjULUy
	 8UvbOFtZN+znQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Eddie James <eajames@linux.ibm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: aspeed: ibm: Use non-deprecated AT25 properties
Date: Tue,  6 Jan 2026 15:31:51 -0600
Message-ID: <20260106213153.2766411-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_133158_714470_B616022C 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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

The at25,* properties have been deprecated since 2012. These platforms
weren't upstream until 2020 and 2023, so it should be safe to switch
over to the "new" properties and just drop the deprecated ones.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../dts/aspeed/aspeed-bmc-ibm-everest.dts     | 128 +++++++++---------
 .../arm/boot/dts/aspeed/ibm-power10-dual.dtsi |  64 ++++-----
 .../arm/boot/dts/aspeed/ibm-power10-quad.dtsi |  64 ++++-----
 3 files changed, 128 insertions(+), 128 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
index 5a0975d52492..561633d31039 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
@@ -2806,13 +2806,13 @@ cfam4_spi0: spi@0 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 
@@ -2823,13 +2823,13 @@ cfam4_spi1: spi@20 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 
@@ -2840,13 +2840,13 @@ cfam4_spi2: spi@40 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 
@@ -2857,13 +2857,13 @@ cfam4_spi3: spi@60 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 		};
@@ -3181,13 +3181,13 @@ cfam5_spi0: spi@0 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 
@@ -3198,13 +3198,13 @@ cfam5_spi1: spi@20 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 
@@ -3215,13 +3215,13 @@ cfam5_spi2: spi@40 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 
@@ -3232,13 +3232,13 @@ cfam5_spi3: spi@60 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 		};
@@ -3556,13 +3556,13 @@ cfam6_spi0: spi@0 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 
@@ -3573,13 +3573,13 @@ cfam6_spi1: spi@20 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 
@@ -3590,13 +3590,13 @@ cfam6_spi2: spi@40 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 
@@ -3607,13 +3607,13 @@ cfam6_spi3: spi@60 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 		};
@@ -3931,13 +3931,13 @@ cfam7_spi0: spi@0 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 
@@ -3948,13 +3948,13 @@ cfam7_spi1: spi@20 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 
@@ -3965,13 +3965,13 @@ cfam7_spi2: spi@40 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 
@@ -3982,13 +3982,13 @@ cfam7_spi3: spi@60 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 		};
diff --git a/arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi b/arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi
index 06fac236773f..79eaf442c5bf 100644
--- a/arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi
+++ b/arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi
@@ -88,13 +88,13 @@ cfam0_spi0: spi@0 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 
@@ -105,13 +105,13 @@ cfam0_spi1: spi@20 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 
@@ -122,13 +122,13 @@ cfam0_spi2: spi@40 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 
@@ -139,13 +139,13 @@ cfam0_spi3: spi@60 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 		};
@@ -257,13 +257,13 @@ cfam1_spi0: spi@0 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 
@@ -274,13 +274,13 @@ cfam1_spi1: spi@20 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 
@@ -291,13 +291,13 @@ cfam1_spi2: spi@40 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 
@@ -308,13 +308,13 @@ cfam1_spi3: spi@60 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 		};
diff --git a/arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi b/arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi
index 9501f66d0030..a54be7d0af0b 100644
--- a/arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi
+++ b/arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi
@@ -739,13 +739,13 @@ cfam2_spi0: spi@0 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 
@@ -756,13 +756,13 @@ cfam2_spi1: spi@20 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 
@@ -773,13 +773,13 @@ cfam2_spi2: spi@40 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 
@@ -790,13 +790,13 @@ cfam2_spi3: spi@60 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 		};
@@ -1114,13 +1114,13 @@ cfam3_spi0: spi@0 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 
@@ -1131,13 +1131,13 @@ cfam3_spi1: spi@20 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 
@@ -1148,13 +1148,13 @@ cfam3_spi2: spi@40 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 
@@ -1165,13 +1165,13 @@ cfam3_spi3: spi@60 {
 				#size-cells = <0>;
 
 				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
 					compatible = "atmel,at25";
 					reg = <0>;
 					spi-max-frequency = <1000000>;
+
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
 				};
 			};
 		};
-- 
2.51.0


