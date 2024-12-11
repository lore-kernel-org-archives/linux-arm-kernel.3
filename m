Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707E8E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 20:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vUZouHY51dv6HhTZgqqmU/lpMVbWxcnkaVUPPMXUAZE=; b=k3PJTKfpoAdERKXp2v4LacuxdG
	NTxdk+QNba8uMWDpssIITUBw42Ca6f3d6EgyNPH3bGyVCTn1h/WG3x78Is5NlzSp6Lul23OgZ5+nm
	vU/ldRElr5+HX1jzDCwEMAxydyz3rYwxqg1ZN7AcSopEtBaC2uZtPtCSAuYU4JZs7Svq5Uq42FTay
	2GHUT6wcJ7MM1PkIHPHrPcphqtP9cl+dS9Ix+vTG+VY4BQJhR2Lifv6dgS48lgpUZNGLczIjTzeup
	jnc4sp5hIzBa8WoFOnGjbNrdXYXaeX822ARwLPE+t/myA73E5/ond5xqF/uKCstpYqA7Ycdj8uWpX
	gMBBqBBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLTXB-0000000G3PD-0a0t;
	Wed, 11 Dec 2024 20:42:13 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLTW2-0000000G3DS-0x7i;
	Wed, 11 Dec 2024 20:41:07 +0000
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1733949659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vUZouHY51dv6HhTZgqqmU/lpMVbWxcnkaVUPPMXUAZE=;
	b=jAc4zyL4AS+0IZUZUCfQT5892wMBNOB7of3Yw0n+Fwb3yT3HYETJNSCzHAwl1Ec9XVvYNx
	U6TdHs4Ev2HbQL7vZUkxLuq2IGqRvbZ8MdLYhmdQEOeTF9G4Fa11bLkKyLGc5lndcVYaP3
	ouEI7hZUp7wBpU4utxaPigCjquCxzpVXbJzPT/k6pGBEUsr1fADPteBsGFbup2WMUVhSjS
	xKUq7j3yi0bvEFuXtuKgv+8sxKM3mnhwGe9ogPw3H7858COKxngjqsedRiFDmr4/TMdQeK
	hOWn/d9msKePGM1IC7gHTXUlygs50diCV5wzRcuXToYD9vvaIO8sREMK3YavTg==
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH v2] arm64: dts: rockchip: Delete redundant RK3328 GMAC stability fixes
Date: Wed, 11 Dec 2024 21:40:52 +0100
Message-Id: <fe05ecccc9fe27a678ad3e700ea022429f659724.1733943615.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_124102_614075_E06695D6 
X-CRM114-Status: GOOD (  11.83  )
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

Since the commit 8a469ee35606 ("arm64: dts: rockchip: Add txpbl node for
RK3399/RK3328"), having "snps,txpbl" properties defined as Ethernet stability
fixes in RK3328-based board dts(i) files is redundant, because that commit
added the required fix to the RK3328 SoC dtsi, so let's delete them.

It has been determined that the Ethernet stability fixes no longer require
"snps,rxpbl", "snps,aal" and "snps,force_thresh_dma_mode" properties, [1][2]
out of which the last two also induce performance penalties, so let's delete
these properties from the relevant RK3328-based board dts(i) files.

This commit completes the removal of these redundant "snps,*" DT properties
that was started by a patch from Peter Geis. [3]

[1] https://lore.kernel.org/linux-rockchip/CAMdYzYpj3d7Rq0O0QjV4r6HEf_e07R0QAhPT2NheZdQV3TnQ6g@mail.gmail.com/
[2] https://lore.kernel.org/linux-rockchip/CAMdYzYpnx=pHJ+oqshgfZFp=Mfqp3TcMmEForqJ+s9KuhkgnqA@mail.gmail.com/
[3] https://lore.kernel.org/linux-rockchip/20241210013010.81257-7-pgwipeout@gmail.com/

Cc: Peter Geis <pgwipeout@gmail.com>
Acked-by: Peter Geis <pgwipeout@gmail.com>
Signed-off-by: Dragan Simic <dsimic@manjaro.org>
---

Notes:
    Changes in v2:
      - Added "snps,force_thresh_dma_mode" to the set of redundant properties
        deleted from RK3328 board dts(i) files, as suggested by Peter, [2] and
        updated the patch description to reflect the set extension
      - Collected Acked-by tag from Peter [2]
    
    Link to v1: https://lore.kernel.org/linux-rockchip/e00f08d2351e82d6acd56271a68c7ed05b3362e8.1733901896.git.dsimic@manjaro.org/T/#u

 arch/arm64/boot/dts/rockchip/rk3328-a1.dts                | 1 -
 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2.dtsi        | 1 -
 arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi | 1 -
 arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts         | 3 ---
 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts            | 1 -
 5 files changed, 7 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-a1.dts b/arch/arm64/boot/dts/rockchip/rk3328-a1.dts
index 824183e515da..24baaa7f1d8c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-a1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-a1.dts
@@ -110,7 +110,6 @@ &gmac2io {
 	phy-supply = <&vcc_io>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&rgmiim1_pins>;
-	snps,aal;
 	snps,pbl = <0x4>;
 	tx_delay = <0x26>;
 	rx_delay = <0x11>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2.dtsi b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2.dtsi
index f9fab35aed23..d5f129e304e5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2.dtsi
@@ -142,7 +142,6 @@ &gmac2io {
 	phy-supply = <&vcc_io_33>;
 	pinctrl-0 = <&rgmiim1_pins>;
 	pinctrl-names = "default";
-	snps,aal;
 
 	mdio {
 		compatible = "snps,dwmac-mdio";
diff --git a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
index 181ec6de0019..9ec93f61433e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
@@ -113,7 +113,6 @@ &gmac2io {
 	phy-supply = <&vcc_io>;
 	pinctrl-0 = <&rgmiim1_pins>;
 	pinctrl-names = "default";
-	snps,aal;
 
 	mdio {
 		compatible = "snps,dwmac-mdio";
diff --git a/arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts b/arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts
index 3e08e2fd0a78..59dead1cc503 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts
@@ -153,9 +153,6 @@ &gmac2io {
 	phy-supply = <&vcc_io>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&rgmiim1_pins>;
-	snps,aal;
-	snps,rxpbl = <0x4>;
-	snps,txpbl = <0x4>;
 	tx_delay = <0x26>;
 	rx_delay = <0x11>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts b/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
index 90fef766f3ae..2ed602d44ec8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
@@ -144,7 +144,6 @@ &gmac2io {
 	phy-mode = "rgmii";
 	pinctrl-names = "default";
 	pinctrl-0 = <&rgmiim1_pins>;
-	snps,force_thresh_dma_mode;
 	snps,reset-gpio = <&gpio1 RK_PC2 GPIO_ACTIVE_LOW>;
 	snps,reset-active-low;
 	snps,reset-delays-us = <0 10000 50000>;

