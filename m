Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03B61090221
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 12:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Q8qsvt1bZoH/VIKZxsYOsSv+bdgpuhRY775z6O30ec=; b=V13qba5yjDstKuF5gkYVhPZGRT
	PKjWjfaB2+bFXwNSbhf3qJkZE0zl6mGPoK4BBOgDmduNSmKUCXxpFFJLnwOF+4ed7OmV0IHFQFmFU
	FEYdse+FsZi7a7SQtcVcrLIMTcWd3qVpvikb35l82EyHzW9kRaCdifEDH2TY1GEFMoRt2RvM2F+pn
	+M0HShz5UpHgXgTodPAZRNZqh8svKWcc0eiIqjiYay9jKm1/xpfCiRxByVoG/SHIFpxtzvx3cKPoF
	xTA4+W7lbt/iD/gafvT1IRWmJHf1tERWpUgCSGooh+is2SwJds/39WgHLn9LPYb5Cimyri2QWdsh2
	GX31JfQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3CpW-0000000Acyh-3Ymq;
	Thu, 19 Mar 2026 12:50:26 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3CpT-0000000Acwh-1hxr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 12:50:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=7Q8qsvt1bZoH/VIKZxsYOsSv+bdgpuhRY775z6O30ec=; b=Y0b1u9mT9N6f5eWbpiyteHqhQF
	sMqJunQZB7NIb/23Kwuyb+/apFhetS2eLHflJtOhJ773lcFHK46tnoF57cIajbhZLg5LkoplQ5wTK
	RqN7394namhnjRE1c1xWXTBqqrou1Oz4+Y3DnhArSMOyVRsREu0O8BhXE7FNVULb+32wXv0EOljOR
	lIhhTGtr/6O3YGatC7WAUMmBh3r10e+58/t/lqJRMWgoZ/s/2howZ6kc2SxyPd5dyWlZkZU7y2jf2
	oCrUs0395fdIrp+hov+SRyC8cVBHgTGenBJuGot3zRVCk0ZTbnxNrM4pRM9XjshXI0QYxHF+arQ7W
	udEMlEaA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w3CpQ-0009xA-21;
	Thu, 19 Mar 2026 13:50:20 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w3CpP-000MiA-2c;
	Thu, 19 Mar 2026 13:50:20 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: add MBa93xxLA-MINI
Date: Thu, 19 Mar 2026 13:50:08 +0100
Message-ID: <20260319125013.2421621-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319125013.2421621-1-alexander.stein@ew.tq-group.com>
References: <20260319125013.2421621-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27945/Thu Mar 19 07:24:38 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_055023_444161_0064022A 
X-CRM114-Status: UNSURE (   9.35  )
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

From: Martin Schmiedel <Martin.Schmiedel@tq-group.com>

Adds support for the MBa93xxLA-MINI SBC.
https://www.tq-group.com/en/products/tq-embedded/arm-architecture/mba93xxla-mini/

Signed-off-by: Martin Schmiedel <Martin.Schmiedel@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
---
Changes in v2:
* Collected Daniel's R-b

 Documentation/devicetree/bindings/arm/fsl.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index da2be7114f641..2c86d2381d95a 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1558,11 +1558,14 @@ properties:
           soldered on an adapter board or for the connector variant
           MBa93xxLA mainboard is a single board computer using the solderable
           SOM variant
+          MBa93xxLA-MINI mainboard is a single board computer using the solderable
+          SOM variant
         items:
           - enum:
               - tq,imx93-tqma9352-mba91xxca # TQ-Systems GmbH i.MX93 TQMa93xxCA/LA SOM on MBa91xxCA
               - tq,imx93-tqma9352-mba93xxca # TQ-Systems GmbH i.MX93 TQMa93xxCA/LA SOM on MBa93xxCA
               - tq,imx93-tqma9352-mba93xxla # TQ-Systems GmbH i.MX93 TQMa93xxLA SOM on MBa93xxLA SBC
+              - tq,imx93-tqma9352-mba93xxla-mini # TQ-Systems GmbH i.MX93 TQMa93xxLA SOM on MBa93xxLA-MINI SBC
           - const: tq,imx93-tqma9352        # TQ-Systems GmbH i.MX93 TQMa93xxCA/LA SOM
           - const: fsl,imx93
 
-- 
2.43.0


