Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24E6103E189
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 14:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZfBa15R8mVfW2pS+B1G1OqSBydrfEzOeof2IKR1SZY=; b=vA5wXs/mcO/Ah/1dqhFK8Swd/3
	1doxuMieEDc+/USofjJVSvn7PsQ7NciAzebKgeNzhNsXwg7AYiJQwYXQYup2eB9RDD6R0cKnAsLbJ
	bewDPZQmV6N1oAudKu/EqGrDNcOkwW59PKDVbRZcqmtsA9SK3K9RwSpUM1U9HZliuvcruIvTaZJBt
	B9JncIUvT+4bqvutew1SGERbGQWvmfwjFISk+T8UQeWmveZTp6AcohLoisNIEXp6dsM1ihtvTWThT
	VZjHo6vJuN/CIMK6t8On6a9XC1YBFXF64S2JUsjtYrHf9Wen2IdiSMgsnfF+L29YPlAIckeBra86E
	VQfpjJkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rY4-00000008YAK-2u3Q;
	Wed, 18 Mar 2026 14:07:00 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rY1-00000008Y7O-1J5c;
	Wed, 18 Mar 2026 14:06:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=tZfBa15R8mVfW2pS+B1G1OqSBydrfEzOeof2IKR1SZY=; b=MLomabLxtVH8K0odRdeQlzb53e
	Sgw0ZMCOatqGd4plMrayQ18K8RtAapzWJIQbnUQSguHkczSEHXoIPAbY/5sPowxpd2ooXpWAJffcA
	62z7nm/K5cYYqnQzlS0Xou+yx02ipd23N8bTAXVkeIAx3FGibgDoRIQU4ovLIGKkwg8Oy0zqe2oQU
	0q4aGTAsOuxNMxNttPbq6ve2+bdxdZI+zt55hNGCGLXc4hjTymmwdgHpLIVvXCEyD9BDYHTpBVOGJ
	myStcZfZSF2He4o3ufESPuCw6YPPqf6esuyj6yssZPKGQPwFb9fsmIdU9rj8dTO5lUY0R0iRftSAw
	8IjsuZJw==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w2rXw-000Bpc-1U;
	Wed, 18 Mar 2026 15:06:52 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w2rXT-000B1s-1z;
	Wed, 18 Mar 2026 15:06:23 +0100
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
Subject: [PATCH 1/7] dt-bindings: phy: ti: phy-j721e-wiz: Add ti,j722s-wiz-10g compatible
Date: Wed, 18 Mar 2026 15:05:23 +0100
Message-ID: <54b55c7aa46530283224b5af631cf3ae20966e59.1773751309.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773751309.git.nora.schiffer@ew.tq-group.com>
References: <cover.1773751309.git.nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27944/Wed Mar 18 07:24:13 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_070657_487123_98E4CF1F 
X-CRM114-Status: UNSURE (   7.97  )
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
SGMII.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 Documentation/devicetree/bindings/phy/ti,phy-j721e-wiz.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/ti,phy-j721e-wiz.yaml b/Documentation/devicetree/bindings/phy/ti,phy-j721e-wiz.yaml
index 3f16ff14484d2..e476ff1991b13 100644
--- a/Documentation/devicetree/bindings/phy/ti,phy-j721e-wiz.yaml
+++ b/Documentation/devicetree/bindings/phy/ti,phy-j721e-wiz.yaml
@@ -17,6 +17,7 @@ properties:
       - ti,j721e-wiz-10g
       - ti,j721s2-wiz-10g
       - ti,am64-wiz-10g
+      - ti,j722s-wiz-10g
       - ti,j7200-wiz-10g
       - ti,j784s4-wiz-10g
 
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


