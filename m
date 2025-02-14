Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FF5C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oqjP77RdlsrQ+PBarQ2plbLl14GnrAVdCEFqfCLgb08=; b=YZCCrPUZGtTnigp72VkEv+a/J0
	v4oF8mku79QOhGc+pMN/NWuch6FxjNwb/zYedt8s1cGQcM9Nsg763Apn2r/8HyDUGu7cdtJU3NPRl
	pA10MZt+RLjNyz2GLJKNAvn7q1HtU2yThDDuUMfgtmwzObpWGL826kZVVHKDsvTYQrrSd592PHyfN
	OIEEl3HnMrP/TcGZ5WQo5zXG8sLTbKC5d7lpSxHbOcI8VWkNpSpwcH5/RdQPN3PvN01+fxW5RVq8Q
	ZF2R0EetF5rhDAd0Sm4gR09o1/ikmFv0opm6cahXHgfLpGV+G27ayjC9DtveJ2F9ksFWTOnQW2VIm
	O90P8TNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0fl-0000000FvXF-0DlY;
	Fri, 14 Feb 2025 18:44:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj07N-0000000Fp2M-0Ntc
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Feb 2025 18:08:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=oqjP77RdlsrQ+PBarQ2plbLl14GnrAVdCEFqfCLgb08=; b=UVlY4nk2idw10CiUh+s7MNpx5v
	5JuCrOvDIButHNQGPB2ST2XdYGqEBQ9fqvYvawVe56NjS8O6o+4aOr4SIYBGK4R8BurErt8VftAG8
	H+pFohWgY1T+2CuWC289VgctyeF+nHQ9H5rChnKuvIHNvLpKcYqz3Is7L4hjdxFkwyPtDCfR2ktYg
	rQFBud7mrHyTugioKvdX83Q6qexAtmvI+JwLiM8YylEndMjeIk2EXZWAR+szjMrfRmOvpNGqUet4h
	JFBS620/O9SMqIB/qnYUI+f2/PEJ1C/10WDC8/wyqCc+F7+OOXQX8ubC+QrVepPqZT5pk+fBmNKvE
	96Pbubhg==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj07J-00000001J2u-1z9q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 18:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1739556526; x=1771092526;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=H8tXLa2p1VhUWkXliwBLSLkbzNFdosczokdQ/wtBBm8=;
  b=2B5rBUP7V4KddigoBqcDNUsIotBsqgvB05JwmnXWeYuP260jc9vbwqRs
   ClE7wXMN3D1sW8OixUWfogF8E4iUMLDtEL/4Gz351jpFz3TdAKVufpxVp
   H7AvpeUogWcg+SugCzGClrm6A7+3K5GWCQeLsFMz8TaaRDkiPB4rmCQH6
   V3Hnj+gOHyaTRKcZSDfmdZlb9guB467KDRI1GYJeTHyeRhsDaLZpRk0nq
   QuDOSkYYX1ZN2wR307oNk9nwD/8KixKQ4+T7zf8Q+dTbTF7BkjrQJVpiH
   vkGHyI3C1Qxyj90As5QQdWVVyHa0Txid87rTtfAGhy1FgVJRkfyVpnnnH
   w==;
X-CSE-ConnectionGUID: afEECSQvQkGMMmDvtHvTFg==
X-CSE-MsgGUID: 2lHh1jY2S7Kw2hWZ/xXjEA==
X-IronPort-AV: E=Sophos;i="6.13,286,1732604400"; 
   d="scan'208";a="37700922"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Feb 2025 11:08:38 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 14 Feb 2025 11:08:25 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 14 Feb 2025 11:08:25 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <vkoul@kernel.org>, <wim@linux-watchdog.org>,
	<linux@roeck-us.net>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH 0/8]  Add System Components for Microchip SAMA7D65 SoC
Date: Fri, 14 Feb 2025 11:08:13 -0700
Message-ID: <cover.1739555984.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_180846_297410_CE1B5EFC 
X-CRM114-Status: UNSURE (   9.21  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

This patch set adds support for the following systems in the SAMA7D65
SoC:
- DMAs
- Chip ID
- Dual watchdog timer.

Ryan Wanner (8):
  dt-bindings: atmel-sysreg: Add SAMA7D65 Chip ID
  dt-bindings: watchdog: sama5d4-wdt: Add sama7d65-wdt
  dt-bindings: dma: atmel: add microchip,sama7d65-dma
  ARM: at91: Add Support in SoC driver for SAMA7D65
  ARM: dts: microchip: sama7d65: Add chipID for sama7d65
  ARM: dts: microchip: sama7d65: Add watchdog for sama7d65
  ARM: dts: microchip: sama7d65: Add DMAs to sama7d65 SoC
  ARM: dts: microchip: sama7d65: Enable DMAs

 .../devicetree/bindings/arm/atmel-sysregs.txt |  1 +
 .../bindings/dma/atmel,sama5d4-dma.yaml       |  3 ++
 .../bindings/watchdog/atmel,sama5d4-wdt.yaml  |  3 ++
 .../dts/microchip/at91-sama7d65_curiosity.dts | 12 +++++
 arch/arm/boot/dts/microchip/sama7d65.dtsi     | 44 +++++++++++++++++++
 drivers/soc/atmel/soc.c                       |  5 +++
 drivers/soc/atmel/soc.h                       |  3 ++
 7 files changed, 71 insertions(+)

-- 
2.43.0


