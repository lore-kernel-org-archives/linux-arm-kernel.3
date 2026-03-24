Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263F4F4613D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 12:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HXjqylECdGDFHUiyugySRrfNFcwy5NMDZ6un9XJQF4g=; b=Bs89GQ6HSGR5OT7DHDoc8v3thy
	9Qaf6VxvqZvH25cjPaUqSjIdtv9ndyQ8oIoQ83tN3ZqbdhVVBj0XCeXV/avalCLfn0II9yV37PliK
	Qtw180vGDD48qQAEQbp6bR2CuDxJ0AR1HS6k5jqDmuBF5ils7HYRuzHzR3xAQ1unUEZ7tmiDyw515
	h/KhtIkf9+M2jWRU5s707/OxTdRbx++TjL1q+aon4m2ijF1joYx5X87+FPrxMKZZYZcLngqlyczFK
	GeMu3kW/h8Parq2TCcl6m/98QoqZSxwgRfp5zJILRU5260O4lbiqDKccLNOBFLk9hd+Gn5mnGpcev
	qHCcfkWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50uA-00000001Nda-2f57;
	Tue, 24 Mar 2026 12:30:42 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50ty-00000001NWm-3kBC;
	Tue, 24 Mar 2026 12:30:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=HXjqylECdGDFHUiyugySRrfNFcwy5NMDZ6un9XJQF4g=; b=V9/vtmSyHhRM1BItbFutZ0uo/g
	movhuFkhMQRVN8yfy+ARUH5Zn8PpxxiU96vfqN/kf97X7iqB9ojOU9KiTN1ND0Vxy+1WMruilISqG
	gIzf2Iyybs4XPLABbmdRfx9al+sSxJdDrlTl6uZJfnTW1vPIt1pIyTQyzv9PTRiaDB6YD9eOBjEWV
	E66oCKPhMsOL2L2sd6mfTDWS1ryVhnbxDpyloRGWMVNeg41Gp+Mb/dEm953MxqdtHYBrrjbd8Hl5c
	g1SlaJel8yERvu1FVZl+MKwdTjzJ2qrKV6oFu09QYUs908htDG18zYiEFyMt6sIjM5LUEKC365b4d
	TwyRIV9g==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w50tq-0005qE-0a;
	Tue, 24 Mar 2026 13:30:22 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w50tq-000Pna-01;
	Tue, 24 Mar 2026 13:30:21 +0100
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v2 1/7] dt-bindings: phy: ti: phy-j721e-wiz: Add ti,j722s-wiz-10g compatible
Date: Tue, 24 Mar 2026 13:29:37 +0100
Message-ID: <55a56bdcbed0e49680e3074d0f1c06f244287f9f.1774354734.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774354734.git.nora.schiffer@ew.tq-group.com>
References: <cover.1774354734.git.nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27950/Tue Mar 24 07:24:19 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_053031_022245_57A31204 
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

The J722S WIZ is mostly identical to the AM64's, but additionally supports
SGMII. The AM64 compatible ti,am64-wiz-10g is used as a fallback.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 .../bindings/phy/ti,phy-j721e-wiz.yaml        | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/ti,phy-j721e-wiz.yaml b/Documentation/devicetree/bindings/phy/ti,phy-j721e-wiz.yaml
index 3f16ff14484d2..283e3eedc0f31 100644
--- a/Documentation/devicetree/bindings/phy/ti,phy-j721e-wiz.yaml
+++ b/Documentation/devicetree/bindings/phy/ti,phy-j721e-wiz.yaml
@@ -12,13 +12,19 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - ti,j721e-wiz-16g
-      - ti,j721e-wiz-10g
-      - ti,j721s2-wiz-10g
-      - ti,am64-wiz-10g
-      - ti,j7200-wiz-10g
-      - ti,j784s4-wiz-10g
+    oneOf:
+      - items:
+          - enum:
+              - ti,j721e-wiz-16g
+              - ti,j721e-wiz-10g
+              - ti,j721s2-wiz-10g
+              - ti,am64-wiz-10g
+              - ti,j7200-wiz-10g
+              - ti,j784s4-wiz-10g
+      - items:
+          - enum:
+              - ti,j722s-wiz-10g
+          - const: ti,am64-wiz-10g
 
   power-domains:
     maxItems: 1
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


