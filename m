Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20346CCF2D4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 04:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zpUkQHOvSlCu5EQ2H5QMKaaPI+z0PVdQz6FmIZA8esw=; b=ai2NUPoy9eiv4Xw/SLoH82xM0u
	Fak9u2ZBY4aBsu5MzAPZn1Kf8QeCaR3DYnqZk4Oq6Vektp3V/0FL3fPLV5+6nIWOHqpJ6CGCCyzB6
	OyukZXyXsU2MnstHtwRBDdgWhceOG0+Ox9FjaglO/yt5v87feArOI7S+OjdE8TDMQdrK6plusW617
	XIEBrrOfsSxjACpLLn0pLcfxbcz3S0D8Txit6oZLDUp7taPq7RNaQmyEJ378eTJYAwI7SORgcO2sz
	NCHNzrRucjiZG7SPwyLOcYCuQYZS94Rn4n0zYwRz2z4t7AKvTum8ZX9cQau0LXNia5L7fZTfklMak
	2clxHfxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIfPY-00000006bZp-1gvO;
	Mon, 19 Oct 2026 04:55:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIfPX-00000006bZ4-1I6p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 04:55:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C9F940C31;
	Mon, 19 Oct 2026 04:55:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F87CC2BCF4;
	Mon, 19 Oct 2026 04:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792385746;
	bh=ZhUYbZ95NLFa/Rn1zmjWlfg7lpCSN/HC3tfwt4ccO2k=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=KxPoUGhKuoAQgV3Y34Pe7Pw6PAXKXgRRH2HliH5txWP0NlsFFc0VGcQs49wH2qxop
	 zPrMseUdsVBFn/8O67jq07sSnSIDJKLVZOx41boTlVoHiV1x7kD5cqFcBSvJ5YGy7i
	 MmvImxNMifLmuxu0WnMDFSSGCq/9Rs88Dcc3K5vEeHowb/5O1SiODiihd6r5VIcGZ3
	 7GlDijpjWr54N9Ucxy+d197X+Kf7Na8sXsAwiNsjorKpTORj/R21gl0kXI3CmA/Zue
	 Qnx6G8s3i+Zb6MU41c37vujAeCgfi0PMEi45k0QfqTpoBQLl+7fl+cbQI9ZPKmHnhB
	 BelyNRV7pR0Tg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF958CCF2D4;
	Mon, 19 Oct 2026 04:55:45 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Subject: [PATCH v10 0/5] arm64: add Ambarella CV75 SoC support
Date: Mon, 19 Oct 2026 12:55:38 +0800
Message-Id: <20261019-cv75-soc-v10-0-d386065e2dd5@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMqi1WoC/zWNQQ6CMBBFr0JmbU2pUAor72FYlHGQGqCmxUZDe
 ncLxGQ2/+f9Nyt4coY8NNkKjoLxxs4p5PyUAQ56fhAz91SA4ELmnFcMQ1Uyb5GRFKq/lFXPpYS
 Evxz15rO7bu2R/bt7Ei7bfiMG4xfrvvuzUG/cX5sf2pCuZpwVSiIKVeuiU1c9ddrROOoz2gnaG
 OMP/TT72rYAAAA=
X-Change-ID: 20261007-cv75-soc-e628f357f066
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 Long Zhao <longzhao@ambarella.com>, Long Zhao <zl020895@163.com>, 
 linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792385743; l=4886;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=ZhUYbZ95NLFa/Rn1zmjWlfg7lpCSN/HC3tfwt4ccO2k=;
 b=LResnsxn04Owvm0w55MCC1Uo/RgsQXcvWGXasac6sOU6bloesyJhMTc+5mirtAswNhKvCIiXf
 z5B5m98br0KAJNrpJ5SG+bsFZqqtb4ObU9Jvqw1CJtCCYeP2jL0AAtM
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

Apply the patches in this order:

1. board binding
2. RCT clock binding and clock ID header
3. RCT clock driver
4. ARCH_AMBARELLA and the CV75 SoC and EVK device trees
5. MAINTAINERS

cv75.dtsi includes the clock ID header, so patch 2 has to be applied
before patch 4. The DT sources then preprocess without a separate
clock series.

