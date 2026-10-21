Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7B8606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 14:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dWgG1VcF;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Odem8RpQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y7LYXebtPPjaPBHUpJOVdDqW1228929tSZVAiRMHhO0=; b=dWgG1VcF6Y9dst
	rTlz2gJiwzXIPYHBBRyRZBgvDKDv6Bpm3z/q1Sdjjfwhx2Ezj6/K17Fu7uZf04Dh1UWTFl9lQ9Ql4
	rYS27xaxMQNCwR+5m74UHE6Hzv5vJbYqVIcP9Js1JmgRKxARHKrLZHVFrZAtdUZPcSe4sYIvyJMwP
	H/vM1aMsADHMRM+HNijbA6Ilc9sBN3VGKJpcCjk//+cQNxnOLinNuBjbRWpPlcqChTSc7UKfjDM+s
	CsFh+wQh2pNM6nLPV6nw/sVucsGtILnM1ZveIIfjx42N8a3TjHrtvHfsHNvUKuhA4vqCbiYfwR/Sd
	2Yp7THKqemxcjaWAbtAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWx2-0000000C2nd-3Hux;
	Wed, 21 Oct 2026 14:05:56 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWww-0000000C2lL-0W4q;
	Wed, 21 Oct 2026 14:05:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type:To; bh=y7LYXebtPPjaPBHUpJOVdDqW1228929tSZVAiRMHhO0=;
	b=Odem8RpQq+AFtvQ0n0WitCIP63af3uCyeSDpFvgzJL+zF7wizQJt21FJ/YU2gv
	NBWZoS1sUFOl4u3YEtV/z9dkIdcF69tsK3G2ItNKwODNFMUxTVVnuOjTUMuQkHaO
	jyIvOJrrwXQ4Xz6ZzbiU2ToDB9QA17DPkDLDOG3oFvApU=
Received: from 4F-GAME.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDnD6anxthqXSXxBg--.24760S2;
	Wed, 21 Oct 2026 22:05:28 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Subject: [PATCH v9 0/2] arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2
Date: Wed, 21 Oct 2026 22:05:20 +0800
Message-Id: <20261021-quarkpi-ca2-v9-0-b75006b22bc5@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKDG2GoC/32NzQ7CIBAGX8VwFgO0BerJ9zAe+NlaNLYVWqJp+
 u5CjTFeTPYyyTezMwrgHQS038zIQ3TB9V2CertBplXdGbCziREjjFNCSnyflL8ODhvFMKOWqao
 2FTEFSsbgoXGPtXY8vTlM+gJmzIm8aF0Ye/9c30WRd5+y+ClHkY9gJUvDbWU5NPxAebEz/Q3ld
 JR/ZJlMLQtaMw2WCP01l2V5AdCJG0vzAAAA
X-Change-ID: 20261004-quarkpi-ca2-21d2a59c50c3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID: _____wDnD6anxthqXSXxBg--.24760S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3WFW7Ar43ur18JF4DZw4DXFb_yoWDXr4kpF
	ZxXrs8Jr4DGryI9an7Cw47Z34rZa18Jw4Ygr1vq34F9a1YvF18Arsa9r4Yqa4jkr95K3Wj
	qFsxWa48Ka4DZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pREdgLUUUUU=
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC+gqsGmrYxqrzugAA3R
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_070550_577900_F74C65B0 
X-CRM114-Status: GOOD (  32.57  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds support for the ALIENTEK QuarkPi-CA2, an RK3588S based
single board computer. The binding patch documents the board, the DTS
patch describes the hardware.

The DTS was rebuilt from scratch against the vendor 5.10 BSP device tree
and then translated to current mainline bindings, so that every node and
property has a vendor-side or schematic origin instead of being carried
over from the earlier revisions.

Changes in v9:
 - SD card: drop enable-active-high again, the power switch of the card slot (vcc_3v3_sd_s0) is active low.  The v8 conclusion that it was missing came from a test run with the wrong DTB loaded; with the property present the regulator core drives the enable pin high and the card's rail stays off.
 - Audio: the I2S0 MCLK pinmux moved from the I2S controller node to the codec node.

Testing: boots from microSD with this series on a v7.3 kernel, and the on-board hardware (microSD, eMMC, HDMI, USB-C DP altmode, USB 3.0 and USB 2.0, PCIe Wi-Fi, Bluetooth, GbE, ES8388 playback, PWM fan) works; "make CHECK_DTBS=y" is clean.

Note: there is no fiq_debugger node, so the debug console is ttyS2 and console=ttyS2,1500000 has to be added to the bootargs manually.
Capture from the headset microphone does not work with the in-tree es8328 driver; that is fixed by a separate ASoC patch series (sound/soc/codecs/es8328.c) and does not affect playback.

Link to v8: https://lore.kernel.org/all/20261007-quarkpi-ca2-v8-0-b83192bed07b@163.com/

Changes in v8:
- SD card: add the missing enable-active-high to the SD card power switch
  (vcc_3v3_sd_s0).  Without it of_gpio_quirk_polarity() forces
  OF_GPIO_ACTIVE_LOW onto the GPIO descriptor, so enabling the regulator
  switched the rail off instead of on and the card lost its power.
  Reported by the sashiko review; verified on hardware, the board now
  boots from an SD card:
  https://lore.kernel.org/all/sashiko-outbox-162297@kernel.org/
- SPI0: describe the two chip selects as GPIOs (cs-gpios) instead of
  muxing the dedicated SPI0_CS0_M3 / SPI0_CS1_M3 pins, so that both chip
  select lines stay usable from the 40-pin header.  Verified on hardware:
  both lines are claimed by the SPI core.
- Link to v7:
  https://lore.kernel.org/all/20261007-quarkpi-ca2-v7-v7-0-a84c6d5d6ef6@163.com/

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
 .../boot/dts/rockchip/rk3588s-quarkpi-ca2.dts      | 1208 ++++++++++++++++++++
 3 files changed, 1214 insertions(+)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261004-quarkpi-ca2-21d2a59c50c3

Best regards,
--  
Bob Hui <bg9oxa@163.com>


