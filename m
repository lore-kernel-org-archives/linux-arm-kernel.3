Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD69C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 16:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iBtnnRNnpsLEv58/ugRdVyDnfbX9ZflZVi6vWUF2Bqs=; b=0F20EioJHK2bULaRDWQRUY/51+
	x22R6RzhHICtS043jfXmbpc2XfELI5zUOK218JSEipER+qo+ZUE3sawZqjJz1rgtNCQ7aRDO/5+gQ
	cdGbZfod/9UhDi1WATgPdTCNsqMwoMxLpw9RmF+G3FleyuJ6akMKaEY94BJnvl46XVajxORCr6Wm4
	0ky09LY7S8s2svK66XFW9xjddfPdsRKKrH40HQ4wm5V6swgT0cQMGTTfdpkwV64XCeSY5SRwfWoFA
	aH5l1W67Fg3BqkdAo0Dw8sah5HfmVe9SUHc2QIIDFx1Se5jnOLhVRSaKWdnrHYrXyQpacqZmDMACi
	Y4vt99fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQy2-00000004MH6-26VW;
	Fri, 09 May 2025 16:52:58 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOco-00000003w74-2v06
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 14:22:57 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:805c:3876:152c:485c])
	by michel.telenet-ops.be with cmsmtp
	id n2No2E00J3X0DE5062NomE; Fri, 09 May 2025 16:22:50 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uDOca-000000012Ns-3YHG;
	Fri, 09 May 2025 16:22:48 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uDOci-00000003ADO-22u0;
	Fri, 09 May 2025 16:22:48 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DTS updates for v6.16 (take two)
Date: Fri,  9 May 2025 16:22:30 +0200
Message-ID: <cover.1746798755.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746798748.git.geert+renesas@glider.be>
References: <cover.1746798748.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_072254_869755_F33131DF 
X-CRM114-Status: GOOD (  11.25  )
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

The following changes since commit 9f78a29caacef6df5d6a43e85d1112e39cfa3b34:

  arm64: dts: renesas: r8a779h0: Add ISP core function block (2025-04-24 11:29:11 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.16-tag2

for you to fetch changes up to b280613d480aa170e51029d5582bb4b666982b7c:

  ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable USB host port (2025-05-08 20:23:33 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.16 (take two)

  - Add CANFD support for the RZ/G3E SoC and the RZ/G3E SMARC Carrier-II
    EVK development board,
  - Add support for Ethernet port A, 9-pin D-sub serial, and USB on the
    RZN1D-DB and RZN1D-EB development and expansion boards,
  - Add sound support for the Retronix Sparrow Hawk board,
  - Add General PWM Timer (GPT) support for the RZ/G2L and RZ/V2L SoCs
    and SMARC EVK boards,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (6):
      arm64: dts: renesas: r9a09g047: Add CANFD node
      arm64: dts: renesas: r9a09g047e57-smarc: Enable CANFD
      arm64: dts: renesas: r9a09g047e57-smarc: Enable CAN Transceiver
      arm64: dts: renesas: r9a07g044: Add GPT support
      arm64: dts: renesas: r9a07g054: Add GPT support
      arm64: dts: renesas: rzg2l-smarc: Enable GPT on carrier board

Geert Uytterhoeven (1):
      arm64: dts: renesas: white-hawk-single: Improve Ethernet TSN description

Krzysztof Kozlowski (1):
      arm64: dts: renesas: beacon-renesom: Align wifi node name with bindings

Kuninori Morimoto (1):
      arm64: dts: renesas: sparrow-hawk: Add MSIOF Sound support

Wolfram Sang (5):
      ARM: dts: renesas: r9a06g032-rzn1d400-eb: Add GMAC1 port
      ARM: dts: renesas: r9a06g032-rzn1d400-eb: Describe 9-pin D-sub serial port
      ARM: dts: renesas: r9a06g032-rzn1d400-db: Enable USB device port
      ARM: dts: renesas: r9a06g032-rzn1d400-db: Add pinmux for the CPLD
      ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable USB host port

 .../arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts |  14 +++
 .../arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts |  84 +++++++++++++++
 .../arm64/boot/dts/renesas/beacon-renesom-som.dtsi |   2 +-
 .../boot/dts/renesas/r8a779g3-sparrow-hawk.dts     | 106 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         | 115 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts  |   7 ++
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         | 115 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts  |   7 ++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         |  60 +++++++++++
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts |  53 ++++++++++
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi    |  29 ++++++
 .../boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi  |   5 +
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi       |   8 ++
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi   |  14 ++-
 arch/arm64/boot/dts/renesas/white-hawk-single.dtsi |   8 +-
 15 files changed, 621 insertions(+), 6 deletions(-)

