Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B072AC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 03:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbcumU2ifuiNtuXVGGwdbDs+0MQ0RaTtxOStGoUTBn8=; b=l5hxn51SO/N7btocLejD2FaYda
	7VWXjIJba9sGRZoy2pEU5JtSGvnE6Q78EmnmoQNuiUr/732Ji8bmjJ/HVZTonv9UYAgDLwyPsV9mH
	v9PPH3meo9gKp3+kFBsBEKIrfTrmcVbsQW3LbGqv6weXug0IbsRmyia3Q7iSkJ02WMU/sDkxN2jIE
	TIfZ7VGNjytzK/v9rNNmYAIsH4GCqyKP/DHvEWKtMKTkZGFDfnqvPE2UyIZTGhIF/BywTJ2N/7f7z
	wqWl4g21At7MLwBVy0X8ecMpP7ojiLbeOdnEXTCFGcbKpMKYmxiwlSQZUu9S+SQ83A+zH3KeTOhR3
	yhAz5Agw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu0o8-000000011NN-3DC5;
	Mon, 17 Mar 2025 03:06:28 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu0hb-00000000zyY-2wQS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 02:59:44 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 17 Mar
 2025 10:59:22 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 17 Mar 2025 10:59:22 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <ratbert@faraday-tech.com>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>
CC: <BMC-SW@aspeedtech.com>
Subject: [net-next 3/4] dt-bindings: net: ftgmac100: add rgmii delay properties
Date: Mon, 17 Mar 2025 10:59:21 +0800
Message-ID: <20250317025922.1526937-4-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250317025922.1526937-1-jacky_chou@aspeedtech.com>
References: <20250317025922.1526937-1-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_195943_737146_9857FB28 
X-CRM114-Status: GOOD (  10.17  )
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

Add tx-internal-delay-ps and rx-internal-delay-ps to
configure the RGMII delay for MAC. According to
ethernet-controller.yaml, they use for RGMII TX and RX delay.

In Aspeed desgin, the RGMII delay is a number of ps as unit to
set delay, do not use one ps as unit. The values are different
from each MAC. So, here describes the property values
as index to configure corresponding scu register.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 .../bindings/net/faraday,ftgmac100.yaml          | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
index 55d6a8379025..c5904aa84e05 100644
--- a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
+++ b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
@@ -66,6 +66,20 @@ properties:
     type: boolean
     deprecated: true
 
+  rx-internal-delay-ps:
+    description:
+       Setting this property to a non-zero number sets the RX internal delay
+       for the MAC. Use this property value as a index not a ps unit to
+       configure the corresponding delay register field. And the index range is
+       0 to 63.
+
+  tx-internal-delay-ps:
+    description:
+       Setting this property to a non-zero number sets the TX internal delay
+       for the MAC. Use this property value as a index not a ps unit to
+       configure the corresponding delay register field. And the index range is
+       0 to 63.
+
   mdio:
     $ref: /schemas/net/mdio.yaml#
 
@@ -102,4 +116,4 @@ examples:
                 reg = <1>;
             };
         };
-    };
+    };
\ No newline at end of file
-- 
2.34.1


