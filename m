Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6F3CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6f0/9t1/hAO0xXpNxF8cq+WlgMeZNGxzR43oPfG3WdM=; b=us6zSsYCLZUtOnp/V7KwidwaD2
	uKWuhh1TlUMY5VhYj/sD88X0vICFUXy3hbvzwSD26RkZllu4cy5sAfOwdXelFQ10nlnXumcBb3XCT
	FMDnxSfd4tkG8OeNu/zl8o/l13FjKpUiBunxGvAQCmD/5bgXN+gJGS/FhYbk0rfZUq7MiBnlbs9M7
	xh1aJIr5Z62G5PBmXAepDdfQtEDTq467MVxq5CkYFo2qvqjwsXcJ1gxAwIbqtn1UdbdbwVSxMMzmS
	dV7wtZGzRY3wZAoAzPz1680+xcGw3uACEgae4hiagxOvzarWAFbJIV+Qrpg4XX2NpaYa40YlG6l6S
	+gY3ynjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGeS-00000009CpP-19tJ;
	Thu, 01 Oct 2026 13:16:44 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGeO-00000009CoH-18xD;
	Thu, 01 Oct 2026 13:16:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID; bh=6f0/9t1/hAO0xXp
	NxF8cq+WlgMeZNGxzR43oPfG3WdM=; b=FULTK5HlpQQFSTwRFo1Niux7YBXbmEY
	xep3XlW8DDfLgFcUYGUQ4VdS0bLIj5uZgKxqJilLRo6z5QoIWWaplc6IB7bziug1
	ASOi2yCcGNkBxu0J4C2OBLVe/azniDJP/TkLDGf8PjWT1cRGUGdxxnOWIrBxF6R1
	bW4rFByraEto=
From: BG9OXA <bg9oxa@163.com>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v3 0/2] arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2
Date: Thu, 01 Oct 2026 21:16:33 +0800
Message-ID: <179086059377.25869.266865258704141387@163.com>
X-CM-TRANSID: _____wDX_zwxXb5q97_IBw--.9753S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3GF4ktFy8AF1UJr1fJw4ruFg_yoW7trW8pF
	Z8X3y3Kr4kKr1xuw1IkF1UCrWSvF4fJay5WF1qq34ayw45Gr1ftF1Sk3ZIqa47C34SgFyj
	vF4jg3y7GF4DZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Us2-OUUUUU=
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC3RKtG2q+XTKLlAAA3d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_061640_769707_23E64641 
X-CRM114-Status: GOOD (  24.04  )
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

Hi all,

This short series adds support for the ALIENTEK QuarkPi-CA2, an RK3588S
based single board computer.

Board summary:
 - Rockchip RK3588S (4x Cortex-A76 + 4x Cortex-A55), LPDDR4x
 - eMMC, microSD slot, M.2 socket (PCIe 2.0 x1)
 - Gigabit Ethernet, USB 3.0 Type-A, USB 2.0 Type-A ports and a USB-C
   port (USB 2.0/3.0 plus DisplayPort altmode, two DP lanes)
 - HDMI output, three MIPI CSI and two MIPI DSI connectors
 - ES8388 analog codec with 3.5 mm jack, HUSB311 USB-C PD controller
 - 40-pin header, RK806 PMIC, IR receiver
 - No SPI-NOR; the vendor bootloader reads extlinux.conf from the SD/eMMC
   boot partition

Patch 1 documents the board in the Rockchip platform bindings, patch 2
adds the device tree itself (plus its Makefile entry).  The "alientek"
vendor prefix is already present in vendor-prefixes.yaml, so no vendor
prefix change is needed.

Tested on hardware: boot from SD and eMMC, gigabit Ethernet, the USB 2.0
ports, the USB 3.0 Type-A port (UAS storage device, 5000 Mbps link,
309 MB/s), USB-C DisplayPort altmode, HDMI video and audio, ES8388 analog
playback, the ADC keys, the IR receiver, the PWM fan and ramoops.  The M.2
socket is described following the vendor design; no suitable device was
available here to exercise that link.  dtbs_check is clean for both patches.

