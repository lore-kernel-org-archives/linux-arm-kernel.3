Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E899D68BCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 19:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8JP6bopcCzb+sjhLVk40EcAwxJ9I5Dmd73E18/FnEQE=; b=Kz+BP2Jmi2hEWC5XXstrrNgTXr
	LA2jglk4err3r8D0T/PCcf/o1EQWOlwOb66hPseXhxbFsrb1LcbOnd++o4bp28dCtREPFSExjdME7
	YQjcTTk4FXjtxc9lA+3v6xpi3GdruiR72ozbmEWTFmb353GB6Of8RUb/F2+n3st17Zx9JYtTzhtBy
	lsHvMD3IOo7oxf9MJb43FlHIfH70deN9A6FLqfysgnYLnTGvcPRK/vHMdNTY5Ixyx3uyaKQeSWGF8
	yDKgq4K02K1eL3LcaQNLxvf4sVDk9WAOoHi+Q7rxvJDrMsgOiFW12eQMuxenkOkjbG3VCrvHOEces
	cdv4MGQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC2CO-00000003tmg-2os9;
	Fri, 15 Nov 2024 19:41:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC29u-00000003sz1-41jr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 19:39:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 388D85C5808;
	Fri, 15 Nov 2024 19:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E96DFC4CECF;
	Fri, 15 Nov 2024 19:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731699550;
	bh=ZgK5lNGMN4OonmhY1/VBlb02ULM6gIQ2UorUmZYTdgo=;
	h=From:To:Cc:Subject:Date:From;
	b=PKkE6O4Jk4FaZZrNimzqApd4wdNSxTnM/vNaJAA4gSm9XFAIVR5fJBpxGQcmSyRK2
	 DZcIQuIWLmuMjFWhlWEfj0lNV9gnqQY1OH+IFZSzKo59Zpei5WC4dDugtZkN4iftiK
	 p5m2sOg8Tx5BC8yw/5cgD2D0ocVRjA4EtYrewSXYz5YOXPxmQ/G/xUWHErH3gR/j2w
	 3SnFB7YaS25R4lk1NXYWi38eNN5Y/Ty6zHK+PIwURZv1F8uxDh6zXC/LFo+Vmjnivn
	 dKxYR5p/SX8venYlitFcAsXd8r7fnX7b8pyYyTlmWC27alGlycvkTvQyBkGXfTNtn2
	 J1rgV0ADJe0Zw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm: dts: broadcom: Remove unused and undocumented properties
Date: Fri, 15 Nov 2024 13:39:01 -0600
Message-ID: <20241115193904.3624350-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_113911_083812_FDE725D4 
X-CRM114-Status: UNSURE (   9.31  )
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

Remove properties which are both unused in the kernel and undocumented.
Most likely they are leftovers from downstream.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/broadcom/bcm53340-ubnt-unifi-switch8.dts | 1 -
 arch/arm/boot/dts/broadcom/bcm953012hr.dts                 | 1 -
 arch/arm/boot/dts/broadcom/bcm953012k.dts                  | 1 -
 arch/arm/boot/dts/broadcom/bcm958522er.dts                 | 1 -
 arch/arm/boot/dts/broadcom/bcm958525er.dts                 | 1 -
 arch/arm/boot/dts/broadcom/bcm958525xmc.dts                | 1 -
 arch/arm/boot/dts/broadcom/bcm958622hr.dts                 | 1 -
 arch/arm/boot/dts/broadcom/bcm958623hr.dts                 | 1 -
 arch/arm/boot/dts/broadcom/bcm958625hr.dts                 | 1 -
 arch/arm/boot/dts/broadcom/bcm958625k.dts                  | 1 -
 arch/arm/boot/dts/broadcom/bcm988312hr.dts                 | 1 -
 11 files changed, 11 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm53340-ubnt-unifi-switch8.dts b/arch/arm/boot/dts/broadcom/bcm53340-ubnt-unifi-switch8.dts
