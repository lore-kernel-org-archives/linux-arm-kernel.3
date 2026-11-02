Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3816260703AD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 15:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kd7QInMf;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=X6hAabrk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4Uwae+gE1BcmoHM+lz7cCmQC10sk8bUBWclgEXNXliM=; b=kd7QInMfsNbZ9WKQNJbTudnun8
	jP2T1WwC0YU6fDTL77WM3GEl2wPZU2D6clFy47DTPNnb2Gmy4PJhKyPaYagQjMBCsq2zGWkQhi6f9
	jDEXYf21+Odg6iFyfL4JB3USzzU9k8DD0AtraxQp1DmAI+dm5mN48Dh1Vxy0xyOKP04r3C+RiqCqY
	1Te9ITWQhzvge2lcMaN63dOhXV0/odqql7VtsrQwMg13FR29vFDn3E34e2hKF6xqpF9bkIZxxhy2j
	rBo6ssB4xRbfdXtyRECeG/4lurHShh1HNG+9q4u3k7RUKEfC67DkbgUF5jJnZK1eNvgQ2M61GkOUd
	5b5AEa2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtWQ-0000000Gwbr-3jmV;
	Mon, 02 Nov 2026 15:00:30 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtWM-0000000GwZ6-2zZd;
	Mon, 02 Nov 2026 15:00:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type:To; bh=4Uwae+gE1BcmoHM+lz7cCmQC10sk8bUBWclgEXNXliM=;
	b=X6hAabrkf7v8g3aGn6Q6oVY7CbRGc3h5xrNQbjI940fWlQd6Zwil90BkznBg7N
	sPsvWsc8XTSrta3EpyxmBmtsyfusw5T/oJKu2mDObQb7Hkd/IaDfXX1nQIJIFReI
	UXCdyfmmiN/Lm7MFG67HMBG715giiQmtCPPNQ4K2Ju6RQ=
Received: from 4F-GAME.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3_yh5pehq8uWTEg--.2912S2;
	Mon, 02 Nov 2026 23:00:10 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Subject: [PATCH v11 0/2] arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2
Date: Mon, 02 Nov 2026 23:00:00 +0800
Message-Id: <20261102-quarkpi-ca2-v11-0-eb246076a82f@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHCl6GoC/33NzW4CIRDA8VcxnIuZgQWWnvoejQc+RqVNXQu6s
 TH77gVNU7mYcJnJ/P5cWaGcqLDX1ZVlmlNJ06EOiC8rFvbusCOeYl0wAUIjwMC/zy5/HhMPTnC
 BUThlg4IgWRXHTNt0ueXeN/e5nP0HhVNLtIt9Kqcp/9z+m027+yubrjyb9oC7cQg6qqhpq99Qy
 3WYvlhLz+MTPFbpR4lWeIpgfC/tgxTYS9ukUQDaC+GD6iXCI5U9RajWRm9hQDsQyH+7LMsvFtd
 wAGoBAAA=
X-Change-ID: 20261004-quarkpi-ca2-21d2a59c50c3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID: _____wD3_yh5pehq8uWTEg--.2912S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF1UtF1xArW5Kry7tryxZrb_yoWrWw1fpF
	ZxuFs8Grs7tryI9ws29w1xZFyIvw4kJa1SqF1kJ345Za1Yvr18Zr1Skr4FvF9xCrnay34U
	Cr15WFykGF9rZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRiYFJUUUUU=
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC+hxdymropXyuHAAA3Y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_070027_101773_D24327EA 
X-CRM114-Status: GOOD (  18.07  )
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

Changes in v11:
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
95.00% correct on 200 images), and so do the H.264, HEVC, VP8 and AV1
decode paths.

Note: there is no fiq_debugger node, so the debug console is ttyS2 and
console=ttyS2,1500000 has to be added to the bootargs manually.  Capture
from the headset microphone does not work with the in-tree es8328 driver;
that is fixed by a separate ASoC patch series (sound/soc/codecs/es8328.c)
and does not affect playback.

Changes in v9:
- SD card: drop enable-active-high again, the power switch of the card
  slot (vcc_3v3_sd_s0) is active low.  The v8 conclusion that it was missing
  came from a test run with the wrong DTB loaded; with the property present the
  regulator core drives the enable pin high and the card's rail stays off.
- Audio: the I2S0 MCLK pinmux moved from the I2S controller node to the codec node.
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

Please review.

---
Bob Hui (2):
      dt-bindings: arm: rockchip: Add ALIENTEK QuarkPi-CA2
      arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2

 .../devicetree/bindings/arm/rockchip.yaml          |    5 +
 arch/arm64/boot/dts/rockchip/Makefile              |    1 +
 .../boot/dts/rockchip/rk3588s-quarkpi-ca2.dts      | 1202 ++++++++++++++++++++
 3 files changed, 1208 insertions(+)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261004-quarkpi-ca2-21d2a59c50c3

Best regards,
--  
Bob Hui <bg9oxa@163.com>


