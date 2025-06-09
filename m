Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CADC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 22:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E5OMVTKaKsl8EaoinBgB0RnOg5QS5+R8IpTSKVKkwqY=; b=wNVbdUnT1mmoLy0u++MWG81cOH
	rd3X3geEtIgKW0iMM0cZH5WpysdQTtvy5uwzQr1uBmswba3Y5jdKCmKSLH5mcxje4+GQ39dSMhyGz
	G0tZjEOICfgIcdKXlUqFJ4LCCkta+LcdZZBfay0K5tF8sDQ1rmnAEai0EoysZFLLeR3xEeAahyKJM
	n/aqKK4DwrQo63mhlOOFI8MYBqqGZhwJ5uWdy2/BtZ6Hh5WjwxNDEXULl2llispG0RE1nYRg836ug
	Id8TBv/hW3JQZ8X5NxhUm5Df8hvEKoQxWpX0rKU1j7Bxn5Mehbxxz4p4H9niNRzb90q3CLctrtd5i
	ML/wOhWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOkaz-00000005JSl-086N;
	Mon, 09 Jun 2025 22:03:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOkUi-00000005IwZ-49kG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 21:57:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 37AD1629E3;
	Mon,  9 Jun 2025 21:57:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C4DC4CEEB;
	Mon,  9 Jun 2025 21:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749506247;
	bh=H0LP7W2hYltTeFPZPNeKYE1C/owB9QWsDiUoyqTMeno=;
	h=From:To:Cc:Subject:Date:From;
	b=k+/LzdOSCuz/NfiUkLCeYAN157XpIljEmZJMc4MojulOsbb9Z6Yy2qIyrGLsLfHa6
	 kwR4H4RZl6/5qh/pJiyth5rb0lHZC66iPFL6gStDnSPnOTEY3Hio8aZ8CAWmYv3Y6S
	 YrZE1eQizI81oJ0GUvAWlpFwOvsd4mvMHuT9sq9PbyL9acWjp9BgKPp0zhrGA+j0Bj
	 4nU1msgJVli/iAeEYnXr11GB5Xq1YEjjzH+VKm0g5GZtHBjFoiF0R2E6myKzAEiTR5
	 Q1sCftrRnO7k9BxlTqkvth3LqL7FLVb1ku8N8r7O81I8X4QN9e4vUu+DxAdMa1/8Fp
	 UEysR4v5H1lJw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: soc@kernel.org,
	Robert Richter <rric@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: cavium: thunder2: Add missing PL011 "uartclk"
Date: Mon,  9 Jun 2025 16:57:06 -0500
Message-ID: <20250609215706.3009692-2-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Thunder2 SoC is missing the core "uartclk". In this case, the Linux
driver uses single clock for both clock inputs. Let's assume that's how
the h/w is wired and make the DT reflect that.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Arnd, Please apply directly.

 arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi b/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
index 6dfe78a7d4ab..966fb57280f3 100644
--- a/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
+++ b/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
@@ -136,8 +136,8 @@ uart0: serial@402020000 {
 			reg = <0x04 0x02020000 0x0 0x1000>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk125mhz>;
-			clock-names = "apb_pclk";
+			clocks = <&clk125mhz>, <&clk125mhz>;
+			clock-names = "uartclk", "apb_pclk";
 		};
 	};
 
-- 
2.47.2


