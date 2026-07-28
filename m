Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716C9C54F55
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 12:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=axgwGFqbMnwqtmjLKcig2a7eBPALgHdE5D0pU4dvYXo=; b=v4FFvykBIDPz5w86Pew0Gy3dk5
	78h0HLRzcse7jFqW1hiUL/Zvvd8N447gmXfqDs1+jBy83bIcjC+IGeOrEcIth4sBAETCp03d3jN0W
	JStKApaWL4eoadb03I3DbI3xBIGfeIz8s1qmRVh61WCaZR+f4Y6rifcUIrpmc1eIftQMViIOfDKqH
	Eraq1DCn+3aDPDUlzuBf0lhIkyXftoNiiI+cSOsRBzW8WkFIe1yL5jD9kkmbpE0jxJVtISIa8mg/k
	njt/UiPz6+hcOBCBcD/cvxvHAnmAVuUq0JkRaqy2qdkmYomjXk7ZagifgIqqBqlnAdVlNIx69cBnO
	0jxfJWLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogW1-00000005AGf-02U0;
	Tue, 28 Jul 2026 12:02:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogVx-00000005A9Y-1b9Q;
	Tue, 28 Jul 2026 12:02:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B8EE460A9B;
	Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60CDEC2BCC6;
	Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785240148;
	bh=sTssC4ZOJKDi8YIjbtJEz656tgnfSueY7mB/LAUtm2Y=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=MKhlUDjBWA5m1BokUH5OzIHzMDSa0LubN4oLwCaDR3nDyVoIU8g0cq3MY4+F+DRQl
	 ABz3Zevtz/AflhLMNssCzfr+Ea3myMidv50nYMiAvKSuuA+S48Ov8jcCgD3RTCoKCU
	 DNoUsoPEyhMbnSPokDhSnMlUTJ1Ragt9+G5hGgYpnRWChNNZIX+6M8WcS5f7sJ03Kp
	 HN28sJVYfIgAGtdrk2hWpFP4rjgsIYcUt914oI/oCT2rJeHxJTkuPNXDVeqZVgO+Vw
	 6V1w4K5Imjw6y6dotv5FYo44JYtQ197oUqy553FOW2IHyncia7xdjpu24w4BiId+c6
	 GJvczJDoqvpiQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 337CCC54EFC;
	Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Subject: [PATCH v5 00/12] arm64: dts: rockchip: Add NanoPi M6 board
Date: Tue, 28 Jul 2026 14:00:27 +0200
Message-Id: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13OQW7DIBAF0KtErEvEDAzEXfUeVRYEDwlRbUcmR
 aki3704USWa5Zf++zN3kXlOnMX75i5mLimnaayB3jYinPx4ZJn6mgUqtMopkKMfp0uSg5UxMke
 HhLF3ovYvM8d0e2x97p85fx/OHK7rwNo4pXyd5p/HsQJr729XN7sFpJI7bYwHoo6g+zgOPn1tw
 zSIdbdgI6H9qGCVBtE68paMwlepW/nvpq4S0ZF1MQbqw6s0rXStNFUeNOgOvEM20MplWX4BBBD
 hcWIBAAA=
X-Change-ID: 20260701-nanopi-m6-ffeef7252fd7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785240146; l=4024;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=sTssC4ZOJKDi8YIjbtJEz656tgnfSueY7mB/LAUtm2Y=;
 b=eXj05Ly+3z2Amkdc+5SyWYYmSgLeDolSy65/n0Xx7AZ8JfgoPKGLV72J5MxLp677S8RmMiqC2
 ek6du9BJw2uC6fiw1f03HLaScP0AI/mzM8wz0wSOKdNyoBeAxMDLcin
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
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
Reply-To: joachim.eastwood@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patch series add support for the NanoPi M6. This board is very
similar to the NanoPi R6C and R6S boards which are already supported.

Main differences:
* M.2 M-key slot with PCIe (Also present on R6C)
* M.2 E-key slot with PCIe and USB (from hub)
* 1 additional USB 2.0 port from an on-board USB hub
* RT5616 audio CODEC

