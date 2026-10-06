Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7C3CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 17:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GxSXrn1I5iZE9sOU8qsq/Mjbajn5S833YpKv40o2AwE=; b=fSrCopUA0Z9EtR
	SfvJOwU1aB0Kw5wC0XKAKsF3q61osazPJPTTglQgR5f+MYbZbD5wP0CUYGFv3JS3mvJIu/16rto8h
	RxMyIHtdrlK5kl+WQQYUowDxK8ydfoWoKI+VpWUsRbVUxZCLCVSbsMCz49NUlqsieWz91qlg6AhGk
	t4I0dyRA2i48DSX+bmdZGFXDkMSuTYS9zKdw1Rlz6RLaKbUCj9JnRWarA4edHy+/v2WZIvH2gV1K9
	fEAHuR+2HqEBoS0O2eVGav1bqonYyCo83A3aWvbFV43u+bZ25z+YeEe3bf0SkHMZ0GJEnf04+rDlK
	dsFIpYX9D9X7pz/hmgyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE8dt-00000001BSW-3NDT;
	Tue, 06 Oct 2026 17:07:53 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE8dq-00000001BQp-0qXt;
	Tue, 06 Oct 2026 17:07:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type:To; bh=GxSXrn1I5iZE9sOU8qsq/Mjbajn5S833YpKv40o2AwE=;
	b=CMRKrc0jxFT4bjz3AF5GuIjyiZQkJPzAUYOl2TyXMK+5sfK+wJvolMTMoXpSqT
	TpPsUJST15QoLwMJ+sX711esOrLEb5sRl8dhyGhfLugdhiHww1mwGD9a24HgFTrN
	NnmxgVtWRSIoWW/j0h60fb1q+LyM1PJ7k5BLFpuEjTN6A=
Received: from 4F-GAME.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnz_fJKsVqPjBSCw--.19378S2;
	Wed, 07 Oct 2026 01:07:22 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Subject: [PATCH v7 0/2] arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2
Date: Wed, 07 Oct 2026 01:06:25 +0800
Message-Id: <20261007-quarkpi-ca2-v7-v7-0-a84c6d5d6ef6@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJEqxWoC/yXMSQ6DMAxA0asgr2spmElwlaqLYNxikBiSBiEh7
 t4Ulm/x/wFenIqHJjnAyaZe5ymieiTAvZ0+gtpFAxkqU2NyXIN146LIlnCrkNKObFFzYTiDGC1
 O3rpfw+frtg/tIPz9X+A8f+yLJI9yAAAA
X-Change-ID: 20261004-quarkpi-ca2-v7-21d2a59c50c3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Andrew Lunn <andrew@lunn.ch>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID: _____wDnz_fJKsVqPjBSCw--.19378S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3WFWrGr1rAry8Zr1Dtw1xuFg_yoW3ZFy3pF
	ZxXrs8Jr4DGryIkan7Ca17u34rZa18Jw4Ygr1qq34F9a15ZF10yr4S9r45Xa4jkr95K3W2
	qFsxWa48Ka4DZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pREApUUUUUU=
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC+gvINmrFKssN0gAA3e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_100751_026639_C75E194E 
X-CRM114-Status: GOOD (  28.73  )
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

This series adds support for the ALIENTEK QuarkPi-CA2, an RK3588S based
single board computer. The binding patch documents the board, the DTS
patch describes the hardware.

The DTS was rebuilt from scratch against the vendor 5.10 BSP device tree
and then translated to current mainline bindings, so that every node and
property has a vendor-side or schematic origin instead of being carried
over from the earlier revisions.

Changes in v7:
- Rebuilt the board DTS from the vendor 5.10 BSP device tree.
- USB-C: the connector now describes data-role "dual" with role-switch and
  DP-altmode endpoints, the dwc3 uses usb-role-switch, and the VBUS switch
  is marked enable-active-high.  v5 had set data-role "host", following the
  vendor configuration; the port is a dual-role connector and the tested
  behaviour is host mode with DP altmode on an attached display.
  https://lore.kernel.org/all/20261001140429.1710C1F000FF@smtp.kernel.org/
  https://lore.kernel.org/all/20260927140406.5C3381F000FF@smtp.kernel.org/
- GbE: the RGMII delays are now documented as PHY-side only, matching
  "rgmii-id" in the DTS; re-measured with this setting, a 500 MB transfer
  completed with zero retransmissions.
  https://lore.kernel.org/all/80eceb66-b573-463a-a577-30ba5793dbc4@lunn.ch/
  https://lore.kernel.org/all/20261001153113.E4B131F000FF@smtp.kernel.org/
- Audio: both the codec and the amplifier paths to the jack are kept,
  with the hardware evidence in the patch description.
  https://lore.kernel.org/all/20261001140429.1710C1F000FF@smtp.kernel.org/
