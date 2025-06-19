Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B189EC7115D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 18:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HoqckQxZ37mdbag/HEWUORzIQ/6MLzKp6yKer2BShCE=; b=omgD1ch9pQ3JvF9an4ehQAAVmJ
	xTzpN/QIZ4iYjqSBv8Pot0Sv9ouRu/Rq3woTdkucuCq/Xz+QWZYaCwogWOPbBEAGOcG1anMyIAhlm
	xZZbL5xOoFhEdAzBTMpuQFOK+3BZusoNHmCslbCxiv+P/eJLzaM99Fzj2c+iDDt0eAz5uV3TKQgo6
	4Sn77KN67ieaXKrR3fWSMvkviyMPVEob36LqT50RTK70hc/ZEmYSfY+g/xFVZ9cm0hP1ZnYeUOcce
	4Dgqxd1HBJUYNeutaxdkEW9kGSzSahGh6/U7FOUtrAPNkhDqbZoB5XRfA/Eo0ZnveC0L2jbyOANCX
	3HVkNgWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKDG-0000000E0CV-3G29;
	Thu, 19 Jun 2025 18:42:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSJ5b-0000000Dn3M-3Zom
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 17:30:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 351E361AE5;
	Thu, 19 Jun 2025 17:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63971C4CEF1;
	Thu, 19 Jun 2025 17:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750354214;
	bh=HfFEv6qUpuQv8j0SGXGzwPKNs8oEcWMJkK/zqT9Mh64=;
	h=From:To:Cc:Subject:Date:From;
	b=cesb14huYwxK82KQ4sPB058imYTtnn85Vzl+lLjNEKK6mc/amkcQMvJ3KLZS1No6y
	 86/0OGkM9a7EHA8WIVUzO6Pgqzr69KUIYGuaR/37HRKv7YXNmeuL3NfWlq5f5YlhwD
	 tPn1akioZjboW3ir9b5vei6iMXfESdKMOxMQhDIPcAMhQKQwSO6N/tBxrHKuLhbj2n
	 QOv3YfXjJco7Ni7RqpP+/z6hOmYAs98Ut2pKsnuAFZp/oHoYPHpDLOx6yx+7wcenN6
	 hLhm3J1vtvBOcmya2KXAFE8k454AlmGxhG3q1nCf+MfOhB3QTuEYuB7wsyCGt46QzX
	 BC5K8A1k2Vejw==
Received: by wens.tw (Postfix, from userid 1000)
	id 0B0015FEF5; Fri, 20 Jun 2025 01:30:12 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 0/5] arm64: allwinner: t527: Add OrangePi 4A board
Date: Fri, 20 Jun 2025 01:30:02 +0800
Message-Id: <20250619173007.3367034-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Chen-Yu Tsai <wens@csie.org>

Hi everyone,

This series adds support for the OrangePi 4A board. This is a Raspberry
Pi model B form factor development board based on the Allwinner T527
SoC.

The board has the following features:
- Allwinner T527 SoC
- AXP717B + AXP323 PMICs
- Up to 4GB LPDDR4 DRAM
- micro SD slot
- optional eMMC module
- M.2 slot for PCIe 2.0 x1
- 16 MB SPI-NOR flash
- 4x USB 2.0 type-A ports (one can be used in gadget mode)
- 1x Gigabit ethernet w/ Motorcomm PHY (through yet to be supported GMAC200)
- 3.5mm audio jack via internal audio codec
- HDMI 2.0 output
- eDP, MIPI CSI (2-lane and 4-lane) and MIPI DSI (4-lane) connectors
- USB type-C port purely for power
- AP6256 (Broadcom BCM4345) WiFi 5.0 + BT 5.0
- unsoldered headers for ADC and an additional USB 2.0 host port
- 40-pin GPIO header

Patch 1 adds a new entry to the list of board compatibles.

Patch 2 and 3 are minor cleanups.

Patch 4 adds pins for UART1, which is used for BT on the board.

Patch 5 adds a dts file for the new board.


Please take a look. I will take all the patches through the sunxi tree.


Thanks
ChenYu


Chen-Yu Tsai (5):
  dt-bindings: arm: sunxi: Add Xunlong OrangePi 4A board
  arm64: dts: allwinner: a523: Move mmc nodes to correct position
  arm64: dts: allwinner: a523: Move rgmii0 pins to correct location
  arm64: dts: allwinner: a523: Add UART1 pins
  arm64: dts: allwinner: t527: Add OrangePi 4A board

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 160 ++++----
 .../dts/allwinner/sun55i-t527-orangepi-4a.dts | 378 ++++++++++++++++++
 4 files changed, 471 insertions(+), 73 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts

-- 
2.39.5


