Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C867ACCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 17:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fdNDyOX4NAmg5jJPp/BSNYVyFEaiphE74uzwC/EVG8Y=; b=cOp5pAaXOwFlCdd6gkaBwm09nw
	FRUVk5iIxAZ5+H2vpLwtmeE6Z58TjB3/hOcUfuyETI9l+lLz3Tn175ARLZMIwdCqL69HKpYSCgsr4
	CIHW+mP5c5ZkYCeDupA+1XXVaxxHjJYuonkIUJTDG6N1yF+P2bYKHGu6q2URWqBNTfDGsHr36oY1w
	EnjtmxKQcCeUmUFIH9Kh+kmlZzfwMwITvV7sQ5nOaLMp8uEbOb6h6zoDBex19RSAX/L7PBcZ/vNWr
	T060yYgGdwOkXaJ7dik6iR/iMm3/R3xMHm2VWJAWVt86ilVZ0CvonxUYyxusAQUkp8uhe3H7qUXSI
	XVbQb7lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsaS-00000007Z1W-2KiM;
	Tue, 11 Nov 2025 17:55:24 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsaQ-00000007Z0p-3bai
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 17:55:23 +0000
Received: from localhost.localdomain (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 39AFA1FBD9;
	Tue, 11 Nov 2025 18:55:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1762883720;
	bh=fdNDyOX4NAmg5jJPp/BSNYVyFEaiphE74uzwC/EVG8Y=; h=From:To:Subject;
	b=WTn94SvtsCWamAxJn76sKb5PVF8wUtAu3vxP8QvKN2VHmuVyJelm7XaBPifHaxlaN
	 MaR5OND/QLf38IiyZgM5Q72xEq6gwfw9oCX/9AwgrF3k2Tp4ceWd5UwkTxx9iMXgRC
	 b9sEMhYZeF0C7vCwv7v0T9qfhA3oRu6+h9DTEnpB9yJdbLu3Np5nAW6kJvt9Fikv53
	 pEtBmRHn7MQ78Bx5G0eSr+GQZw0083GzaJTzU+Bg/AQ8LqZr2k4URjPV3ScE2ERO4I
	 ax04uklnhcPRkG0zMYLchzscreSYAebssCfcvervNjIWYC4K3Kmq0ZB0fls6ZoStfP
	 CzxLfmxDwdirg==
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
Subject: [PATCH v2 0/3] arm64: dts: ti: Add Aquila AM69 Support
Date: Tue, 11 Nov 2025 18:54:56 +0100
Message-ID: <20251111175502.8847-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_095523_058314_BD98132E 
X-CRM114-Status: GOOD (  10.35  )
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


