Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCE5105F79B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 11:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tCc/sKraMt4Y6QmqGzkkXdepq6AtQpu2jfZGQHdbWMk=; b=BbE80RyiKkdorZBrnzVkXVTdFg
	XlEIIB/38yRIgGDrHyAT0tkZVkY6cBQySZTOTmypvRxB1H2GDu7sWxYLLnda29PvoP8bWVXFiWp8v
	MdQuzfdYZordADCevw6RRZHiMFIXm83J8Y4wPoTjSrjLXXQnGZRYPFKHGFBFQAGLpouph2th2yvbt
	tqVjpuCjcqRX4DJFzGx/m7dd+FtcaX6lRGnsYOo5OP/SgyDDOnl2rFQ+IzYEjT9vrCbtSi3qP1wtC
	fQPy1CmiScQZkFChK4OV3t1KERyg4CcCkZpmFz3oKHCtTYnTcjd03ncvDKxohRZT6sbJRAO0CBJVr
	FMo8p4Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10ml-000000002K4-0t2b;
	Fri, 13 Mar 2026 11:34:31 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10mi-000000002IK-3RUR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 11:34:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=tCc/sKraMt4Y6QmqGzkkXdepq6AtQpu2jfZGQHdbWMk=; b=C9NPpEr0kVu8bvDm+gVWUfa53y
	R66J1TWInmlmkLjZvFDRLS2rd0ZOPItjtNTWfPZ6Y+kR3q2ls7+BV/wCKR2msMyUdwFtdBiA3sLq7
	vkmFvIq17mxac9RsssAVlNFruHx+x48cZemuQGXK0fpcoJnwgb83/aRlijLxeQ2FZwVj9+zu9Tnhq
	i30+23IRxQJQNS+z4WNcHTl3HzawsJUbpH5R9FRMgIH5CJuugaKdRjSQyulcvGumkDvrWe7iYMwIT
	JGliMk9qfo+yWaq5jZqIxdTF9oWchjSegie1UGF5Xrkvi/ZWKj1+afiKmfUvkiA8U3jG4a7Gyofru
	yrxLIwVQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w10mf-00070J-3C;
	Fri, 13 Mar 2026 12:34:26 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w10mf-0004VU-1Y;
	Fri, 13 Mar 2026 12:34:25 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 1/3] arm64: dts: mba8mx: Add DSI->LVDS bridge IRQ
Date: Fri, 13 Mar 2026 12:34:18 +0100
Message-ID: <20260313113422.1722787-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27939/Fri Mar 13 07:24:42 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_043428_860232_96A021BC 
X-CRM114-Status: UNSURE (   9.93  )
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

Now that the bindings supports IRQ, add the IRQ line. Add a GPIO label
as well.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/mba8mx.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/mba8mx.dtsi b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
index 10d5c211b1c9b..c24ae953cbc25 100644
--- a/arch/arm64/boot/dts/freescale/mba8mx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
@@ -209,7 +209,7 @@ expander0: gpio@23 {
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		gpio-line-names = "", "", "", "",
-				  "", "", "LVDS_BRIDGE_EN", "",
+				  "", "", "LVDS_BRIDGE_EN", "LVDS_BRIDGE_IRQ",
 				  "", "", "", "",
 				  "", "", "", "";
 
@@ -298,6 +298,8 @@ dsi_lvds_bridge: bridge@2d {
 		reg = <0x2d>;
 		enable-gpios = <&gpio_delays 0 130000 0>;
 		vcc-supply = <&reg_sn65dsi83_1v8>;
+		interrupt-parent = <&expander0>;
+		interrupts = <7 IRQ_TYPE_EDGE_RISING>;
 		status = "disabled";
 
 		ports {
-- 
2.43.0


