Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC040C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 22:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgVYiRuukW2LXHRTQ9E6wojtqpdIQdT+Kx6essfkeMM=; b=PeMWkJi2qiYIU6qYEGg8yMcGP2
	LF51wsx5lpiYtGXrsiDnIeBIYWfdL6y24ym+pqEKHikj/rlZ4JA/hbXUH+dnFawkgas8UjM21axfw
	uPNtTOeqsn35PMCzB9Gc3eYksymCr8fPTFjWQBI26235gnYuJW7DTEij5ipf1eobpMQy0gIJBJwaF
	/KW44uWO3FuZqs58RAZjEqFpPg0ipq44SPI/sd75/NRezpxYs8LmAWNwAECGGGlrFnVW7QokRrEuz
	qkdQlN9+1UwTKG9olBDFn/O556oOupy42Qhkhy11X+7pQ2Ap/hn33JTPkwkWMHZF83I49c4tf3gep
	/tjwqgqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOkYp-00000005JEr-1BAr;
	Mon, 09 Jun 2025 22:01:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOkSU-00000005Ija-0RZI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 21:55:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 707C34AE63;
	Mon,  9 Jun 2025 21:55:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D0CEC4CEED;
	Mon,  9 Jun 2025 21:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749506109;
	bh=sFe34T4JjO0tAEnsFjcwuygXkVXQNdWJSnqO77GzWWo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o/rAG/5i/F3cxZt7Ep2Dw3ZU885oM6P0+eYjhhqobJan1bcBdUfzydkKF78XoKu3S
	 rRn15rGPhLyornEE1hbZFu+2W3N3DwYmUlrocFEndjiOGWiCrHfpRwC01nfgcxaUt7
	 t/6FK0s0yv8nTh2Mf6JuIGyHTD28r0SQZu78xY8RNXFxfyfC6QWOst0Iu9PkiyVnfZ
	 1nkxDIpSz5Yytb9WuhpiZrQbQELFLnCt/Fq9C/81T5T1lePxTRZtREVzzymRN3lfZA
	 2gW1CTCCx6E3HLiy4luWd3TZoh6EveLRlGuNOr/kl8j8EdFWsoxumRzwbDhewe1lmR
	 9eeUM4tZ59a1A==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Mon, 09 Jun 2025 16:54:57 -0500
Subject: [PATCH 2/2] arm64: dts: lg: Add missing PL011 "uartclk"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-dt-lg-fixes-v1-2-e210e797c2d7@kernel.org>
References: <20250609-dt-lg-fixes-v1-0-e210e797c2d7@kernel.org>
In-Reply-To: <20250609-dt-lg-fixes-v1-0-e210e797c2d7@kernel.org>
To: soc@kernel.org, Chanho Min <chanho.min@lge.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_145510_175591_B6E82892 
X-CRM114-Status: UNSURE (   9.88  )
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

The PL011 IP has 2 clock inputs for UART core/baud and APB bus. The
LG131x SoCs are missing the core "uartclk". In this case, the Linux
driver uses single clock for both clock inputs. Let's assume that's how
the h/w is wired and make the DT reflect that.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/lg/lg131x.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/lg/lg131x.dtsi b/arch/arm64/boot/dts/lg/lg131x.dtsi
index dc4229bd9ebb..4cb1e4510897 100644
--- a/arch/arm64/boot/dts/lg/lg131x.dtsi
+++ b/arch/arm64/boot/dts/lg/lg131x.dtsi
@@ -128,24 +128,24 @@ uart0: serial@fe000000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x0 0xfe000000 0x1000>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
+			clocks = <&clk_bus>, <&clk_bus>;
+			clock-names = "uartclk", "apb_pclk";
 			status = "disabled";
 		};
 		uart1: serial@fe100000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x0 0xfe100000 0x1000>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
+			clocks = <&clk_bus>, <&clk_bus>;
+			clock-names = "uartclk", "apb_pclk";
 			status = "disabled";
 		};
 		uart2: serial@fe200000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x0 0xfe200000 0x1000>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
+			clocks = <&clk_bus>, <&clk_bus>;
+			clock-names = "uartclk", "apb_pclk";
 			status = "disabled";
 		};
 		spi0: spi@fe800000 {

-- 
2.47.2


