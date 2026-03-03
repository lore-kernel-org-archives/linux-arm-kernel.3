Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6F3EDA68E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 15:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jHzhCH9/GEBSd2c47WYcZuCUD+mIVq/xYp6Uf0oWzLs=; b=IoNgGwZMeHyI294A3AlRQfI28n
	7udqodb7xmclhNa7xjIHUpnsX9C2jzK4NTgAdfIWWNtDZ/KAnMmmxPwYdibQ7A8p/1+fNltemHQe6
	EScmHiZnDn5HvcTcwe9FwFTEVMH9fKPhWeBZG9imKwOUHPTz2wW7JNYVt5g4SBjplo7c4AERmTpiv
	jYPk2pvP/1OGoL7eqKzswGUJqmSMrdTG+2v4iLyhv6PQMTOH+ZvSnD4hs/ag6cIo06pQYhAK6uu2v
	6UKMjuwqOhAPXKdiSVTzOnYW9RV04mhoJ9YU7lMmm9X80PNPvwQ65zSNbTg0Q6YWOMhQkE6WKg3A1
	8H/hkzRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRxw-0000000FSNF-1nXR;
	Tue, 03 Mar 2026 15:47:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRxs-0000000FSJ7-410Q;
	Tue, 03 Mar 2026 15:47:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E34BA44466;
	Tue,  3 Mar 2026 15:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C197DC2BCB0;
	Tue,  3 Mar 2026 15:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772552835;
	bh=WpK6TM64+IkP3lExn7Vbp3PoT5WVThNQ5k9ZpE2jVJc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iBL7OGdSTGtCmYDCXcmzZ8PpgPoxXEorCWhGhusawUO8wc6LTyjTttqgwNis7gmhL
	 lKMJYNgTd2R3wEpu0SsJxV5iWBH1KN+gVvG9Oz7dt6QRufHdo401KGczLbjhN+Stk2
	 L8wnvtJj9oRz5EHD2RyORZR8YjJf4rZ+BvzKDPBLtK2D81JMFrLrAO1ktRqae10Vg1
	 s6FH6yZvMj9rkkndz+MgCUB90uxbQJaj2/xznnKj1YJetOKf4FGCJ6FX8yIpgxjcaA
	 KBGh6cFTZXj2K9rZ2vYLFsyMyaE0bcz6cAcy7vqhvfbHuwXFXO0LP9k5tTGgeKgHKn
	 7rI86VtsCryjg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F4CEDA68E;
	Tue,  3 Mar 2026 15:47:15 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 03 Mar 2026 16:47:15 +0100
Subject: [PATCH v2 2/3] arm64: dts: rockchip: Use reference PCIe clock
 generator for BPI-R2-Pro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-rk3568-bri-r2-pro-fix-pcie-v2-2-04665e55d5a8@ixit.cz>
References: <20260303-rk3568-bri-r2-pro-fix-pcie-v2-0-04665e55d5a8@ixit.cz>
In-Reply-To: <20260303-rk3568-bri-r2-pro-fix-pcie-v2-0-04665e55d5a8@ixit.cz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Martin Filla <freebsd@sysctl.cz>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3494; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=fmz8BMbZFzyFiwv7LpD6cohFb+ECwAt+N054XIm/Qc8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBppwKC07PB66EJZALmmA2MuLEZkOlZmUGkDjifm
 cRbOORhdMqJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaacCggAKCRBgAj/E00kg
 crzPD/9zK+HOjFGvlOcg06a70OOVQKOtQHl0mUL4O/RweCi8gkblwz53Ux1NvfvZm9sCmj6uJvc
 KH4dHfZbJ+jH4kjGaxRr8K8TxwJp6q5iDQrr4LnTii8f3Qdlx83UP8gfCgPYYWvfVUNqRgvgqj7
 bWTBb88L5me0cIgQesJyGQ5rOqg3WVZxEtjZNDoa8NMD30nqNNZirhMfryhxqnLt0MTyayvpViM
 LTGPPGJwRvYEGmaUxsDy53zd0LWBnQF+4bO9/EcrYTbt0Hw07yf1CdE/Ln791BTWhWYCSiVaqxP
 I/ojgjms5hmZDtEitw2m1ZY/LR3nHlCGQ1CJHnXYDGa3G1/xb/0R5uq8sdiVp5KZzg6MHwu9VXI
 PWV2SH/n4CI6WZKm5UZYcOJJl2DcOT1lnq6wRFsSfzLScQ+AEUjHh1ZzYvC15P+k0qSwjmJ7X5B
 8fXBWU5cRICI/kHjMUb7IzNaeSPMxhQyaHz1StoypBjIOqfn8tCxMxZnIf7k7Rvj+6WNtYMb8gm
 OklyP4HKLPPjvGTwX05aNi9tjK4lE/RcWsBC5DRKcZHasJaFd9YqC4N02FkoZLwYJBRy4UJxCUB
 qQyMFiTpBzz84Bk5ke1WQO/XBY5Goe7Jizb09sy23H7YOc4VKlyQ+HVpZuN21X3fYj216mIseCZ
 UQX0T+KwGJ9o2QA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_074717_052042_42DD21C9 
