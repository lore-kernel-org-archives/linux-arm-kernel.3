Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D293CEDB7EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 10:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QAAMci2a2IFoW4AUViSFOjWysthteAkqh5wfGRrvW6A=; b=mzjbCWF34TQlns4naRFZlKuaH3
	YlE5DzEqPCWyMb8w8YVZgZcAvSFTvMgzwxUg0issVztdieLdUDqk0PmhROq4HPlvsNKsNOE5x8zcB
	Bde2b1mTC21DC+dnJ3AqgbAYWRtSZ749d0DpvgIzjLvDRYhYPGRS4UagfnHZ1ADk/onUHBI1HBIX/
	GfnOCUCwrv4gpCcZlH5bcKhkBCeRyEvUNdMqdjudIdpCQ3io++rL8o8LtnZM8pcJBN4lxNiLucjqx
	dvByB+M/qhffnYEvTzOS/xE5TSHZkhybHPw1GtGY7e+DJZjUvxyGavVmnWEQ/qPCYu/B9qtcZOQA+
	7wsVM6Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3zG-00000006KkS-3VY2;
	Tue, 07 Apr 2026 10:48:50 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3zB-00000006Ki9-3QR5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 10:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=QAAMci2a2IFoW4AUViSFOjWysthteAkqh5wfGRrvW6A=; b=GBXC6V0+dFiTvQA6IXOTnWtp+Z
	HMDBgGe1y5PJ5yZivjW0OtO/7KJE9esMQ3jgtDAS7CUj86Fi+sPYX++NhGpvRTxcKhIVmYpLvs3Yu
	66Yh5yRbo6Tm4QhZkRxdZYvHoLH+ncScWPC+Mqp8R2qwpl9uLMHH2lyKj3jdYw8VA/TMSvpSW1iih
	n1KxTRS9eXtaGVNqf0BdI7baneLs1qlBqWSu2t4P8vc325bMOmWFUwRxSWUkm04Xm67lnAfyfHvPb
	2tGbXaCDr5XmOmlzepdDWHXbnzDjUSPc/yjksF0f/fLj9vYJAmxq6KDuNabzatbMRj9W4cPxmO31e
	50jitKVA==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wA3z1-0006oo-2R;
	Tue, 07 Apr 2026 12:48:35 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wA3z0-0007uJ-2M;
	Tue, 07 Apr 2026 12:48:35 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH net-next v4 1/2] dt-bindings: net: ti: k3-am654-cpsw-nuss: Add ti,j722s-cpsw-nuss compatible
Date: Tue,  7 Apr 2026 12:48:01 +0200
Message-ID: <191e9f7e3a6c14eabe891a98c5fb646766479c0a.1775558273.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27964/Tue Apr  7 08:24:40 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_034845_981814_0C800B64 
X-CRM114-Status: UNSURE (   8.05  )
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

The J722S CPSW3G is mostly identical to the AM64's, but additionally
supports SGMII. The AM64 compatible ti,am642-cpsw-nuss is used as a
fallback.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---

v2: keep ti,am642-cpsw-nuss as a fallback
v3: resubmission for net-next, no changes
v4: remove redundant items: level

 .../bindings/net/ti,k3-am654-cpsw-nuss.yaml   | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml b/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
index a959c1d7e643a..c409c6310ed40 100644
--- a/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
+++ b/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
@@ -53,13 +53,18 @@ properties:
   "#size-cells": true
 
   compatible:
-    enum:
-      - ti,am642-cpsw-nuss
-      - ti,am654-cpsw-nuss
-      - ti,j7200-cpswxg-nuss
-      - ti,j721e-cpsw-nuss
-      - ti,j721e-cpswxg-nuss
-      - ti,j784s4-cpswxg-nuss
+    oneOf:
+      - enum:
+          - ti,am642-cpsw-nuss
+          - ti,am654-cpsw-nuss
+          - ti,j7200-cpswxg-nuss
+          - ti,j721e-cpsw-nuss
+          - ti,j721e-cpswxg-nuss
+          - ti,j784s4-cpswxg-nuss
+      - items:
+          - enum:
+              - ti,j722s-cpsw-nuss
+          - const: ti,am642-cpsw-nuss
 
   reg:
     maxItems: 1
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


