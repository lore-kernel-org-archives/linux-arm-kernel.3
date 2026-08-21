Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D49C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z731BjH5rnDd5aybMq6kivsN8BP8Ax5qUenloHORtJs=; b=QvzYEzima4jmaA
	LkFrG/5JoB1HTUOmrZkphECSt8+PaHPMpdq89rYoKmX1Rt5DM2bRqn8Kz9gyUECLUN1wxb6zZHRAx
	VcdyYXIoVVSwwZCxF8waRZSefKDOyWuD3U89jMNVig/LBnfhurtXlVCGdA6hxQ/8KgAvrOhCv6JrG
	z87Tkq4qm6AUmt6uc8ygEZAiprKZ+nnNGXvbJ0ij8P4Dv9qS0fzdkmanwFJSruu1mJXFJ2HPgrnDI
	mvRaWf4RKUAHBFqlyygex0s+qoEmyfFjPgutLVmhJI3IP9FY2KH2ox+nALqU9uZDlvvpzMzNa0ai/
	SCtUF0UyKVMLQpPnabkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLvo-0000000Cyt3-0DGx;
	Fri, 21 Aug 2026 09:53:00 +0000
Received: from [38.71.22.102] (helo=spam.axera-tech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLvk-0000000Cyrf-2IDI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 09:52:58 +0000
Received: from spam.axera-tech.com (localhost [127.0.0.2] (may be forged))
	by spam.axera-tech.com with ESMTP id 67L9VrYv009889
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 17:31:53 +0800 (+08)
	(envelope-from lenghonglin@axera-tech.com)
Received: from aixinexchange02.aixin-chip.com ([10.122.86.161])
	by spam.axera-tech.com with ESMTPS id 67L9USlA009398
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Aug 2026 17:30:28 +0800 (+08)
	(envelope-from lenghonglin@axera-tech.com)
Received: from [127.0.1.1] (10.126.103.103) by aixinexchange02.aixin-chip.com
 (10.122.86.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 21 Aug
 2026 17:30:25 +0800
From: Leng Honglin <lenghonglin@axera-tech.com>
Subject: [PATCH 0/6] arm64: Introduce Axera AX650 SoC and AX650 Demo board
Date: Fri, 21 Aug 2026 17:30:00 +0800
Message-ID: <20260821-ax650-v1-v1-0-e1b013938e6b@axera-tech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJkaiGoC/yXMQQqAIBCF4avErBMcQcmuEi3MppoWFloRRHfPa
 vnB/94FiSJTgrq4INLBiZeQgWUBfnJhJMF9NiipjKywEu40WooDhR20R2t0j2Qg52ukgc/vqml
 /p72byW/vHu77ATMMxgNsAAAA
X-Change-ID: 20260818-ax650-v1-9f5c1965d1e6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shi Zhicheng
	<shizhicheng@axera-tech.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will
 Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus
 Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <soc@lists.linux.dev>,
        Leng Honglin
	<lenghonglin@axera-tech.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787304625; l=2694;
 i=lenghonglin@axera-tech.com; s=20260818; h=from:subject:message-id;
 bh=XiqqMU+n2H4IsNsfEhAreZfC2soM/m4qASUAU3DYM3M=;
 b=LWQupdQRcvIFUKzmTjeNX95B4ozK4icK+Am/IHRM3/dwUbKbHmnmfKebxCCjgZzxFWv3GU9zi
 W9sX3V+Xj8TBw/hZP0ak8mgOAFgdbrbvG9n+2CsyqMcYGYlNR482yoY
X-Developer-Key: i=lenghonglin@axera-tech.com; a=ed25519;
 pk=fo0agzxyiwbJZc3VZRLVthobvWCvq0qAViAw4TxhF80=
X-Originating-IP: [10.126.103.103]
X-ClientProxiedBy: aixinexchange02.aixin-chip.com (10.122.86.161) To
 aixinexchange02.aixin-chip.com (10.122.86.161)
X-DKIM-Results: [10.122.86.161]; dkim=none;
X-DNSRBL: 
X-MAIL: spam.axera-tech.com 67L9VrYv009889
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_025257_310725_61269459 
X-CRM114-Status: GOOD (  17.84  )
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

Axera AX650 is an Arm64 SoC developed by Axera Semiconductor. The
AX650 Demo board is based on the AX650 SoC and provides the hardware
platform used to validate this series.

This series adds the initial upstream support required to build and
boot the Linux kernel on the AX650 Demo board.

The initial platform support includes:

- Axera AX650 SoC and AX650 Demo devicetree bindings
- ARCH_AXERA arm64 platform selection
- arm64 defconfig support
- Cortex-A55 CPUs and PSCI
- GIC-400 interrupt controller
- ARMv8 architectural timer
- Cortex-A55 PMU
- UART console
- 8 GiB system memory
- Axera ARM64 SoC maintainer information

The patches are organized as follows:

- Patch 1/6: Add the Axera vendor prefix.
- Patch 2/6: Add devicetree bindings for the AX650 SoC and
  AX650 Demo board.
- Patch 3/6: Add the ARCH_AXERA arm64 platform option.
- Patch 4/6: Enable ARCH_AXERA in the arm64 defconfig.
- Patch 5/6: Add the initial devicetree description for the AX650 SoC
  and AX650 Demo board.
- Patch 6/6: Add Axera ARM64 SoC entries to MAINTAINERS.

The series is intentionally limited to the minimum platform support
required to boot the board with a serial console. Additional
peripherals will be added in subsequent patches.

The platform was tested on an AX650 Demo board using the vendor boot
chain to load the kernel and device tree. A kernel with an embedded
initramfs successfully reached an interactive shell on the serial
console, and all 8 CPUs were brought online.

Signed-off-by: Leng Honglin <lenghonglin@axera-tech.com>
---
Leng Honglin (6):
      dt-bindings: vendor-prefixes: add Axera
      dt-bindings: arm: add Axera AX650 SoC and AX650 Demo board
      arm64: Kconfig.platforms: add ARCH_AXERA
      arm64: defconfig: enable ARCH_AXERA
      arm64: dts: axera: add AX650 Demo initial support
      MAINTAINERS: add Axera ARM SoC support

 Documentation/devicetree/bindings/arm/axera.yaml   |  24 ++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   8 ++
 arch/arm64/Kconfig.platforms                       |   5 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/axera/Makefile                 |   3 +
 arch/arm64/boot/dts/axera/ax650-demo.dts           |  30 +++++
 arch/arm64/boot/dts/axera/ax650.dtsi               | 134 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 9 files changed, 208 insertions(+)
---
base-commit: ff68e5f557f69a08fdcfa4ce8b1b809d63bd4f45
change-id: 20260818-ax650-v1-9f5c1965d1e6

Best regards,
--  
Leng Honglin <lenghonglin@axera-tech.com>


