Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C511CD58CC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 12:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E2G3cP9X4cNiCp8YAHg4IjVGgRKZxQbDkjOgRFSfK7s=; b=NZAAE2xeS/jQHJOEpptdYO+vsq
	2Jx7L46vNzDU6f4foRM396QK5iyyn3LNkKHu3wjMswRtL+N8ARtwYUPEPtRL7IA8iOm7GalRV+ibS
	B6/7XLJv3GXFRODh8cYLXXAhCnPtaPEWYC+vHH90PuIfF5OWX2Zw56DVIybOGVb7nV6hESO76mOnM
	Jsk/JepZUYQoCsTymvIRa+vcXMj9JeBnk8UAGErchmpHCE8JA9z/WoNltaMA1iS0ClcvyAEt3J7Sw
	S+ZvTukVkrjxJq5e7eqLL9YJA7U1bZvSXQ6I5O/a0d96I5ILMG82nZTz4eujZhnlAOyE7iK46tDI6
	YHvykOPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50u1-00000001NYn-1825;
	Tue, 24 Mar 2026 12:30:33 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50ty-00000001NWk-3g2x;
	Tue, 24 Mar 2026 12:30:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=E2G3cP9X4cNiCp8YAHg4IjVGgRKZxQbDkjOgRFSfK7s=; b=CGCHJdjK/1owAbl5MGcgmdmyYJ
	Y09H/czoDgIgTrlmPsSQ63V/gBB+NCC7hgWBQFM8jni3Nrl2p6Nsn/Y2qHbu8LjoVKgmmn1NYyWl/
	JGNqsXu22p5Ezm/DIL3GxaB7A1y2I9dVS6zoqRQGodKO+ucpmntsTVioKBL/iHYoXKN6qXx3WjC4I
	m6JMi+u4KJIjbGC6asfUJCwNuMRdG377rwvmLxXmzpl8w2gX4ijdDqy/h44jYcX42BsJJh2P/0JFa
	aI2dP+S/sDRH0HiE2/eezPTlIZQm+m9YGDDufJfuZBOO4znH6CwQlA/gKgmHOs+CwRLW7zTj2xyzr
	8DWDGr5A==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w50tq-0005qG-2N;
	Tue, 24 Mar 2026 13:30:22 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w50tq-000Pna-1r;
	Tue, 24 Mar 2026 13:30:22 +0100
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
Subject: [PATCH v2 2/7] dt-bindings: phy: ti: phy-gmii-sel: Add ti,j722s-phy-gmii-sel compatible
Date: Tue, 24 Mar 2026 13:29:38 +0100
Message-ID: <eb006e0d5f71d97f9123642877d66ef569098158.1774354734.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774354734.git.nora.schiffer@ew.tq-group.com>
References: <cover.1774354734.git.nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27950/Tue Mar 24 07:24:19 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_053031_025279_1BEF3EED 
X-CRM114-Status: UNSURE (   8.28  )
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

The J722S gmii-sel is mostly identical to the AM64's, but additionally
supports SGMII. The AM64 compatible ti,am654-phy-gmii-sel is used as a
fallback.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 .../bindings/phy/ti,phy-gmii-sel.yaml         | 24 ++++++++++++-------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/ti,phy-gmii-sel.yaml b/Documentation/devicetree/bindings/phy/ti,phy-gmii-sel.yaml
index be41b4547ec6d..6e12a75100eb8 100644
--- a/Documentation/devicetree/bindings/phy/ti,phy-gmii-sel.yaml
+++ b/Documentation/devicetree/bindings/phy/ti,phy-gmii-sel.yaml
@@ -47,15 +47,21 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - ti,am3352-phy-gmii-sel
-      - ti,dra7xx-phy-gmii-sel
-      - ti,am43xx-phy-gmii-sel
-      - ti,dm814-phy-gmii-sel
-      - ti,am654-phy-gmii-sel
-      - ti,j7200-cpsw5g-phy-gmii-sel
-      - ti,j721e-cpsw9g-phy-gmii-sel
-      - ti,j784s4-cpsw9g-phy-gmii-sel
+    oneOf:
+      - items:
+          - enum:
+              - ti,am3352-phy-gmii-sel
+              - ti,dra7xx-phy-gmii-sel
+              - ti,am43xx-phy-gmii-sel
+              - ti,dm814-phy-gmii-sel
+              - ti,am654-phy-gmii-sel
+              - ti,j7200-cpsw5g-phy-gmii-sel
+              - ti,j721e-cpsw9g-phy-gmii-sel
+              - ti,j784s4-cpsw9g-phy-gmii-sel
+      - items:
+          - enum:
+              - ti,j722s-phy-gmii-sel
+          - const: ti,am654-phy-gmii-sel
 
   reg:
     maxItems: 1
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


