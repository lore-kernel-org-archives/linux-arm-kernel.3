Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6825CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 12:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00k9z3skB7gR2LLupKcDepgXtJjZzHUw4H/B5ReRTKM=; b=sh204r9HKdivZX5w+0QeNTgcR6
	nN+DQD3QY8TUv8/RFbEFenKuas6j9Cb68wRy142WdBlxBhmA/2+vyYa1JEGPMv+WyUhllZ5lZh0qE
	+8NkfsnlZzSLgpZ6VR6kMOnHL6Gwj8PE5RSq3eoLthXjPE18fJoSLL5+rgPneyIvsLGU9IFmsJ8tG
	vCVbQFT+XHZIbtbK5YW8Y0qwTM3GSJB7T1EzCO7dWRc8a7/o+sGLmnc4Xvai6LcpKeP/AAM4W2HUx
	gIgC1WEC6OhvHi0eh/bm7xudTIHvn6XWgLEoJncmqO/g5PyA3sXnlcWfsyJJV13JBEaQ3oQyQlg8q
	RjhwXloA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzwje-00000005KfM-26Q3;
	Sat, 20 Sep 2025 12:30:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzwjc-00000005Kes-39YS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 12:30:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D2DF6014D
	for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Sep 2025 12:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BCFDC4CEF7;
	Sat, 20 Sep 2025 12:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758371435;
	bh=azjtBgg9o8jYuuDI1h5t3q803QLZoJl/KPkMwExin3Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WdhGKz7iOT5/i+kSqRcvVLN0ApfKvwUHjabdMZZkluxpQS4s8a5ZO5IfGeeWreasd
	 XBBCb6SM3dB/AJGmxHS4IqWdcO7RqRHwnAJnq9zoiuL9qlsMmFIaA8QOJgYx+3v3KD
	 bNu6qek6IRu5gikpFrHfZSA1WlU5Lnqa2AtqBgrRZRqvhivoPc183l++Q32VkAqGif
	 0tiVu8KV+8f+DuvrTBQASDuWqmcFmGf5SUj6xBPou5Ev+COuKRQxaC8us+3dtxEcDc
	 vC37tUxMrNomi4UT/dK5Ya2SF3REei3TlNDUS1VoCYBHlmjR2BKGSuhhy445I8kRrK
	 khr2nSvs2EmMg==
From: Sven Peter <sven@kernel.org>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 2/2] Apple SoC DTS changes for v6.18
Date: Sat, 20 Sep 2025 14:30:28 +0200
Message-Id: <20250920123028.49973-2-sven@kernel.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250920123028.49973-1-sven@kernel.org>
References: <20250920123028.49973-1-sven@kernel.org>
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

