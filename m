Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD667C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 11:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ny7bhpn00Ly6BIl8F1IWZPB/0Rmu55iPoKi9YsgQedg=; b=eGGrRo7ZeiEBJW6M3mFvWpyYfh
	VA/PPM59D50dgdJxbXaY5MBkblsEpNMRvQ50u4u3xPbw+sW5od8T85DI1ji904I3AB+lvq/zgc/Dt
	Vg8V79e+TY5xJwVeHLWvCefFsObe2Ra//NJL4beHg7Xez7f2CqRQNtx/c30/g2/kJsZm9ZgnXBcgb
	A5B7LkU/Q7l7hchxx7G7cHZ78kTfCOL6tv1/LVYwC5kYSLHUP4SxodAiZmZJqSejtqwFHp1YuIJXZ
	OjsR1HZK8mJ8leYwi8LcluWkSXmvz2oco4Z0w8Q98t13YrT37pjrlYViToJdXei4M50JlxHEyXEHf
	gQ8JEZjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl4Sr-00000000TLD-0WS6;
	Thu, 20 Feb 2025 11:11:33 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl4RM-00000000Svr-0CX6;
	Thu, 20 Feb 2025 11:10:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740049798;
	bh=KbXYp775cdnty7f1RIZ5D4SMIl7u1xJAlQegzHLVtg0=;
	h=From:To:Cc:Subject:Date:From;
	b=Lj5Rz8xFMibe4IC22N7/0i+iFcJChPrurFTfbm6FxtnBiXZjlcr0ysS8d18Kkk24H
	 JcBMXGugW9or6w3gy2zAAokcERw07Ft+q1MFQ1V2By+tzJ/v6fH0ruqbuLQpam24jt
	 bPUDMenlljFsyIHHrpTOnBx9ZzkkK1b/VDqJAkM8NFwKZP2Ax76OFtvFev2/qe75fY
	 qvgblGP7EeS4BCNpIFWY6dAXfHAAd92g+8/GGE9MjJeqcAqLF/wVQJTQbhkU5GlhuO
	 kNqVg06Py0PppaZ+hxFneiwETXc5Sennhn7a9nOMU9k2pD73FX6G4ZIZA0R1zbSFWK
	 v8TN7mI5oOR7A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B37CF17E1247;
	Thu, 20 Feb 2025 12:09:57 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	pablo.sun@mediatek.com
Subject: [PATCH v1 0/4] MediaTek MT8188 Display Graph: Chromebooks+Genio
Date: Thu, 20 Feb 2025 12:09:44 +0100
Message-ID: <20250220110948.45596-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_031000_231034_32C68B20 
X-CRM114-Status: UNSURE (   7.06  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Like already done for MT8195 in a parallel series, this one adds a
base display controller graph for the MT8188 SoC, migrates the Geralt
Chromebooks to use it, and adds support for the DSI display found on
the Genio 510 and Genio 700 boards.

While at it, this also adds pinmux configuration for switching on/off
the fixed power supply of the touchscreen IC found in Genio 510 and 700
IoT boards to stop relying on the bootloader preconfiguring it as GPIO
before booting the kernel.

AngeloGioacchino Del Regno (4):
  arm64: dts: mediatek: mt8188: Add base display controller graph
  arm64: dts: mediatek: mt8390-genio-common: Add Display on DSI0
  arm64: dts: mediatek: mt8188-geralt: Add graph for DSI and DP displays
  arm64: dts: mediatek: mt8390-genio-common: Configure touch vreg pins

 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 155 +++++++++++++++++-
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 140 ++++++++++++++++
 .../dts/mediatek/mt8390-genio-common.dtsi     | 154 ++++++++++++++++-
 3 files changed, 434 insertions(+), 15 deletions(-)

-- 
2.48.1


