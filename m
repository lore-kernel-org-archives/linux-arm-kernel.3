Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A589D606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o8o4We95;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Aryd6J2a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=RB13LQEiHMUpEqGLCsZmcfuPA8GVdgrKVYUoyebN0To=; b=o8o4We95AadG/TTQ/Ab1dSXsFu
	Jb+vk2+XqYLugdCZXQrQQdxjJ/Fr7lGrGzc0tSgT4TPGIMUfG2i4HbNr2wQzYKX2hLxm4o+t9eTmG
	b93FY6QkKDSDCQBQ2BV47neHJXfjhtOi3R8o3AV9yHOgRH/mdqVAyqKmdjw5BVj83QO0hLqj7fias
	lpL/qMARDyum2TUpCQB5Umpx/G1xiWrn/bp+wFXgy4B430JJhRRvKuDX8P9U2Wx7VqKW/EMI1qi+A
	uJcAByVoD5VuT35wVtq6H//lB7a8BiH4SUXw/SMM2tvBovQnmz/34Cv1aAPoOS5kmTxTGlcEgJXRY
	y/diawuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdxe-0000000602p-23QJ;
	Wed, 04 Nov 2026 16:35:42 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdxW-00000005zs6-1gEm;
	Wed, 04 Nov 2026 16:35:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type:To; bh=RB13LQEiHMUpEqGLCsZmcfuPA8GVdgrKVYUoyebN0To=;
	b=Aryd6J2at4ar29ai3icMYEUkeSho9yEi83aVMQF6h60LP6HMxLkzIhfG7DWdWs
	Wv8nKW0nTBUswOWiXSd2lAY51Oe8lve5tJLNFhfnvvzx4dFJVcnBYuVtAIayaQgZ
	GtsVz51yIE3/JvpnoktsXOxIDu+O1K052llNC0QbWOW3k=
Received: from 4F-GAME.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDXH7_CXutqdSA2Fg--.15833S2;
	Thu, 05 Nov 2026 00:35:15 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Subject: [PATCH v15 0/2] arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2
Date: Thu, 05 Nov 2026 00:34:53 +0800
Message-Id: <20261105-quarkpi-ca2-v15-0-2347608d717a@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK1e62oC/33QS07DMBAG4KtUXhM0Hj+HFfdALPwKNYimJG0Eq
 nJ37CLUxItK3ow13+8ZX9iUxpwm9rS7sDHNecrDoRRcPexY2LvDW+pyLBcMATUHkN3X2Y0fx9w
 Fhx3yiE5RUBAEK+I4pj5/X+NeXv/q6ezfUzjViNqxz9NpGH+u782m9v0nm03ybOqBzlkZdFRRp
 14/cy0ew/DJavRs72BbpLeCE/oUwfitpJVEvpVUpVEA2iP6oLaSw5qKLeVQLEVPIDnJBKKx/GY
 LbiwvNnmUGox2FvvG4j2LxUYjKZL36HtqrFjbdmZR/zjaICBEr01qrLxnZbFIQGVhCQXf7LIsv
 /bUwrFaAgAA