Notes worth the reviewer's attention:

 * The codec is clocked through I2S0_8CH_MCLKOUT_TO_IO rather than the
   internal I2S0_8CH_MCLKOUT mux that the other boards reference.  On
   RK3588 the MCLK-to-IO routing is a gate in SYS_GRF SOC_CON6 which the
   bootloader leaves closed, so nothing drives MCLK out to the codec;
   pointing "clocks" at the _TO_IO clock makes the codec driver open that
   gate at probe, while "assigned-clocks" stays on the internal mux to
   keep the 12.288 MHz rate.  Verified on hardware: i2s0_8ch_mclkout_to_io
   is enabled with the codec (1-0011) as its consumer, and playback works.

 * The codec compatible list is "everest,es8388", "everest,es8328", as
   documented in everest,es8328.yaml and as used by the other boards with
   this part.  The standalone ES8323 driver cannot instantiate a card on
   this board at all, which is how the fitted part was confirmed.

 * Analog capture from the 3.5 mm TRRS jack (headset microphone) does not
   work yet: the capture stream returns a constant idle pattern (0xFFFF)
   although the analog bypass path works, and the DAPM routes and the ALSA
   controls look correct.  This looks like the same ES8328 capture problem
   that has been reported for other boards, so I kept it out of this
   series.

 * The USB 3.0 Type-A port is wired to usb_host2_xhci through combphy2_psu;
   both are enabled here, as in the vendor BSP.  combphy2_psu is free on
   this board because the M.2 socket uses pcie2x1l2 (combphy0_ps).

 * The board has three MIPI CSI and two MIPI DSI connectors, but no camera
   or panel is described here: those are plug-in modules.  Enabling the
   CSI-2 receiver without a sensor attached makes the driver fail to find
   its endpoint at probe (verified on hardware), so, as in the vendor
   tree, camera and panel descriptions belong in overlays.

 * GbE: phy-mode is "rgmii" and the RGMII delay is applied on the MAC side
   (tx_delay), matching the other boards in mainline that use the same
   YT8531 PHY.  Tested for 900 seconds at full rate in both directions
   (922 Mbit/s, zero retransmissions) and with 1000-packet pings; the MAC
   error counters stay at zero.

This is my first patch to the Rockchip platform.  I am a Chinese amateur
electronics hobbyist (amateur radio callsign BG9OXA) working on this board
in my spare time, so please point out anything that does not follow the
expected style.

Changes in v3:
- Rebase onto current mainline and re-run dtbs_check.
- Drop the explanatory device tree comments, as requested.  The rationale
  that was in them is in this cover letter instead; the compiled .dtb is
  unchanged by that cleanup (verified byte-for-byte).
- Use phy-mode = "rgmii" with the RGMII delay applied on the MAC side
  instead of "rgmii-rxid", as pointed out by Andrew Lunn: phy-mode
  describes the PCB wiring, and only one side should add the delay.
- Rename the fixed regulators that used a different naming scheme so that
  all of them follow the same style, and use generic node names.
- Drop two redundant "status = \"okay\"" properties (rga3_core0 and
  rga3_core1 are already enabled in rk3588-base.dtsi).
- Add the missing "enable-active-high" to the Type-C VBUS regulator.
- Use the binding-documented codec compatible pair and drop the
  "clock-names" property, which everest,es8328.yaml does not allow; the
  codec node now passes dtbs_check.
- Drop the phy-supply of u2phy0_otg, the USB 2.0 PHY of the USB-C OTG
  port.  That rail is the Type-C VBUS and is already owned by the TCPC;
  while the PHY held it enabled as well, VBUS was powered from boot, the
  TCPM state machine never saw a VBUS-off event, and the port could not
  finish a source attach, so DisplayPort altmode never came up (the
  monitor had power but no picture).  Verified on hardware: the port now
  attaches at boot and the monitor gets a picture.
- Add the LED color so the work LED is exposed as "green:heartbeat".
- Drop the camera sensor and its regulator: camera modules are plug-in
  devices, and enabling the CSI-2 receiver without a sensor attached makes
  the driver fail to find its endpoint at probe.  Following the vendor
  tree, camera and panel descriptions belong in overlays.


BG9OXA (2):
  dt-bindings: arm: rockchip: add ALIENTEK QuarkPi-CA2
  arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2

 .../devicetree/bindings/arm/rockchip.yaml     |    5 +
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../boot/dts/rockchip/rk3588s-quarkpi-ca2.dts | 1149 +++++++++++++++++
 3 files changed, 1155 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts

-- 
2.47.3


