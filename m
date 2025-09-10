Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1907ACA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 12:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i5eZpvVaUY8gD/MkTVeIO0Y5AXr++eDnFaaDoqHs5b8=; b=lFSXCjLvsOeNEGaOM/gWTTVUqI
	slKcfrsD0zSLCjq1Tvn+RGIJp9dAJfx2QB7YeG6Tv43vnSZtpW/SD0/UZQzxeYNAMOWqULd26gvfV
	iT/Mi/K3r1e20m4SrdQTW1OvhtzTkoMDQb/zefPKM/l+/hhz8W7llwv5rPY+OKVjJlglQAQhmXGv1
	bOYyZA3a+AqIeNnei0J9WhESMTkvZGz6Ni72mUoZFCLg0aF3zhPhB8Bp7zy6qO2hRsxrjpxTm3uFr
	Aa/WwAAOyTw+ToRhfVCKm+nz9lBb5Hjpae4uHOR72ti98ztwrJS/8ZjyGO+vgg/FWa1Xn18/c/31p
	1+kSLqqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwK3M-0000000E9Ip-0Vj8;
	Wed, 10 Sep 2025 12:36:00 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwK3J-0000000E9Gm-1etm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 12:35:58 +0000
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1uwK31-0002Rk-Jq; Wed, 10 Sep 2025 14:35:39 +0200
From: Jonas Rebmann <jre@pengutronix.de>
Date: Wed, 10 Sep 2025 14:35:22 +0200
Subject: [PATCH 2/4] ASoC: dt-bindings: asahi-kasei,ak4458: Reference
 common DAI properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-imx8mp-prt8ml-v1-2-fd04aed15670@pengutronix.de>
References: <20250910-imx8mp-prt8ml-v1-0-fd04aed15670@pengutronix.de>
In-Reply-To: <20250910-imx8mp-prt8ml-v1-0-fd04aed15670@pengutronix.de>
To: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.15-dev-7abec
X-Developer-Signature: v=1; a=openpgp-sha256; l=926; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=cRnw/rMFKF5mNaHDp3VQz3lG8dTPu1HRaGTl0p0YzSc=;
 b=owGbwMvMwCV2ZcYT3onnbjcwnlZLYsg4WDDzwZwXTCt9pM9wuIm3Mq1R0Xhkxr73R+7NZ1/kd
 VcFpN6U7ShlYRDjYpAVU2SJVZNTEDL2v25WaRcLM4eVCWQIAxenAExE5jMjw5yD+ofcGv/Jvlnw
 8/w5Ta7Hhp+a1I7O6soz+uRz44l37HOGv5LqL1/57c36PjlH8fM6oY1VW+eu/NxZn/xhWfC8CEW
 9aEYA
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_053557_432607_C5EFAC57 
X-CRM114-Status: UNSURE (   9.62  )
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

Reference the dai-common.yaml schema to allow '#sound-dai-cells' and
"sound-name-prefix' to be used.

Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
 Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
index 4477f84b7acc..1fdbeecc5eff 100644
--- a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
+++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
@@ -15,6 +15,9 @@ properties:
       - asahi-kasei,ak4458
       - asahi-kasei,ak4497
 
+  "#sound-dai-cells":
+    const: 0
+
   reg:
     maxItems: 1
 
@@ -46,6 +49,7 @@ required:
   - reg
 
 allOf:
+  - $ref: dai-common.yaml#
   - if:
       properties:
         compatible:

-- 
2.51.0.178.g2462961280


