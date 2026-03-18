Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D426B103E190
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 14:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3YCXKNNM4ThVB3Z8qL4Lkn6GGLYvaGJjMPVWPPsNEG0=; b=qgBG3AvVDpGMRCKvSMCL+yRQMU
	TQkRDYlN1Zet8aaD50vk2mBa8tFoHliYlpZDPeClV3tEEcpqOv1ZWDedTJDVUU7WuWGwk1WnGAPwU
	vHXxRREVhEFQzEGK9vvCG9xpNNDZU/XRuScRYSwSTtyr0t++cR3TVWDogDgd12f4vzUi4edymGBXp
	BeZjdK9nuzBFClL9TGKb+DEQcIpM5DOwNxN5CTlfY/d6s07vu5R9Te36VZKhi2V8Ok6HRFLLLaT0H
	gOix7LY9wE3u+kf3EWTTqkB8IvPLkuImXUV4/xtnf1zC5Dx75aXXovq2MgPtrsPLA8hmnxttgiptI
	sfA4QlGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rYD-00000008YD5-3Gqo;
	Wed, 18 Mar 2026 14:07:09 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rY1-00000008Y7T-1fQs;
	Wed, 18 Mar 2026 14:07:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=3YCXKNNM4ThVB3Z8qL4Lkn6GGLYvaGJjMPVWPPsNEG0=; b=MSZe5WF6EFpCxlEteYWktv6jAh
	aOiaCb7OgpyWjM/gB500qbnf9ksHnJkKFmKjPxp6TN1iQIzXr+P+J3aEAGsO61NFeRWLp031qepQs
	vECOy/Va4MBaUNU7OpTMj4R6jRAiFg9f4LGQSvHDmj4VEIw1GasLQegn/CxwhYOaOPhDeZzSkhoAw
	ZczliEOrxzENombrElaVqbcTtZgIAlZTh6R+l8S0lwpO8HGJCDmIBiq20bIqg9fUgU5HhYnNqz8zW
	1lqE5s6ZKpUJxXLcXdN+XDDDhhcWrTmtm3deXGrO2fc+vYNdz5WQBQCG4x0ZcKg5aQfiNyue75vU4
	F9YkEx+Q==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w2rXx-000Bpi-06;
	Wed, 18 Mar 2026 15:06:53 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w2rXU-000B1s-0c;
	Wed, 18 Mar 2026 15:06:24 +0100
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
Subject: [PATCH 2/7] dt-bindings: phy: ti: phy-gmii-sel: Add ti,j722s-phy-gmii-sel compatible
Date: Wed, 18 Mar 2026 15:05:24 +0100
Message-ID: <1fe7e84aca488c58eee55ce29569196ad5f7121b.1773751309.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773751309.git.nora.schiffer@ew.tq-group.com>
References: <cover.1773751309.git.nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27944/Wed Mar 18 07:24:13 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_070657_479189_B2BB182A 
X-CRM114-Status: UNSURE (   8.09  )
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
supports SGMII.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 Documentation/devicetree/bindings/phy/ti,phy-gmii-sel.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/ti,phy-gmii-sel.yaml b/Documentation/devicetree/bindings/phy/ti,phy-gmii-sel.yaml
index be41b4547ec6d..fa3f3ad9fcc3e 100644
--- a/Documentation/devicetree/bindings/phy/ti,phy-gmii-sel.yaml
+++ b/Documentation/devicetree/bindings/phy/ti,phy-gmii-sel.yaml
@@ -55,6 +55,7 @@ properties:
       - ti,am654-phy-gmii-sel
       - ti,j7200-cpsw5g-phy-gmii-sel
       - ti,j721e-cpsw9g-phy-gmii-sel
+      - ti,j722s-phy-gmii-sel
       - ti,j784s4-cpsw9g-phy-gmii-sel
 
   reg:
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


