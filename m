Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0ACC88E6E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 08:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IRegA8kqVicebJUtSyDbGMn4fPSbkV/OWZfayrrgtK8=; b=yUkQwd+8RvGutpeRoIIqHsFBGO
	7CuN4TwhWpWQC0NGbgK9P8ru5PRlNyTU83KbssS1DDgmoALGh/zIQswCRkf0j9hgfyx5i4fP8fMnv
	5vpbY2xoBE81WjWf+dl8FnNr+k1yDdgmXNG20I+j8kP/3Lb0NVx1C06VYw4pUpU/rJHH2+M5EhG1i
	6GIUufUH6ID8TsKZBAzLWEeiShZgs1VLl3mS/2dqY78v62maD3lLfhTgOsb4WtqftGc0NPmm2JFpy
	D52WkUSHxOq/VxIY+upYAjY1qdNptPWzZNVRji45anS1SbzY5nSzIEEnP2e0BL+yQyrmL4L3tC00B
	3wjprbQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61zC-00000002idA-3ACp;
	Mon, 14 Sep 2026 08:24:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61z7-00000002ib1-3BA0;
	Mon, 14 Sep 2026 08:24:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 23A3A436F7;
	Mon, 14 Sep 2026 08:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EF9A3C2BCFA;
	Mon, 14 Sep 2026 08:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789374257;
	bh=Tg7F9RW/Oyg87Q9Vu49hAxhpX0Bv9spAEOpSsn2o2FQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=e3IoVpiPMCBavv/ydWWmT5C4+EDtC7H8FFVrTtyQDDoCKp/gdvafDNPdnfF5My1lw
	 dpeJngjT/rZM6WkHVeyM9UGnHXF76AdoJ9AL/Pe84dTG+BSMBeKP9zbkeTUotx4bCl
	 2y+kFMgcDfvsHVqV1UqRHw2e/u218joJGZgGv9NMGIPR5EPJJ0kJVCrDJtxqAzXn5c
	 0+BL0ifdrLVMdEpowNEt0EKYhL/n9OP8mAQBiUKDk1Ab/u6IWaX+5sonUo90+tnLCs
	 0sqq4l1GhpHx83CixxiS97gLYtm4/BJ3+TO7cbDA8ZJlpR1IttTUZAke5qd2DLuFHE
	 OobmSEpPClGDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC359C88E6A;
	Mon, 14 Sep 2026 08:24:16 +0000 (UTC)
From: =?utf-8?q?=E5=AE=89=E5=AE=B9_via_B4_Relay?= <devnull+HystericalDragons.proton.me@kernel.org>
Subject: [PATCH v5 0/4] arm64: dts: rockchip: Add FriendlyElec NanoPi R28S
Date: Mon, 14 Sep 2026 16:24:06 +0800
Message-Id: <20260914-r28s-upstream-v5-0-7409c498e8dc@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOwY6DIBAG4FdpOC8bZhCUnvY9Nj0gji2bVA1Y0
 8b47gX3Ykh6/JP/+2dWFil4iux8WlmgxUc/DimorxNzNztcifsuZYYCtTBC8YBN5I8pzoHsnRM
 CEtadBq1YMlOg3j/3vd/Lf46P9o/cnEdy4+bjPIbXfnCB3Pu0vQAXvNdNp2RjUBv7M4VxHofvO
 7G8veBR16XGpBFsq2rROwOu1PKoTall0kSSwMrKSiVLXR00QKmr/HmrXaN6RN1VR71t2xuxyqM
 bdgEAAA==
X-Change-ID: 20260905-r28s-upstream-e212e27d6165
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chukun Pan <amadeus@jmu.edu.cn>, Jonas Karlman <jonas@kwiboo.se>, 
 jensen <jensenhuang@friendlyarm.com>, 
 Andrey Korshunov <razor1702@gmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6210;
 i=HystericalDragons@proton.me; h=from:subject:message-id;
 bh=Tg7F9RW/Oyg87Q9Vu49hAxhpX0Bv9spAEOpSsn2o2FQ=;
 b=owGbwMvMwCUmepz3XUtTHjvjabUkhqzl6/XfL3HqN4pJNZhwnTkzvfzqy7u9i6pymT84XdHTv
 veY79q3jlIWBjEuBlkxRRbZTdWRQquiZxaxSB2HmcPKBDKEgYtTACZSMYWRYcq8suOblZ9mppow
 /7S7+GbG2wWsa16tzzl6vq+D+/Di6bEMv5i3JTUJPvqacyNPsSBml6bHioxWJecbPtYq/t5Pz5x
 eywgA
X-Developer-Key: i=HystericalDragons@proton.me; a=openpgp;
 fpr=1DB27B5912AA5B9972041AC715C70DEE84826E07
X-Endpoint-Received: by B4 Relay for HystericalDragons@proton.me/default
 with auth_id=1004
X-Original-From: =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
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
Reply-To: HystericalDragons@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The NanoPi R28S is a dual gigabit Ethernet router board based on the
Rockchip RK3528 SoC:

  https://wiki.friendlyelec.com/wiki/index.php/NanoPi_R28S

It is closely related to the already supported NanoPi Zero2, sharing
most of its power tree and peripheral routing. Patch 2 therefore moves
the common parts into rk3528-nanopi.dtsi, and patch 3 adds the board on
top of it. The split leaves the NanoPi Zero2 dtb unchanged; I verified
this by comparing the node and property sets of the dtb before and after
the split, which differ only in node order and phandle numbering. Patch
4 is a coding style cleanup in the shared devicetree and the NanoPi
Zero2 devicetree.

