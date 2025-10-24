Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 991B6CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 11:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u3LzzpDLJbjkxcTkHuBCTZyEXYbMYEnVF4tXQgwxtKc=; b=DajubTJpnQubop
	FVAMdKtNPQu+S0tMsU1+4n0J0Y3nbsbjLAegSbIGtzzKIsd7uzkkqcZi9jU4crL/6SYM11YDsQwt1
	tph+fB1/V6oU85RjH5F7XdTbQIk9/62dihMPOHuqfHM0LpggW3qdkXMYqqUFQKgDdLqZfbm6P7o8/
	XAvkshd3/r1Gr2OtnEgy/Jhj4kmCexjetzf5WU8kXHtDZwhzlE3NsKpT/WVD3vgEVgpt2WwBneC5R
	5Dqyj9eQRQAkzX3UkZbNQ+97eTiLbP3z52cghfMbJRM2CI6q2vi3IMFiuv7/T5j0HFS3svOLB5UJ2
	WZT4Iqk4RozH+ywN8wyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGJX-00000009GJG-0SUy;
	Fri, 24 Oct 2025 11:50:35 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGJQ-00000009GGR-1Rr8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 11:50:29 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1vCGJ3-0002FG-Sl; Fri, 24 Oct 2025 13:50:05 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH v5 00/10] arm64: dts: socfpga: agilex5: enable network and
 add new board
Date: Fri, 24 Oct 2025 13:49:52 +0200
Message-Id: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOBn+2gC/43Ny27DIBCF4VeJWJdqGMwlXfU9qi4wDA5SZSxwk
 avI714SqcqiUdPlfxbfObNKJVFlL4czK9RSTXnuoZ4OzJ/cPBFPoTdDwEGABN40F8jXvCTPa/Z
 xmRx3U/qgTfEjxCCDjUcLnnVhKRTTdtXf3nufUl1z+bqeNXFZ/+c2wYGPOGpjLJAGel1onj7Xk
 ue0PQdiF7zhDRSo/gaxg1YPqDR5b0a8C8obiPAAlB1EZ32IRkYF7i44/IAKHoJDB2mMYIAQjIq
 /wH3fvwGz4zOWvgEAAA==
X-Change-ID: 20241030-v6-12-topic-socfpga-agilex5-90fd3d8f980c
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Matthew Gerlach <matthew.gerlach@altera.com>
Cc: kernel@pengutronix.de, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 Teoh Ji Sheng <ji.sheng.teoh@intel.com>, 
 Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>, 
 Austin Zhang <austin.zhang@intel.com>, 
 "Tham, Mun Yew" <mun.yew.tham@intel.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_045028_391254_61E916E9 
X-CRM114-Status: GOOD (  12.37  )
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

Add an initial devicetree for a new board (Arrow AXE5-Eagle) and all
needed patches to support the network on current mainline.

Currently only QSPI and network are functional as all other hardware
currently lacks mainline support.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
Changes in v5:
- remove binding conversion
- rebase to 6.18-rc1
- add sofpga_agilex5.dtsi patches
- add stmmac patches
- add dwxgmac compatible to have usable network
- Link to v4: https://lore.kernel.org/r/20250205-v6-12-topic-socfpga-agilex5-v4-0-ebf070e2075f@pengutronix.de

Changes in v4:
- extract gmii-to-sgmii-converter binding to pcs subdir
- fix dt_binding_check warnings
- rebase to v6.13-rc1
- Link to v3: https://lore.kernel.org/r/20241205-v6-12-topic-socfpga-agilex5-v3-0-2a8cdf73f50a@pengutronix.de

Changes in v3:
- add socfpga-stmmac-agilex5 compatible
- convert socfpga-dwmac.txt -> yaml
- add Acked-bys
- rebase to v6.13-rc1
- Link to v2: https://lore.kernel.org/r/20241125-v6-12-topic-socfpga-agilex5-v2-0-864256ecc7b2@pengutronix.de

Changes in v2:
- fix node names according to dtb_check
- remove gpio 'status = disabled'
- mdio0: remove setting of adi,[rt]x-internal-delay-ps. 2000 is the
  default value
- add Acked-by to dt-binding
- Link to v1: https://lore.kernel.org/r/20241030-v6-12-topic-socfpga-agilex5-v1-0-b2b67780e60e@pengutronix.de

---
Adrian Ng Ho Yin (1):
      arm64: dts: socfpga: agilex5: Add SMMU node

Austin Zhang (1):
      arm64: dts: socfpga: agilex5: smmu enablement

Steffen Trumtrar (6):
      net: stmmac: dwmac-socfpga: don't set has_gmac
      dt-bindings: net: altr,socfpga-stmmac: add generic dwxgmac compatible
      arm64: dts: socfpga: agilex5: add dwxgmac compatible
      dt-bindings: net: altr,socfpga-stmmac: allow dma-coherent property
      dt-bindings: intel: add agilex5-based Arrow AXE5-Eagle
      arm64: dts: socfpga: agilex5: initial support for Arrow AXE5-Eagle

Teoh Ji Sheng (1):
      net: stmmac: Use interrupt mode INTM=1 for per channel irq

Tham, Mun Yew (1):
      arm64: dts: socfpga: agilex5: dma coherent enablement for XGMACs

 .../devicetree/bindings/arm/intel,socfpga.yaml     |   1 +
 .../bindings/net/altr,socfpga-stmmac.yaml          |   4 +
 arch/arm64/boot/dts/intel/Makefile                 |   1 +
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi     |  31 ++++-
 .../boot/dts/intel/socfpga_agilex5_axe5_eagle.dts  | 146 +++++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |   1 -
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |   3 +
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c |  10 +-
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  |  20 +++
 include/linux/stmmac.h                             |   2 +
 10 files changed, 214 insertions(+), 5 deletions(-)
---
base-commit: f67859cf0b6d21bf3641e7dec9e99edba91e0829
change-id: 20241030-v6-12-topic-socfpga-agilex5-90fd3d8f980c

Best regards,
-- 
Steffen Trumtrar <s.trumtrar@pengutronix.de>