X-CRM114-Status: GOOD (  11.80  )
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: David Heidelberg <david@ixit.cz>

Describe properly PCIe clock, which allows us correct the
toplogy (removing the vcc3v3-{minipcie,ngff} dependency on pi6c as
supply) and adding the clock dependency in the PCIe nodes.

Suggested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Martin Filla <freebsd@sysctl.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts | 45 +++++++++++++++-------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
index d02b82c5f979a..a071cb67579c4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
@@ -120,18 +120,13 @@ pcie_refclk_gen: pcie-refclk-gen-clock {
 		clock-frequency = <100000000>;
 	};
 
-	vcc3v3_pi6c_05: regulator-vcc3v3-pi6c-05 {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc3v3_pcie";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		enable-active-high;
-		gpios = <&gpio0 RK_PD4 GPIO_ACTIVE_HIGH>;
-		startup-delay-us = <200000>;
-		vin-supply = <&vcc5v0_sys>;
+	pcie_refclk: pcie-refclk-clock {
+		compatible = "gpio-gate-clock";
+		clocks = <&pcie_refclk_gen>;
+		#clock-cells = <0>;
+		enable-gpios = <&gpio0 RK_PD4 GPIO_ACTIVE_HIGH>;
 	};
 
-	/* actually fed by vcc3v3_sys, dependent on pi6c clock generator */
 	vcc3v3_minipcie: regulator-vcc3v3-minipcie {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc3v3_minipcie";
@@ -142,10 +137,9 @@ vcc3v3_minipcie: regulator-vcc3v3-minipcie {
 		pinctrl-names = "default";
 		pinctrl-0 = <&minipcie_enable_h>;
 		startup-delay-us = <50000>;
-		vin-supply = <&vcc3v3_pi6c_05>;
+		vin-supply = <&vcc3v3_sys>;
 	};
 
-	/* actually fed by vcc3v3_sys, dependent on pi6c clock generator */
 	vcc3v3_ngff: regulator-vcc3v3-ngff {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc3v3_ngff";
@@ -156,7 +150,7 @@ vcc3v3_ngff: regulator-vcc3v3-ngff {
 		pinctrl-names = "default";
 		pinctrl-0 = <&ngffpcie_enable_h>;
 		startup-delay-us = <50000>;
-		vin-supply = <&vcc3v3_pi6c_05>;
+		vin-supply = <&vcc3v3_sys>;
 	};
 
 	vcc5v0_usb: regulator-vcc5v0-usb {
@@ -586,12 +580,23 @@ rgmii_phy1: ethernet-phy@0 {
 
 &pcie30phy {
 	data-lanes = <1 2>;
-	phy-supply = <&vcc3v3_pi6c_05>;
+
 	status = "okay";
 };
 
 &pcie3x1 {
 	/* M.2 slot */
+	/*
+	 * The board has a gpio-controlled "pcie_refclk" generator,
+	 * so add it to the list of clocks.
+	 */
+	clocks = <&cru ACLK_PCIE30X1_MST>, <&cru ACLK_PCIE30X1_SLV>,
+		 <&cru ACLK_PCIE30X1_DBI>, <&cru PCLK_PCIE30X1>,
+		 <&cru CLK_PCIE30X1_AUX_NDFT>,
+		 <&pcie_refclk>;
+	clock-names = "aclk_mst", "aclk_slv",
+		      "aclk_dbi", "pclk", "aux",
+		      "ref";
 	num-lanes = <1>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&ngffpcie_reset_h>;
@@ -602,6 +607,18 @@ &pcie3x1 {
 
 &pcie3x2 {
 	/* mPCIe slot */
+	/*
+	 * The board has a gpio-controlled "pcie_refclk" generator,
+	 * so add it to the list of clocks.
+	 */
+	clocks = <&cru ACLK_PCIE30X2_MST>, <&cru ACLK_PCIE30X2_SLV>,
+		 <&cru ACLK_PCIE30X2_DBI>, <&cru PCLK_PCIE30X2>,
+		 <&cru CLK_PCIE30X2_AUX_NDFT>,
+		 <&pcie_refclk>;
+	clock-names = "aclk_mst", "aclk_slv",
+		      "aclk_dbi", "pclk", "aux",
+		      "ref";
+
 	num-lanes = <1>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&minipcie_reset_h>;

-- 
2.53.0



