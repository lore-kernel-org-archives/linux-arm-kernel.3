Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA0BC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 17:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T31NEck3M5FWrgi1yTf0docgh7wBM3wytkuvc/AHQMw=; b=SlxtEdzp/15OzPYneaSZAh84vT
	DGN+PK9SCyfIv1uhf2u1QuaIDbcaUcJSnNoFykDfTdVlZIWdDNF89dGepoLsp+TT3vMBaOIlYYIoz
	AX8bZQifFw26Q768aS/7qqI+cKNT4fEysziz8UTVfcpRuQKtVvBDgnDstEFSaFMRJ5JcAhF+I+ErV
	mcLZaVAGgV8Pkc972VVKMxQpVvtsKFYSF0hP+l6Ubpkydk0oTDQgtVZN9/Z43MSaZx2S9LRXjjiO9
	Yd9bQ2vfocM21nPQd5Z4iVcW4pE0+2oib8St8DCry0SWpzzDGTqEGi1WaUPQnNFcu0VfkeDZ1zg//
	quOsgzcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBzLX-000000086v6-0sFC;
	Mon, 05 May 2025 17:11:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uByz9-0000000830S-2GPZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 16:48:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20F54339;
	Mon,  5 May 2025 09:47:50 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 000F63F673;
	Mon,  5 May 2025 09:47:57 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Cody Eksal <masterr3c0rd@epochal.quest>,
	Philippe Simons <simons.philippe@gmail.com>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] arm64: dts: sunxi: Add Liontron H-A133L support
Date: Mon,  5 May 2025 17:47:26 +0100
Message-ID: <20250505164729.18175-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_094807_619423_129A62DF 
X-CRM114-Status: UNSURE (   9.47  )
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

The Liontron H-A133L is an industrial development board featuring the
Allwinner A133 SoC.
Alongside the usual standard connectors like USB and Ethernet ports,
it contains a number of dedicated JST connectors, to connect external
peripherals.

Add support for that board with the usual patch trinity: vendor prefix,
board name binding, board .dts file.

Please have a look!

Cheers,
Andre

Andre Przywara (3):
  dt-bindings: vendor-prefixes: Add Liontron name
  dt-bindings: arm: sunxi: Add Liontron H-A133L board name
  arm64: dts: allwinner: a100: add Liontron H-A133L board support

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../sun50i-a133-liontron-h-a133l.dts          | 214 ++++++++++++++++++
 4 files changed, 222 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts

-- 
2.46.3


