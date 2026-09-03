Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E954C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 21:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t9DKB903Z1cJvxv1LCnzaR776+3g+prEEanB2I0Pav0=; b=PP4cj8eNVI/1TaCswSXE6YBIpn
	dMvxD7t6k+YtvV17zlbTrYngtZS5NiBeueSYX4T6asU0/uqVIp2vfxXtBISoJYDsdhSDfQNwW0UK6
	q6lo6jQGQ6dZKv0oMFqCvE3nrYln4F6oYoN4GL1jzTkpBERnTXcXGEXUDZ51o7s/VUcWSbrGclryN
	1ORQzekxVcUDJwPuXIcv5IV0mgySi6+MkJBgptg+fr3Vy/R1o6uRHaZnsvqAwCYeQFGNGleNbAot+
	9HRay2dt0WHf5jF+6T1bYOLl3t6qOPNmAXSkvmumKE8HTnBSRtyuJuzMB8jN9pDw5Fhgp5c490KQD
	mTAtvpmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2EuS-00000000dEf-0QPj;
	Thu, 03 Sep 2026 21:23:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2EuQ-00000000dCb-3NpL;
	Thu, 03 Sep 2026 21:23:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 53576439E5;
	Thu,  3 Sep 2026 21:23:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2713CC2BCB8;
	Thu,  3 Sep 2026 21:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788470626;
	bh=Cu7Yp6tQ+jejPi7mhr+6x4eHJKr5kHNLrcxsvAjGzZI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=t8VLo71WOdma5yTUOohXnwvc8+yYsz+LclbYLU3nUaiNRa5UUtES3TqMivbj9mr6k
	 PRq0pGRfMXu3X+M1mmqIn47CsJ1ZBdeUQ1bmrHuBjqimg954iSnzaFYg86lZJShl21
	 7+xWt9HAPArUZ9LBkI/eMbneqfFe7RTBs8EYin47F00Z106WayGEvVp3vCq/cH7t82
	 LzW/LrAY+U64Ch7FmTXcwmFZpMnY5NAL2xkkFSv/4vjIuNEuC2cXNesQuM7sRRcSIT
	 qY8jWtHjVU/JbWg867hUDxceHZG9xC07FGtrZuXI2USrXl0YgCduhPHUAI6W9ruqU+
	 BvR26rqNX7UPA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02880C624D7;
	Thu,  3 Sep 2026 21:23:46 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Subject: [PATCH v6 00/12] arm64: dts: rockchip: Add NanoPi M6 board
Date: Thu, 03 Sep 2026 23:23:12 +0200
Message-Id: <20260903-nanopi-m6-v6-0-37416bbd6862@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13OTW7DIBAF4KtErEvFDAzYWfUeVRaYn4SqtiOTo
 FaR716cqhL18knvezMPlsOSQmbHw4MtoaSc5qkG/XJg7mKnc+DJ18xQoBZGAJ/sNF8THzWPMYR
 okDB6w2r/uoSYvp5b76ffnO/DR3C3bWBrXFK+zcv381iBrfe3K5vdAlzwTiplgagn6N/Oo02fr
 24e2bZbsJHQflSwSoWoDVlNSuBeylb+uymrRDSkTYyOvNtL1UrTSlXlIEH2YA0GBXtJjcSulVS
 lGxyEQfjOk27luq4/eCRhaJwBAAA=
X-Change-ID: 20260701-nanopi-m6-ffeef7252fd7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788470611; l=4151;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=Cu7Yp6tQ+jejPi7mhr+6x4eHJKr5kHNLrcxsvAjGzZI=;
 b=/b2e7FpEBbNIj+TgPyd03X5EWm2UupMahyJ0VL5C6SSWMZ0VUaZXEBT1m98vywu8v8fKxcL7l
 LYNP7nf2SpdCaTwQ05re9y3QRX2olRDMUEUWBgs0N56r/aGlXET2Vvm
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
Changes in v6:
- Rebase on v7.3-rc1
- Link to v5: https://patch.msgid.link/20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com

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
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260701-nanopi-m6-ffeef7252fd7

Best regards,
--  
Joachim Eastwood <joachim.eastwood@gmail.com>