Patch 1 documents the NanoPi M6 board compatibility string
Patch 2 to 10 are fixes and additions to the nanopi-r6 base DT
Patch 11 extracts the common NanoPi 6 series bits from nanopi-r6 into
nanopi.dtsi
The final patch adds support for NanoPi M6. Support for M6 has been
split into two files; one dtsi and one dts file. This makes it easier
to add support to the new M6V2 board at a later stage.

All changes have been verified using the schematics for M6, R6C and R6S.
Only M6 have been boot and runtime tested. Testers for R6x are welcome.

Note that Sashiko may complain that u2phy0_otg is a dangling phandle in
patch 11. This will never happen in practice so it's safe to ignore.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
Changes in v5:
- Switch from simple-audio-card to audio-graph-card as Sashiko
  complains, rightfully, that the bindings are a mismash of both.
- Add pull-up on sd cd pin. Noticed by Diederik.
- Link to v4: https://patch.msgid.link/20260717-nanopi-m6-v4-0-b31391a72e41@gmail.com

Changes in v4:
- Remove boot-on reintroduction on vdd_npu_s0 in nanopi.dtsi during
  refactor screw-up. Thanks to Sashiko for catching that.
- Fix minor typo in "add gmac1 add phy-supply" commit message
- Use schematic net names on PCIe reset lines. As suggested by Diederik.
- Link to v3: https://patch.msgid.link/20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com

Changes in v3:
- Reorder patches so the DT fixes/additions are applied to
  nanopi-r6.dtsi as suggested by Jonas Karlman
- Add comment to gmac to rgmii-rxid phy-mode to explain usage
- Addition of pinctrl to sd and pcie are now marked as fixes
- Remove both always-on and boot-on from NPU regulator
- Link to v2: https://patch.msgid.link/20260711-nanopi-m6-v2-0-422675a65402@gmail.com

Changes in v2:
- Organize DT such that adding support to NanoPi M6V2 later is easier
- Use correct clk id for I2C mclk out as suggested by Diederik.
- Add a couple of acks from Krzysztof Kozlowski.
- Link to v1: https://patch.msgid.link/20260703-nanopi-m6-v1-0-8344a1559519@gmail.com

---
Joachim Eastwood (12):
      dt-bindings: arm: rockchip: add FriendlyElec NanoPi M6
      arm64: dts: rockchip: rk3588s-nanopi-r6: fix missing sdmmc cd pinctrl
      arm64: dts: rockchip: rk3588s-nanopi-r6: fix missing pcie rst pinctrl
      arm64: dts: rockchip: rk3588s-nanopi-r6: remove pull up on rtc int pin
      arm64: dts: rockchip: rk3588s-nanopi-r6: pcie2x1l2: add clkreq
      arm64: dts: rockchip: rk3588s-nanopi-r6: remove always-on and boot-on from vdd_npu_s0 reg
      arm64: dts: rockchip: rk3588s-nanopi-r6: remove useless vcc_3v3_pcie20
      arm64: dts: rockchip: rk3588s-nanopi-r6: add gmac1 phy-supply
      arm64: dts: rockchip: rk3588s-nanopi-r6: remove bogus vcc5v0_usb regulator
      arm64: dts: rockchip: rk3588s-nanopi-r6: add comment about gmac phy-mode
      arm64: dts: rockchip: rk3588s-nanopi-r6: refactor to support M6 boards
      arm64: dts: rockchip: add support for NanoPi M6 board

 .../devicetree/bindings/arm/rockchip.yaml          |   3 +-
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi | 142 ++++
 .../boot/dts/rockchip/rk3588s-nanopi-m6v1.dts      |  57 ++
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 792 +-------------------
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi   | 797 +++++++++++++++++++++
 6 files changed, 1000 insertions(+), 792 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260701-nanopi-m6-ffeef7252fd7

Best regards,
--  
Joachim Eastwood <joachim.eastwood@gmail.com>