The following changes since commit 4379305ffbc2eebe3de673fc965145d441c89b8f:

  arm64: dts: apple: t600x: Add SMC node (2025-08-10 20:21:57 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git tags/apple-soc-dt-6.18-part2

for you to fetch changes up to 70fa521f4d55127c85d7c2defe8c20be75e29efd:

  arm64: dts: apple: t8015: Add SPMI node (2025-09-18 21:13:45 +0200)

----------------------------------------------------------------
Apple SoC DTS updates for 6.18, part 2

- New device trees for all M2 Pro, Max and Ultra models are added.
  This is responsible for most of the changed lines since we already
  need 2000+ lines just to describe all the power domains inside
  t602x-pmgr.dtsi for these SoCs.
- Missing WiFi properties for t600x are added.
- Bluetooth nodes are added for all t600x machines.
- The PCIe ethernet iommu-map was fixed for the Apple M1 iMac
  to account for a disabled PCIe port.
- SPMI, NVMe, SART and mailbox nodes for Apple's T2 and A11.

----------------------------------------------------------------
Hector Martin (5):
      arm64: dts: apple: t600x: Add missing WiFi properties
      arm64: dts: apple: t600x: Add bluetooth device nodes
      arm64: dts: apple: Add initial t6020/t6021/t6022 DTs
      arm64: dts: apple: Add J414 and J416 Macbook Pro device trees
      arm64: dts: apple: Add J180d (Mac Pro, M2 Ultra, 2023) device tree

Janne Grunau (6):
      arm64: dts: apple: t8103-j457: Fix PCIe ethernet iommu-map
      dt-bindings: arm: apple: Add t8112 j415 compatible
      arm64: dts: apple: Add devicetreee for t8112-j415
      dt-bindings: arm: apple: Add t6020x compatibles
      arm64: dts: apple: Add ethernet0 alias for J375 template
      arm64: dts: apple: Add J474s, J475c and J475d device trees

Nick Chan (4):
      arm64: dts: apple: t8015: Fix PCIE power domains dependencies
      arm64: dts: apple: t8015: Add NVMe nodes
      arm64: dts: apple: t8012: Add SPMI node
      arm64: dts: apple: t8015: Add SPMI node

 Documentation/devicetree/bindings/arm/apple.yaml |   41 +-
 arch/arm64/boot/dts/apple/Makefile               |    9 +
 arch/arm64/boot/dts/apple/t6000-j314s.dts        |    8 +
 arch/arm64/boot/dts/apple/t6000-j316s.dts        |    8 +
 arch/arm64/boot/dts/apple/t6001-j314c.dts        |    8 +
 arch/arm64/boot/dts/apple/t6001-j316c.dts        |    8 +
 arch/arm64/boot/dts/apple/t6001-j375c.dts        |    8 +
 arch/arm64/boot/dts/apple/t6002-j375d.dts        |    8 +
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi   |   10 +
 arch/arm64/boot/dts/apple/t600x-j375.dtsi        |   11 +
 arch/arm64/boot/dts/apple/t6020-j414s.dts        |   26 +
 arch/arm64/boot/dts/apple/t6020-j416s.dts        |   26 +
 arch/arm64/boot/dts/apple/t6020-j474s.dts        |   47 +
 arch/arm64/boot/dts/apple/t6020.dtsi             |   22 +
 arch/arm64/boot/dts/apple/t6021-j414c.dts        |   26 +
 arch/arm64/boot/dts/apple/t6021-j416c.dts        |   26 +
 arch/arm64/boot/dts/apple/t6021-j475c.dts        |   37 +
 arch/arm64/boot/dts/apple/t6021.dtsi             |   69 +
 arch/arm64/boot/dts/apple/t6022-j180d.dts        |  121 ++
 arch/arm64/boot/dts/apple/t6022-j475d.dts        |   42 +
 arch/arm64/boot/dts/apple/t6022-jxxxd.dtsi       |   38 +
 arch/arm64/boot/dts/apple/t6022.dtsi             |  349 ++++
 arch/arm64/boot/dts/apple/t602x-common.dtsi      |  465 +++++
 arch/arm64/boot/dts/apple/t602x-die0.dtsi        |  575 ++++++
 arch/arm64/boot/dts/apple/t602x-dieX.dtsi        |  128 ++
 arch/arm64/boot/dts/apple/t602x-gpio-pins.dtsi   |   81 +
 arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi   |   45 +
 arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi   |   38 +
 arch/arm64/boot/dts/apple/t602x-nvme.dtsi        |   42 +
 arch/arm64/boot/dts/apple/t602x-pmgr.dtsi        | 2265 ++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8012.dtsi             |    8 +
 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi        |    1 +
 arch/arm64/boot/dts/apple/t8015.dtsi             |   42 +
 arch/arm64/boot/dts/apple/t8103-j457.dts         |   12 +-
 arch/arm64/boot/dts/apple/t8112-j415.dts         |   80 +
 35 files changed, 4727 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/apple/t6020-j414s.dts
 create mode 100644 arch/arm64/boot/dts/apple/t6020-j416s.dts
 create mode 100644 arch/arm64/boot/dts/apple/t6020-j474s.dts
 create mode 100644 arch/arm64/boot/dts/apple/t6020.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t6021-j414c.dts
 create mode 100644 arch/arm64/boot/dts/apple/t6021-j416c.dts
 create mode 100644 arch/arm64/boot/dts/apple/t6021-j475c.dts
 create mode 100644 arch/arm64/boot/dts/apple/t6021.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t6022-j180d.dts
 create mode 100644 arch/arm64/boot/dts/apple/t6022-j475d.dts
 create mode 100644 arch/arm64/boot/dts/apple/t6022-jxxxd.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t6022.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t602x-common.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t602x-die0.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t602x-dieX.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t602x-gpio-pins.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t602x-nvme.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t602x-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8112-j415.dts

