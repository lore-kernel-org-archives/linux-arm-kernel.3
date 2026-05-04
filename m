Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782D8FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 13:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S031vBNU+JgrXTVKHjnIkVHpNj+hiUpmvamQk+gL5nA=; b=dX+FXG8l98OhRAS3h5f+1VrJZX
	JIBWCbyyv1I5puw2uSJGRJ51g5qX0ZZS3Eh55LXaUCX+0+XqpiAYLiZtAwT4srwQwcBv8JikTX79W
	1bUwfLErs4ElAniftYUIQGIucho7IjQxupRBTDlZJcRRdVEl44nEg5ZsunilPpWP1NIfrW7LGzs/q
	TSosUTEekCPOXDyvwR9pMzkoJT29hR/R1Pn43TP8rz/Gqd9lGuD3pYwOq8FBFFpspP90QxUbwWEIE
	Tv/XRGNaH/vyKW6sn/jQLpscHueejlOGH3+xnzFX32O8nwGpFd04hkmlfpGHvxnVG2un/CVIRxgea
	KsS5Iwyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJsuF-0000000DDfp-20f7;
	Mon, 04 May 2026 13:00:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJsuE-0000000DDfh-2F9q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 13:00:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B380B60125;
	Mon,  4 May 2026 13:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18410C2BCB8;
	Mon,  4 May 2026 13:00:11 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL]  Renesas SoC fixes for v7.1
Date: Mon,  4 May 2026 15:00:09 +0200
Message-ID: <cover.1777899408.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
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

	Hi SoC folks,

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v7.1-tag1

for you to fetch changes up to 7e070a14beaf036588f164575bbaf7011dd26285:

  arm64: dts: renesas: r9a09g056: Add #mux-state-cells to usb20phyrst (2026-04-27 11:14:31 +0200)

----------------------------------------------------------------
Renesas fixes for v7.1

  - Fix SCIF (serial port) clocks on R-Car X5H,
  - Fix various dtc and dtbs_check warnings.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      arm64: dts: renesas: r8a78000: Fix SCIF brg_int clocks

Marek Vasut (10):
      arm64: dts: renesas: draak/ebisu-panel: Fix missing cells and reg in DTO
      arm64: dts: renesas: salvator-panel: Fix missing cells and reg in DTO
      arm64: dts: renesas: rz-smarc-cru-csi-ov5645: Fix missing cells and reg in CSI2 subnode
      arm64: dts: renesas: rz-smarc-du-adv7513-smarc: Fix missing cells and reg in DU subnode
      ARM: dts: renesas: r8a7778: Add missing unit address to bus node
      ARM: dts: renesas: r8a7779: Add missing unit address to bus node
      ARM: dts: renesas: r8a7792: Add missing unit address to bus node
      ARM: dts: renesas: r7s72100: Add missing unit address to bus node
      ARM: dts: renesas: genmai: Drop superfluous cells
      ARM: dts: renesas: rskrza1: Drop superfluous cells

Tommaso Merciai (2):
      arm64: dts: renesas: r9a09g057: Add #mux-state-cells to usb2{0,1}phyrst
      arm64: dts: renesas: r9a09g056: Add #mux-state-cells to usb20phyrst

 arch/arm/boot/dts/renesas/r7s72100-genmai.dts                | 3 ---
 arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts               | 2 --
 arch/arm/boot/dts/renesas/r7s72100.dtsi                      | 2 +-
 arch/arm/boot/dts/renesas/r8a7778.dtsi                       | 2 +-
 arch/arm/boot/dts/renesas/r8a7779.dtsi                       | 2 +-
 arch/arm/boot/dts/renesas/r8a7792.dtsi                       | 2 +-
 arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso | 5 +++++
 arch/arm64/boot/dts/renesas/r8a78000.dtsi                    | 8 ++++----
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi                   | 1 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi                   | 2 ++
 arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi     | 5 +++++
 arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi         | 5 +++++
 arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso    | 5 +++++
 13 files changed, 31 insertions(+), 13 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

