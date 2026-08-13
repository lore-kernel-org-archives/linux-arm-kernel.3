Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA275C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 09:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JZBzCt2pWMikt6PRygltkPsaRUIMxgECr8t06O3fuH4=; b=nrZxbxRoN8I8mQ1UTL4VxtUCyW
	jS0wH+w8N7DMV4lgcvNhkPcLOe14vGUZYjfH6G3R4/5dpPzLCe1fQVEy5lJQJP9gX3nlUua6bk5my
	6nSn0IeLuA6Bpba6Z1l9qvb9i+h75D8VyCjC+OiehXx0kTYfgI8Ijxq+B/7f04/+tlJqdFG0/L8cR
	FyOQjnD68BIObpEaJF9Hy6ijbe09s1Xk/8cNwthADCWBUjauiNjHgFPt7ROIjWvT4q3oWCkwwCC7L
	Sg0ltkRdSvQWAd55Ukawi65UY8+P7fB0wS6WhihDOryucoINl7xxJudXUk1Pn+10dSa1WAwtuhs5l
	BhSn7sSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSBU-00000000OUN-27of;
	Thu, 13 Aug 2026 09:57:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSBT-00000000OSy-3Fq7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 09:57:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 44FF04141F;
	Thu, 13 Aug 2026 09:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17BD6C19425;
	Thu, 13 Aug 2026 09:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786615031;
	bh=vZIoz8SRkvQelWw7HwQIV7pR02ZXIQjeTCwUQyR2gNw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=FVctRvSsZcStP1nZkJtwRlRpDqxhGT/j/waaGFyxNUE7coC4/HOa4SsFwn9Bu5DP+
	 HFaj/ciY1qPFPnIH6sdP/7eDAOdLbxGWsYl68a3UETRdsMZA6UkiXWQIgU9yDp8UeL
	 AnDd6I2MExV5d6l0iACh2fZh+9AmO1XOv712htpyLy7qb2EkdqwaSopKZ4WZW2i+Xb
	 n9wzP/Rrg7YIOR22WY2XAxzL434PSDxV8VJAHK7qDu6xAPAvh7pwvZibuwyPnHaVZp
	 XSQOmk9UFV7dVArdRNCsOClMAFPyUA1kc9ms4biue9YhHahxDGVllSByK3PIec7r9T
	 q8sjoAEfSikMw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A6AC5AC67;
	Thu, 13 Aug 2026 09:57:10 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Subject: [PATCH v3 0/6] Ambarella CV75: bindings, RCT clocks, and DT
Date: Thu, 13 Aug 2026 17:56:11 +0800
Message-Id: <20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALuUfWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0Mj3eQyc1PdMmPdRN1kE0tDI8PE5ETLRCMloPqCotS0zAqwWdGxEH5
 xaVJWanIJyACl2loAMuV2+W0AAAA=
X-Change-ID: 20260812-cv75-v3-a-c49121aca9a2
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 soc@lists.linux.dev, Long Zhao <longzhao@ambarella.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786615029; l=2927;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=vZIoz8SRkvQelWw7HwQIV7pR02ZXIQjeTCwUQyR2gNw=;
 b=drpF2zlFCoa1mKfCLbPwXAsC2fQwzR+XcHfjZ0z6pqsAg9IW60wutmdtUY2YSmDLTeU1Vdyh5
 emo06DBL8wMBYmj5eZBI+KZxWLvyrDhRLmQhDj69okgFoMmvLC0fYLg
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
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
Reply-To: longzhao@ambarella.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This is part A of a 3-part CV75 v3 split:

  A: bindings + RCT/CCU clocks + SoC/EVK DT + MAINTAINERS  (this series)
  B: pinctrl + PL061 GPIO variant
  C: 8250_dw UART quirks

B depends on A; C depends on A+B. B and C follow as separate threads.

Link to v2:
https://lore.kernel.org/r/20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com

Summary:
- arm / syscon / clock bindings and CV75 RCT CCU driver
- minimal CV75 SoC + EVK DT (UART0, clocks)
- MAINTAINERS entry for Ambarella

Changes since v2 (A scope):
- scratchpad as generic syscon (Krzysztof)
- RCT as dedicated clock-controller binding/header (Krzysztof)
- DT nodes under /soc with unit-address ordering (Krzysztof/Rob)
- clk robustness: div_u64 and mux/div + PLL edge cases (internal review)

Verified on CV75 with A+B+C (boot, UART, clk_summary).

Signed-off-by: Long Zhao <longzhao@ambarella.com>

---
Long Zhao (6):
      dt-bindings: arm: add Ambarella CV75 platforms
      dt-bindings: mfd: syscon: add Ambarella CV75 secure scratchpad
      dt-bindings: clock: add Ambarella CV75 RCT
      clk: ambarella: add CV75 CCU driver
      arm64: ambarella: add ARCH_AMBARELLA and CV75 EVK DT
      MAINTAINERS: add ARM/AMBARELLA SoC support

 .../devicetree/bindings/arm/ambarella.yaml         |  24 ++
 .../bindings/clock/ambarella,cv75-rct.yaml         |  58 ++++
 Documentation/devicetree/bindings/mfd/syscon.yaml  |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |  14 +
 arch/arm64/Kconfig.platforms                       |   9 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/ambarella/Makefile             |   3 +
 arch/arm64/boot/dts/ambarella/cv75-evk.dts         |  30 ++
 arch/arm64/boot/dts/ambarella/cv75.dtsi            | 178 ++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/ambarella/Kconfig                      |  13 +
 drivers/clk/ambarella/Makefile                     |   6 +
 drivers/clk/ambarella/ccu-cv75.c                   | 296 ++++++++++++++++
 drivers/clk/ambarella/ccu_common.c                 |  60 ++++
 drivers/clk/ambarella/ccu_common.h                 |  25 ++
 drivers/clk/ambarella/ccu_mux_div.c                | 231 +++++++++++++
 drivers/clk/ambarella/ccu_mux_div.h                |  35 ++
 drivers/clk/ambarella/ccu_pll.c                    | 378 +++++++++++++++++++++
 drivers/clk/ambarella/ccu_pll.h                    |  70 ++++
 include/dt-bindings/clock/ambarella,cv75-rct.h     |  15 +
 23 files changed, 1452 insertions(+)
---
base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
change-id: 20260812-cv75-v3-a-c49121aca9a2

Best regards,
--  
Long Zhao <longzhao@ambarella.com>



