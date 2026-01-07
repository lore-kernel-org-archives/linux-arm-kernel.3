Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6261BCF6BE3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 02:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i5sHx3KtRSUp3oHYQEgObhp1BHeEQAZqhMRm2LyWYOY=; b=gbyh2907cyxb81cnQm2uSSg0DX
	YLuqO464dwODwYq7H440NiTLduxMdRTApCEPb4ZnukKcj6W4E3eKZysQrHuAcjue6wMuZWeHBrief
	8L/HfyyuIzhe2qZFX5qeJ6Db/XqHzM805+NLT4Vbu788tkWUsOVlrrdqCS51Ni12CKP7Mt8PnlPjC
	13J8cPku1+NMIZuqKdIU1w+7mNg9KOuN74kSoEGqITezmQbtLcpXKOMUxRT/diAMxza/OORq89GnA
	Tk63FvFA+EpPpp7Eoq4C6U6HeBYciyQMAnlgxXbKtgWK0YXFDL9UEo9tOuNvvjDLUf3OYGgEUcI3S
	Y7DbrFNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJ09-0000000E2Lq-42Hm;
	Wed, 07 Jan 2026 02:10:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJ01-0000000E2AY-0VzU;
	Wed, 07 Jan 2026 02:10:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0224843F7D;
	Wed,  7 Jan 2026 02:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1A48C19423;
	Wed,  7 Jan 2026 02:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767751812;
	bh=12eYzsY+uCcWiQdHRuMZK9/t3j//pTN38HKrXY+KR2E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Usl63sWn5EWV90FhPkXbzNjnocqFsBo7qSWHdI8jaMD3wCF9ACVYM4DkSNXTzyV5s
	 +4U0TyQ9cJLXwH4clvS+ezJp6tOng9EEnYWNQHCPqhULs6tbiDk0jha8I5P4K9V//l
	 Cthzzsgv5NjLL44D2TiraRGkyoP/gX54pLTG1zydb5ZNPsgdkJ3GhYAKr/vCiTnJsH
	 svMM8j1gMvSWelCmi24qdMOnlFWY2BLHim1hzLAUwtfWW7dtVanmGJgXu71JQRW2QM
	 3VFxWfsCCOlMeaUV3YE/SYVlHiqb+ftNaMnV2Hr6hwr0nc9m8EZlYWwbdcTIrqMdsj
	 1QBjMpI3m9TuA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 06 Jan 2026 20:09:45 -0600
Subject: [PATCH 06/13] arm64: dts: broadcom: stingray: Fix 'simple-bus'
 node names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-dt-dtbs-broadcom-fixes-v1-6-ba45874e4553@kernel.org>
References: <20260106-dt-dtbs-broadcom-fixes-v1-0-ba45874e4553@kernel.org>
In-Reply-To: <20260106-dt-dtbs-broadcom-fixes-v1-0-ba45874e4553@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_181013_238320_AE2BB7B2 
X-CRM114-Status: GOOD (  10.65  )
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

Fix 'simple-bus' node names to follow the defined pattern. Nodes with 'reg'
or 'ranges' addresses should also have a unit-address.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../arm64/boot/dts/broadcom/stingray/stingray-fs4.dtsi |  2 +-
 .../boot/dts/broadcom/stingray/stingray-pcie.dtsi      |  2 +-
 .../arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi |  2 +-
 arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi    | 18 +++++++++---------
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray-fs4.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray-fs4.dtsi
index 9666969c8c88..cf3cb9199ce4 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray-fs4.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray-fs4.dtsi
@@ -30,7 +30,7 @@
  *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 
-	fs4: fs4 {
+	fs4: fs4-bus@67000000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray-pcie.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray-pcie.dtsi
index 663e51756746..fbb2621d1b29 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray-pcie.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray-pcie.dtsi
@@ -38,7 +38,7 @@ pcie8: pcie@60400000 {
 	phy-names = "pcie-phy";
 };
 
-pcie-ss {
+pcie-ss-bus@40000000 {
 	compatible = "simple-bus";
 	#address-cells = <1>;
 	#size-cells = <1>;
diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi
index 3fa9e57185b2..850988287e48 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi
@@ -2,7 +2,7 @@
 /*
  *Copyright(c) 2018 Broadcom
  */
-	usb {
+	usb-bus@68500000 {
 		compatible = "simple-bus";
 		#address-cells = <2>;
 		#size-cells = <2>;
diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
index 9b015b8e1bb1..f9f77b2639c5 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
@@ -199,7 +199,7 @@ hsls_25m_div2_clk: clock-12500000 {
 		clock-mult = <1>;
 	};
 
-	scr {
+	scr-bus@61000000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -303,7 +303,7 @@ smmu: iommu@3000000 {
 		};
 	};
 
-	crmu: crmu {
+	crmu: crmu-bus@66400000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -412,7 +412,7 @@ gpio_crmu: gpio@24800 {
 	#include "stingray-pcie.dtsi"
 	#include "stingray-usb.dtsi"
 
-	hsls {
+	hsls-bus@68900000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -725,7 +725,7 @@ sdio1: sdhci@3f2000 {
 		};
 	};
 
-	tmons {
+	tmons-bus@8f100000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -814,18 +814,18 @@ cpu-crit {
 		};
 	};
 
-	nic-hsls {
+	nic-hsls-bus@60800000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-		ranges = <0x0 0x0  0x0 0x7fffffff>;
+		ranges = <0x0 0x0 0x60800000 0x6fffff>;
 
-		nic_i2c0: i2c@60826100 {
+		nic_i2c0: i2c@26100 {
 			compatible = "brcm,iproc-nic-i2c";
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <0x60826100 0x100>,
-			      <0x60e00408 0x1000>;
+			reg = <0x026100 0x100>,
+			      <0x600408 0x1000>;
 			brcm,ape-hsls-addr-mask = <0x03400000>;
 			clock-frequency = <100000>;
 			status = "disabled";

-- 
2.51.0


