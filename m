Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0AACE7AA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 10:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lVAFmSzAzKR1X6k+neB8TO4t6pS0Edy4vysyD0h0Zfg=; b=EQkHaaRWZxgfnY/8VOZXPSdYwh
	ra5Tpkvf5VaU6qfmxIXg/LrwH63sC0bQhdBKHf7ud262Fwdu4kuCz318lwFFXNVq4ZSeRbpRYCwek
	8Tac/H3hVooqbGncXzjJ+mfGpF5AInMJqahhCTf+j7TK3CtRr5fp/RGWV82NLHgakYDIhCOBIyV6y
	mEbzQpSdoJIB7iOdwjbnprSTiz7bW8NHndmBtJXV8t7DZZwRxKa/FxP9jvUeeISlq0fkoIwMaEIMy
	vsq9b05guVwqz0QHQ9r5O6Gn3Lek5+3mLZgIkvZCH6mTvY0VmW5+xd56A7UzhhSW3bMw9KCZYfBaN
	YgoCbnFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJr4e-0000000C19u-48pH;
	Fri, 14 Nov 2025 10:30:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJr4U-0000000C17J-0NvX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 10:30:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CAE71407EA;
	Fri, 14 Nov 2025 10:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96FA1C4CEF8;
	Fri, 14 Nov 2025 10:30:24 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/2] Renesas DTS updates for v6.19 (take two)
Date: Fri, 14 Nov 2025 11:30:17 +0100
Message-ID: <cover.1763115234.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763115230.git.geert+renesas@glider.be>
References: <cover.1763115230.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_023026_166641_B19E9896 
X-CRM114-Status: UNSURE (   9.55  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The following changes since commit 9d22a34a016313137b9e534a918f1f9aa790aa69:

  arm64: dts: renesas: sparrow-hawk: Fix full-size DP connector node name and labels (2025-10-31 10:16:03 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.19-tag2

for you to fetch changes up to b272b94fd223977a79cb521dc7f14a8041b3fb3f:

  arm64: dts: renesas: rzt2h-n2h-evk: Enable Ethernet support (2025-11-13 21:19:22 +0100)

----------------------------------------------------------------
Renesas DTS updates for v6.19 (take two)

  - Add Imagination Technologies PowerVR Series 7XE GE7800 GPU support
    for the R-Car M3-N and V3U SoCs,
  - Add Ethernet support for the RZ/T2H and RZ/N2H SoCs and their
    evaluation boards,
  - Add ADC support for the RZ/N1D SoC,
  - Add thermal, NMI pushbutton, and RTC support for the RZ/V2H SoC and
    the RZ/V2H EVK development board,
  - Add USB2.0 support for the RZ/G3S SoC and the RZ/G3S SMARC Carrier
    II board.

----------------------------------------------------------------
Claudiu Beznea (2):
      arm64: dts: renesas: r9a08g045: Add USB support
      arm64: dts: renesas: rzg3s-smarc: Enable USB support

Geert Uytterhoeven (1):
      Merge tag 'renesas-r8a779a0-dt-binding-defs-tag2' into renesas-dts-for-v6.19

Herve Codina (Schneider Electric) (1):
      ARM: dts: renesas: r9a06g032: Add the ADC device

Lad Prabhakar (5):
      arm64: dts: renesas: r9a09g077: Add ETHSS node
      arm64: dts: renesas: r9a09g087: Add ETHSS node
      arm64: dts: renesas: r9a09g077: Add GMAC nodes
      arm64: dts: renesas: r9a09g087: Add GMAC nodes
      arm64: dts: renesas: rzt2h-n2h-evk: Enable Ethernet support

Marek Vasut (1):
      arm64: dts: renesas: r8a77965: Add GE7800 GPU node

Niklas Söderlund (2):
      dt-bindings: clock: r8a779a0: Add ZG core clock
      arm64: dts: renesas: r8a779a0: Add GE7800 GPU node

Ovidiu Panait (4):
      arm64: dts: renesas: r9a09g057: Add TSU nodes
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add NMI pushbutton support
      arm64: dts: renesas: r9a09g057: Add RTC node
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable RTC

 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |  10 +
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |  17 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  17 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi         | 118 +++++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         |  90 ++++
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  17 +
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi         | 482 ++++++++++++++++++++
 .../boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  70 +++
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi         | 485 +++++++++++++++++++++
 .../boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts    |  78 ++++
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi       |  57 +++
 .../boot/dts/renesas/rzt2h-n2h-evk-common.dtsi     |  70 +++
 include/dt-bindings/clock/r8a779a0-cpg-mssr.h      |   1 +
 13 files changed, 1512 insertions(+)

