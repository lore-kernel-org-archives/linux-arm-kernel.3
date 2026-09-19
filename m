Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C594AC982E2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 10:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lz5yUAvpCXGzwKyHaSEmy6fD0B0UMFHeH2nuviBOeso=; b=h16rmzPEZahUCfXFz3mjPOIFoB
	/e8HDnhA70e/6xDRicyRejVvE1uKcqZkU3ItNYXA5eaN57E0686touNCOws074xAZXPv2XzHz5mLl
	z/9SKj2Ifoo1SJRHDBiHT6cik5DhP6jqERSA2GYoP7GMi6/+sZ5AKvAWnhreOl03zYurfu38wvhP+
	taYSeiYMa1e7x7503/dkpWgNxs+emCe71ST2vR94vVpkVsHyxrs4ImqquodaYpDiDrj3zN4mMkr7g
	KX9Z0udPfnrHWDfpgxQU9zcQfCDmuWP8vZCoLs7H4KwUGH+2hL741D8ioAe51RqdS8u73ws23DDIW
	TonxZjqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7sJ3-0000000GAet-067Q;
	Sat, 19 Sep 2026 10:28:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7sJ1-0000000GAdh-2rtK;
	Sat, 19 Sep 2026 10:28:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ADBAB6020C;
	Sat, 19 Sep 2026 10:28:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45977C2BCB9;
	Sat, 19 Sep 2026 10:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789813705;
	bh=QJuegv5AvaKXKaFqU+9Y3yj6OxSF+29JojZjmqC2qJM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=JiazlwTbALxQXl4fLpNWCkmJDc/oxJXjMnu2nu6p2Hao9EhZedfMJw7HXNPBQVSQ8
	 7gX2YpGVWzMXv1uW8QD+bFzAMi/zEp+dQ0drEpBmxVO+hsk8eoIQIKza7iDRv0f5tn
	 lqne/JkpF1sOdQEXwnj+0zIJL8wE04zX/3tmPCHDH8QU3qyiNOrwSTGR/ER2XbLQ+s
	 IYOxla1M0BGhgaK8YleEDlXTBk2q7I+htSKW6oTtbsoNWFfuSSWWfvFyklUllLuN83
	 Nu+JLSTkBTsK7UQ3pROuKvjOOkXFdEg/BdGXRPGMvL1REJ+NpCaoHRRQpoFB80nele
	 XQh9NTvJv4/uA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 243DBC982DA;
	Sat, 19 Sep 2026 10:28:25 +0000 (UTC)
From: =?utf-8?q?=E5=AE=89=E5=AE=B9_via_B4_Relay?= <devnull+HystericalDragons.proton.me@kernel.org>
Subject: [PATCH v7 0/3] arm64: dts: rockchip: Add FriendlyElec NanoPi R28S
Date: Sat, 19 Sep 2026 18:28:16 +0800
Message-Id: <20260919-r28s-upstream-v7-0-e80a6f8ef521@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33OTU7DMBAF4KtUXmNkj/+74h6IhWNPqJGaRHYag
 arcHbtsIiNYPmm+N+9OCuaEhZxPd5JxSyXNUw3m6UTCxU/vSFOsmQADzRxTNIMt9LaUNaO/UgQ
 OCCZqrhWpZsk4ps9H3+vbTy634QPD2kraxSWVdc5fj4cbb3d/dW+cMjpqG5WwDrTzL0ue13l6v
 iJp3Rsctek1VA3cD8qwMTgeei2O2vVaVI0okHshvVCi1/KgOe+1bMsHHawaAXSUvVZHLXutqja
 SuSCdRRt/Ldf/at2We4cxGhU46KPe9/0bLBb3DvIBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9461;
 i=HystericalDragons@proton.me; h=from:subject:message-id;
 bh=QJuegv5AvaKXKaFqU+9Y3yj6OxSF+29JojZjmqC2qJM=;
 b=owGbwMvMwCUmepz3XUtTHjvjabUkhqx1yccNtubfnTo9/qVfzi8hjts9gmcv6f8+8Okgi9ZRG
 a71/ik8HaUsDGJcDLJiiiyym6ojhVZFzyxikToOM4eVCWQIAxenAExkx1xGhp4yi79fpU/92RL8
 /viN4IpJ1QZJ7W+Z+QJ/retpneSb5cfIsEBqF0eVYsHnpvMHSmQCbn6+43T05tvrtf9svwkzBim
 8YwYA
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
top of it. The split leaves the NanoPi Zero2 hardware description
unchanged; I verified this by comparing the node and property sets of
the dtb before and after the split, which differ only in node order,
phandle numbering and the two renamed LED pin configuration nodes.

The devicetree was derived from the vendor tree:

  https://github.com/friendlyarm/kernel-rockchip/commit/ee640c5344b13a0a317436e2357df01af8268ce7

but with many changes to make it suitable for mainline.

Tested on a metal-case unit without the optional onboard eMMC: boots
from microSD, both Ethernet ports link up at 1000 Mbps, the HYM8563 RTC
registers, and all three LEDs are functional. The USB Type-C connector
registers as a DWC3 UDC; gadget enumeration against a USB host was not
completed, because that connector is also the 5V input and a PC port
cannot power the board. Jonas Karlman verified host mode on the same
board with an externally powered hub, so the port is left in the SoC's
default OTG mode.