The devicetree was derived from the vendor tree:

  https://github.com/friendlyarm/kernel-rockchip/commit/ee640c5344b13a0a317436e2357df01af8268ce7

but with many changes to make it suitable for mainline.

Tested on a metal-case unit without the optional onboard eMMC: boots
from microSD, both Ethernet ports link up at 1000 Mbps, the HYM8563 RTC
registers, and all three LEDs are functional. The USB Type-C connector
registers as a DWC3 UDC in peripheral mode; gadget enumeration against
a USB host was not completed, because that connector is also the 5V
input and a PC port cannot power the board.

The bootloader was U-Boot 2026.07 with a board specific R28S target,
which releases the RGMII PHY reset before Linux starts, so the reset
description in the PHY node is all the kernel needs.

Two things I did not do, because my hardware cannot verify them:

- The AICSemi AIC8800D80 WiFi chip on sdio0 has no upstream driver, so
  only the SDIO controller is described.
- The eMMC is described as HS200 rather than the vendor's HS400 with
  enhanced strobe, since the board at hand has an unpopulated eMMC
  footprint and the faster modes could not be verified.

---
Changes in v5:
- Dropped the pinctrl-0 before pinctrl-names reordering from the coding
  style patch and used the order the rest of the rockchip devicetrees
  use, pinctrl-names first, in the new devicetree as well. The strict
  mode of scripts/dtc/dt-check-style asks for the alphabetical order,
  but it does so for many other properties that no rockchip devicetree
  sorts that way either (Chukun Pan).
- Moved the SYS LED, which the NanoPi R28S shares with the NanoPi Zero2,
  and the led1 and led_sys pin configurations into rk3528-nanopi.dtsi.
  Both boards now only add their own LEDs to &leds (Chukun Pan).
- Renamed the NanoPi R28S LED nodes to led-1 and led-2, to use the
  led-[0-9] node naming (Chukun Pan).
- Changed the user button from KEY_RESTART to BTN_1. It is a general
  purpose button on this board, not a reset button (Chukun Pan).
- Link to v4: https://patch.msgid.link/20260911-r28s-upstream-v4-0-fb6c85f226d4@proton.me

Changes in v4:
- Dropped the patch that moved the NanoPi Zero2 RGMII PHY reset to the
  MDIO bus. GPIO4_C2 resets the PHY, not the bus, so describing it on
  &mdio1 is not a description of the hardware. It would also break
  Ethernet in U-Boot, which reads reset-gpios, reset-assert-us and
  reset-deassert-us from the PHY node and has no support for a bus
  level reset. The nanopi-zero2-rk3528 U-Boot target releases the PHY
  reset before Linux starts; the failure I reported was seen with the
  generic-rk3528 target, which carries no board devicetree. Pointed out
  by Chukun Pan, and by Jonas Karlman in the same discussion for the
  HINLINK H28K:
  https://lore.kernel.org/lkml/1e8da54f-ef87-4d31-9a0a-17c0ff66bee0@kwiboo.se/
  My own R28S has in fact been running a board specific U-Boot target
  all along, with the PHY node description this series now keeps, so
  the reset ordering problem I described does not arise there.
- Reworded the coding style patch to state the coding style violation
  itself as the reason, rather than the tool that found it (Diederik de
  Haas).
- Link to v3: https://patch.msgid.link/20260909-r28s-upstream-v3-0-ee3e1a34a353@proton.me

Changes in v3:
- New patch 1: describe the NanoPi Zero2 RGMII PHY reset on the MDIO
  bus rather than in the PHY node, so that it is applied before the PHY
  ID is read. A PHY held in reset by the bootloader was otherwise never
  probed, leaving the port dead. Reported by Andrey Korshunov, who
  proposed the deprecated snps,reset-gpio properties on the MAC; the
  bus level reset-gpios in mdio.yaml fixes the same ordering without a
  deprecated property.
- New patch 5: follow the DTS coding style in the three NanoPi RK3528
  devicetrees, as found by scripts/dtc/dt-check-style --mode=strict:
  pinctrl-0 before pinctrl-names, and a blank line before status.
  Suggested by Diederik de Haas.
- Picked up Conor Dooley's Acked-by on the binding.
- Link to v2: https://patch.msgid.link/20260907-r28s-upstream-v2-0-21ab570fc91c@proton.me

Changes in v2:
- Split the parts shared with the NanoPi Zero2 into a new
  rk3528-nanopi.dtsi (new patch 2). The NanoPi Zero2 dtb is unchanged.
- Name the pinctrl labels after the nets in the schematic: usr_btn,
  led1, led2, led_sys, pwr_wf and pcie_eth_perstb.
- Rename the button node to button-user and its label to "USER".
- Link to v1: https://patch.msgid.link/20260905-r28s-upstream-v1-0-f68d5389269a@proton.me

---
安容 (4):
      dt-bindings: arm: rockchip: Add FriendlyElec NanoPi R28S
      arm64: dts: rockchip: Split out the common NanoPi RK3528 parts
      arm64: dts: rockchip: Add devicetree for the FriendlyElec NanoPi R28S
      arm64: dts: rockchip: Follow the DTS coding style in the NanoPi RK3528 devicetrees

 .../devicetree/bindings/arm/rockchip.yaml          |   5 +
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts | 127 +++++++++
 .../boot/dts/rockchip/rk3528-nanopi-zero2.dts      | 306 +-------------------
 arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi    | 314 +++++++++++++++++++++
 5 files changed, 456 insertions(+), 297 deletions(-)
---
base-commit: 32e0f64640d558a0f5410ac5cdd8ebf371c5e6a6
change-id: 20260905-r28s-upstream-e212e27d6165

Best regards,
--  
安容 <HystericalDragons@proton.me>



