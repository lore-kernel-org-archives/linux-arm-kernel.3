Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D658FD68BCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 19:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JxRGFHv+JCnanJsikDJJUzvpPtbVAdV2AH/PWcMi8tU=; b=1uaoxrf8pvpDDgN65ficzns9VM
	1fl+3kmVmymS6e4I3fZyj1Q78rDNy7lUssNluqIJX4hBCAqhXMVl7p2ZlX8mMhArgnmEKkGpIn6gF
	4rcGBqXIuVWdfKSP0FjFMHGNhm1QGxVP6pQShMWxQd8DDw1NrM+njMSuyxoh6AJZYGPyj35dkJbET
	opQt9x2TmJLdxw1zPxjC3UTEGfaZx4jMIJt7LPreGY2pVOQxVEaj4phW8dI6UovI8SyITx7a5KXJ+
	wn6uhL/9hx2mOXo0HM/dy01OBWN7aQwE5aHVlEPaXXw0XflaXC8JouNr2iZdgozVrXs6qW3QjAQsC
	/pCJ7X1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC2BT-00000003tVj-3bVi;
	Fri, 15 Nov 2024 19:40:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC29k-00000003svq-2zk3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 19:39:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 160AEA42C68;
	Fri, 15 Nov 2024 19:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F34AC4CECF;
	Fri, 15 Nov 2024 19:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731699539;
	bh=LP0u3QqCbmQC1vap+Z+0ND0Z2RGUjbmmF6GaJXzgnOE=;
	h=From:To:Cc:Subject:Date:From;
	b=bBDt5/c96q0G7FjXYGwQaRDfNE5SP7ZBj4URNMEb83NofF1jiB02MtyKktH8Bm0zB
	 SHjnRd364PVSjBDYVCwhUysALvQYtXQWWr7HC7Zgv5zO8W19GdPlqpX4n/9d3Kfa7t
	 zJS6p6hZWECyQosIYu2rMREXTqV3aOZQLA0g09kmr3jlOeoywwYWgNEwSKL7eMMHp+
	 UU+XO7eX10G2URWnHtlaZCu/PXe+7wCUnhehaIxOh/cqz+VlgsBzDgqapcEbRZrbKI
	 HRuK7M3ilHFYuOus3WTdKqMBWrRALaAiu0HCjSanvB2fmrvC0wMLon5eB/yeprecvI
	 rRUl0BWaTlNJw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: broadcom: Remove unused and undocumented properties
Date: Fri, 15 Nov 2024 13:38:53 -0600
Message-ID: <20241115193854.3624123-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_113900_823069_0385552C 
X-CRM114-Status: UNSURE (   9.68  )
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
 arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts | 2 --
 arch/arm64/boot/dts/broadcom/northstar2/ns2-xmc.dts | 1 -
 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi    | 2 --
 3 files changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts b/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts
index f43cfe66b6af..5939d342aec7 100644
--- a/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts
+++ b/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts
@@ -137,7 +137,6 @@ at25@0 {
 		spi-cpha;
 		spi-cpol;
 		pl022,interface = <0>;
-		pl022,slave-tx-disable = <0>;
 		pl022,com-mode = <0>;
 		pl022,rx-level-trig = <1>;
 		pl022,tx-level-trig = <1>;
@@ -200,7 +199,6 @@ nand_sel: nand_sel {
 };
 
 &qspi {
-	bspi-sel = <0>;
 	flash: flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm64/boot/dts/broadcom/northstar2/ns2-xmc.dts b/arch/arm64/boot/dts/broadcom/northstar2/ns2-xmc.dts
index c50df1d02797..0e134a94e142 100644
--- a/arch/arm64/boot/dts/broadcom/northstar2/ns2-xmc.dts
+++ b/arch/arm64/boot/dts/broadcom/northstar2/ns2-xmc.dts
@@ -151,7 +151,6 @@ flash: flash@0 {
 		#size-cells = <1>;
 		compatible = "m25p80";
 		spi-max-frequency = <62500000>;
-		m25p,default-addr-width = <3>;
 		reg = <0x0 0x0>;
 
 		partition@0 {
diff --git a/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi b/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
index cfd9fd23a1c2..5a4b81faff20 100644
--- a/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
@@ -134,7 +134,6 @@ pcie0: pcie@20020000 {
 		brcm,pcie-ob;
 		brcm,pcie-ob-oarr-size;
 		brcm,pcie-ob-axi-offset = <0x00000000>;
-		brcm,pcie-ob-window-size = <256>;
 
 		status = "disabled";
 
@@ -165,7 +164,6 @@ pcie4: pcie@50020000 {
 		brcm,pcie-ob;
 		brcm,pcie-ob-oarr-size;
 		brcm,pcie-ob-axi-offset = <0x30000000>;
-		brcm,pcie-ob-window-size = <256>;
 
 		status = "disabled";
 
-- 
2.45.2


