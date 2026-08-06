Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC4EC56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 09:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A0NbfX7EF33F5sUsmyoH2ieWnvtO3lXavryJLRSmJzY=; b=mnQ8zR1PNlGaWLHKx1gPyC39SF
	XXcyz09p3YLmij9ov8Kcy7vaR+tg1gUAAfbF2UPyOeeKSkdrieA2MKP1Yt1JhuKl126piaEG2UYTW
	gLwax4ikVGaa1goplGYrehD4W+7ZXOy7N8F7RRbggvaYhWdN31pO4Dg3o51nUj++GHmbK4mapN3ko
	+8G4giw1oU76OprSz1tZN+3z6vMZc7zLLrUq5f/7ky2oFq8CakafXx1bZg0SLMuOdgG0jke6jPdjX
	hNA7YYKwU9n40a56+V4RpDTogzfwCei41Bd6mO17Xz0CYX1ToLxS8KQZQOp5Ye34OzucVB9LAsPNu
	rRRb3yAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruUd-00000005OMl-1SZQ;
	Thu, 06 Aug 2026 09:34:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruUc-00000005OLt-3gTU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 09:34:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5CB2D41E98;
	Thu,  6 Aug 2026 09:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 281C0C2BCB9;
	Thu,  6 Aug 2026 09:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786008866;
	bh=C9JHKAjPPmXGoQ//B5ouZUxOqyevIxFUeda9hRCDS9I=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=IgHnjhzCMIzNZk8HP8xrXlD5nIYieg8anXt3cAwsTsGWgjXwCJSdGNvYFYXFvBdK2
	 1MyDlC8k27HLi9pusxWw8zlVRW3UVyPwgbTVySHkncvWGsEHz/d+GLV9Z91DGFT1hy
	 bMUR568E8BDsVQ0aowBRSISRVh7FK/xA0kWDnfosaNiISL9MlmONCzcRrDscmPaiOB
	 q+NXmu1ShgjW675VJGeYuaK/M1aP9QXAUoryBCVPYJlNUk+PWupR2d7us+fi6X09g9
	 dbyZwOQ1VnvLRjSur6PD47WochlswZ0KXqOB5CQmRgJGHWFgf4aHNl2EhOxzpBs8gD
	 TFBtwoDHmYk6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE859C55838;
	Thu,  6 Aug 2026 09:34:25 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Subject: [PATCH v2 00/10] Ambarella CV75 SoC minimal bring-up
Date: Thu, 06 Aug 2026 17:34:08 +0800
Message-Id: <20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABRVdGoC/yXMQQ6CMBBA0auQWTtJMxGwXsW4KOMINdqSDjREw
 t2puHyL/1dQSV4UrtUKSbJXH0MBnSrgwYVe0D+KgQw15mLO+I6h/w4u4jzqlMR9kHNbYyZkqm3
 LnbUNC5R+TPL0y/G+3f/WuXsJT78hbNsOtCq2FH0AAAA=
X-Change-ID: 20260804-longzhao-upstream-cv75-v2-c2597cb996ce
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
 soc@lists.linux.dev, Long Zhao <longzhao@ambarella.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786008863; l=4719;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=C9JHKAjPPmXGoQ//B5ouZUxOqyevIxFUeda9hRCDS9I=;
 b=TlVdhCw0rcuc6SGNOvniCQ+KZa7tu6qsNa/S9pG97AAqo54goGd3rssNe33YrrZj7QlPKJpVA
 8LRpmaoz7icBLaUJtwo0d0IFXVpwR4SfflGLqCGJ8iRnk0BdFsw36oZ
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

This series adds minimal Ambarella CV75 support sufficient for early
bring-up with a serial console.

It introduces DT bindings and drivers for the RCT clock controller,
pinctrl, and UART, plus ARCH_AMBARELLA, a minimal CV75 EVK device tree,
arm64 defconfig entries, and a MAINTAINERS entry.

The goal remains a small, reviewable console-capable baseline. Further
SoC peripherals can follow in later series.

This is v2. Link to v1:
https://lore.kernel.org/r/20260730104330.81367-1-longzhao@ambarella.com

Changes since v1:
- pinctrl: parent node only describes IOMUX; GPIO bank MMIO and IRQs
  live in gpio child nodes (Rob)
