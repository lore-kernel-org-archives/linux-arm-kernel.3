Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B23C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 19:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OHA9zlC97iQEd9Z/K0ZMi6fcOGFr2AIQ8m935rD2YRM=; b=iQ0ghnPTR/QHF4
	OoVXFfsqWEvyrqsZWTtgi2LR7qm1yGW0tL5mH4IELRBG2dIYUBjzSjAKB8e1u4kLtM9u65Z1wg0ED
	tZBl65hAsVWRZHdGFr+Cr8k24VmjeuwppGwoL9QSlXjkx4r0WxlI4VyaBFnyVGfpkWvWVso7BNn6q
	RqWxeZQpcMJYYT9Wtt6MRdQbEoc/s6JxTTW74s2BzdWrjq40pFK7frc2UE1ZoSPto5YeqL/LYR0fT
	se7e6DIIuAfU64AJ/S/JTSO4up42hDKQHE1Pbflyk+zyfmdZY+qphn//PTfMnFcbYshoWEazPOXau
	h8npPW5GdTycf2QjuPwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtsHk-0000000Er9m-2ZIZ;
	Tue, 11 Aug 2026 19:37:16 +0000
Received: from mail.cyberchaos.dev ([195.39.247.168])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtsHf-0000000Er3n-1keK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 19:37:14 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1786477022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OHA9zlC97iQEd9Z/K0ZMi6fcOGFr2AIQ8m935rD2YRM=;
	b=1G1uTXboJ3+0TChcjCo/PBxFkklV7vYSqa+BsVaxW5SfprIUFR/lq/XMANH7pPjWjl4F/w
	mbcRdore3GBWcwEHmDyLwwG6gFsSD/YsO0i8PEixQ50f5uwD83pXJUmx8EjWfkrcKqmCh9
	7QVj4VQfNQqFgldVij4bekfLU5YVGto=
Subject: [PATCH v3 0/9] Initial Apple Silicon M4 device trees and
 dt-bindings
Date: Tue, 11 Aug 2026 21:36:53 +0200
Message-Id: <20260811-apple-m4-initial-devicetrees-v3-0-6bf32d45ad0b@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42QzU4DMQyEX6XKmSDnz0l64j0Qh8Tx0iDaLZvti
 qrqu5NtD0hwgIulkcbf2HMRjafKTWw3FzHxUlsdD12Yh42gXTq8sqyla6FBI3hwMh2P7yz3VtZ
 DnWt6l6VvEc8Tc5MDcs6KfNJUREccJx7q5w3//HLX7ZTfmOaVuTp2tc3jdL7lL2r1/TNqURIkO
 3SO16nNE50zT/3osT12o1jzFv1NDKD+IOpOdJTBE2nvSvpFvN5fmPjj1Iua73+JnBpLGvf7Om8
 3yCFCHtBa7ZwhnweHAX2KinTJHUw6ughwayfNtOv9bjeRKFpIiMBBlRQYDLAJhjVScckDDKw5/
 NhSCcFoNSCyjWBVUYV1QDso9AEgJjAOdbT98OsX8jfwIekBAAA=
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
X-CRM114-CacheID: sfid-20260811_123711_646128_5FD100D2 
X-CRM114-Status: GOOD (  16.45  )
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
Changes in v3:
- Fix pinctrl_nub node ordering
- Add i-cache-size and d-cache-size
- Link to v2: https://patch.msgid.link/20260801-apple-m4-initial-devicetrees-v2-0-5cb07cc275da@cyberchaos.dev

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
 arch/arm64/boot/dts/apple/t8132.dtsi               |  467 ++++++++
 18 files changed, 1846 insertions(+)
---
base-commit: 6e890bf6442553c7bf56867a91c2dbcc2c295900
change-id: 20260705-apple-m4-initial-devicetrees-f6ebb1c7a2cd
prerequisite-patch-id: 9cc940a660e81da8e030e383e26cd5a700fe2e80
prerequisite-patch-id: 1a60321f66e49041d1de2864f1678009a0356294

Best regards,
--  
Yureka Lilian <yureka@cyberchaos.dev>


