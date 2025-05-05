Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B41CC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 17:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6puXxQ0tPazG4PX9/Ca04nttbZfCRhE7eIqITbDMoi8=; b=QUGVsC9oeVlR4BTM1AWpi2Me3C
	MmC1+7mE1rM3KDISU7inCFBCb8Xs2+PziGQF5W6E4pzGFD12iD1hgMpRXMZOfn9jQmMvjV5spB7/D
	RrGjENmtQwJNDXODdT9j9Ybh8WM6FZvcb8VHIYNe05p5Hg7Jn/rlx5m6E89o/2Df1dUUvCFJp68P/
	Q5lELS1fu3KBvOYuj/H+0SPJSMCwsIf2e3VibjGTYirYv7EUXN6YiGVf+UXVW/01nBdpC2oz4Iyre
	3ItpVY/lazfjeX/tuu+C1B3eZlyXsY3f9dmJ6DeLmM/Vquv3OJO/GnHa/0T+SXRN4JfSfus1TJvTc
	LIPsDBZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBzDi-000000085Um-0JRc;
	Mon, 05 May 2025 17:03:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uByXc-00000007xXa-2dnZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 16:19:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C7AEB5C54F3;
	Mon,  5 May 2025 16:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657EDC4CEEF;
	Mon,  5 May 2025 16:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746461979;
	bh=W9CwbGba2l/4DV2mVSRkgzCbSIJIRxSkUrO2huXF8pw=;
	h=From:To:Cc:Subject:Date:From;
	b=Sa1Ug5sfnyga80HsoJ3Dewm7UKCoPdgGsO7QDheok4L6aeRNgvNq8CU/eaJ32XUjC
	 w0vS8QmkoS0EFJGqZ28Ocry/JxgHOk1lif2f82y1o89pU+z0jgzHzs4T7cZhnTr5Qu
	 XCW4KpNe3hUwBjf+dgcnINMt9+plVz1Tzz/kf3rQoEW7qlcvdSZ2MmZ8h2YmKIU+cT
	 EuvOMsS3OzMqzfa3Ks/7l1WbNtWJI5iQ1lvjXR+NGMZg8QKkZkDf0agpueInltaJvU
	 oKz2mKHm52N4mXzcb5HOyPB+mwDz5GV242hxFTyQnZN2CmJNGQB0shbbnbvo8F3UMr
	 64Fa8a3bhsHZw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: Drop st,stm32h7-rcc.txt
Date: Mon,  5 May 2025 11:19:32 -0500
Message-ID: <20250505161933.1432791-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_091940_781833_1C4E791E 
X-CRM114-Status: GOOD (  11.43  )
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

The binding is already covered by st,stm32-rcc.yaml.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/st,stm32h7-rcc.txt         | 71 -------------------
 1 file changed, 71 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/st,stm32h7-rcc.txt

diff --git a/Documentation/devicetree/bindings/clock/st,stm32h7-rcc.txt b/Documentation/devicetree/bindings/clock/st,stm32h7-rcc.txt
deleted file mode 100644
index cac24ee10b72..000000000000
--- a/Documentation/devicetree/bindings/clock/st,stm32h7-rcc.txt
+++ /dev/null
@@ -1,71 +0,0 @@
-STMicroelectronics STM32H7 Reset and Clock Controller
-=====================================================
-
-The RCC IP is both a reset and a clock controller.
-
-Please refer to clock-bindings.txt for common clock controller binding usage.
-Please also refer to reset.txt for common reset controller binding usage.
-
-Required properties:
-- compatible: Should be:
-  "st,stm32h743-rcc"
-
-- reg: should be register base and length as documented in the
-  datasheet
-
-- #reset-cells: 1, see below
-
-- #clock-cells : from common clock binding; shall be set to 1
-
-- clocks: External oscillator clock phandle
-  - high speed external clock signal (HSE)
-  - low speed external clock signal (LSE)
-  - external I2S clock (I2S_CKIN)
-
-Optional properties:
-- st,syscfg: phandle for pwrcfg, mandatory to disable/enable backup domain
-  write protection (RTC clock).
-
-Example:
-
-	rcc: reset-clock-controller@58024400 {
-		compatible = "st,stm32h743-rcc", "st,stm32-rcc";
-		reg = <0x58024400 0x400>;
-		#reset-cells = <1>;
-		#clock-cells = <1>;
-		clocks = <&clk_hse>, <&clk_lse>, <&clk_i2s_ckin>;
-
-		st,syscfg = <&pwrcfg>;
-};
-
-The peripheral clock consumer should specify the desired clock by
-having the clock ID in its "clocks" phandle cell.
-
-Example:
-
-		timer5: timer@40000c00 {
-			compatible = "st,stm32-timer";
-			reg = <0x40000c00 0x400>;
-			interrupts = <50>;
-			clocks = <&rcc TIM5_CK>;
-		};
-
-Specifying softreset control of devices
-=======================================
-
-Device nodes should specify the reset channel required in their "resets"
-property, containing a phandle to the reset device node and an index specifying
-which channel to use.
-The index is the bit number within the RCC registers bank, starting from RCC
-base address.
-It is calculated as: index = register_offset / 4 * 32 + bit_offset.
-Where bit_offset is the bit offset within the register.
-
-For example, for CRC reset:
-  crc = AHB4RSTR_offset / 4 * 32 + CRCRST_bit_offset = 0x88 / 4 * 32 + 19 = 1107
-
-Example:
-
-	timer2 {
-		resets	= <&rcc STM32H7_APB1L_RESET(TIM2)>;
-	};
-- 
2.47.2


