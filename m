Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB81C021BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 08:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AQq1tfNVC3PLTkluezaUKOxK1ntdb4Rwze8vX7bXHRc=; b=qYmIRwzs1TS8fU
	kvqqx9Y43xd08goPUNydKpUtO95dAAK1e4I7jZfYTFEXhVCTkK+TAY4/0qAT8frAV6UUw3xATQVVL
	0pNl3YP6WBQMkarhVbYgZq5JC9OPb/n9p1qIUicoN/CnskhluhZf527h3mvPTzRYO8XZdENfVSR2t
	IigKim19rMA0XRLA2qm6WL3/7Usoy8paBrk/RdE3OfLuFqV08POD6K3Z40Xtc9Y71g2WhGn1TdYRU
	AMK33rkKlYN2hAqnV/LdgzfS3XPPZW+aqZxuIr4S0vPqwgreobdEn5tf9Jvq/x5N16pAMCA6nOFAq
	9cX1MMd73OB0/HscUr0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDDO-00000002yt5-0y8X;
	Wed, 26 Feb 2025 08:56:26 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnD7I-00000002xUj-3Tay
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 08:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=AQq1tfNVC3PLTk
	luezaUKOxK1ntdb4Rwze8vX7bXHRc=; b=b4cY+8dxDKoGjTrMa1Ve+FLtVhfWlp
	QjLoAZxrw0Bux0IQxH/ywcB5WlXVew7oALVAEXm/qSKhSrJPdkTfejKUPQogIUGX
	7sPJdhk195COtnfVzhn3GZS6IGwEuPUcDbgbW61hZ++7KAqSoh6ex/ybPGvG2m4D
	P49BgoQmwXNYd+ch258B/kVJjEQOb06YkIJ4EaREJ7zl1xD7VWIpYWAYRglJpa5k
	Sc0JuZoT4nhrkbEcimkqdxeWhQqAMtp07+44ADrz4CNzoHObBXapSc4yh4aELoCD
	27P9jBBc9XYo+dTS2ODJaC0nngaMYH1bXTecj3iCWdBN3w7CY+S1Xjig==
Received: (qmail 500321 invoked from network); 26 Feb 2025 09:50:03 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Feb 2025 09:50:03 +0100
X-UD-Smtp-Session: l3s3148p1@iBzBqAcv2pIgAwDPXxaLANR24ZQNPy5l
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] ARM: dts: at91: calao_usb: improve support
Date: Wed, 26 Feb 2025 09:49:35 +0100
Message-ID: <20250226084938.3436-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_005009_786661_B35C9854 
X-CRM114-Status: UNSURE (   8.55  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series improves Calao USB devicetrees and fixes other at91-wide DT
issues on the way. The Calao boards are added to the at91 binding
description, the Olimex board is separated first. Also, the wrong
usb-node name is fixed for the whole directory

Changes since v1:
* add patches 1-2 to this series to meet dependencies of patch 3
* patch 4 is new
* rebased on at91-next

Wolfram Sang (4):
  dt-bindings: ARM: at91: make separate entry for Olimex board
  dt-bindings: ARM: at91: add Calao USB boards
  ARM: dts: at91: usb_a9263: fix wrong vendor
  ARM: dts: at91: fix faulty ohci/ehci node names

 .../devicetree/bindings/arm/atmel-at91.yaml   | 33 +++++++++++++++++--
 arch/arm/boot/dts/microchip/aks-cdu.dts       |  2 +-
 arch/arm/boot/dts/microchip/animeo_ip.dts     |  2 +-
 arch/arm/boot/dts/microchip/at91-foxg20.dts   |  2 +-
 .../arm/boot/dts/microchip/at91-qil_a9260.dts |  2 +-
 .../boot/dts/microchip/at91-sam9_l9260.dts    |  2 +-
 .../dts/microchip/at91-sama5d27_som1_ek.dts   |  4 +--
 .../dts/microchip/at91-sama5d2_ptc_ek.dts     |  4 +--
 .../dts/microchip/at91-sama5d2_xplained.dts   |  4 +--
 .../dts/microchip/at91-sama5d3_xplained.dts   |  4 +--
 .../dts/microchip/at91-sama5d4_ma5d4evk.dts   |  4 +--
 .../dts/microchip/at91-sama5d4_xplained.dts   |  4 +--
 .../arm/boot/dts/microchip/at91-sama5d4ek.dts |  4 +--
 arch/arm/boot/dts/microchip/at91-vinco.dts    |  4 +--
 arch/arm/boot/dts/microchip/at91rm9200.dtsi   |  2 +-
 arch/arm/boot/dts/microchip/at91rm9200ek.dts  |  2 +-
 arch/arm/boot/dts/microchip/at91sam9260.dtsi  |  2 +-
 arch/arm/boot/dts/microchip/at91sam9260ek.dts |  2 +-
 arch/arm/boot/dts/microchip/at91sam9261.dtsi  |  2 +-
 arch/arm/boot/dts/microchip/at91sam9261ek.dts |  2 +-
 arch/arm/boot/dts/microchip/at91sam9263.dtsi  |  2 +-
 arch/arm/boot/dts/microchip/at91sam9263ek.dts |  2 +-
 .../dts/microchip/at91sam9g20ek_common.dtsi   |  2 +-
 arch/arm/boot/dts/microchip/at91sam9g45.dtsi  |  4 +--
 .../boot/dts/microchip/at91sam9m10g45ek.dts   |  4 +--
 arch/arm/boot/dts/microchip/at91sam9n12.dtsi  |  2 +-
 arch/arm/boot/dts/microchip/at91sam9n12ek.dts |  2 +-
 arch/arm/boot/dts/microchip/at91sam9x5.dtsi   |  4 +--
 arch/arm/boot/dts/microchip/ethernut5.dts     |  2 +-
 arch/arm/boot/dts/microchip/evk-pro3.dts      |  2 +-
 arch/arm/boot/dts/microchip/mpa1600.dts       |  2 +-
 arch/arm/boot/dts/microchip/pm9g45.dts        |  4 +--
 arch/arm/boot/dts/microchip/sam9x60.dtsi      |  4 +--
 arch/arm/boot/dts/microchip/sama5d2.dtsi      |  4 +--
 arch/arm/boot/dts/microchip/sama5d3.dtsi      |  4 +--
 arch/arm/boot/dts/microchip/sama5d3xmb.dtsi   |  4 +--
 arch/arm/boot/dts/microchip/sama5d4.dtsi      |  4 +--
 .../boot/dts/microchip/usb_a9260_common.dtsi  |  2 +-
 arch/arm/boot/dts/microchip/usb_a9263.dts     |  4 +--
 39 files changed, 87 insertions(+), 58 deletions(-)

-- 
2.45.2


