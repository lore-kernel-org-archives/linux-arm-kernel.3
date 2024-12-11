Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F8CE77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 07:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hSvPaPYTDrhaxeXHOjgIwmnYGfYQBlYwxY0RwWwuTDc=; b=LgWnay+jbYMQ2V0KNDN7iqZffd
	r7zNrMvju/Flit8v0FMWg4Xvr0DxXkP1LlM0eg/p3kaq4Z4rAod+NS5V2LJWCrze5t1D9+rBmOXWU
	4XbxPRm2lmhfzf+CLBJgDjco89qekrRfznxwWuM3fCt6DWCdyLFb7+irJJlepKAWOm65aV2IXmaPi
	d+OcbvLOnM6yoTHTiN3OJmk48lOKlYMlEUW2XMJ4ZhuBjM4bLePukVw90BM1EhWY7T9dNulPakGOe
	SMvgJLKQgOLovmuGv7hcpX3za3+2FG6j96AjWXp9zUbQ4xJENR3r4/RMFK6U3g7NLyxUYp8hjeKIi
	kAwSiCcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLHBH-0000000E3oZ-33J0;
	Wed, 11 Dec 2024 07:30:47 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLHAD-0000000E3VC-0fB5;
	Wed, 11 Dec 2024 07:29:42 +0000
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1733902179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hSvPaPYTDrhaxeXHOjgIwmnYGfYQBlYwxY0RwWwuTDc=;
	b=rG4dnS5y6JnYoM1DAPyUi8dQvdMTe4IKS8rR8evqzGQHVFSLrYV8R2cuG4NLsht7d//3sm
	nSxum/OIHO7IS/2w7w2xwLr/jk0b/CBI9XUfszoDHQAV0vQM+t5fqw9yLB8ArUgHcwwlSH
	6pSncdl6KmtufzEsEIODza0Q++MRWr/MXivVowlvAXnwH9N7AlgERmokJR/rTdEctr06wp
	WQUaGzWo4bVgHuUic/iO1exwpUvlgkwBVRRD3TcOAcJxYnQrmiRi07QTum0mezA1Pqajik
	McBCzIm9e+9r3C32AcsgdRvVkBOFWzlOWr2QEPezozMRXlimU3leYjMHT34fhw==
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: Delete redundant RK3328 GMAC stability fixes
Date: Wed, 11 Dec 2024 08:29:32 +0100
Message-Id: <e00f08d2351e82d6acd56271a68c7ed05b3362e8.1733901896.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_232941_481325_8DEE610B 
X-CRM114-Status: GOOD (  10.33  )
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
the "snps,rxpbl" and "snps,aal" properties, [1] out of which the latter also
induces performance penalties, so let's delete these properties from the
relevant RK3328-based board dts(i) files.

This commit completes the removal of these redundant "snps,*" properties
that was started by a patch from Peter Geis. [2]

[1] https://lore.kernel.org/linux-rockchip/CAMdYzYpj3d7Rq0O0QjV4r6HEf_e07R0QAhPT2NheZdQV3TnQ6g@mail.gmail.com/
[2] https://lore.kernel.org/linux-rockchip/20241210013010.81257-7-pgwipeout@gmail.com/

Cc: Peter Geis <pgwipeout@gmail.com>
Signed-off-by: Dragan Simic <dsimic@manjaro.org>
---
 arch/arm64/boot/dts/rockchip/rk3328-a1.dts                | 1 -
 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2.dtsi        | 1 -
 arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi | 1 -
 arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts         | 3 ---
 4 files changed, 6 deletions(-)

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

