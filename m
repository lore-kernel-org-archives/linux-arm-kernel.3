Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3832DC88E6A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 08:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vUAgjTs6GdjG01KZPCc5Vh53pfUq/UJYtzOr24zdMQ=; b=wMrkHYy3sUUJclAwkNMKXZ7mG3
	lWFHg2bK9lPwz+UiRlw//swlFd9h0O7VYy6rsxQ9K4SnQKg3BbwbNCQ147+ZLVDfT1NcCsaficzZX
	uemOtlxx0POm/YLnwZ/x9TCN+jYDitc38OpGYNACEV3zMBuc8tG209UtclhEChBSKLCO1AdJvhKhM
	Rb9LtKXLqUCIokcpJPuPkoeOiVB6rXae4KOlGUBiB/mXoPyjAMzOquvW2NPVm+WAlgAjdHZF/eNii
	O9/gUncv5y6xGttP7zPoq3onZwfBaKdcaUDtnFlk8vb0dRKreapEg/25xqZ/oz7j2k7Qtw24cRYk6
	PuyV0y5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62Wo-00000002qer-06gr;
	Mon, 14 Sep 2026 08:59:06 +0000
Received: from out-61.mta0.migadu.com ([2001:41d0:1004:224b::3d] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62Wl-00000002qdQ-1iCL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 08:59:05 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=g6znYCCn3/yoIa4DdoJwc9F7KKna78UvWYBm5/Hagk4=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789376339; v=1; x=1789981139;
 b=MRCLqk/ltyx2C0g5pRAKsZtm0iJXn9FdB5sUR+T1MnXCemAG26tqvbnbbddaf9RktEnzOt9X
 TSLxHSlYVsVIjbLYi5uXv6WKgVq0AKwacGgwccAXFTttdo0UPTHO8QEQKpmoBx1lXyZLeG5px5v
 kknGEyoBsgSXy6p8rGUpCJrMsqagq6RD/75wJU1tzuDqorV13kb47SteqvdSmhnZh7tE26U7xty
 DjohuNK0lmEYta8feJoc4bXJtTZTY2xT5ZO1a76AT7oRcL7AFMad1522r1nPPaaiyAw18PBhtO/
 0/534V5NzQwNmzkHbYfFB92CgWxPXN7/PnVsACG+tMzqA==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b1d13efd5afab658;
	Mon, 14 Sep 2026 08:58:49 +0000
X-Mizu-Trace-ID: b1d13efd5afab658
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 10:58:44 +0200
Message-Id: <DLEWYVCME40R.L2IMBIU3ILG1@cknow-tech.com>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Chukun Pan" <amadeus@jmu.edu.cn>, "Jonas Karlman" <jonas@kwiboo.se>,
 "jensen" <jensenhuang@friendlyarm.com>, "Andrey Korshunov"
 <razor1702@gmail.com>, "Diederik de Haas" <diederik@cknow-tech.com>, "Conor
 Dooley" <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 0/4] arm64: dts: rockchip: Add FriendlyElec NanoPi
 R28S
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: <HystericalDragons@proton.me>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
X-Mailer: aerc 0.22.0-9-ge948bb7230f4
References: <20260914-r28s-upstream-v5-0-7409c498e8dc@proton.me>
In-Reply-To: <20260914-r28s-upstream-v5-0-7409c498e8dc@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_015903_807503_0A72036C 
X-CRM114-Status: GOOD (  37.07  )
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

On Mon Sep 14, 2026 at 10:24 AM CEST, =E5=AE=89=E5=AE=B9 via B4 Relay wrote=
:
> The NanoPi R28S is a dual gigabit Ethernet router board based on the
> Rockchip RK3528 SoC:
>
>   https://wiki.friendlyelec.com/wiki/index.php/NanoPi_R28S
>
> It is closely related to the already supported NanoPi Zero2, sharing
> most of its power tree and peripheral routing. Patch 2 therefore moves
> the common parts into rk3528-nanopi.dtsi, and patch 3 adds the board on
> top of it. The split leaves the NanoPi Zero2 dtb unchanged; I verified
> this by comparing the node and property sets of the dtb before and after
> the split, which differ only in node order and phandle numbering. Patch
> 4 is a coding style cleanup in the shared devicetree and the NanoPi
> Zero2 devicetree.
>
> The devicetree was derived from the vendor tree:
>
>   https://github.com/friendlyarm/kernel-rockchip/commit/ee640c5344b13a0a3=
17436e2357df01af8268ce7
>
> but with many changes to make it suitable for mainline.
>
> Tested on a metal-case unit without the optional onboard eMMC: boots
> from microSD, both Ethernet ports link up at 1000 Mbps, the HYM8563 RTC
> registers, and all three LEDs are functional. The USB Type-C connector
> registers as a DWC3 UDC in peripheral mode; gadget enumeration against
> a USB host was not completed, because that connector is also the 5V
> input and a PC port cannot power the board.
>
> The bootloader was U-Boot 2026.07 with a board specific R28S target,
> which releases the RGMII PHY reset before Linux starts, so the reset
> description in the PHY node is all the kernel needs.
>
> Two things I did not do, because my hardware cannot verify them:
>
> - The AICSemi AIC8800D80 WiFi chip on sdio0 has no upstream driver, so
>   only the SDIO controller is described.
> - The eMMC is described as HS200 rather than the vendor's HS400 with
>   enhanced strobe, since the board at hand has an unpopulated eMMC
>   footprint and the faster modes could not be verified.
>
> ---
> Changes in v5:
> - Dropped the pinctrl-0 before pinctrl-names reordering from the coding
>   style patch and used the order the rest of the rockchip devicetrees
>   use, pinctrl-names first, in the new devicetree as well. The strict
>   mode of scripts/dtc/dt-check-style asks for the alphabetical order,
>   but it does so for many other properties that no rockchip devicetree
>   sorts that way either (Chukun Pan).

Then you can also just drop patch 4 as (by far) most rockchip devicetrees
do not have a blank line before ``status =3D <okay>;``

> - Moved the SYS LED, which the NanoPi R28S shares with the NanoPi Zero2,
>   and the led1 and led_sys pin configurations into rk3528-nanopi.dtsi.
>   Both boards now only add their own LEDs to &leds (Chukun Pan).
> - Renamed the NanoPi R28S LED nodes to led-1 and led-2, to use the
>   led-[0-9] node naming (Chukun Pan).
> - Changed the user button from KEY_RESTART to BTN_1. It is a general
>   purpose button on this board, not a reset button (Chukun Pan).
> - Link to v4: https://patch.msgid.link/20260911-r28s-upstream-v4-0-fb6c85=
f226d4@proton.me
>
> Changes in v4:
> - Dropped the patch that moved the NanoPi Zero2 RGMII PHY reset to the
>   MDIO bus. GPIO4_C2 resets the PHY, not the bus, so describing it on
>   &mdio1 is not a description of the hardware. It would also break
>   Ethernet in U-Boot, which reads reset-gpios, reset-assert-us and
>   reset-deassert-us from the PHY node and has no support for a bus
>   level reset. The nanopi-zero2-rk3528 U-Boot target releases the PHY
>   reset before Linux starts; the failure I reported was seen with the
>   generic-rk3528 target, which carries no board devicetree. Pointed out
>   by Chukun Pan, and by Jonas Karlman in the same discussion for the
>   HINLINK H28K:
>   https://lore.kernel.org/lkml/1e8da54f-ef87-4d31-9a0a-17c0ff66bee0@kwibo=
o.se/
>   My own R28S has in fact been running a board specific U-Boot target
>   all along, with the PHY node description this series now keeps, so
>   the reset ordering problem I described does not arise there.
> - Reworded the coding style patch to state the coding style violation
>   itself as the reason, rather than the tool that found it (Diederik de
>   Haas).
> - Link to v3: https://patch.msgid.link/20260909-r28s-upstream-v3-0-ee3e1a=
34a353@proton.me
>
> Changes in v3:
> - New patch 1: describe the NanoPi Zero2 RGMII PHY reset on the MDIO
>   bus rather than in the PHY node, so that it is applied before the PHY
>   ID is read. A PHY held in reset by the bootloader was otherwise never
>   probed, leaving the port dead. Reported by Andrey Korshunov, who
>   proposed the deprecated snps,reset-gpio properties on the MAC; the
>   bus level reset-gpios in mdio.yaml fixes the same ordering without a
>   deprecated property.
> - New patch 5: follow the DTS coding style in the three NanoPi RK3528
>   devicetrees, as found by scripts/dtc/dt-check-style --mode=3Dstrict:
>   pinctrl-0 before pinctrl-names, and a blank line before status.
>   Suggested by Diederik de Haas.
> - Picked up Conor Dooley's Acked-by on the binding.
> - Link to v2: https://patch.msgid.link/20260907-r28s-upstream-v2-0-21ab57=
0fc91c@proton.me
>
> Changes in v2:
> - Split the parts shared with the NanoPi Zero2 into a new
>   rk3528-nanopi.dtsi (new patch 2). The NanoPi Zero2 dtb is unchanged.
> - Name the pinctrl labels after the nets in the schematic: usr_btn,
>   led1, led2, led_sys, pwr_wf and pcie_eth_perstb.
> - Rename the button node to button-user and its label to "USER".
> - Link to v1: https://patch.msgid.link/20260905-r28s-upstream-v1-0-f68d53=
89269a@proton.me
>
> ---
> =E5=AE=89=E5=AE=B9 (4):
>       dt-bindings: arm: rockchip: Add FriendlyElec NanoPi R28S
>       arm64: dts: rockchip: Split out the common NanoPi RK3528 parts
>       arm64: dts: rockchip: Add devicetree for the FriendlyElec NanoPi R2=
8S
>       arm64: dts: rockchip: Follow the DTS coding style in the NanoPi RK3=
528 devicetrees
>
>  .../devicetree/bindings/arm/rockchip.yaml          |   5 +
>  arch/arm64/boot/dts/rockchip/Makefile              |   1 +
>  .../arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts | 127 +++++++++
>  .../boot/dts/rockchip/rk3528-nanopi-zero2.dts      | 306 +--------------=
-----
>  arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi    | 314 +++++++++++++++=
++++++
>  5 files changed, 456 insertions(+), 297 deletions(-)
> ---
> base-commit: 32e0f64640d558a0f5410ac5cdd8ebf371c5e6a6
> change-id: 20260905-r28s-upstream-e212e27d6165
>
> Best regards,
> -- =20
> =E5=AE=89=E5=AE=B9 <HystericalDragons@proton.me>
>
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip



