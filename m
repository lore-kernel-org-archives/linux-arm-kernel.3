Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B47CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 18:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dhz5odU/pdgYQBlgWm1u3nk3BZVZRJKLgTbbju+m8rg=; b=voUOcvfBcQayHadT+K1SyH10mY
	/cfrTemWo6yvHoclWDAlzHv6qAUWADCe/AEx+PKBSggztgV7vyJFJqdCvt7Ia0DGWUsLkalU36uSX
	G3Q80kHmULKGcrN1gQZqa9kevGuYrYyfphPWBpjymYaoLZvaJCKHzQvaqwlT67Je0SB9pFbaihUXO
	PDPR66YGtm3mjXV1n792ceVmzcHbivgNxOG1+4N+3wNxNkH9gtoNJ9hK62awDQXs6XHxfZCjpVU67
	0k2L6RjvPrLXq5ZRSM+Y9LF5LP2EM2027Zpw1OAQnDgPZdd72TECKmWp+c3AI+apHRQ4Uh2Pi85mI
	TlJbR/hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmr8-00000003hUM-25z3;
	Fri, 16 Oct 2026 18:40:38 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmr4-00000003hT6-1Er8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 18:40:37 +0000
Received: from francesco-nb.. (93-33-119-6.ip44.fastwebnet.it [93.33.119.6])
	by mail11.truemail.it (Postfix) with ESMTPA id 993AD1F81F;
	Fri, 16 Oct 2026 20:40:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1792176028;
	bh=dhz5odU/pdgYQBlgWm1u3nk3BZVZRJKLgTbbju+m8rg=; h=From:To:Subject;
	b=w2ppnyJFFmMCnalDgb3D0VJPrZbpvkFuJS3v0ZqeyNgaLPmbWNrgN2u38AmxEnKxs
	 xSlFM0002JM7M6VAIQKyuLH2/s+fzT6cQcNw9ZMHlb8+PsHjgZLqaUvfZM40KYAQ1F
	 x+YxXfz2e13QrMlc2YMXt17wKGwt31pJAZW5jYhbBU6cJGIFJqtL3Q2Ksn+5DKqKdc
	 yaVpknB7bwl3703D1yDUEvxM5uX8fAPvjUyZfB6QZnBUCsMmpCJ+ku++WpnQV38B04
	 qogJ8KzxiBbGgSuFSHS0lu12J2mtehrYqVwTQtnbJdBULbSPIAMRpLHVNoo/Omcfgg
	 4K96AlnWaXIwg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: dts: freescale: Remove Toradex OSM Development Board ETH_A PHY interrupt
Date: Fri, 16 Oct 2026 20:40:17 +0200
Message-ID: <20261016184020.46763-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_114035_372308_11487E04 
X-CRM114-Status: UNSURE (   9.49  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

GPIO_A7 is a boot strap on the OSM iMX95 module. The pull-up on the OSM
Development Board Ethernet PHY interrupt line causes the module to enter USB
loader mode instead of booting normally when the reset button is held for more
than 0.5 seconds.

On the OSM Development Board the PHY interrupt line reaches GPIO_A7 through a
jumper. Boards are shipped with this jumper removed to avoid the strap
conflict, with no change to the board revision, and GPIO_A7 is available in
the jumper area for general-purpose use. A future board revision might drop
the PHY interrupt connection from the schematics altogether.

Since the OSM Development Board is shared across OSM modules, switch the
Ethernet PHY to polling on OSM iMX95, iMX93 and iMX91. Polling works
regardless of whether the jumper is fitted, so this is transparent across
existing and future board revisions.

v2:
 - explain the jumper and board revision situation in the commit messages

v1: https://lore.kernel.org/all/20261014075812.29154-1-francesco@dolcini.it/

Francesco Dolcini (2):
  arm64: dts: freescale: imx95-toradex-osm-dev: Remove ETH_A PHY
    interrupt
  arm64: dts: freescale: imx93-imx91-toradex-osm-dev: Remove ETH_A PHY
    interrupt

 .../freescale/imx93-imx91-toradex-osm-dev-common.dtsi    | 6 +-----
 arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts  | 9 +++++----
 2 files changed, 6 insertions(+), 9 deletions(-)

-- 
2.47.3


