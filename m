Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52FE103E17A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 14:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49Vbxs1tbT6ZaweIAZX7I1sqeBv6ee8F5dSzIqT9pis=; b=hKdMkZr+5xnIBLP/UsU/yB+02s
	ZsK62LywzNMO0eCNK9dwUsQyLygep4i77RuXm3uVXLxtbJj1SS+HEOku1njaqypnFWMpzRXuqCWQg
	xTuRX7ftAL/LL29JDg0bvltio9xSTJbo+VsOHz8qaN5l/UPJXRu9+wOn8BidGThB9mXg74jfNQIWk
	CMKV5EGjDTp3SvA3KnCRIfgNxMmEvBhaRwG7Lc63CW3tAh63c72uNzTCMz2yGNBflAiC530llfoQn
	2OaG6jJy/zW/OMoKlKYkBTjdbe8fUEiP8K8zhlc3aspVkIxlHwHlrMdoU0wQejtKaHP66divg5lQl
	HSU1zONQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rY4-00000008Y9Z-0iYE;
	Wed, 18 Mar 2026 14:07:00 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rY1-00000008Y7S-1IZT;
	Wed, 18 Mar 2026 14:06:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=49Vbxs1tbT6ZaweIAZX7I1sqeBv6ee8F5dSzIqT9pis=; b=A1nKafl+ImtWdsDaIeswWqCmtI
	Qh2T82mFYz0kBsBrdVVLyqTn/yu1xV2e6wCxfvrTRwefmBe89iyWjibvY0pvDaOM0KSJ1MSGAICYO
	YXjIE6dWQaraEpw6T5RA8hxt4R3B8kRZiZp0eaYQX26fXlysO97LCNbpwfD/Z2N7IM3AIeRK4ji9B
	pgBwf51z3KzYuysGbZgRBw0ORMek5KZ3gYkfOSCeWKoAK5+X6nm+2tyYcZnlAr2wsmxmXwhr1dQha
	6gjhpbvSALWmnV7n8KSu82pcbVaqBXPSGTjmSdugX6NV3z0LtcrmE69xSiM6llommK37kfTUWxC6P
	g74f/5KQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w2rXx-000Bq3-20;
	Wed, 18 Mar 2026 15:06:53 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w2rXU-000B1s-2R;
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
Subject: [PATCH 3/7] dt-bindings: net: ti: k3-am654-cpsw-nuss: Add ti,j722s-cpsw-nuss compatible
Date: Wed, 18 Mar 2026 15:05:25 +0100
Message-ID: <1382fed198246f1563dea091478757aebc4e4948.1773751309.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773751309.git.nora.schiffer@ew.tq-group.com>
References: <cover.1773751309.git.nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27944/Wed Mar 18 07:24:13 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_070657_479571_5F329844 
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

The J722S CPSW3G is mostly identical to the AM64's, but additionally
supports SGMII.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml b/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
index a959c1d7e643a..9ab8237c7f79e 100644
--- a/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
+++ b/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
@@ -59,6 +59,7 @@ properties:
       - ti,j7200-cpswxg-nuss
       - ti,j721e-cpsw-nuss
       - ti,j721e-cpswxg-nuss
+      - ti,j722s-cpsw-nuss
       - ti,j784s4-cpswxg-nuss
 
   reg:
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


