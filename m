Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2F9CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 10:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tDz0f2R3tGpvLkGflsBmqNS32m6oAsYJKUrh43zMpXM=; b=on5vXN3WOg4w1JA2fhOobmCpvm
	yZYFaRUIwSOgfl9hjJdvi6k2tjbe5IA+sWJm5qDv2rG4dMt9aWJ8mTNpZ90dKY7pkv0JFBmCR+N3Y
	Y0nm8kVAY69m7WWenKL5nN/k5Ok/X/F5m7I29WSq24swdJVYIN85Y69brG8tMrhSLfmI4hbAyKFSX
	QNfAKTKvHysbl9aOhrfi35f7pdp6iv+KacGqni95oy51Z2wFxG321ooChDy/n1P5y3hN5Vm3+7M/F
	1VDt1+c65/3+rPZcEF7KVS0db29WlMWt+WnFykmcUlkr3ATYvb8VOa4QKXfFcs44Pr7VMaG2tdJmo
	bunw1YvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9Ak-0000000GYN4-1Wzc;
	Tue, 21 Oct 2025 10:00:54 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9Ag-0000000GYLb-1LZj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 10:00:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=tDz0f2R3tGpvLkGflsBmqNS32m6oAsYJKUrh43zMpXM=; b=EBgSp+SD0ksBsqcrSFEiokgrfx
	vfwMneoBjTw9qjnWWvhIoWxzKb6a54R56936EKe3v3m4Br2eOMS/hGX2J5vUDoTx0zWhYOabokSKI
	Yo8PWvchfkAjz+HxoyDLnVv8CvFEuDNUKPcrVfGcMJmgGSLvWQ5xBw6t8Ys7akcbgQD4jL1q8bG+o
	O1d8/lUfFpALOK3jQsmlGyoaHVE6kp0VULqPqzo9n4yj6l48xlMYbzEJ+SY7qVS23R+ZR356wdGl8
	QF84xPwMlZvC9mIiMu+vfZMUr/w89dQ6G1+HfwoKyjThs14TC8a3wRODN8wwQnqRclZJgWiK8AhtX
	pFCPQEqA==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:33124 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1vB8nj-00000004LXL-3X5C;
	Tue, 21 Oct 2025 11:37:05 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	upstream@lists.phytec.de
Subject: [PATCH 1/2] dt-bindings: arm: fsl: Add PHYTEC phyBOARD-Segin-i.MX91 board
Date: Tue, 21 Oct 2025 11:37:03 +0200
Message-Id: <20251021093704.690410-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_030050_517093_59082DEA 
X-CRM114-Status: UNSURE (   4.82  )
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

Add device-tree bindings for PHYTEC phyBOARD-Segin-i.MX91 board based on
the PHYTEC phyCORE-i.MX91 SoM (System-on-Module).

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 00cdf490b062..73987ba1d16a 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1492,6 +1492,13 @@ properties:
           - const: tq,imx93-tqma9352        # TQ-Systems GmbH i.MX93 TQMa93xxCA/LA SOM
           - const: fsl,imx93
 
+      - description: PHYTEC phyCORE-i.MX91 SoM based boards
+        items:
+          - enum:
+              - phytec,imx91-phyboard-segin # phyBOARD-Segin with i.MX91
+          - const: phytec,imx91-phycore-som # phyCORE-i.MX91 SoM
+          - const: fsl,imx91
+
       - description: PHYTEC phyCORE-i.MX93 SoM based boards
         items:
           - enum:
-- 
2.34.1


