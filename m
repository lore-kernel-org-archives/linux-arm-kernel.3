Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A73C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 13:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j4e+Haxfk0quznaJK3unHVuZUERCgLpoVhoi6RHHiSY=; b=duK5AgeZT3qfek
	p5RE+kRUQPIwHFnFKE0lZJ0r+AERhYVvIUzJChy14eEU4sbQn0/Wvcu76G0Dgycn4H/9HgG/mz4Vv
	jnY+H/rfxmt43qSV/d1Q04zKoU5oiyF/BvbDKsreLU6lKaTR8oa1qLsua7BRmU+GFFcm0w49jTVuy
	xdWDsNNNxjk5EpZl+pYNqysUd1IRimwzuPGcrgTstpcf47PvFhInaX/ucf+hON4mM640LldaQNr7a
	qpe1J55fBMbNALsnltjvyYy36Wzjzs2LfdkcJa1pdj2/HsS+XmYNKBVQKlpYzs9r8nDxPCb+ju2RV
	2f3KPry3E0MXDUj8Damg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKmH-00000005Idy-0skO;
	Mon, 13 Jan 2025 13:46:49 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKic-00000005Hnl-3ue6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 13:43:05 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXKib-0002oy-Dh; Mon, 13 Jan 2025 14:43:01 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXKia-000Ghu-1M;
	Mon, 13 Jan 2025 14:43:00 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXKib-00GZFh-1p;
	Mon, 13 Jan 2025 14:43:00 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH v3 0/6] arm64: dts: freescale: imx8mp-skov: switch to
 nominal drive mode
Date: Mon, 13 Jan 2025 14:42:50 +0100
Message-Id: <20250113-imx8m-clk-v3-0-0d6e9bdeaa4e@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFoYhWcC/2WMywqDMBQFf0WybkoSNdGu+h+li0tyo6H1QWKDR
 fz3RkEQupzDmVlIQO8wkFu2EI/RBTf0CfJLRnQLfYPUmcREMFFwwRV13Vx1VL9ftC6kUjI3Vpu
 KpP/o0bp5bz2eiVsXpsF/93Tk23pU6lMlcsqotmAtsEoZkPcR++Yz+aF389Ug2VJRHHrJOJNnX
 SRdAiAY0LK0+Kev6/oDL4II0uYAAAA=
X-Change-ID: 20241217-imx8m-clk-9467763dfcd8
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abel.vesa@linaro.org>, 
 Marek Vasut <marex@denx.de>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_054302_974775_BFBE2007 
X-CRM114-Status: GOOD (  14.97  )
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

Unlike the i.MX8MM and i.MX8MN SoCs added earlier, the imx8mp.dtsi
configures some clocks at frequencies that are only validated for
overdrive mode, i.e., when VDD_SOC is 950 mV.

For the Skov i.MX8MP board, we want to run the SoC at the lower voltage of
850 mV though to reduce heat generation and power usage. For this to work,
clock rates need to adhere to the limits of the nominal drive mode.

This is done by this series: A new imx8mp-nominal.dtsi reconfigures
the imx8mp.dtsi clock tree to be compatible with nominal mode, an adaptation
to the Linux clock driver makes it sanity check the actual clock rates against
the SoC operating mode's constraints and finally the Skov DT makes use
of it.

Actual configuration of the VDD_SOC rail continues to happen prior to Linux
as well as PLL configuration that needs to happen earlier than the kernel
running. See the corresponding barebox patch series[1] for details.
Note that the barebox series didn't yet include VDD_SOC reconfiguration
to 850mV, that would follow once the kernel changes have been merged.

[1]: https://lore.kernel.org/barebox/20240503103717.1370636-1-a.fatoum@pengutronix.de/

---
Changes in v3:
- change boolean mode properties to string property, so it's possible to
  override in overlays (Frank).
- Dropped Conor's Ack again due to aforementioned binding change.
- make struct imx8mp_clock_constraints::clkid unsigned (Stephen)
- Remove comma after sentinel member (Stephen)
- Link to v2: https://lore.kernel.org/r/20250106-imx8m-clk-v2-0-6aaeadac65fe@pengutronix.de

Changes in v2:
- Explain in Patch 1/6 why two properties are added instead of one
  (Conor)
- Collect Conor's Acked-by
- Collect Peng's Reviewed-by
- Link to v1: https://lore.kernel.org/r/20241219-imx8m-clk-v1-0-cfaffa087da6@pengutronix.de

---
Ahmad Fatoum (6):
      dt-bindings: clock: imx8m: document nominal/overdrive properties
      arm64: dts: imx8mp: Add optional nominal drive mode DTSI
      arm64: dts: imx8mp: add fsl,nominal-mode property into nominal.dtsi
      arm64: dts: freescale: imx8mp-skov: fix LDB clock rate configuration
      arm64: dts: freescale: imx8mp-skov: operate SoC in nominal mode
      clk: imx8mp: inform CCF of maximum frequency of clocks

 .../devicetree/bindings/clock/imx8m-clock.yaml     |  11 ++
 arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi  |  64 +++++++++
 .../arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi |   5 +-
 .../freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts  |  19 +--
 drivers/clk/imx/clk-imx8mp.c                       | 151 +++++++++++++++++++++
 5 files changed, 234 insertions(+), 16 deletions(-)
---
base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
change-id: 20241217-imx8m-clk-9467763dfcd8

Best regards,
-- 
Ahmad Fatoum <a.fatoum@pengutronix.de>