The ambarella vendor prefix [1] is in linux-next (applied by Rob).
Lee has applied the CV75 secure scratchpad syscon binding in the
mfd tree. This series does not repeat either of them.

GPIO [2] and UART [3] stay separate series. The prefix they need
is in linux-next. Their drivers do not depend on it. The CV75
pinctrl binding and driver are not in this series.

This is v10 of the SoC and clock patches from the combined CV75
series. The posting on Oct 9 numbered them v1 after the split. That
was a mistake. This series merges the SoC v1 and the clock v1.

Tested on the CV75 EVK. The board boots. That boot used a local tree
that also includes the GPIO, UART and pinctrl patches.

Changes since the combined v9 [4]:
- Fold the clock v1 into this series (Krzysztof). The clock series
  will not be resent:
  https://patch.msgid.link/20261009-cv75-clk-v1-0-6959b4da83c5@ambarella.com
- clk: drop CLK_GET_RATE_NOCACHE. The driver only implements
  recalc_rate (Brian).
- clk: use reverse Christmas tree order for the locals in
  cv75_pll_recalc_rate() (Brian).
- clk: the RCT helpers stay in clk-cv75.c for now. Only CV75 uses
  this PLL model, so the common part can move out when another SoC
  shares it (Brian).
- binding: #reset-cells stays on the RCT for now. This series has no
  resets= consumers, so the reset provider and the soft-reset IDs
  can wait for the first user (Brian).
- Link to v9: https://patch.msgid.link/20261001-cv75-v5-v9-0-486cc289a4b8@ambarella.com

Changes since the Oct 9 SoC posting [5]:
- the fold, clock and reset items listed above.
- Link to that posting: https://patch.msgid.link/20261009-cv75-soc-v1-0-808330e93ff1@ambarella.com

[1] https://patch.msgid.link/20261014-cv75-prefix-v1-1-fe95ed567880@ambarella.com
[2] https://patch.msgid.link/20261009-cv75-gpio-v1-0-5836bd438423@ambarella.com
[3] https://patch.msgid.link/20261009-cv75-uart-v1-0-38c098efaa99@ambarella.com
[4] https://patch.msgid.link/20261001-cv75-v5-v9-0-486cc289a4b8@ambarella.com
[5] https://patch.msgid.link/20261009-cv75-soc-v1-0-808330e93ff1@ambarella.com

To: Arnd Bergmann <arnd@arndb.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: soc@lists.linux.dev
To: linux-arm-kernel@lists.infradead.org
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-clk@vger.kernel.org
Cc: Brian Masney <masneyb@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev
Cc: devicetree@vger.kernel.org
Cc: Long Zhao <longzhao@ambarella.com>
Cc: Long Zhao <zl020895@163.com>
Cc: linux-kernel@vger.kernel.org

Assisted-by: LLM
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
Long Zhao (5):
      dt-bindings: arm: add Ambarella CV75 platforms
      dt-bindings: clock: add Ambarella CV75 RCT
      clk: ambarella: add CV75 RCT clock controller
      arm64: ambarella: add ARCH_AMBARELLA and CV75 EVK DT
      MAINTAINERS: add ARM/AMBARELLA SoC support

 .../devicetree/bindings/arm/ambarella.yaml         |  24 ++
 .../bindings/clock/ambarella,cv75-rct.yaml         |  64 ++++
 MAINTAINERS                                        |  14 +
 arch/arm64/Kconfig.platforms                       |   6 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/ambarella/Makefile             |   3 +
 arch/arm64/boot/dts/ambarella/cv75-evk.dts         |  30 ++
 arch/arm64/boot/dts/ambarella/cv75.dtsi            | 177 ++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/ambarella/Kconfig                      |   9 +
 drivers/clk/ambarella/Makefile                     |   3 +
 drivers/clk/ambarella/clk-cv75.c                   | 361 +++++++++++++++++++++
 include/dt-bindings/clock/ambarella,cv75-rct.h     |  14 +
 15 files changed, 709 insertions(+)
---
base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
change-id: 20261007-cv75-soc-e628f357f066

Best regards,
--  
Long Zhao <longzhao@ambarella.com>



