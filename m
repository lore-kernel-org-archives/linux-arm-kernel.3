Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF405C98317
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 11:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FohcH64RXz6MAI+SVghSGzJsT6T5yz7lkid7XQE+zO0=; b=Mg9kUJQYlpdv+V6ZfNXQsHWVNo
	3lUs5Lspscl8TZfau1GAj3h676JfAthj9gef9NkwtGmSqHcKK6UZey973UuTbcUhuRFGTWymsxkzK
	3MtCFo92o3hxJltQ6YjeWBu00ZSalDPGyKUHTBDdhsE3NeQb5R0xT93pOnzu83+Dlou1iworG+bTz
	n9Sa/9VbH4qsjFEfHVppALX2edYoRlh6AErClVgNI6pbMr38gtqBqMQGNrZ3vAKTVCtKTlNQw3eiX
	ojDU/V9I2o1GGTC8Gbwfaej7OQWz7M5lD66AeegdFsuQf8d9rtJch9TsosJET2GMVIwfehuefqC3s
	rCcC+yVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hJd-0000000Aogt-3IFy;
	Thu, 24 Sep 2026 11:08:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hJb-0000000AogD-2UkJ;
	Thu, 24 Sep 2026 11:08:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790248112;
	bh=f1NI3qMziuOlznqvIL1ulfZOaRPAxcYcTLJ2j9fbPcQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OcS3be1YIbiACfPsv66ogjTIWZxcX5iz0zBSGf60mdJxMRauXTVG706T5diEoSd/M
	 3nnnFTNMoPi0lkjpjplX98h1tiL+2WsbTzxx5Ukdyy5fKHEbm9iBaCASc82Px2JQVy
	 4fdnIpCFIARKLBDplE03n8y+BWnn9J+PQPPeyxToPsyRWV0mOoaEe9NR1NR9MaXUD/
	 qHAKQU2G+h56IjQ2BRLjOPkYCwI3OtG5w5+07pHUHyndZlKxCPOJRBNuHlKD7I+Fct
	 7AuztpxOdmrIGKQX13CEfW7fcnKEhCtFm8oYGTHpmI31wsGBi7fyKII1GGhQPYEFtr
	 qRRtiaBp59FFg==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1B88A17E0A68;
	Thu, 24 Sep 2026 13:08:32 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v2 2/3] media: dt-bindings: media: nxp, imx8mq-vpu: Remove nxp,imx8mq-vpu
Date: Thu, 24 Sep 2026 13:08:24 +0200
Message-ID: <20260924110825.166238-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924110825.166238-1-benjamin.gaignard@collabora.com>
References: <20260924110825.166238-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_040835_786855_66864EF4 
X-CRM114-Status: GOOD (  10.14  )
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

nxp,imx8mq-vpu has been tagged has deprecated since a while.
After driver clean up it is time to remove it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
changes in v2:
- have a separate patch for documentation
- fix dt-bindings

 .../devicetree/bindings/media/nxp,imx8mq-vpu.yaml      | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
index 19528262810a..69619d2c86fa 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
@@ -14,12 +14,10 @@ description:
 
 properties:
   compatible:
-    oneOf:
-      - const: nxp,imx8mq-vpu
-        deprecated: true
-      - const: nxp,imx8mq-vpu-g1
-      - const: nxp,imx8mq-vpu-g2
-      - const: nxp,imx8mm-vpu-g1
+    enum:
+      - nxp,imx8mq-vpu-g1
+      - nxp,imx8mq-vpu-g2
+      - nxp,imx8mm-vpu-g1
 
   reg:
     maxItems: 1
-- 
2.53.0