The bootloader was U-Boot 2026.07 with a board specific R28S target,
which releases the RGMII PHY reset before Linux starts, so the reset
description in the PHY node is all the kernel needs.

Two things I did not do, because my hardware cannot verify them:

- The AICSemi AIC8800D80 WiFi and Bluetooth chip has no upstream driver,
  so only the SDIO and UART controllers it hangs off are enabled, along
  with its wake and power pins.
- The eMMC is described as HS200 rather than the vendor's HS400 with
  enhanced strobe, since the board at hand has an unpopulated eMMC
  footprint and the faster modes could not be verified.

---
Changes in v7:
- Named the binding entry after the SoC, "FriendlyElec NanoPi RK3528
  series boards", so further RK3528 boards can join it without another
  rename and reorder (Jonas Karlman).
- Described the second LED in rk3528-nanopi.dtsi, since both boards
  drive it from the same pin, and left only the function, trigger and
  default state to the board devicetrees. The LED pin configurations
  gained the usual _pin suffix, which frees the led1 label for the LED
  node (Jonas Karlman).
- Added pinctrl-names to the &leds override in the NanoPi R28S
  devicetree, which redefines pinctrl-0 (Jonas Karlman).
- Dropped the leds/common.h include from both board devicetrees, as
  rk3528-nanopi.dtsi already pulls it in (Jonas Karlman).
- Dropped the header comment from rk3528-nanopi.dtsi (Jonas Karlman).
- Added the WiFi and Bluetooth wake pins from the schematic (Jonas
  Karlman).
- Kept the OTG port in the SoC's default OTG mode instead of forcing
  dr_mode = "peripheral", since host mode works with an externally
  powered hub (Jonas Karlman).
- Link to v6: https://patch.msgid.link/20260914-r28s-upstream-v6-0-ea9edd75c126@proton.me

Changes in v6:
- Dropped the coding style patch, and the blank line before "status" in
  the new devicetree along with it. Only 18 of the ~2900 "status"
  properties in arch/arm64/boot/dts/rockchip are preceded by a blank
  line, so the series now does what the rockchip devicetrees do (Jonas
  Karlman).
- Listed the NanoPi R28S and the NanoPi Zero2 in a single binding entry,
  since they share a devicetree. The entry only changed shape, so I kept
  Conor's Acked-by; please shout if that is not fine (Jonas Karlman).
- Kept all USB nodes in the board devicetrees instead of moving the OTG
  port into rk3528-nanopi.dtsi, since the NanoPi NEO3 Plus has USB 3.0
  and configures it differently (Jonas Karlman).
- Added the serial2 alias for the Bluetooth UART (Jonas Karlman).
- Named the user button pin configuration after its net in the
  schematic, GPIO4_B2_USR_BTN (Jonas Karlman).
- Described the SDIO slot more precisely: no-mmc, no-sd and the missing
  vmmc-supply. The module's VBAT comes from VCC_3V3 through a ferrite
  bead, VDDIO from VCC_1V8 (Jonas Karlman).
- Enabled DMA on uart2 with dma-names (Jonas Karlman).
- Kept dr_mode = "peripheral" and said why in a comment. The Type-C port
  is the 5V input: both CC pins have a 5.1k pull-down (R3811, R3812),
  USB20_OTG0_ID is not connected (R3922 is /NC) and VBUS only feeds
  VCC5V0_SYS through the input protection. So the port cannot present
  itself as a host or source VBUS, not even behind a powered hub.
- Did not add the WiFi and Bluetooth wake pin configurations. The pins
  are there, HOST_WAKE_WL and WL_WAKE_HOST on GPIO1_A6 and GPIO1_A7,
  HOST_WAKE_BT and BT_WAKE_HOST on GPIO1_B4 and GPIO1_B5, but the
  AIC8800D80 has no upstream driver, so there is no wifi@1 or bluetooth
  node to reference them from and the pin states would never be applied.
  They belong in the patch that adds those nodes (Jonas Karlman).
- Link to v5: https://patch.msgid.link/20260914-r28s-upstream-v5-0-7409c498e8dc@proton.me

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
安容 (3):
      dt-bindings: arm: rockchip: Add FriendlyElec NanoPi R28S
      arm64: dts: rockchip: Split out the common NanoPi RK3528 parts
      arm64: dts: rockchip: Add devicetree for the FriendlyElec NanoPi R28S

 .../devicetree/bindings/arm/rockchip.yaml          |  12 +-
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts | 160 +++++++++++
 .../boot/dts/rockchip/rk3528-nanopi-zero2.dts      | 290 +-------------------
 arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi    | 291 +++++++++++++++++++++
 5 files changed, 464 insertions(+), 290 deletions(-)
---
base-commit: 32e0f64640d558a0f5410ac5cdd8ebf371c5e6a6
change-id: 20260905-r28s-upstream-e212e27d6165

Best regards,
--  
安容 <HystericalDragons@proton.me>



