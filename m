Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E8CC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 10:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oig9/2Z6FM/jxxKaWn92rPhU8H6GU/PLXD9pseFMf7k=; b=bdClAZ4moSRBzTJ8yI8cEVSs3t
	NxywjdvFfiVKSpd4Rbyfj9vK7QvUodpSv4PCCKOK7AyLGtZp9PGcHt1DljKRG8K60i+sPA+tibNLI
	lMRCtP4ZzaujQF9H/AJHULbzzScf7MicqF3YIwtcldPILQjHnSqVxjXHnDckWwU46PMnYE7heekJK
	3XOlOX8Q7et5LFguWVgFK2JieSlQk7z5KlOlJIg1Jx9JwOL6B2IqVPyiH911B9SWl11JJyUXiT6JM
	0esTL6hrBMQ/KU0Owy1YE2vx0NEcKrDMMwMwDsX6f6nJMkdfa8f8W25exq9fZmvV1OjkGkeRcbrbi
	pwNzoxIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQfD-000000098FI-336z;
	Mon, 12 May 2025 10:45:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQZD-000000097Tg-1Iol
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 10:39:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AA6AF4A241;
	Mon, 12 May 2025 10:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9DB6C4CEF1;
	Mon, 12 May 2025 10:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747046366;
	bh=SBRvjhmUtNuaagTaAy5xBuW4p4p/zWlNthxNMMao0OU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bTGXERYLRij4sOf/9Qbo7aPWtcEMIeOXa+S2K9OBy2m96Fnr1uAf/gzXtKAgp79FF
	 7+uJXAxerLMb4VHO0pPw/FJQAXQVG1atPWe0qm3f4YhmEk9RNDnQWWNh6uIg1lYI63
	 DDb+NZKlFonkgJX/d8b/vdYSyMZks3fgroKCadaBJ8AbyWhpY8BrGWURr/J9OPjagD
	 oNgylx06mBMyrU6Hlc4g+GJnnoKunIL7KOd8Hx8iIs/6fl9pijxpO5xRtWWX7pA3kC
	 6fzBj9HDRjqrfvOi1Do7d7qB2dPynz8gBgOTqOJvui3oyo74RUlQROY6kzrSsM4TT/
	 f5GvwLQBU9+kw==
From: Shawn Guo <shawnguo@kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/5] i.MX ARM device tree change for 6.16
Date: Mon, 12 May 2025 11:38:56 +0100
Message-Id: <20250512103858.50501-3-shawnguo@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250512103858.50501-1-shawnguo@kernel.org>
References: <20250512103858.50501-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_033927_395361_6C2B3E6D 
X-CRM114-Status: GOOD (  12.64  )
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

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-6.16

for you to fetch changes up to 10d0bc88bbc884519abe7d966d86b1ca7f3d686b:

  ARM: dts: mxs: use padconfig macros (2025-05-09 22:53:33 +0800)

----------------------------------------------------------------
i.MX ARM device tree change for 6.16:

- A series from Alexander Stein that updates ls1021a-tqmals1021a device
  tree mostly for display support inlcuding HDMI, LVDS and CDTech panel
- A change from Dario Binacchi to use pad config defines for i.MX23/28
  device trees
- A i.MX7D change from Efe Can İçöz to include min and max voltage in
  opp-microvolt
- A few patches from Fabio Estevam to fix dt-schema warnings
- A couple of changes from Krzysztof Kozlowski to align NAND and WIFI
  node name with binings
- A clean-up change from Rob Herring to drop redundant CPU
  "clock-latency"

----------------------------------------------------------------
Alexander Stein (7):
      ARM: dts: ls1021a-tqmals1021a: Fix license
      ARM: dts: ls1021a-tqmals1021a: Add vcc-supply for spi-nor
      ARM: dts: ls1021a-tqmals1021a: Add HDMI overlay
      ARM: dts: ls1021a-tqmals1021a: Add LVDS overlay for Tianma TM070JVGH33
      ARM: dts: ls1021a-tqmals1021a: Add overlay for CDTech FC21 RGB display
      ARM: dts: ls1021a-tqmals1021a: Add overlay for CDTech DC44 RGB display
      ARM: dts: ls1021a-tqmals1021a: change sound card model name

Dario Binacchi (1):
      ARM: dts: mxs: use padconfig macros

Efe Can İçöz (1):
      ARM: dts: imx7d: update opp-table voltages

Fabio Estevam (3):
      ARM: dts: imx31/imx6: Use flash as the NOR node name
      ARM: dts: imx: Fix the iim compatible string
      ARM: dts: imx51-digi-connectcore-som: Fix MMA7455 compatible

Francesco Dolcini (1):
      ARM: dts: imx6q-apalis: remove pcie-switch node

Krzysztof Kozlowski (2):
      ARM: dts: nxp: Align NAND controller node name with bindings
      ARM: dts: nxp: Align wifi node name with bindings

Rob Herring (Arm) (1):
      ARM: dts: imx: Drop redundant CPU "clock-latency"

 arch/arm/boot/dts/nxp/imx/imx25.dtsi               |  2 +-
 arch/arm/boot/dts/nxp/imx/imx31-lite.dts           |  2 +-
 arch/arm/boot/dts/nxp/imx/imx31.dtsi               |  2 +-
 arch/arm/boot/dts/nxp/imx/imx35.dtsi               |  2 +-
 .../dts/nxp/imx/imx51-digi-connectcore-som.dtsi    |  2 +-
 arch/arm/boot/dts/nxp/imx/imx51.dtsi               |  4 +-
 arch/arm/boot/dts/nxp/imx/imx53.dtsi               |  4 +-
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dts    |  9 ----
 arch/arm/boot/dts/nxp/imx/imx6q-mccmon6.dts        |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi   |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dts        |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts    |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7d.dtsi               |  6 +--
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi               |  1 -
 arch/arm/boot/dts/nxp/ls/Makefile                  |  9 ++++
 .../nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso  | 32 +++++++++++++
 ...021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso | 47 ++++++++++++++++++
 ...1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso | 55 ++++++++++++++++++++++
 ...1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso | 55 ++++++++++++++++++++++
 .../dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts    |  5 +-
 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi   |  3 +-
 arch/arm/boot/dts/nxp/mxs/imx23-sansa.dts          |  6 +--
 arch/arm/boot/dts/nxp/mxs/imx23-xfi3.dts           | 12 ++---
 arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi          |  2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts       |  6 +--
 25 files changed, 232 insertions(+), 42 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso

