Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E28CC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 16:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+w1ZZnCvKV+oSk29eKlZh6v2QwpGqlIYSLAhcgzmPSQ=; b=X2HzE9weY3ItujLX8HTy87Kr4d
	gjpMa6iJQVe9LK4gy+koDkOgUpjZfvE6xcE+09Wc2gC58CxObSi+hYUXh0JecWa2Z/08i3h7WyqV3
	G/7jmfVYcoLTfuS247rOkJIWCoAGgQrhZuc5uI+IlEiraz0b3bVUfDcdpCspE8u6u+z1IGrgTCjp8
	7s66gbz88zO5YiYmpo4o1TMPSJpgh6GFxRTGKVMWH5RTGn7XDorq0igakk46OqavNyy/9oMZPD/+R
	PVCC7JidE0Dx4qKpmIpIqBjSHl4FySsILp9TbAxqsbF20xXlN54D3D3N9Zeo0XRsE4Pyr42ua5zs+
	0OlbwSCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNHi-00000008PTG-2cN3;
	Fri, 07 Aug 2026 16:19:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNHh-00000008PT5-2gkn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 16:19:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 092AC600B0
	for <linux-arm-kernel@lists.infradead.org>; Fri,  7 Aug 2026 16:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A5281F000E9;
	Fri,  7 Aug 2026 16:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786119540;
	bh=+w1ZZnCvKV+oSk29eKlZh6v2QwpGqlIYSLAhcgzmPSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TCd+VQSFDs+u0DCNp/HiVaweVxlNvmERKcLiNZIqWK6WobeSvPk3zdZlrw4skNkN8
	 Lf5bcUUys8/Lt0ds/6udPZbhzj45NJ2Ia597E3IWLrhvvoe1B3W4w2YzV5j66NxiVx
	 I7hqXIBZ7+z0i1Vwx1K2jxmJF3X/GjMhXkbYU86uCNMXlN9sppQ+JmD6Y696B8Op/K
	 uaDWc7r2sRc6keoRZxaXsAIzUA/QYO+0apUNa45nV7KTuDhH3jheWHM4fWhCsZMeVc
	 WA8xgMzn8YVQmj1z8dij2VLgwbYrUK+Hp39qidgyM3EtS/9i9NHnqRe8P1IZqmjewU
	 sgzfLZQ+PQO/Q==
From: Sven Peter <sven@kernel.org>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>
Subject: [GIT PULL] Apple SoC DTS changes for v7.3
Date: Fri,  7 Aug 2026 18:18:35 +0200
Message-ID: <20260807161840.6011-2-sven@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807161840.6011-1-sven@kernel.org>
References: <20260807161840.6011-1-sven@kernel.org>
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git apple-soc-dt-7.3

for you to fetch changes up to 6e890bf6442553c7bf56867a91c2dbcc2c295900:

  Merge patch series "Initial Apple M3 Pro, Max and Ultra device trees" (2026-08-01 20:50:00 +0200)

----------------------------------------------------------------
Apple SoC DTS changes for 7.3

- Initial M3 Pro, Max and Ultra device trees, which are responsible for
  the majority of the diffstat. These include CPU cores, interrupt
  controller, power state, watchdog, serial pin/gpio controller, i2c and
  the boot framebuffer. They are now on par with the base M3 device
  trees.
- HWMON sensors for M1/M2
- "pmgr-misc" nodes for M1/2 Pro/Max/Ultra which saves about 1W of power
  on these machines. The corresponding driver and dt-binding are part of
  the Apple SoC driver changes tag for this cycle.

Signed-off-by: Sven Peter <sven@kernel.org>

----------------------------------------------------------------
James Calligeros (12):
      arm64: dts: apple: t8112: Add SMC hwmon node
      arm64: dts: apple: t8103: Add SMC hwmon node
      arm64: dts: apple: t600x: Add SMC hwmon node
      arm64: dts: apple: t602x: Add SMC hwmon node
      arm64: dts: apple: Add common SMC hwmon infrastructure
      arm64: dts: apple: t8103: Add common SMC hwmon sensors
      arm64: dts: apple: t8112: Add common SMC hwmon sensors
      arm64: dts: apple: t600x: Add common SMC hwmon sensors
      arm64: dts: apple: t602x: Add common SMC hwmon sensors
      arm64: dts: apple: t8103: jxxx: Add device-specific SMC hwmon sensors
      arm64: dts: apple: t8112: jxxx: Add device-specific SMC hwmon sensors
      arm64: dts: apple: t60xx: jxxx: Add device-specific SMC hwmon sensors

Janne Grunau (9):
      dt-bindings: arm: apple: Add M3 Pro/Max/Ultra devices (T603x)
      dt-bindings: interrupt-controller: apple,aic2: Invert #interrupt-cells condition
      dt-bindings: interrupt-controller: apple,aic2: Add apple,t6031-aic3 compatible
      dt-bindings: arm: apple: apple,pmgr: Add t6030 and t6031 compatibles
      dt-bindings: power: apple,pmgr-pwrstate: Add t6030 and t6031 compatibles
      dt-bindings: i2c: apple,i2c: Add t6030 and t6031 compatibles
      dt-bindings: pwm: apple,s5l-fpwm: Add t6030 and t6031 compatibles
      arm64: dts: apple: Initial T603[124] (M3 Max and Ultra) device trees
      arm64: dts: apple: Initial T6030 (M3 Pro) device trees

