Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8D5E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 09:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C9RBnRSti7f7SgIlq7qr6tqFDDd/TA3hM/2DzBsoiDc=; b=npN+K1G3lUh44n9c8zbxDl229W
	rmpExM8Aa4Jisymg3wCxPBHhGfAX4gXOu1d4NCGno2PEFDyoFuCktQKa8n3/OtwPBNaeAmhBMBtT2
	NlSSBijdYpAuwhUtfm6b+ekixND2afxrBsaJ9tuUUl0h1rIfrOvSs+i1M2dMxykeMOnYO5xYyGmnF
	f9Bn9C2Q/KIuj7clU0NIHsgsXAQuy5rKWNsPwu4QlGqDFkyLOcDIYIqCerT4W+Hn9ox+aTBSUlATS
	P0sM9KeDeo2GsLv15nC/rfdV40vpmFw6zkuW5o8JNknhUUS++PU1azAC1XSPgOzKxwR8PZlgo5LWx
	vd5Hn5jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTmT-0000000Ctep-0eaO;
	Tue, 17 Dec 2024 09:22:17 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTdM-0000000Cr18-3XEM;
	Tue, 17 Dec 2024 09:12:54 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout2.routing.net (Postfix) with ESMTP id F18AF6025C;
	Tue, 17 Dec 2024 09:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1734426771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=C9RBnRSti7f7SgIlq7qr6tqFDDd/TA3hM/2DzBsoiDc=;
	b=kK/sYAt9QaMOQk/Kh8q9ds7yTLape+FyzYhjlfI5KX0vdxLYhW6/110fiEZd9KWnk/ifh6
	uUhIj3Ctro4c/8XE8OI+Kf8r4h1/Wn/9WeX1dAEIXdS7T3wYt6ZrvUtw7zXtlm4isfYm7i
	yC5fzGGauZFBt3poeCe1rLro+Zjm1n8=
Received: from frank-u24.. (fttx-pool-217.61.150.187.bambit.de [217.61.150.187])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 2765E1004DD;
	Tue, 17 Dec 2024 09:12:50 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 00/22] continue mt7988 devicetree work
Date: Tue, 17 Dec 2024 10:12:14 +0100
Message-ID: <20241217091238.16032-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 06ab4296-b2cd-4af8-a756-3c2e5162f988
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_011253_024071_D56C5245 
X-CRM114-Status: GOOD (  10.63  )
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

From: Frank Wunderlich <frank-w@public-files.de>

This series adds some missing labels and new nodes to mt7988 DTS.

based on pinctrl-series
https://patchwork.kernel.org/project/linux-mediatek/list/?series=918572

changes:
v3:
- reorder
- small fixes
- add some new patches (t-phy, pcie, mmc overlays)
- dropped pmic and proc-supply for now because we found a mismatch compared with schematic

v2:
- reorder and squash label-commits to where they are used
- add some more nodes
- add changes to bananapi-r4 board
- moving some nodes from SoC dtsi to board dts

Frank Wunderlich (22):
  arm64: dts: mediatek: mt7988: Add reserved memory
  arm64: dts: mediatek: mt7988: Add mmc support
  arm64: dts: mediatek: mt7988: Add lvts node
  arm64: dts: mediatek: mt7988: Add thermal-zone
  arm64: dts: mediatek: mt7988: Add missing clock-div property for i2c
  arm64: dts: mediatek: mt7988: Add mcu-sys node for cpu
  arm64: dts: mediatek: mt7988: Add CPU OPP table for clock scaling
  arm64: dts: mediatek: mt7988: Disable usb controllers by default
  arm64: dts: mediatek: mt7988: Add t-phy for ssusb1
  arm64: dts: mediatek: mt7988: Add pcie nodes
  arm64: dts: mediatek: mt7988a-bpi-r4: Enable watchdog
  arm64: dts: mediatek: mt7988a-bpi-r4: Add fixed regulators for 1v8 and
    3v3
  arm64: dts: mediatek: mt7988a-bpi-r4: Add dt overlays for sd + emmc
  arm64: dts: mediatek: mt7988a-bpi-r4: Add thermal configuration
  arm64: dts: mediatek: mt7988a-bpi-r4: Enable serial0 debug uart
  arm64: dts: mediatek: mt7988a-bpi-r4: Add default UART stdout
  arm64: dts: mediatek: mt7988a-bpi-r4: Enable I2C controllers
  arm64: dts: mediatek: mt7988a-bpi-r4: Add PCA9545 I2C Mux
  arm64: dts: mediatek: mt7988a-bpi-r4: Enable t-phy for ssusb1
  arm64: dts: mediatek: mt7988a-bpi-r4: Enable ssusb1 on bpi-r4
  arm64: dts: mediatek: mt7988a-bpi-r4: Enable pwm
  arm64: dts: mediatek: mt7988a-bpi-r4: Enable pcie

 arch/arm64/boot/dts/mediatek/Makefile         |   3 +
 .../mt7988a-bananapi-bpi-r4-emmc.dtso         |  33 ++
 .../mediatek/mt7988a-bananapi-bpi-r4-sd.dtso  |  31 ++
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  | 143 +++++++++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi     | 303 +++++++++++++++++-
 5 files changed, 506 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtso

-- 
2.43.0


