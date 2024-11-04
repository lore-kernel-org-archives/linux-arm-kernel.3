Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29637D132C4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 13:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FqDWQ6fhSe2gTpt/um6UruBk65uQkqperaVVlS0IWis=; b=BYKgQ2Q0WTVoS9u73ZreNskqXi
	OInlJnUJFh+gBZONe/vhgy19B5fx1U7mAgyey6dehPTa59oR8FppVTj3COaunUjl6X2rb61/Q0cWP
	MPOcQ5rWVY+015DkL+5qgFGFCPgoe4NJKeWgo6PGnASyR5PCp6buyoFxmznsy8Qb0ihXalBYduT/N
	mwqhks6ZTvwsu9W4Pz2Qv/W8iOEstWjvHNuAhhOwxTemFGn3bJqHxx2ld9PV9zjjV7rvpQA4qVPa/
	gYgMqQCujQBt4biIhb/VDbDfxDN11Jp9Tm/NmxYAOQgTWE6KnqH08k7XKKRlNmVNyrfWt7SqraZ4i
	0nb099Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xCv-0000000Dscf-2jeW;
	Mon, 04 Nov 2024 13:33:25 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7x6V-0000000Dr0m-1sXU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 13:26:49 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ae0d:26ef:36dd:9be1])
	by baptiste.telenet-ops.be with cmsmtp
	id YdSh2D00X31l0Qj01dShxN; Mon, 04 Nov 2024 14:26:42 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t7x65-006FvO-U9;
	Mon, 04 Nov 2024 14:26:41 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t7x6P-000BK3-KO;
	Mon, 04 Nov 2024 14:26:41 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/2] Renesas DTS updates for v6.13 (take two)
Date: Mon,  4 Nov 2024 14:26:40 +0100
Message-Id: <cover.1730726155.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730726152.git.geert+renesas@glider.be>
References: <cover.1730726152.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_052647_647999_D7485F07 
X-CRM114-Status: GOOD (  12.60  )
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

The following changes since commit 1e03bd2cf0d68a4138f2347bd77ef12b8726d214:

  arm64: dts: renesas: rzg3s-smarc: Use interrupts-extended for gpio-keys (2024-10-14 10:16:17 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.13-tag2

for you to fetch changes up to 0cd647cd53db0315361e41056e10739a5ee1e668:

  arm64: dts: renesas: rzg3s-smarc-som: Enable RTC (2024-11-03 12:29:51 +0100)

----------------------------------------------------------------
Renesas DTS updates for v6.13 (take two)

  - Add a CPU Operating Performance Points table for the RZ/V2H SoC,
  - Add Battery Backup Function (VBATTB) and RTC support for the RZ/G3S
    SoC and the RZ/G3S SMARC SoM,
  - Add DMAC support for MMC on the RZ/A1H SoC and the Genmai
    development board,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Claudiu Beznea (6):
      dt-bindings: clock: r9a08g045-cpg: Add power domain ID for RTC
      dt-bindings: clock: renesas,r9a08g045-vbattb: Document VBATTB
      arm64: dts: renesas: r9a08g045: Add VBATTB node
      arm64: dts: renesas: r9a08g045: Add RTC node
      arm64: dts: renesas: rzg3s-smarc-som: Enable VBATTB
      arm64: dts: renesas: rzg3s-smarc-som: Enable RTC

Geert Uytterhoeven (2):
      arm64: dts: renesas: white-hawk-cpu-common: Add pin control for DSI-eDP IRQ
      Merge tag 'renesas-r9a08g045-dt-binding-defs-tag3' into renesas-dts-for-v6.13

Lad Prabhakar (2):
      arm64: dts: renesas: r9a09g057: Add OPP table
      arm64: dts: renesas: hihope: Drop #sound-dai-cells

Wolfram Sang (2):
      ARM: dts: renesas: r7s72100: Add DMAC node
      ARM: dts: renesas: r7s72100: Add DMA support to MMCIF

 .../bindings/clock/renesas,r9a08g045-vbattb.yaml   | 84 ++++++++++++++++++++++
 arch/arm/boot/dts/renesas/r7s72100.dtsi            | 33 +++++++++
 arch/arm64/boot/dts/renesas/hihope-rev2.dtsi       |  3 -
 arch/arm64/boot/dts/renesas/hihope-rev4.dtsi       |  3 -
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi         | 34 +++++++++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         | 41 +++++++++++
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi   | 16 +++++
 .../boot/dts/renesas/white-hawk-cpu-common.dtsi    |  8 +++
 include/dt-bindings/clock/r9a08g045-cpg.h          |  1 +
 .../dt-bindings/clock/renesas,r9a08g045-vbattb.h   | 13 ++++
 10 files changed, 230 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml
 create mode 100644 include/dt-bindings/clock/renesas,r9a08g045-vbattb.h

