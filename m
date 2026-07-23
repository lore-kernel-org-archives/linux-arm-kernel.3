Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D048AC531CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 03:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ct6A69eIy8M8/F/aRHvQbC7tJPRJSKR5xYVgwqSRpk4=; b=y1lmMM0Jbi0CFxuz9KvSOx+RfR
	cPG49hHnXer8WvOfCecrPsA80rvIbPj3sAUyyR/UU+QIlOXtY2hvHiX9Y/BwEP8PS0TxwFzgpfBVt
	VwmR9h72CEbr0ki2/+mz2zyBdZCXJ3/CrZ/Xbdleik4I+yUfEBiiFY73Pw4QrJ16atO5X0L1X4whr
	F1gNUt9jpE06nZnttzojrmCclcQYCIQ8xkHSn41IvD7UwRL4dz5A7g1IMRqVcmI+RMtTh2F3Ijmfa
	Zz8vGubud6d7V2UvqPtgtT38ZWZCRvqi7tDciS064BvMQEopmOWGBMx/bA6JZRE65V9fce68hqypH
	C8V9zMnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmkQN-0000000DL7w-0iFA;
	Thu, 23 Jul 2026 03:48:43 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmkQK-0000000DL62-0xv8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 03:48:41 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 23 Jul
 2026 11:48:34 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 23 Jul 2026 11:48:34 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
Date: Thu, 23 Jul 2026 11:48:34 +0800
Subject: [PATCH v2] ARM: dts: aspeed: g6: Add missing uart nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260723-upstream_g6_dts_uart-v2-1-4951ae6b4ac4@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIABGPYWoC/4WNQQ6CMBBFr0JmbQ0MStGV9zCElDJCF9BmphAN4
 e5WLuDyveS/v4EQOxK4ZxswrU6cnxPgKQM7mnkg5frEgDlWeYlaLUEik5naoWr7KO1iOCpdm6u
 lssNal5Cmgenl3kf22SQenUTPn+NlLX72T3AtVKGwIo3dRXf2ph9GAlEfyY5n6ydo9n3/AnZeV
 L69AAAA
X-Change-ID: 20260327-upstream_g6_dts_uart-78a5ce3b2873
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Jammy Huang
	<jammy_huang@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784778514; l=2543;
 i=jammy_huang@aspeedtech.com; s=20251124; h=from:subject:message-id;
 bh=q9hDcLVgLxrUGo37KNtSJnNiFCPmBGY9FhkK/ChAGFM=;
 b=NT1RKytf/ZW/AuqE/8pQQxHdslunNiGhDK3q1vJvWwxdFiVn7tP/ID/jZhF6pk309F+Gtd7jp
 CWEaT9YAsAQD8TYQlJXvr2xeKwyolAR5ZjxrpR8Ci1nCXt5wqFVvelj
X-Developer-Key: i=jammy_huang@aspeedtech.com; a=ed25519;
 pk=E5YwijeJZZcuDR6srvwNlXrNHvLxwipUg3Mb/xxUF9o=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_204840_271910_6C3DD69B 
X-CRM114-Status: UNSURE (   8.38  )
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

Add nodes for uart10/11/12/13.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
Changes in v2:
- rebase on bmc/linux.git aspeed/arm/dt, no functional changes
- Link to v1: https://lore.kernel.org/r/20260327-upstream_g6_dts_uart-v1-1-26e72b47bc97@aspeedtech.com
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index edf4b74f5ab..fb21e353005 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -844,6 +844,62 @@ uart9: serial@1e790300 {
 				status = "disabled";
 			};
 
+			uart10: serial@1e790400 {
+				compatible = "ns16550a";
+				reg = <0x1e790400 0x20>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&syscon ASPEED_CLK_GATE_UART10CLK>;
+				no-loopback-test;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_uart10_default>;
+
+				status = "disabled";
+			};
+
+			uart11: serial@1e790500 {
+				compatible = "ns16550a";
+				reg = <0x1e790500 0x20>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&syscon ASPEED_CLK_GATE_UART11CLK>;
+				no-loopback-test;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_uart11_default>;
+
+				status = "disabled";
+			};
+
+			uart12: serial@1e790600 {
+				compatible = "ns16550a";
+				reg = <0x1e790600 0x20>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&syscon ASPEED_CLK_GATE_UART12CLK>;
+				no-loopback-test;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_uart12g1_default>;
+
+				status = "disabled";
+			};
+
+			uart13: serial@1e790700 {
+				compatible = "ns16550a";
+				reg = <0x1e790700 0x20>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&syscon ASPEED_CLK_GATE_UART13CLK>;
+				no-loopback-test;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_uart13g1_default>;
+
+				status = "disabled";
+			};
+
 			bus@1e78a000 {
 				compatible = "simple-bus";
 				#address-cells = <1>;

---
base-commit: 749c34389679f8d56cb200a69b62f9a64670034f
change-id: 20260327-upstream_g6_dts_uart-78a5ce3b2873

Best regards,
-- 
Jammy Huang <jammy_huang@aspeedtech.com>


