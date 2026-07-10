Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72519C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 22:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DVUPI8330ccx7zwCb4STTaKOYiuhRQURGJYFkc1H3iw=; b=m0RAHWGJ+3d6+hH/MgYmjsvVpE
	kkxXRPKojRzbJlme0bCNt2B52n+GYBNryfaKwsGWyt5jbyIgKnkud2muQoYwM8Y32w+R+OIta/ULo
	cbKW06Mmi5otrDasZPBGagQEInN7r+RajJyEZ5v3LvRH5A8myryEg/gW+H1I5FTsn+bMhGYfFpNgu
	BSZ4Xb6Pu0py5jFgqCYGCjCf1FHOlTzoEUjjspAeV9zZEfvFcAlRlBkJWGHLq04G76R3xcFdqqJjd
	yvFAeYreTyjmjKFl8HbUOw31m9Wd5BZOuomvjDxTNV7Wt/RsroWZ8xaeZ1AO91nDjldkxTDwd7slq
	+ajswR7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiJSA-00000005uFo-0rQp;
	Fri, 10 Jul 2026 22:12:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiJS9-00000005uDu-1dRk;
	Fri, 10 Jul 2026 22:12:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A42CE43858;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78B8AC2BCC6;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783721532;
	bh=VOXS061+i4B6rTq/FKv/O4sEPS77Y6p/9W3TknowL+Q=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=h+hGy3jWacBIJXxRAbS4yZbrvSbG4XU414OR40JSx2yhR3Ref8Yz81Oaid8yhWFwc
	 FQUUaftn7oHyPExdkY9OiJc9Bs2Xl2BqPnmzZbBTF9tMJGpWbkiJ/NeWZ92Crynvls
	 oq72IfgeUtPI67P8kzboI2PuZyjmpTjeFb0Vg3Q2QJMuwHnPwNy+VB+LaQS3Ao6b8E
	 g0voGArY8Hd6n7dOTtw8SrD08MVUyFCzNSZw3ZVNVpes0T8jwWUWqVH+XAVfiFyp94
	 XtTqTGutsb5Ehh1pAvNiMT8SALQDoS8wD+FSgOo4nPonVEKXFs+P9+sJ8H1JK9GSjL
	 rdpNPAS9Bcu4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D47C43458;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Subject: [PATCH v2 00/12] arm64: dts: rockchip: Add NanoPi M6 board
Date: Sat, 11 Jul 2026 00:11:49 +0200
Message-Id: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02NQQ6CMBAAv0L2bE1bKIgn/2E4VNjCGmlJi42G9
 O8CxsTjJJOZBQJ6wgDnbAGPkQI5u4I8ZNAO2vbIqFsZJJclr7hgVls3ERtLZgyiqaSSpqtg9Se
 Phl5769p8OTxvd2znLbAZA4XZ+fc+i2Lzft38rxsF4+yUF4UWStVK1Jd+1PQ4tm6EJqX0AQCxr
 Eq0AAAA
X-Change-ID: 20260701-nanopi-m6-ffeef7252fd7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 Joachim Eastwood <joachim.eastwood@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783721530; l=2868;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=VOXS061+i4B6rTq/FKv/O4sEPS77Y6p/9W3TknowL+Q=;
 b=2tOGs1JKJXsFraC6tYtOa24VTiPzRAZebPeA2bVTGxNavJ94mkWA9VK17zNIAeiWv8NbUjNLc
 WV+BrP5C0p+Dd8Ar/ILhIPJLn/IjF1ByDQcw9KQzeX0GRnd+I7bwj59
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

Patch 2 and 3 moves a bit code around. Please let me know if those two
should be squashed together.
Next few patches adds some missing bits the common nanopi dtsi file.
While the final patch adds support for NanoPi M6. Support for M6 has
been split into two files one dtsi and one dts file. This is to make
it easier to add support to the new M6V2 board at a later stage.

All changes have been verified using the schematics for M6, R6C and R6S.
Only M6 have been boot and runtime tested. Tester for R6x are welcome.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
Changes in v2:
- Organize DT such that adding support to NanoPi M6V2 later is easier
- Use correct clk id for I2C mclk out as suggested by Diederik.
- Add a couple of acks from Krzysztof Kozlowski.
- Link to v1: https://patch.msgid.link/20260703-nanopi-m6-v1-0-8344a1559519@gmail.com

---
Joachim Eastwood (12):
      dt-bindings: arm: rockchip: add FriendlyElec NanoPi M6
      arm64: dts: rockchip: refactor rk3588s-nanopi* to support M6
      arm64: dts: rockchip: move NanoPi R6 code into common dtsi
      arm64: dts: rockchip: rk3588s-nanopi: add missing sdmmc cd pinctrl
      arm64: dts: rockchip: rk3588s-nanopi: remove pull up on rtc int pin
      arm64: dts: rockchip: rk3588s-nanopi: add missing pcie rst pinctrl
      arm64: dts: rockchip: rk3588s-nanopi: pcie2x1l2: add clkreq
      arm64: dts: rockchip: rk3588s-nanopi: remove always-on from vdd_npu_s0 reg
      arm64: dts: rockchip: rk3588s-nanopi: remove useless vcc_3v3_pcie20
      arm64: dts: rockchip: rk3588s-nanopi: add gmac1 add phy-supply
      arm64: dts: rockchip: rk3588s-nanopi: remove bogus vcc5v0_usb regulator
      arm64: dts: rockchip: add support for NanoPi M6 board

 .../devicetree/bindings/arm/rockchip.yaml          |   3 +-
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi | 142 ++++
 .../boot/dts/rockchip/rk3588s-nanopi-m6v1.dts      |  67 ++
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 792 --------------------
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts |   1 +
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dts |   1 +
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi   | 800 +++++++++++++++++++++
 8 files changed, 1014 insertions(+), 793 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260701-nanopi-m6-ffeef7252fd7

Best regards,
--  
Joachim Eastwood <joachim.eastwood@gmail.com>