X-Change-ID: 20261004-quarkpi-ca2-21d2a59c50c3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Andrew Lunn <andrew@lunn.ch>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID: _____wDXH7_CXutqdSA2Fg--.15833S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3WFW7uryUZw15ZFyUGry7GFg_yoWxAFy5pF
	ZxCFs8GrsxtryI9rs7Ww1xZrWxAFs7trW5XFn5J345Za1Y9r1IyrySkwn0v3WDCrn5Aa4U
	Gr15W3yrWF9xZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pREApUUUUUU=
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC3QRey2rrXsRGTwAA3e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_083534_855796_EEBD1CE6 
X-CRM114-Status: GOOD (  24.27  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NORMAL_HTTP_TO_IP,NUMERIC_HTTP_ADDR,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds support for the ALIENTEK QuarkPi-CA2, an RK3588S based
single board computer. The binding patch documents the board, the DTS
patch describes the hardware.

The DTS was rebuilt from scratch against the vendor 5.10 BSP device tree
and then translated to current mainline bindings, so that every node and
property has a vendor-side or schematic origin instead of being carried
over from the earlier revisions.

Changes in v15:
- Rebase onto v7.4-rc1 and re-check the DTS with that tree's dt-schema.
- Move the Ethernet PHY reset from the MAC to the MDIO bus, as the Sashiko
  bot suggested on v14: snps,reset-gpio, snps,reset-active-low and
  snps,reset-delay-us are deprecated, and stmmac_resume() pulses that
  reset while the YT8531 clock is only programmed once in probe, so the
  link may not come back after a resume.  &mdio1 now carries reset-gpios,
  reset-delay-us, reset-post-delay-us and a pinctrl group for the GPIO.
- Drop the &sata0 node, as the Sashiko bot suggested on v14: rk3588-base
  .dtsi already leaves sata0 disabled, so the override only repeated the
  default.
- Drop cap-mmc-highspeed from &sdmmc, as the Sashiko bot suggested on v14:
  with no-mmc set mmc_of_parse() never initialises MMC mode, so the
  capability could not take effect.
- Describe the USB-C data path with the graph the drivers parse, as the
  Sashiko bot suggested on v14: rk_udphy_probe() looks its DisplayPort
  output up with fwnode_graph_get_endpoint_by_id(dev, 3), so the Type-C
  connector, the USB 3.0 host controller and the USBDP PHY now use ports
  with port@N and reg, and the endpoints are connected through labels.
- Fix the indentation of the added graph nodes and the SPDX line.  No
  property is changed by that.
- Link to v14: https://patch.msgid.link/20261103-quarkpi-ca2-v14-0-290990440b67@163.com

Changes in v14, addressing the Sashiko bot's suggestions on v13:
- Drop the unused media/video-interfaces.h include.
- Write the ramoops zone sizes as powers of two.  ramoops_probe() rounds
  record_size and pmsg_size down, so 64 KiB and 128 KiB are the sizes the
  driver already used and the layout does not change.
- Link to v13: https://patch.msgid.link/20261103-quarkpi-ca2-v13-0-ad8c30cdb67e@163.com

Changes in v13:
- Add a link to the board schematics and the Reviewed-by tag from Shawn
  Lin, who reviewed the sdmmc, sdhci and PCIe parts.
- Move the pin configuration of the headphone amplifier's enable GPIO from
  the sound card node to the amplifier node itself, as the Sashiko bot
  suggested on v12: pinctrl is applied per device, so the amplifier can
  probe before the sound card and request that GPIO while it is not yet
  configured.
- Drop the leftover Assisted-by tag from the bindings patch.
- Link to v12: https://patch.msgid.link/20261102-quarkpi-ca2-v12-0-d749d9bb2bf9@163.com

Changes in v12, addressing the Sashiko bot's suggestions on v11:
- Sort the PMIC regulator nodes in natural order, so that dcdc-reg1 comes
  before dcdc-reg10.
- Sort the phandle references in natural order, so that pwm7 comes before
  pwm14.
- Put simple-audio-card,codec before simple-audio-card,cpu.
- Add the blank lines between sibling nodes that were missing.
- Link to v11: https://patch.msgid.link/20261102-quarkpi-ca2-v11-0-eb246076a82f@163.com

Changes in v11, addressing Heiko Stuebner's review of v10:
- Trim the commit message down to the board description and the list of
  supported peripherals.
- Drop the Assisted-by tag.
- Note on the Reviewed-by line which nodes were reviewed.
- Sort the properties in aliases alphabetically.
- Sort the nodes without unit addresses alphabetically, everywhere.
- Drop the deprecated regulator-suspend-microvolt properties.
- Sort the phandle references alphabetically.
- Keep a single root node and merge the extra root nodes and the &{/}
  block into it.
- Link to v10: https://patch.msgid.link/20261023-quarkpi-ca2-v10-0-9db904194e03@163.com

Changes in v10:
- Add the Acked-by tag from Conor Dooley, which I missed.
- Add the missing domain-supply for the GPU and NPU power domains.  Without
  it the power domain driver falls back to a dummy regulator for both.
- Enable the three NPU IOMMUs the enabled NPU cores reference.  Without them
  opening /dev/accel/accel0 fails with -ENODEV.
- Link to v9: https://patch.msgid.link/20261021-quarkpi-ca2-v9-0-b75006b22bc5@163.com

Testing: boots from microSD with this series on a v7.3 kernel, and the
on-board hardware (microSD, eMMC, HDMI, USB-C DP altmode, USB 3.0 and
USB 2.0, PCIe Wi-Fi, Bluetooth, GbE, ES8388 playback, PWM fan) works;
"make CHECK_DTBS=y" is clean.  The NPU works on this revision (all three
cores detected, IOMMUs attached, /dev/accel/accel0 opens, MNIST classifier
95.00% correct on 200 images).

Note: the debug console is ttyS2 and there is no fiq_debugger node, so
console=ttyS2,1500000 has to be added to the bootargs manually, and capture
from the headset microphone needs the separate ASoC series for
sound/soc/codecs/es8328.c, which does not affect playback.  PWM14 has no
consumer, because it is only described with the pinctrl group for pin 33 of
the 40-pin header, and it is enabled so that user space can drive it
through the pwmchip interface.  The unconsumed combophy_avdd0v85 and
combophy_avdd1v8 regulators are kept as well, because they document the two
PHY rails of the board and the combphy driver has no supply property to
attach them to.  Both the direct and the amplified headphone routes are
kept, so the Sashiko bot's suggestion on v12 to drop the direct ones is not
applied: the vendor card routes LOUT1/ROUT1 and its "Headphone Power"
widget into the same Headphone sink, and the jack is silent when only the
amplifier path is described.  The connector's port@0/port@1 numbering
therefore stays as it is and the v14 suggestion to swap it is not applied,
because that numbering matches rk3588-evb1-v10.dts, and rockchip,dp-lane-mux
stays too because the other RK3588 boards that route DisplayPort over USB-C
set it as well.

Please review.

---
Bob Hui (2):
      dt-bindings: arm: rockchip: Add ALIENTEK QuarkPi-CA2
      arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2

 .../devicetree/bindings/arm/rockchip.yaml          |    5 +
 arch/arm64/boot/dts/rockchip/Makefile              |    1 +
 .../boot/dts/rockchip/rk3588s-quarkpi-ca2.dts      | 1240 ++++++++++++++++++++
 3 files changed, 1246 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261004-quarkpi-ca2-21d2a59c50c3

Best regards,
--  
Bob Hui <bg9oxa@163.com>


