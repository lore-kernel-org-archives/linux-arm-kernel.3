Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1827CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 14:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fdNDyOX4NAmg5jJPp/BSNYVyFEaiphE74uzwC/EVG8Y=; b=J/i09iwNR9BpqTJpYNus2ic2l+
	B1WvpqPBz3BVUs91hK0hArzHQI270s/Nq8PHmXrllSpS3+HAr43dA9tYTlCir2T1OAdQgoPM1dxh8
	72lzrA62oRRZ4SMTmZdrrzP84xaopQoA5HR9cGB8iHk7mmcjKn8gSy1tDpt1bWW/46tHFsa3j1F+N
	Z+cxkz0QdiwAKjbrwgtfGx2pWWz72HhlNbedYHHaDirKaYtV+ooD4CIRnfVvWnaJ4KINRVt8QmDiT
	mf0331Ok4PRK4t93GMixyQ1FbTQsvt77Oj7Xn8yZX+WA+UB+pLKnypxoKcVQdojINA8303vcI7gGI
	brU8+FAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGILu-0000000C0Cc-1iGI;
	Tue, 04 Nov 2025 14:49:42 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGILq-0000000C0Bu-2yw5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 14:49:41 +0000
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 7F3761F8C1;
	Tue,  4 Nov 2025 15:49:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1762267771;
	bh=fdNDyOX4NAmg5jJPp/BSNYVyFEaiphE74uzwC/EVG8Y=; h=From:To:Subject;
	b=d5Opm/36Lqni0IV5t3VtljEiTBIc1zBAT/56ZepB/aCPiJtkzot2RtEU4RKpAeFKC
	 XddB/mkvKvpgFrWLmumzpOhgRiZr/2Ow2/R8KfX7su4Et6N+BUxgv/iOf91NOh4Rtm
	 THst4LYgwlr/GUn3oiocudX1KGRVSgtMuT6utnSLH2w2X0TviEEjzqjIyN0jCs+O2P
	 bgsi8vzl2W7392y31J8cSXNaYezvZo1J4IMJoEPhZ/B402pTcbEY8EO/Knbja/qpdE
	 3iYBa8HHxpt3K3rXcw5KKxTL3nbhBtH/6vLVD/c6M9Xf4rGgnRupFgrCTwVTqBrUni
	 oNvgLAdr8iKLg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] arm64: dts: ti: Add Aquila AM69 Support
Date: Tue,  4 Nov 2025 15:49:10 +0100
Message-ID: <20251104144915.60445-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_064939_794052_925BB9F1 
X-CRM114-Status: GOOD (  10.54  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

This patch series adds support for the Toradex Aquila AM69 SoM and its
currently available carrier boards: the Aquila Development Board and Clover.

The Aquila AM69 SoM is based on the TI AM69 SoC from the Jacinto 7 family and
is designed for high-end embedded computing. The SoM features up to 32GB of
LPDDR4 RAM and 256GB eMMC storage, extensive multimedia support (3x Quad CSI,
2x Quad DSI, DisplayPort, 5x Audio I2S/TDM), six Ethernet interfaces (1x 1G, 4x
2.5G SGMII, 1x 10G), USB 3.2 Host and DRD support and a Wi-Fi 7/BT 5.3 module.
Additionally, it includes an RX8130 RTC, I2C EEPROM and Temperature Sensor and
an optional TPM 2.0.

Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/ti-am69
Link: https://www.toradex.com/products/carrier-board/aquila-development-board-kit
Link: https://www.toradex.com/products/carrier-board/clover

João Paulo Gonçalves (2):
  dt-bindings: arm: ti: add Toradex Aquila AM69
  arm64: dts: ti: am69-aquila: Add Clover

Parth Pancholi (1):
  arm64: dts: ti: Add Aquila AM69 Support

 .../devicetree/bindings/arm/ti/k3.yaml        |    8 +
 arch/arm64/boot/dts/ti/Makefile               |    2 +
 .../boot/dts/ti/k3-am69-aquila-clover.dts     |  451 ++++
 arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts |  576 ++++++
 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi    | 1840 +++++++++++++++++
 5 files changed, 2877 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi

-- 
2.47.3


