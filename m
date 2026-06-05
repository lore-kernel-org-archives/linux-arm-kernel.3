Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CECCD6E7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 11:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSDgYGrLmOyYY0Ll977698O98s/0aY/bol0kXuOCkRs=; b=H7J8OFVmBKFAZwD4ZRIgyry9VZ
	qWfnugCRsnjBBHLGPH5ZiPcgoL5hKBaRSXBO8DpmQQe/PR7nGqeCpKM2mJP0sux7hskh33oTszJsD
	rOT7JGZ6CdGY2tvkTAkT5kDx4hXkxEKJ8TCip0/04JPtEPdGrGLpvimfLLY+KnIC/C01Wr4CnZbfa
	fBTdO+PI2jkikeq0WnLLYIN8cURIMx1hk0v1062hHhrE3EbCI4mprVCKsgDWpB/7bIRmR9CEqiCLs
	aW2edTExCO8jRnLHGYVKzUpatHH2ClJsgsPp4jOp76ArTy3gPesBAlVTj15dDUW6+i4svWYbaXiZL
	G3/tx2Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVT3B-00000000ZSD-3pgx;
	Fri, 05 Jun 2026 11:49:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVT38-00000000ZQS-0i3g;
	Fri, 05 Jun 2026 11:49:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 65707601F6;
	Fri,  5 Jun 2026 11:49:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 070D9C2BCC4;
	Fri,  5 Jun 2026 11:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780660156;
	bh=3l+5UKudMZf4jTOAo8XfPjfcnZ3jIgLsi24txffRVNQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=A516+x5qePV8i4qBxv4FL1T89GiHfNeGiC0VEl3IBQo2+17GZ1osUbWlkiGfYMOwo
	 8gs4wE7BkbQjienezzYjM1MwzxWK0RoJhTVDVSCbkltVkB2pchDPLZHjmF0gJQcKxB
	 HOJ0Zbh40SoT31LKKEEQv1lNvpZANz9K09eFMV8rc0oYb7Ee/SMyMnpepKkrovlVVs
	 Q32QWabPDlep3wxiljmyXNTvUzY8Pr8oFwjQxqWfSPVvNBqTttqVWCCzB4L0uYuejM
	 gkr5J7/h43sg9azs4mZWvopmNq/2gWlGSLHOF0ZdGM59XD76vY7E73WItQT2ksnaW5
	 Be0DqRzL3C8yA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B59CD6E7D;
	Fri,  5 Jun 2026 11:49:15 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Fri, 05 Jun 2026 13:49:09 +0200
Subject: [PATCH v3 2/3] arm64: dts: rockchip: describe PCIe RTL8125
 Ethernet on NanoPC-T6
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-rk3588-dts-rtl-eth-describe-dt-alias-v3-2-8a8857b39daf@pardini.net>
References: <20260605-rk3588-dts-rtl-eth-describe-dt-alias-v3-0-8a8857b39daf@pardini.net>
In-Reply-To: <20260605-rk3588-dts-rtl-eth-describe-dt-alias-v3-0-8a8857b39daf@pardini.net>
To: Heiner Kallweit <hkallweit1@gmail.com>, nic_swsd@realtek.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1934;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=W2w/PoU4s6DqcVmFVZT9MimBtV8OSlVybuPObx2ytBQ=;
 b=owEBiQF2/pANAwAIATteP+Oex+3pAcsmYgBqIre63bdXcPGOPT4kHwiCkKL0PahvOJ6pVxSe+
 BWucMQ/B6yJAU8EAAEIADkWIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCaiK3uhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDMACgkQO14/457H7em5JwgAr3H1dC/AWEzT8lrcRvq2n8QfzPECBk+
 upbQ2zekA9NwTeJj3x2xJLfqkd6mLqBQ2tMdkKDARnrbvWOATDdwbvWMXhWbNI0f90L5sdEpgL4
 dM2Yi/gVsmaBCVn9qOqW6qB9IxNAKALyMYMHg0qt9CZVfGY0emxoI2bRfvX2Rps2neyAe4LCOuM
 no8+nUf2Hmjv3TNnOnqciG3Vn98GvYbkFPiSndF+787xYVOsAmNvPPD8o1gbOtqH3GmVMoxZNog
 OoP9MXSdwMgm1okdW6zjv/5R66x2seEn964Q/KCWYqUKg8NPY6u7V41B7F1Tecyy+ds5jZUECyO
 eoUt1v6kAJA==
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
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
Reply-To: ricardo@pardini.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ricardo Pardini <ricardo@pardini.net>

The FriendlyElec NanoPC-T6 carries two on-board Realtek RTL8125 NICs
behind pcie2x1l0 and pcie2x1l2.

Describe the fixed function nodes and attach ethernet0/ethernet1
aliases, so that U-Boot's fdt_fixup_ethernet() can inject mac-address
properties from its ethaddr/eth1addr env. The on-NIC EEPROMs on this
board are not pre-programmed with a unique MAC, so this gives a
stable MAC across boots that both U-Boot and the kernel agree on.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index 84b6b53f016ab..04c4479f08170 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -20,6 +20,8 @@ / {
 	compatible = "friendlyarm,nanopc-t6", "rockchip,rk3588";
 
 	aliases {
+		ethernet0 = &rtl_eth0;
+		ethernet1 = &rtl_eth1;
 		mmc0 = &sdhci;
 		mmc1 = &sdmmc;
 	};
@@ -635,6 +637,20 @@ &pcie2x1l0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_0_rst>;
 	status = "okay";
+
+	pcie@0,0 {
+		reg = <0x200000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+		device_type = "pci";
+		bus-range = <0x20 0x2f>;
+
+		rtl_eth0: ethernet@0,0 {
+			compatible = "pci10ec,8125";
+			reg = <0x210000 0 0 0 0>;
+		};
+	};
 };
 
 &pcie2x1l1 {
@@ -651,6 +667,20 @@ &pcie2x1l2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_2_rst>;
 	status = "okay";
+
+	pcie@0,0 {
+		reg = <0x400000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+		device_type = "pci";
+		bus-range = <0x40 0x4f>;
+
+		rtl_eth1: ethernet@0,0 {
+			compatible = "pci10ec,8125";
+			reg = <0x410000 0 0 0 0>;
+		};
+	};
 };
 
 &pcie30phy {

-- 
2.54.0



