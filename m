Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3C5C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 01:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l11dzaGJa/3l8/IgdpLrw+5Ip4TCD8Y34A7puwW47Xw=; b=2eexWs3nmgAXEbr7OtxOmD8tyM
	dUM6ERGIK9VHQf26HWaAk5um34AbbcEMJVxbMVGm1eEG/2AM2bbZt+BwLF6lvexzVEND95ROmE0/Z
	PMvaHQx3PrbJnNcrQjHjYSWto4ecnkc1n4w3kSzGfHF9fyh8NjHfG4oZHYwyU2YXJTqoMWFEe5mgW
	EZCRJ0HuxPZBc4NdNTOaXPus2Gmat6eZu/4fe6I8WvklUUJarpNtH3Xcvz/CBcaawLi/XOn7S9DR0
	fAnU5cqwcUg0aIxR1JsZ6Ktym4TF1TQPxdliCyn4Z6oPRkg5fphHW+h1kK6daS99Y151vb6aJM4ME
	rzD/SnVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x719q-0000000AQTc-1Qub;
	Thu, 17 Sep 2026 01:43:26 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x719n-0000000AQSd-1n4A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 01:43:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA187101B3A;
	Thu, 17 Sep 2026 03:43:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1789609400; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=l11dzaGJa/3l8/IgdpLrw+5Ip4TCD8Y34A7puwW47Xw=;
	b=h1Qe/9P7o7a9jSJFv8iJR6QD/Ow31YTgUjo3/AbQn/SVbojOM74PZpyklM/E91KCypmSiT
	nE2+GKZUgKJDzSuFfu5NxhayqdkuaLbYF1BQp8lZ1EjJDlyewEwPww8iaccus+D+mY6eoX
	CE2kEIOTRWQJuuhodbYiKGdSE/Kq1cDv6rs2NNea6EShInKdRCXM4Wd1P/fXYbxoJ13ZCK
	HdlWeQzgNUucmapjr/uN3dBx0NP97HzScmco5Mz2bT9oqYLHX6F866RLLecvV4osnsMw38
	DJks6/qeuIiDeBRXd1/D4v7y/WX4VevlXtaBg5dBSyAMieEfI60p8h47lmcpAw==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: phy: ti,tcan104x-can: Document Microchip ATA6563
Date: Thu, 17 Sep 2026 03:43:02 +0200
Message-ID: <20260917014314.472079-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_184323_612026_F8E0E599 
X-CRM114-Status: UNSURE (   7.58  )
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

Microchip ATA6563 is High-Speed CAN Transceiver with Standby Mode.
It is pin-compatible with TI TCAN1042 and has a compatible programming
model, therefore use ti,tcan1042 as fallback compatible.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Aswath Govindraju <a-govindraju@ti.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-can@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
V2: No change
---
 Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
index 9f5c37ca6496a..75c276548e122 100644
--- a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
+++ b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
@@ -18,6 +18,7 @@ properties:
       - items:
           - enum:
               - microchip,ata6561
+              - microchip,ata6563
               - ti,tcan1051
           - const: ti,tcan1042
       - items:
-- 
2.53.0


