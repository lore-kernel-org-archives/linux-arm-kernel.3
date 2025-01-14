Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFF1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 07:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g93/co7kj3z7QxU12QeGmjlGuM9c6/YzAxajJEXZ9fY=; b=0HRDW/MfAxIaVd
	4F5Rp0bFuikYJO93lznM1J8nNz8RUD6h/ClcKVhm/dqipL89adJ2/rOK/nKj5RVoTYkBv6YzQSLK+
	GV9DVm1l1B8uIgs4ndnwb3bX5QiB0bPwTV4a+45svcZXViPLe6/OP9EwnWQzx/sJAxcgzf7UJ0j+B
	hOjLdBzDkNFFeHwsmoG5ZctLfOrCUjos9wkNL9mP+oGbXt9q4lMX89NfUyM13ERhesGQwDTZmbdtk
	lm3cqa7YWJOPE0Bzbd3ten/VIzPkXJGX/tRZIiNGSS4Ip/a9mCWbRtApLD8m8c3qjAS5jrU4wm2SZ
	LMhZacSKFSyL8ES3e/Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXbXA-00000007iRd-0kUt;
	Tue, 14 Jan 2025 07:40:20 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXbVt-00000007i9m-3bD2;
	Tue, 14 Jan 2025 07:39:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736840338;
	bh=FB0+qrN59+wsgrB59fSYukLc9bwu1EZidKzIxpC2CBw=;
	h=From:Subject:Date:To:Cc:From;
	b=Ydo2mUqEd4ibZWY52KrzIEsBO7N+jbP0VLKPgV5wMZ55LUz9wyxa/an+tlffnEf7o
	 zcn21/BzN8H3DbDgjYBnp5C59+vCa/aw/lPGVuRrOXNToDp7snXWyW3hyKuRNOZwHe
	 sHMPvKJ3LSOYI/7Av2ygQPrpuOfq3CjsrC64boNM9jWPITpmkj1175unLDxqyd8HJC
	 dgYL1Wy3YP/9svGicM82OM3CTE4fvu/Or+CT/z+7CI8p2Ahr1oqHcGjebhrYzd9w1z
	 EcD4n6deuBhWhtC8W3YcUY7MK9ZR/fP6cj81yRNM1xhlj4SiDDP5reaGWaUL8dMoCE
	 KQKGgXakpU/NA==
Received: from fedora.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr [90.76.208.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1663917E0E1C;
	Tue, 14 Jan 2025 08:38:58 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [PATCH 0/3] Add support for Mediatek Genio 510 EVK board
Date: Tue, 14 Jan 2025 08:38:38 +0100
Message-Id: <20250114-dts_mt8370-genio-510-v1-0-8517ee0fdbe8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH4UhmcC/x3MSQqAMAxA0atI1gYSS52uIiIOUbOwSisiiHe3u
 HyL/x8I4lUC1MkDXi4NursIThMY194tgjpFQ0aZJWaD0xm67SxNQbiI0x0tExqb01AS09BXENP
 Dy6z3v23a9/0AxyL5pGYAAAA=
X-Change-ID: 20250113-dts_mt8370-genio-510-3560b8010ba9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736840337; l=2223;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=FB0+qrN59+wsgrB59fSYukLc9bwu1EZidKzIxpC2CBw=;
 b=IxM8NDfTIiqm+gkoWM1h71DqwBuJq8uNDdGbb8qkT6xblhoP+Ppo1+kZ+tIv2tWCJVx0pZj+G
 gZdQs64zgwvAihLcpUR1RGcgaK8SDReWn6dlqFLHO5pF0imQEh/MCUi
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_233902_066022_53FA35E5 
X-CRM114-Status: GOOD (  10.69  )
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

This patchset adds the basic support of the Mediatek Genio 510 EVK
board, based on the Mediatek MT8370 SoC.

It adds a device-tree file for the board (mt8370-genio-510-evk.dtb) 
and an include file for the SoC (mt8370.dtsi), in order to be able to
boot. As the board is very close to the Genio 700 EVK board, an include file
(mt8390-genio-common.dtsi) is also created to factorize the common
definitions.

The Genio 510 EVK has following features:
- MT8370 SoC
- MT6365 PMIC
- MT6319 Buck IC
- 4GB LPDDR4X
- 64GB eMMC 5.1
- 12V DC Jack
- Micro SD card slot
- Push Button x 4 (Power, Reset, Download and Home Key)
- LED x 4 (Power, Reset, System on and Charging Status)
- USB Device Port x 1 (Micro USB Connector)
- USB Host Port x 1 (Type-C USB Connector)
- 3.5mm Earphone Jack x 1 (with Microphone Input)
- 3.5mm Line Out Audio Jack x 1
- Analog Microphone x 1
- Digital Microphone x 2
- Gigabit Ethernet with RJ45 connector
- HDMI 2.0 TX port with Type A HDMI connector
- eDP port
- 3x UART with serial-to-usb converters and micro USB connectors
- M.2 Slot x 2
- I2C Capacitive Touch Pad
- 4-Lane DSI x 2
- 4-Data Lane CSI x 2
- I2S Pin header
- 40-Pin 2.54mm Pin Header x 1 

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
Louis-Alexis Eyraud (3):
      dt-bindings: arm: mediatek: add mt8370-evk board
      arm64: dts: mediatek: add support for MT8370 SoC
      arm64: dts: mediatek: add device-tree for Genio 510 EVK board

 .../devicetree/bindings/arm/mediatek.yaml          |    5 +
 arch/arm64/boot/dts/mediatek/Makefile              |    1 +
 arch/arm64/boot/dts/mediatek/mt8188.dtsi           |    8 +-
 .../boot/dts/mediatek/mt8370-genio-510-evk.dts     |   19 +
 arch/arm64/boot/dts/mediatek/mt8370.dtsi           |   64 ++
 .../boot/dts/mediatek/mt8390-genio-700-evk.dts     | 1033 +------------------
 .../boot/dts/mediatek/mt8390-genio-common.dtsi     | 1040 ++++++++++++++++++++
 7 files changed, 1134 insertions(+), 1036 deletions(-)
---
base-commit: 37136bf5c3a6f6b686d74f41837a6406bec6b7bc
change-id: 20250113-dts_mt8370-genio-510-3560b8010ba9

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