- Codec: the compatible list is "everest,es8388", "everest,es8328".
  https://lore.kernel.org/all/20260927125456.4D5501F000FF@smtp.kernel.org/
  https://lore.kernel.org/all/20260927140406.5C3381F000FF@smtp.kernel.org/
- Microphone wiring matches the board schematic: the microphone signal
  (HP_MIC) is on LINPUT1 and its reference (HP_MIC_GND) on RINPUT1.
- rk806 DVS1 pin names, node names, indentation, blank lines and
  regulator prefixes cleaned up to match the mainline style.
  https://lore.kernel.org/all/20260927125456.4D5501F000FF@smtp.kernel.org/
  https://lore.kernel.org/all/20260929-analytic-cocky-magpie-afefcc@quoll/
- Recipients collected with "b4 prep --auto-to-cc".
  https://lore.kernel.org/all/20260929-ambitious-festive-orca-b59ffe@quoll/
- Link to v6:
  https://lore.kernel.org/all/20261002-b4-quarkpi-ca2-v6-0-9fc33f27ebb9@163.com/

Changes in v6:
- My oversight, sorry for the noise: when I switched phy-mode to "rgmii-id"
  in v5 I forgot to update the commit message of patch 2/2 at the same time,
  so the message still described the v3/v4 approach (delays applied on the
  MAC side) while the code had moved to the PHY-side delays.  The message now
  describes what the code does: the PHY adds the delays internally and the
  MAC adds none, so nothing is applied twice.  The device tree is not touched
  by this change; the compiled .dtb is byte-for-byte identical to the one in
  v5 (verified).
- Keep the headphone routing as in v5.  On this board the 3.5 mm jack needs
  the direct codec output routes: describing only the amplifier path gives
  no output at the jack, which I verified on hardware with a test tone and
  with music playback.  So the parallel routes are intentional here and
  were not changed.
- Link to v5: https://lists.infradead.org/pipermail/linux-rockchip/2026-October/077620.html

Changes in v5:
- Use phy-mode = "rgmii-id" and let the PHY add the RGMII delays, instead of
  "rgmii" with the delay applied on the MAC side, as pointed out by Andrew
  Lunn.  The MAC adds no delay in this mode, so nothing is applied twice;
  see the GbE note above for the details and the measurements.
- Move the Makefile entry so that the list stays in alphabetical order.
- Rename the headphone amplifier node to the generic name "audio-amplifier";
  the labels are unchanged, so no reference is affected.  The audio routing
  itself is unchanged, see the note above.
- Set the Type-C connector data-role to "host".  The XHCI controller is
  host-only on this board (dr_mode = "host" and no usb-role-switch), and
  the vendor DT lists "dual" only because the vendor configures that
  controller as OTG.  The power role stays "dual", as the board can be
  powered over Type-C.
- Link to v4: https://lists.infradead.org/pipermail/linux-rockchip/2026-October/077616.html

Changes in v4:
- Add the missing blank line between the include block and the root node.
- Fix the node indentation in a few places.  That cleanup is whitespace only;
  the compiled .dtb is unchanged by it (verified byte-for-byte).
- Rename the Type-C controller node to the generic name "typec-port", as the
  other boards using this part do, and drop its redundant status property.
- Give the fixed regulator nodes the "regulator-" name prefix, as the other
  boards do; the labels are unchanged, so no reference is affected.
- Route the Type-C SuperSpeed lanes through the USBDP PHY, as the other
  RK3588 boards do, so that the PHY does the orientation muxing.
- Feed the headphone amplifier from one codec output pair only; that is what
  the other ES8388 boards do.
- Cc the people and lists reported by scripts/get_maintainer.pl.
- Link to v3: https://lists.infradead.org/pipermail/linux-rockchip/2026-October/077611.html

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

Changes in v2:
- Fix the RK806 DVS1 pin configuration: dvs1-null-pins used
  "gpio_pwrctrl2" instead of "gpio_pwrctrl1", as reported by the
  sashiko review.
- Translate all device tree comments to English, and drop a stale
  comment that no longer matched the Type-C / USB3 nodes.  Comment
  changes only: the code is otherwise byte-for-byte identical to v1.

Please review.

---
Bob Hui (2):
      dt-bindings: arm: rockchip: Add ALIENTEK QuarkPi-CA2
      arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2

 .../devicetree/bindings/arm/rockchip.yaml          |    5 +
 arch/arm64/boot/dts/rockchip/Makefile              |    1 +
 .../boot/dts/rockchip/rk3588s-quarkpi-ca2.dts      | 1204 ++++++++++++++++++++
 3 files changed, 1210 insertions(+)
---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20261004-quarkpi-ca2-v7-21d2a59c50c3

Best regards,
--  
Bob Hui <bg9oxa@163.com>


