Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164B9CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 21:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8LeTSpTOh/a4F8BYpw89pOWNtfrWtr2Ni4MO60cCAus=; b=2SQVG/7+Z8YdTxy6CCNTs/Eczt
	rqf0f1ZySnixf5DL+TW7RUUXTxqpLX5PJug21ckGazVUSc+Mq/CFydm1rzfWJT/9Xs6ILwj9pcEai
	IC/CffXpBcNBlZpcFTHhifRcUQuioHqQ06/V4O4NsBXLEtkrNJVxydLkM7jCexUG0cQKRIWg7Gfmg
	ovrM/opi5vBQ+6uu6z/FZx3AhgFEk2aUIE6ybr3I6eZXAzbOoBYDQWFgCxJz0ukehtKuqjqDMidMD
	yixuvyM8AHF7M/9yQ8tHGCfqgJ8Us1KLV8XDSRiAtJicoG3VDzGC4kNfeBA67Prj5mMeYzqk6Trea
	zjWvKjjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC29k-00000007Hq7-1BPt;
	Wed, 30 Sep 2026 21:48:04 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC29i-00000007Hos-17HX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 21:48:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9F7E107096;
	Wed, 30 Sep 2026 23:47:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1790804875; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=8LeTSpTOh/a4F8BYpw89pOWNtfrWtr2Ni4MO60cCAus=;
	b=XfwUwhQTD8JxK32TKshp3VbyfErUsjYD86K91Yi4CnsuiVXb4lxV1Ea/+MGyfIb87PQ/oQ
	JOHQNv7SKsNeJyz5i+mXe0QUOaF+rBEAfyCvdNpCy07wTi1pQLz680iblvIwkO8ubYJ6PF
	6IsJlbWSdaObZ5il8FeipuKHRz42UBe5yvN97UGP/jxjMQ5lRlhFhVCLMwvBzwVI1RaPAM
	mfrrMKp+YzbeGBmtCc3CITRSxB2aq2p+q/7hdjHG/C/pks+numQsQNLM119iSDgk6Bx9iQ
	FXkrCoCK81DVOxUhF3Kj153UEOmw33OkOuX/WBV5Mz4UBE5vlromSfXG+W87fg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
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
Subject: [PATCH v6 1/3] dt-bindings: phy: ti,tcan104x-can: Document Microchip ATA6563
Date: Wed, 30 Sep 2026 23:46:38 +0200
Message-ID: <20260930214729.809649-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_144802_458223_DC21F74D 
X-CRM114-Status: UNSURE (   8.15  )
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
V3: No change
V4: No change
V5: Add RB from Krzysztof
V6: No change
---
 Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
index 0cf5fa21106b6..e97b1bc0a2e45 100644
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


