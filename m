Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317E4EA3C20
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 10:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=86el+SLw/QgiWOEupwoMilPrwU17U7TooJ52U2GyoRY=; b=VTgDokFPYlWh3h09NGP16uv3kG
	4Qls31ojgCRYZwe9U3HD6SlPlCfkzk3a0OMwZqvH++iBUjVXxFXi+H8+fhKLYgtyV+DFvNK7H+tsb
	R55rtGxeMDgBQXiNU61I6JgZeSOvOkYqkB1zcc3XKAesAnaLuypEBJOqMC2PXMlTrFHVQTnBDuPuP
	VMXSIvmbntTknklLBNQCnRpaP9XAMXdPPHKCKnl7ZL7auoCIz6ZZwbSxFF61tmkmUcDIrKnPE4+8i
	RHVjWMkmxa7FQm3t1EuIvTAaK3O1W//Ysr0nVVlZ6LMFQi16i4AtsO62aRBb8BtKRCo6W26S+Ioha
	OqDK28dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAmSm-0000000A8lN-1jPk;
	Thu, 09 Apr 2026 10:18:16 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAmSj-0000000A8kE-3xLA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 10:18:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=86el+SLw/QgiWOEupwoMilPrwU17U7TooJ52U2GyoRY=; b=lmD3ldwBZT/G/8ilO/sURQ2035
	qDVZLKQPRAsz4WGKddDz1weC2WTp0WpEE4ZThCvq56e3V4siH00SxmRcEUbswTv4QPWorTTKmP/v5
	edyFfQK515zZicg/dRcTWpTdSz9/IAK4dPJr1p5h7R5vwQcTKy8bOpVTanI2JXVBBmaKU0j2x2kZT
	OYbLmbNk6273Nt9ab2F6kQMb0prGHtb60uGCPL8FFk4GhF0IaljmJlTUJYbbVBNMLgbIns5Urc1GG
	837beWnyXa+kQJdo8SWvEESQdZBc9/xbDaMdrTngo5ZeUJXAuXuQ+hvUtTd/a5GjZYXJsA3+xuH+G
	J09upCAQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wAmSZ-000CCL-2m;
	Thu, 09 Apr 2026 12:18:03 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wAmS2-000NIs-0Y;
	Thu, 09 Apr 2026 12:18:03 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/1] ARM: dts: imx6ul: add #io-channel-cells to ADC
Date: Thu,  9 Apr 2026 12:17:57 +0200
Message-ID: <20260409101759.4159324-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27966/Thu Apr  9 08:24:43 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_031814_099330_4DDB0282 
X-CRM114-Status: UNSURE (   9.25  )
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

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

This commit adds io-channel-cells property to the ADC node. This
property is required in order for an IIO consumer driver to work.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ul.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi
index 24541fdf49ceb..d2bfa08b5e767 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi
@@ -951,6 +951,7 @@ adc1: adc@2198000 {
 				interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6UL_CLK_ADC1>;
 				clock-names = "adc";
+				#io-channel-cells = <1>;
 				fsl,adck-max-frequency = <30000000>, <40000000>,
 							 <20000000>;
 				status = "disabled";
-- 
2.43.0