index 975f854f652f..08cf1220b655 100644
--- a/arch/arm/boot/dts/broadcom/bcm53340-ubnt-unifi-switch8.dts
+++ b/arch/arm/boot/dts/broadcom/bcm53340-ubnt-unifi-switch8.dts
@@ -32,7 +32,6 @@ &uart1 {
 
 &qspi {
 	status = "okay";
-	bspi-sel = <0>;
 
 	flash: flash@0 {
 		compatible = "m25p80";
diff --git a/arch/arm/boot/dts/broadcom/bcm953012hr.dts b/arch/arm/boot/dts/broadcom/bcm953012hr.dts
index b070b69466bd..b728cd54715e 100644
--- a/arch/arm/boot/dts/broadcom/bcm953012hr.dts
+++ b/arch/arm/boot/dts/broadcom/bcm953012hr.dts
@@ -74,7 +74,6 @@ partition@1000000 {
 &spi_nor {
 	status = "okay";
 	spi-max-frequency = <62500000>;
-	m25p,default-addr-width = <3>;
 
 	#address-cells = <1>;
 	#size-cells = <1>;
diff --git a/arch/arm/boot/dts/broadcom/bcm953012k.dts b/arch/arm/boot/dts/broadcom/bcm953012k.dts
index f1e6bcaa1edd..27c0992f1855 100644
--- a/arch/arm/boot/dts/broadcom/bcm953012k.dts
+++ b/arch/arm/boot/dts/broadcom/bcm953012k.dts
@@ -84,7 +84,6 @@ partition@1000000 {
 &spi_nor {
 	status = "okay";
 	spi-max-frequency = <62500000>;
-	m25p,default-addr-width = <3>;
 
 	#address-cells = <1>;
 	#size-cells = <1>;
diff --git a/arch/arm/boot/dts/broadcom/bcm958522er.dts b/arch/arm/boot/dts/broadcom/bcm958522er.dts
index 15f023656df0..2f20f86bd31c 100644
--- a/arch/arm/boot/dts/broadcom/bcm958522er.dts
+++ b/arch/arm/boot/dts/broadcom/bcm958522er.dts
@@ -135,7 +135,6 @@ nand_sel: nand_sel {
 
 &qspi {
 	status = "okay";
-	bspi-sel = <0>;
 	flash: flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm/boot/dts/broadcom/bcm958525er.dts b/arch/arm/boot/dts/broadcom/bcm958525er.dts
index 9b9c225a1fb3..980c03f74a19 100644
--- a/arch/arm/boot/dts/broadcom/bcm958525er.dts
+++ b/arch/arm/boot/dts/broadcom/bcm958525er.dts
@@ -135,7 +135,6 @@ nand_sel: nand_sel {
 
 &qspi {
 	status = "okay";
-	bspi-sel = <0>;
 	flash: flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm/boot/dts/broadcom/bcm958525xmc.dts b/arch/arm/boot/dts/broadcom/bcm958525xmc.dts
index ca9311452739..440bb2d617f2 100644
--- a/arch/arm/boot/dts/broadcom/bcm958525xmc.dts
+++ b/arch/arm/boot/dts/broadcom/bcm958525xmc.dts
@@ -151,7 +151,6 @@ nand_sel: nand_sel {
 
 &qspi {
 	status = "okay";
-	bspi-sel = <0>;
 	flash: flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm/boot/dts/broadcom/bcm958622hr.dts b/arch/arm/boot/dts/broadcom/bcm958622hr.dts
index 9db3c851451a..116f3a7c3bc6 100644
--- a/arch/arm/boot/dts/broadcom/bcm958622hr.dts
+++ b/arch/arm/boot/dts/broadcom/bcm958622hr.dts
@@ -139,7 +139,6 @@ nand_sel: nand_sel {
 
 &qspi {
 	status = "okay";
-	bspi-sel = <0>;
 	flash: flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm/boot/dts/broadcom/bcm958623hr.dts b/arch/arm/boot/dts/broadcom/bcm958623hr.dts
index 32786e7c4e12..fc6ab73ecf56 100644
--- a/arch/arm/boot/dts/broadcom/bcm958623hr.dts
+++ b/arch/arm/boot/dts/broadcom/bcm958623hr.dts
@@ -143,7 +143,6 @@ &sata_phy0 {
 
 &qspi {
 	status = "okay";
-	bspi-sel = <0>;
 	flash: flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm/boot/dts/broadcom/bcm958625hr.dts b/arch/arm/boot/dts/broadcom/bcm958625hr.dts
index 74263d98de73..a9b6aa04d573 100644
--- a/arch/arm/boot/dts/broadcom/bcm958625hr.dts
+++ b/arch/arm/boot/dts/broadcom/bcm958625hr.dts
@@ -150,7 +150,6 @@ nand_sel: nand_sel {
 
 &qspi {
 	status = "okay";
-	bspi-sel = <0>;
 	flash: flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm/boot/dts/broadcom/bcm958625k.dts b/arch/arm/boot/dts/broadcom/bcm958625k.dts
index 69ebc7a913a7..7996116fc923 100644
--- a/arch/arm/boot/dts/broadcom/bcm958625k.dts
+++ b/arch/arm/boot/dts/broadcom/bcm958625k.dts
@@ -154,7 +154,6 @@ &pwm {
 
 &qspi {
 	status = "okay";
-	bspi-sel = <0>;
 	flash: flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm/boot/dts/broadcom/bcm988312hr.dts b/arch/arm/boot/dts/broadcom/bcm988312hr.dts
index e96bc3f2d5cf..663a3f27b6e4 100644
--- a/arch/arm/boot/dts/broadcom/bcm988312hr.dts
+++ b/arch/arm/boot/dts/broadcom/bcm988312hr.dts
@@ -139,7 +139,6 @@ nand_sel: nand_sel {
 
 &qspi {
 	status = "okay";
-	bspi-sel = <0>;
 	flash: flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.45.2


