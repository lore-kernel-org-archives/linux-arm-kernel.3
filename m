Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2ADAC43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 09:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ZshjWd0kJcUSqebGRSVm1D+j5Ff/mTaOm+FBxEe4Zc=; b=ZZJiKKvRi2nVjwZG+UPX68tMWM
	61zB0V4jd6Wi/L9mQVVYTQR7fMUxMBVHw/MjbUoNNpNZkFqiYY9HvYsmxkdKhDkEdlTLeLP40Ilyl
	SaRDHTbzDHwsViqx43bKIfHWmYjGP+i9rMsKIQ0OR5bOnmAz4FmWhlQ3DGJyAYRJaWh1MScdGLFsO
	aTxGkqQ6c9ORHQC2OwiSufdZLxH4QXWoQ5P5dI3LIGTjofNNerqICyKFzf3Pn0nVQc5RPekIiSb6w
	FMsc5EBYFW62Fzfj/xwymRlHqWT1OWqBpQaWYOQ9MqFIivXc4Jht9zIdKgV5RhKDTKFcQKSYO+lq9
	DFNOzR2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1sv-0000000EbHK-4BIU;
	Tue, 07 Jul 2026 09:14:33 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1st-0000000EbFw-0HVp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 09:14:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=1ZshjWd0kJcUSqebGRSVm1D+j5Ff/mTaOm+FBxEe4Zc=; b=XWWKKBJRidLO+EW2C/2X92Jg45
	MVLI7h2eM+5uTQbkvICSGkdjnbzbT39TD5pZblYFCGnv/CGVRcQBmpORMxGnnZ4yHueLwKXCv7ZFD
	CFzVL4R264jZ55v5ZLqfyTMKyLyqIM3B1Lcpde3FuW7Oz3sgltfFxHTDugJJoOTBnmH19pf+wOivR
	WYzbYNRDs8enlQLGPg8BIWpsbyEN9GXXUF+CvZnXKffQsQr7mbtgUfmXw2nTqkaXOVkvjO91p5CQI
	7cVFcZJlUfAWX2xQBZocKhqDm/G7MBAbkIjZmHCDMHfLsYjIaEFqDYrgqcGoTQPkd6szVB+pZOYXP
	xCaawn8A==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh1sr-000Jpw-0R;
	Tue, 07 Jul 2026 11:14:29 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh1sq-000LtS-0o;
	Tue, 07 Jul 2026 11:14:28 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/2] dt-bindings: arm: add MBa93xxCA as mainboard for TQMa91xxCA and TQMa91xxLA SOM
Date: Tue,  7 Jul 2026 11:14:19 +0200
Message-ID: <20260707091424.1702245-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707091424.1702245-1-alexander.stein@ew.tq-group.com>
References: <20260707091424.1702245-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28053/Tue Jul  7 08:24:37 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_021431_104298_09E4796D 
X-CRM114-Status: GOOD (  10.41  )
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

TQMa93xxLA and TQMa93xxCA are two series of feature compatible SOM
using NXP i.MX91 SOC in 11x11 mm package.

MBa93xxCA is a starterkit base board usable for TQMa91xxCA and TQMa91xxLA
soldered on an adapter board to demonstrate use cases without display but
more interfaces.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 6237fb2ae50e6..aa5ef0299a8b3 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1603,9 +1603,14 @@ properties:
           soldered on an adapter board or for the connector variant
           MBa91xxLA mainboard is a single board computer using the solderable
           SOM variant
+          MBa91xxCA mainboard can be used as starterkit for the SOM soldered
+          on an adapter board or for the connector variant to demonstrate parallel
+          display and majority of interfaces while MBa93xxCA starterkit mainboard
+          is focused on communication interfaces without display support.
         items:
           - enum:
               - tq,imx91-tqma9131-mba91xxca # TQ-Systems GmbH i.MX91 TQMa91xxCA/LA SOM on MBa91xxCA
+              - tq,imx91-tqma9131-mba93xxca # TQ-Systems GmbH i.MX91 TQMa91xxCA/LA SOM on MBa93xxCA
           - const: tq,imx91-tqma9131        # TQ-Systems GmbH i.MX91 TQMa91xxCA/LA SOM
           - const: fsl,imx91
 
-- 
2.54.0


