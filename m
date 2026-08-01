Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C481FC5516F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 21:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aS/Ljo3rl5c0Pa1JTsutD/lPBGCFdYAYIyZHHusiLdM=; b=NSUfTp8abxt32V
	NO1HIpG1ske3h/UUqQHDtfbC8e6a2CD/DnONQZzHAJmVMG6MpdUh75BskmxjM3GaP8rVtPLKjGgL+
	szH708pIZF7OngB2j5mamrks17xW9mNVYUfwnNycenWtMUQjXuWhNhEAOJQXA+wG8t9V+lOZvjZ34
	pMr7s4MgwkZhKJbKFTNvQVxMW+4MyJiNHs0tUxCpIZhhlDv9BKR865SS7eRRh/YsbQ+YWDf8sXolM
	G4dQ4daO5zavD7JX0kEQce/rGp+budCjvuQ7/Ts2dmxwSRFCQaDSPz6YPj2XhV/ZeNAJbb51EQ9HR
	Y0rGU5hSoAw4svYbtKTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqHSD-0000000F7sB-3JgO;
	Sat, 01 Aug 2026 21:41:13 +0000
Received: from [2a0f:4ac0::3a11] (helo=mail.cyberchaos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqHSA-0000000F7r8-2R7G
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 21:41:12 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1785620453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aS/Ljo3rl5c0Pa1JTsutD/lPBGCFdYAYIyZHHusiLdM=;
	b=toMt3Lq23KOjC0jcemfS02tF8dxTstk4Otf7hxNJJKvNPyxg8glc4q7iLwI9k/O/oNyRp9
	F/AU/4yzInfcOE0UTT5GG2fXxFPLCKy8qH4vtt3zVtbhoVT2IGMKWDgGzoV4mmZMqlLUZR
	wO01UDtA67P0qIc6kg0cFb2EhxT3hJ0=
Subject: [PATCH v2 0/9] Initial Apple Silicon M4 device trees and
 dt-bindings
Date: Sat, 01 Aug 2026 23:40:30 +0200
Message-Id: <20260801-apple-m4-initial-devicetrees-v2-0-5cb07cc275da@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/41QzW4CIRB+lQ3n0gwszIKnvkfjAYah0qirsJoa4
 7uX1VtPvUzyJd/v3EXjWriJzXAXla+llfnYgX4bBO3C8YtlSR0LDRphAivD6bRneTCyHMtSwl6
 mriJeKnOTGTlGRVPQlES3OFXO5edp/7l94XaJ30zL6rkydqUtc709869q5f0z6qokSLZoLa9Xj
 x90i1x76bm9d6LYPl6Blc+XPmt5tRAxNJY0Hw5l2QzIzkPMaIy2dqQpZosOp+AV6RSJNGlvPcB
 zS1ho17+xGTyRNxAQgZ1KwTGMwKMbWSMlGyaAzJrdH5UKCKNWGZGNB6OSSqwdmqxwcgA+wGhRe
 9OLP34BvQ/1nJcBAAA=
X-Change-ID: 20260705-apple-m4-initial-devicetrees-f6ebb1c7a2cd
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Hector Martin <marcan@marcan.st>, Linus Walleij <linusw@kernel.org>, 
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-pwm@vger.kernel.org, Yureka Lilian <yureka@cyberchaos.dev>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_144110_910872_23D94C3E 
X-CRM114-Status: GOOD (  16.09  )
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

Hi,

This series adds initial device trees and dt-bindings for the Apple
Silicon devices using the M4 (t8132) SoC. For the most part it mirrors
Janne's M3 (t8122) bringup series as it was merged in the 7.2 cycle.

This series covers only a minimal amount of hardware, which is useful
as a basis for future developments. The hardware added here has remained
largely unchanged between the M3 and M4 generations.

Most of the changes for bringing these M4 devices into a bootable state
have been happening in the m1n1 bootloader, which, compared to the M3
generation, is no longer responsible for setting the configuration bits
(🐔-bits) of the CPU, since these are now set and locked by iBoot.  

Additionally, SMP boot depends on patches to avoid WFI and WFIT
instructions, such as the idle=nop patches I sent out just before v1.
Even with those, SMP boot remains unreliable.

Since there are no actual driver changes, we'd generally prefer to merge
the dt-bindings changes through the apple-soc tree once Acked by the
respective maintainers.
There are two notable exceptions in this patch series, due to some
commits having already been applied to the respective subsystems' trees:
- "dt-bindings: watchdog: apple,wdt: Add t8132 compatible"[1] has already
  been applied to the watchdog subsystem tree, and this patch series
  will pass check_dtbs when applied on top of linux-next, which includes
  that commit.
- "dt-bindings: pinctrl: apple,pinctrl: Add t8132 compatible" should be
  applied through the pinctrl tree, since it depends on
  "dt-bindings: pinctrl: apple,pinctrl: Add t6030 and t6031 compatibles"[2]
  which has been applied in the pinctrl tree.

Link: https://lore.kernel.org/asahi/20260705-apple-m4-initial-devicetrees-v1-3-e5655ee56523@cyberchaos.dev/ [1]
Link: https://lore.kernel.org/all/20260709-apple-t603x-initial-devices-v1-7-55b305833123@jannau.net/ [2]

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
Changes in v2:
- Rebased on top of the M3 Pro/Max patch series, which was applied to
  apple-soc earlier today.
- Fix several typos
- Explain merge strategy in cover letter
- Drop "dt-bindings: watchdog: apple,wdt: Add t8132 compatible", as it's
  been applied in linux-watchdog.
- Reword dt-bindings commit messages to not reference the driver
- Add apple,always-on to ps_ans node, since powering it off causes reboots
- Disable ps_disp*_cpu nodes, since even reading their state causes
  SErrors with recent firmware
- Fix inconsistency of name and reg of aic node
- Add M4 devices to the global description in Documentation/devicetree/bindings/arm/apple.yaml
- Link to v1: https://patch.msgid.link/20260705-apple-m4-initial-devicetrees-v1-0-e5655ee56523@cyberchaos.dev

---
Yureka Lilian (9):
      dt-bindings: arm: cpus: Add Apple M4 CPU core compatibles
      dt-bindings: interrupt-controller: apple,aic2: Add apple,t8132 compatible
      dt-bindings: arm: apple: apple,pmgr: Add t8132 compatible
      dt-bindings: power: apple,pmgr-pwrstate: Add t8132 compatible
      dt-bindings: pinctrl: apple,pinctrl: Add t8132 compatible
      dt-bindings: i2c: apple,i2c: Add t8132 compatible
      dt-bindings: pwm: apple,s5l-fpwm: Add t8132 compatible
      dt-bindings: arm: apple: Add M4 based devices
      arm64: dts: apple: Add minimal t8132 (M4) device trees

 Documentation/devicetree/bindings/arm/apple.yaml   |   21 +
 .../devicetree/bindings/arm/apple/apple,pmgr.yaml  |    1 +
 Documentation/devicetree/bindings/arm/cpus.yaml    |    2 +
 .../devicetree/bindings/i2c/apple,i2c.yaml         |    1 +
 .../bindings/interrupt-controller/apple,aic2.yaml  |    1 +
 .../devicetree/bindings/pinctrl/apple,pinctrl.yaml |    1 +
 .../bindings/power/apple,pmgr-pwrstate.yaml        |    1 +
 .../devicetree/bindings/pwm/apple,s5l-fpwm.yaml    |    1 +
 arch/arm64/boot/dts/apple/Makefile                 |    6 +
 arch/arm64/boot/dts/apple/t8132-j604.dts           |   35 +
 arch/arm64/boot/dts/apple/t8132-j623.dts           |   18 +
 arch/arm64/boot/dts/apple/t8132-j624.dts           |   18 +
 arch/arm64/boot/dts/apple/t8132-j713.dts           |   35 +
 arch/arm64/boot/dts/apple/t8132-j715.dts           |   35 +
 arch/arm64/boot/dts/apple/t8132-j773g.dts          |   25 +
 arch/arm64/boot/dts/apple/t8132-jxxx.dtsi          |   48 +
 arch/arm64/boot/dts/apple/t8132-pmgr.dtsi          | 1130 ++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8132.dtsi               |  447 ++++++++
 18 files changed, 1826 insertions(+)
---
base-commit: 6e890bf6442553c7bf56867a91c2dbcc2c295900
change-id: 20260705-apple-m4-initial-devicetrees-f6ebb1c7a2cd
prerequisite-patch-id: 9cc940a660e81da8e030e383e26cd5a700fe2e80
prerequisite-patch-id: 1a60321f66e49041d1de2864f1678009a0356294

Best regards,
--  
Yureka Lilian <yureka@cyberchaos.dev>


