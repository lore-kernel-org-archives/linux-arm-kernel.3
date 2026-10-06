Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29473CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KS5H4193KPqxiaCispUvsgTKoX8n3WQynuhfM5yuyIY=; b=fJCo1Z8JVWP+DEU6vbdFBo9e9w
	dfgwS5j5LriFM3Lt3QN/+ixAr4Qgf/BWM6wkHCPxDL2QRQybObtGpONd8I92ihOUBEZw9FqBkQvgw
	Ts/gExnzp0v8NFHKHRkCVKrqx0bBhvj3iU1qBALebE8xl2JNik1ERfSIaXAkMg1BspSalwg1zvxF1
	oaS9TrZYrIZ62+3RmRPUaykZXeoEzp6BPzQehI3UR3UFMqxhohvuKXy7Q+KzfaVPg3Enok45w+YOZ
	RfIv26EZiwlXuW3Drd14EJZfG2DXL3bZZipAYC7zQ9AaNIp9oDxVF3Xwta15uQob2YqcJdbzaHc4V
	lHnpgFsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2Ba-00000000Swr-3ijK;
	Tue, 06 Oct 2026 10:14:14 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2BY-00000000Sur-0Yyi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 10:14:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=KS5H4193KPqxiaCispUvsgTKoX8n3WQynuhfM5yuyIY=; b=Zy0LPWj3mtgWSErT0qqoXqVVfT
	l5XrwcM4gaGoeW9YCHOY1cu8kftZrAu4dhS8YZIO3b1AY/qXHPUbiRbv4FlASRydv4e6+WQ1SdSnL
	Gwu6ou3+djiGOYlr6Oa+AYl8xlBcf7naK/4cyjKXdK+wvNh09QvrdN6yxtab1cNdjbveruy+YaPLu
	npr207A4ibK7lJWjGxw716g2uys2xFNhk3K5KjURKxPK0C84ziCJP2nwwnmIjUGX55cEPPrOaFCzD
	n4VV7u7GzS+n5VoI9oo/crDRiwyhoG9bxpMnM6UWPidm2SHAyNUuwO+cvMGLC8TYg3XSMk+jPRBkP
	xCFq5ABA==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xE2BP-000EyV-2o;
	Tue, 06 Oct 2026 12:14:04 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xE2Ar-000Bni-2a;
	Tue, 06 Oct 2026 12:14:03 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] arm64: dts: imx91-tqma9131-mba91xxca: remove pullup from CAN pins
Date: Tue,  6 Oct 2026 12:13:45 +0200
Message-ID: <20261006101358.2189639-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28145/Tue Oct  6 08:26:12 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_031412_287321_6873419C 
X-CRM114-Status: UNSURE (   9.65  )
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

Board has external PU, so internal PU are not needed.

Fixes: e71db39f0c7c ("arm64: dts: freescale: add initial device tree for TQMa91xx/MBa91xxCA")

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts b/arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts
index 60d11a4573e3f..db1940ab5cee8 100644
--- a/arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts
@@ -618,10 +618,10 @@ pinctrl_fec_phy: fecphygrp {
 	};
 
 	pinctrl_flexcan1: flexcan1grp {
-		fsl,pins = /* HYS | PU | FSEL_0 | DSE no drive */
-			   <MX91_PAD_PDM_BIT_STREAM0__CAN1_RX		0x1200>,
-			   /* PU | FSEL_3 | DSE X4 */
-			   <MX91_PAD_PDM_CLK__CAN1_TX			0x039e>;
+		fsl,pins = /* HYS | FSEL_0 | DSE no drive */
+			   <MX91_PAD_PDM_BIT_STREAM0__CAN1_RX		0x1000>,
+			   /* FSEL_3 | DSE X4 */
+			   <MX91_PAD_PDM_CLK__CAN1_TX			0x019e>;
 	};
 
 	pinctrl_jtag: jtaggrp {
-- 
2.55.0


