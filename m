Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45888E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 05:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jJY7ImSKrCZkZlGSMzJV3Fwx38U9LtpiQNmaArPGkWo=; b=bDEKKLK086ewVukrXZP6WHmrSS
	DqQVJgcAZucjXDDZHM/djqpaytN7/5m6mkrMtrXpnpQfPiidRawi4nBz49PEomuY+XAbyEfsmlb6n
	L6zjzZ3IxhHkSfyO93+lB/G9wI84IfXYEo5KUROqtL+/3JIKuZ3ake3EF+oIwA8gudE0rylm7MVix
	ZYIXr58XWJ3LqE1G8+9v2+cHiAs8DrdU/iqAiPEMC5v/dO6/ozHRYX/OGjzAPmG5SrlOZyIx9hIgJ
	SeKFqrKYEPcfENIYyeJ5gGSG+fUUxyGCL/HhbjWourPMPZSetfy4YIolWNWp1zBbJZ6Sm6fZa5ENw
	aPzLKLLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTaPo-0000000C8D0-0U2U;
	Fri, 03 Jan 2025 05:40:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTaMY-0000000C7cw-3BHh;
	Fri, 03 Jan 2025 05:36:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 430935C60C8;
	Fri,  3 Jan 2025 05:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39D86C4CECE;
	Fri,  3 Jan 2025 05:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735882605;
	bh=ZptAS+5MfVYHwRbyK5bmvm62nwegy8I9wdDDR18v5n4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=LZyIuBdn/I5Te8li0s6qloz09dvUiA5Bq3l28vhNbhP4xdZtx4vbjPj4CjZGeW1Rz
	 sJ4VJrpHovIpXYo7MueKpf02BZiG+ESLhLdUQdTqP4Gh7iYBbCdFw8MHm/AI9E4JE+
	 ofwuxnI1Lt20hJDFDC3/uvukKqq+fraZ8pmeh3k+uFzlnJZyIYZI+uReVV3n7LLXN0
	 C1mZmQlbnr4iSAuW2zfsHP2G6DO3XHYmyWmbj0y1COyqdw2WP66B5Dq7lCKrHmlJZ2
	 MaE0ve/iMNDsykExAc50SL1KHtPmxShsfmIjUGS5zus2ksYf5TaZUaHQ0kc+pOumfi
	 rs+MDt5AAObMw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D85E77188;
	Fri,  3 Jan 2025 05:36:45 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v3 0/5] Add A5 SoC PLLs and Peripheral clock
Date: Fri, 03 Jan 2025 13:36:40 +0800
Message-Id: <20250103-a5-clk-v3-0-a207ce83b9e9@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGl3d2cC/1WMQQqDMBBFryJZNyUTo2hXvUfpIo5THaqmJCW0i
 HdvFBS6fJ//3iwCeaYgLtksPEUO7KYE+SkT2NupI8ltYqGVNqoGkLaQODxlXqCpLTa5IRDp/PL
 04M8Wut0T9xzezn+3boR13RNmT0SQShZEGs0DGlXh1Y6D6xjP6EaxRqI+RACtDlEnMXFVaqC6h
 PZfXJblB2doYz3XAAAA
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chuan Liu <chuan.liu@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735882602; l=2678;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=ZptAS+5MfVYHwRbyK5bmvm62nwegy8I9wdDDR18v5n4=;
 b=zL9UkYY6YjfifjhPWGcgbd6WLqUytsG2stmsDAanVcuNKVg1DnIXfNZT0t6duvz7/uQ9UPdP0
 y4UhupkQEgzB7VlGR/wfDoDm2CAkZuS9j8AKyGqYL1PGz+TLOvwUWW6
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_213646_912800_DC5AFB48 
X-CRM114-Status: UNSURE (   9.64  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The patchset adds support for the peripheral and PLL clock controller
found on the Amlogic A5 SoC family, such as A113X2.

Some clocks are provided by security zones. These clock accessed
througth SCMI driver in linux, inlcuding OSC, SYS_CLK, AXI_CLK,
CPU_CLK, DSU_CLK, GP1_PLL, FIXED_PLL_DCO, FIXED_PLL, SYS_PLL_DIV16,
ACLKM, CPU_CLK_DIV16, FCLK_50M_PREDIV, FCLK_50M_DIV, FCLK_50M, 
FCLK_DIV2_DIV, FCLK_DIV2, FCLK_DIV2P5_DIV, FCLK_DIV2P5, FCLK_DIV3_DIV,
FCLK_DIV3, FCLK_DIV4_DIV, FCLK_DIV4, FCLK_DIV5_DIV, FCLK_DIV5,
FCLK_DIV7_DIV, FCLK_DIV7, CLKID_SYS_MMC_PCLK, CLKID_SYS_CPU_CTRL,
CLKID_SYS_IRQ_CTRL, CLKID_SYS_GIC, CLKID_SYS_BIG_NIC, CLKID_AXI_SYS_NIC,
and CLKID_AXI_CPU_DMC.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v3:
- Rename xtal_24m to xtal, and modify some description of Kconfig.
- Drop some comment of PLL source code.
- Move definition of A5_CLK_GATE_FW frome common code into A5 peripheral source code.
- Use hw instead of name to describe parent_data.
- Making SCMI binding the first to submit. 
- Link to v2: https://lore.kernel.org/r/20241120-a5-clk-v2-0-1208621e961d@amlogic.com

Changes in v2:
- Move some sys clock and axi clock from peripheral to scmi impletement.
- Remove  ARM_SCMI_PROTOCOL in Kconfig and correct name A5 but not A4.
- Add two optional clock inputs for the peripheral(ddr pll and clk-measure)
- Make some changes and adjustments according to suggestions.
- Link to v1: https://lore.kernel.org/r/20240914-a5-clk-v1-0-5ee2c4f1b08c@amlogic.com

---
Chuan Liu (5):
      dt-bindings: clock: add Amlogic A5 SCMI clock controller support
      dt-bindings: clock: add Amlogic A5 PLL clock controller
      dt-bindings: clock: add Amlogic A5 peripherals clock controller
      clk: meson: add support for the A5 SoC PLL clock
      clk: meson: add A5 clock peripherals controller driver

 .../clock/amlogic,a5-peripherals-clkc.yaml         |  132 ++
 .../bindings/clock/amlogic,a5-pll-clkc.yaml        |   63 +
 drivers/clk/meson/Kconfig                          |   27 +
 drivers/clk/meson/Makefile                         |    2 +
 drivers/clk/meson/a5-peripherals.c                 | 1408 ++++++++++++++++++++
 drivers/clk/meson/a5-pll.c                         |  532 ++++++++
 .../clock/amlogic,a5-peripherals-clkc.h            |  132 ++
 include/dt-bindings/clock/amlogic,a5-pll-clkc.h    |   24 +
 include/dt-bindings/clock/amlogic,a5-scmi-clkc.h   |   44 +
 9 files changed, 2364 insertions(+)
---
base-commit: 961101258aa2da34b032ea21f32599a895448996
change-id: 20240911-a5-clk-35c49acb34e1

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