Sasha Finkelstein (1):
      arm64: dts: apple: Add pmgr-misc nodes to t60xx

Sven Peter (1):
      Merge patch series "Initial Apple M3 Pro, Max and Ultra device trees"

 Documentation/devicetree/bindings/arm/apple.yaml   |   37 +
 .../devicetree/bindings/arm/apple/apple,pmgr.yaml  |    2 +
 .../devicetree/bindings/i2c/apple,i2c.yaml         |    2 +
 .../bindings/interrupt-controller/apple,aic2.yaml  |   10 +-
 .../bindings/power/apple,pmgr-pwrstate.yaml        |    2 +
 .../devicetree/bindings/pwm/apple,s5l-fpwm.yaml    |    2 +
 arch/arm64/boot/dts/apple/Makefile                 |    7 +
 arch/arm64/boot/dts/apple/hwmon-common.dtsi        |   38 +
 arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi      |   23 +
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi           |   17 +
 arch/arm64/boot/dts/apple/hwmon-laptop.dtsi        |   38 +
 arch/arm64/boot/dts/apple/hwmon-mini.dtsi          |   16 +
 arch/arm64/boot/dts/apple/t6001-j375c.dts          |    2 +
 arch/arm64/boot/dts/apple/t6001.dtsi               |    2 +
 arch/arm64/boot/dts/apple/t6002-j375d.dts          |    2 +
 arch/arm64/boot/dts/apple/t6002.dtsi               |    2 +
 arch/arm64/boot/dts/apple/t600x-die0.dtsi          |   11 +
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi     |    2 +
 arch/arm64/boot/dts/apple/t6020-j474s.dts          |    2 +
 arch/arm64/boot/dts/apple/t6021-j475c.dts          |    2 +
 arch/arm64/boot/dts/apple/t6021.dtsi               |    2 +
 arch/arm64/boot/dts/apple/t6022-j475d.dts          |    2 +
 arch/arm64/boot/dts/apple/t6022.dtsi               |    2 +
 arch/arm64/boot/dts/apple/t602x-die0.dtsi          |   11 +
 arch/arm64/boot/dts/apple/t6030-j514s.dts          |   22 +
 arch/arm64/boot/dts/apple/t6030-j516s.dts          |   22 +
 arch/arm64/boot/dts/apple/t6030-pmgr.dtsi          | 1437 ++++++++++++
 arch/arm64/boot/dts/apple/t6030.dtsi               |  524 +++++
 arch/arm64/boot/dts/apple/t6031-base.dtsi          |  297 +++
 arch/arm64/boot/dts/apple/t6031-die0.dtsi          |  197 ++
 arch/arm64/boot/dts/apple/t6031-dieX.dtsi          |  107 +
 arch/arm64/boot/dts/apple/t6031-gpio-pins.dtsi     |   53 +
 arch/arm64/boot/dts/apple/t6031-j514c.dts          |   18 +
 arch/arm64/boot/dts/apple/t6031-j516c.dts          |   18 +
 arch/arm64/boot/dts/apple/t6031-pmgr.dtsi          | 2400 ++++++++++++++++++++
 arch/arm64/boot/dts/apple/t6031.dtsi               |   48 +
 arch/arm64/boot/dts/apple/t6032-j575d.dts          |   46 +
 arch/arm64/boot/dts/apple/t6032.dtsi               |  416 ++++
 arch/arm64/boot/dts/apple/t6034-j514m.dts          |   18 +
 arch/arm64/boot/dts/apple/t6034-j516m.dts          |   18 +
 arch/arm64/boot/dts/apple/t6034.dtsi               |   53 +
 arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi     |   66 +
 arch/arm64/boot/dts/apple/t8103-j274.dts           |    2 +
 arch/arm64/boot/dts/apple/t8103-j293.dts           |    3 +
 arch/arm64/boot/dts/apple/t8103-j313.dts           |    2 +
 arch/arm64/boot/dts/apple/t8103.dtsi               |    5 +
 arch/arm64/boot/dts/apple/t8112-j413.dts           |    2 +
 arch/arm64/boot/dts/apple/t8112-j415.dts           |    2 +
 arch/arm64/boot/dts/apple/t8112-j473.dts           |    2 +
 arch/arm64/boot/dts/apple/t8112-j493.dts           |    3 +
 arch/arm64/boot/dts/apple/t8112.dtsi               |    5 +
 51 files changed, 6018 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/apple/hwmon-common.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/hwmon-fan.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/hwmon-mini.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t6030-j514s.dts
 create mode 100644 arch/arm64/boot/dts/apple/t6030-j516s.dts
 create mode 100644 arch/arm64/boot/dts/apple/t6030-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t6030.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t6031-base.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t6031-die0.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t6031-dieX.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t6031-gpio-pins.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t6031-j514c.dts
 create mode 100644 arch/arm64/boot/dts/apple/t6031-j516c.dts
 create mode 100644 arch/arm64/boot/dts/apple/t6031-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t6031.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t6032-j575d.dts
 create mode 100644 arch/arm64/boot/dts/apple/t6032.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t6034-j514m.dts
 create mode 100644 arch/arm64/boot/dts/apple/t6034-j516m.dts
 create mode 100644 arch/arm64/boot/dts/apple/t6034.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi

