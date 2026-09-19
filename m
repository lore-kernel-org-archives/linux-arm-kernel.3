Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A09C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 19:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ti+yGbnu2sgiBEoxz/2FOqRNEMiMdjPyIrNHcKs3z3w=; b=MSB22sl9KTkwl2tTtDCKa9Mhrx
	g3lOZ9wG9QUdxynJv/jABuByhq9ZXSI2i4e2YcJMajySUjp7cM3ZsrnANyLl2P51g4bbNVWrWkDjY
	T/Ucp1PM3aOW8zL8CxPP6cizFOzHz1ODI1+8gHr+RqD5UGZJESevDqRlVxf2e0lcr9AFph7/LKxJx
	8WVZ70Aa5HzRCIUBmcRrdxhpL3vkYeCrESKsPlpSIPonP2+qHqo0nAzCJS7xM79n83DiDeHolB5Xd
	nMNOhPB/Um6IqnUBmwHHTS+Kx+FpNO5HIJoCDXJqowxtIdi0G0VFtQxufEQlSSgd5SPa+/QkiDtzs
	iALAI0XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x80yy-0000000Gbbu-3z1S;
	Sat, 19 Sep 2026 19:44:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x80yy-0000000GbbJ-061F
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 19:44:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 28330601FB;
	Sat, 19 Sep 2026 19:44:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9043C2BCB9;
	Sat, 19 Sep 2026 19:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789847058;
	bh=jN/xuLLWQ0ENNdxly/LSIJeQTI5L1wucNlyu8/3PGvQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=VLak2Ubme9mkRtyXtlj4Vpkg6ln0iUFE/X00Xs4UMLboVC1r6/wzgL3DnTg6JWy3J
	 IEpUDccFCuc8icQrjRc0QQIg2vZnxZTPFaCU67QoEvwoivRU3VB7Bfbyl1F9kphM+a
	 GCuk46ebu0HnNt1uQrn7umpATswa3eb1/NznIV8sKyvsmUNWROXeANo53RuZ81j1VR
	 Cr9WMyf6pw3BWkTvArrIrAsd8BgeBIT8rAN5F2MDMiVlq9QpR4dLg9I+Jgo9oobmAD
	 n82eddIOLAPA3pEhlgd+Ix3E08iCDG/5NBpm+uDB+Lv2H/WkkIlT7bNkQMhcz/g961
	 J2wWLuGExDv1w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F158C982CC;
	Sat, 19 Sep 2026 19:44:18 +0000 (UTC)
From: Nicolo Giuliani via B4 Relay <devnull+nicolo.giuliani6.studio.unibo.it@kernel.org>
Subject: [PATCH 0/3] arm64: dts: marvell: Add Sophos XGS 107w NPU
Date: Sat, 19 Sep 2026 21:44:16 +0200
Message-Id: <20260919-send-dt-v1-0-365615a74ef3@studio.unibo.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABDmrmoC/yXMyw5AMBCF4VeRWWtSjbi9ili0ZjAWJR1EIt5ds
 fyS/5wLhAKTQJNcEOhg4cVHZGkC/WT9SIoxGow2ha6zWgl5VLipwjnUlc1LjQZivQYa+Pye2u6
 37G6mfnvncN8Pa32lp2sAAAA=
X-Change-ID: 20260919-send-dt-6bbd08a470d2
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789847056; l=2324;
 i=nicolo.giuliani6@studio.unibo.it; s=20260919; h=from:subject:message-id;
 bh=jN/xuLLWQ0ENNdxly/LSIJeQTI5L1wucNlyu8/3PGvQ=;
 b=kF2s2/YeaYZ1CM7tARbZ5N2d9Es+LHHwr6izOEkX3j/au1XGeuQjHgcgk6MQ6+Kb4u7qZaqGy
 YhZM/MnpVpGBQ102hDH2Y0PuLwtiPWljNEVU5qXc9b5S4nvI+unVrLb
X-Developer-Key: i=nicolo.giuliani6@studio.unibo.it; a=ed25519;
 pk=D652ecdT01GkA1eoFWNFNX85xIg5ZnFwUWyjfestgQw=
X-Endpoint-Received: by B4 Relay for
 nicolo.giuliani6@studio.unibo.it/20260919 with auth_id=1040
X-Original-From: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
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
Reply-To: nicolo.giuliani6@studio.unibo.it
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The Sophos XGS 87/107 desktop firewalls pair an AMD x86 host with a
separate network processing unit (NPU): a Marvell Armada CN9130 SoC with
its own eMMC and SPI NOR flash. The NPU serves the eight RJ45 ports and
the SFP cage through a Marvell 88E6193X switch on its MDIO bus, which is
connected to the SoC by a 10GBASE-R link, and reaches the x86 host over
PCIe.

This series adds the Sophos vendor prefix, the compatible string of the
NPU board and a device tree that describes the NPU as a standalone system:
UART console, eMMC, SPI NOR flash, the PCA9555 GPIO expander of the port
LEDs, the SFP cage and the switch with its ports. The LEDs, the USB ports
and the PCIe link to the x86 host (the CN9130 acts as a PCIe endpoint
towards it, which needs endpoint support that is not part of this series)
are not described.

The reset line of the switch is not passed to the mv88e6xxx driver as
reset-gpios, because the 88E6193X needs about two seconds after a reset,
much longer than the driver waits. The boot loader resets it instead.
The details are in patch 3.

Tested on an XGS 107w with Linux 6.18: boot from eMMC, eMMC and SPI NOR
access, the mvpp2 link to the switch at 10 Gb/s, the 88E6193X probing with
its eight user ports, and 936 Mbit/s through a front port. The SFP cage
and the PCA9555 outputs are untested.

dt_binding_check passes for vendor-prefixes.yaml and armada-7k-8k.yaml,
and CHECK_DTBS=y on marvell/cn9130-sophos-xgs107w.dtb reports no warning
specific to this board.

Based on the mvebu/dt branch of the mvebu tree (008e9faade).

Signed-off-by: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
---
Nicolo Giuliani (3):
      dt-bindings: vendor-prefixes: Add Sophos
      dt-bindings: arm: marvell: Add Sophos XGS 107w NPU
      arm64: dts: marvell: Add Sophos XGS 107w NPU board

 .../bindings/arm/marvell/armada-7k-8k.yaml         |   9 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/marvell/Makefile               |   1 +
 .../boot/dts/marvell/cn9130-sophos-xgs107w.dts     | 209 +++++++++++++++++++++
 4 files changed, 221 insertions(+)
---
base-commit: 008e9faadef8c0aaa9b8a3ff05a2126e3c5b08b7
change-id: 20260919-send-dt-6bbd08a470d2

Best regards,
--  
Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>