- pinctrl: switch DT/bindings to function + groups; keep pinmux data in
  the driver; drop include/dt-bindings/pinctrl/ambarella,pinctrl.h
  (Linus)
- pinctrl: split CV75 static data into pinctrl-ambarella-cv75.c
- clock binding: drop syscon-common and redundant assigned-clock*
  properties from the schema (Rob)
- serial: keep only SoC-specific compatible ambarella,cv75-uart
  (Krzysztof)
- scratchpad: drop generic ambarella,sec-scratchpad compatible
  (Krzysztof)
- bindings: rename ambarella,uart.yaml and ambarella,sec-scratchpad.yaml
  to SoC-specific ambarella,cv75-*.yaml names
- dts: fix GIC unit-address; add EL2 virtual timer PPI (Marc)
- uart: use container_of and guarded locks; keep break_ctl under the
  port lock; split earlycon putchar from the console path (Jiri)
- uart: convert console to nbcon; stop toggling IER around console
  writes; drain RBR before uart_handle_break()
- misc binding/DTS cleanups from review

Testing:
- Booted to console on CV75 EVK with initramfs
- scripts/checkpatch.pl --strict
- make dt_binding_check DT_SCHEMA_FILES=ambarella
- W=1 arm64 Image build for the new drivers/DTS

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
Long Zhao (10):
      dt-bindings: arm: add Ambarella CV75 platforms
      dt-bindings: soc: add Ambarella secure scratchpad
      dt-bindings: clock: add Ambarella CV75 RCT clock controller
      dt-bindings: pinctrl: add Ambarella CV75 pinctrl
      dt-bindings: serial: add Ambarella UART
      clk: ambarella: add CV75 CCU driver
      pinctrl: ambarella: add Ambarella pin controller
      serial: ambarella: add Ambarella UART driver
      arm64: ambarella: add ARCH_AMBARELLA and CV75 EVK DT
      MAINTAINERS: add ARM/AMBARELLA SoC support

 .../devicetree/bindings/arm/ambarella.yaml         |   23 +
 .../bindings/clock/ambarella,cv75-rct.yaml         |   66 +
 .../bindings/pinctrl/ambarella,cv75-pinctrl.yaml   |  175 +++
 .../bindings/serial/ambarella,cv75-uart.yaml       |   45 +
 .../ambarella/ambarella,cv75-sec-scratchpad.yaml   |   39 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 MAINTAINERS                                        |   17 +
 arch/arm64/Kconfig.platforms                       |    9 +
 arch/arm64/boot/dts/Makefile                       |    1 +
 arch/arm64/boot/dts/ambarella/Makefile             |    3 +
 arch/arm64/boot/dts/ambarella/cv75-evk.dts         |   30 +
 arch/arm64/boot/dts/ambarella/cv75.dtsi            |  166 +++
 arch/arm64/configs/defconfig                       |    3 +
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/ambarella/Kconfig                      |   16 +
 drivers/clk/ambarella/Makefile                     |    6 +
 drivers/clk/ambarella/ccu-cv75.c                   |  296 ++++
 drivers/clk/ambarella/ccu_common.c                 |   60 +
 drivers/clk/ambarella/ccu_common.h                 |   25 +
 drivers/clk/ambarella/ccu_mux_div.c                |  223 +++
 drivers/clk/ambarella/ccu_mux_div.h                |   35 +
 drivers/clk/ambarella/ccu_pll.c                    |  374 +++++
 drivers/clk/ambarella/ccu_pll.h                    |   70 +
 drivers/pinctrl/Kconfig                            |   15 +
 drivers/pinctrl/Makefile                           |    2 +
 drivers/pinctrl/pinctrl-ambarella-cv75.c           |   68 +
 drivers/pinctrl/pinctrl-ambarella.c                | 1510 ++++++++++++++++++++
 drivers/pinctrl/pinctrl-ambarella.h                |   48 +
 drivers/tty/serial/Kconfig                         |   21 +
 drivers/tty/serial/Makefile                        |    1 +
 drivers/tty/serial/ambarella_uart.c                | 1001 +++++++++++++
 include/dt-bindings/clock/ambarella,cv75-clock.h   |   17 +
 33 files changed, 4369 insertions(+)
---
base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
change-id: 20260804-longzhao-upstream-cv75-v2-c2597cb996ce

Best regards,
--  
Long Zhao <longzhao@ambarella.com>



