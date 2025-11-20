Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7229CF8847
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 11:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Pu2yznAKM69Fw0nbx2D6T8syxRy3vzkc5nzKJ06SAs=; b=MGMX1dJ5Vk+w6+t3T4wvsNyex1
	xEGeOPpmfwK7oPBDNAClsABQZuF0qShi/NnnpRCpgxeh6FsJMY3V7rI4CPCEWprcT2uLcUF3cDe60
	xz1ydysdfgnUiJbtxPla/pfLg68JpiHMmw8VcntgooHl+yeQaw3l8NYuZ8jYdaFsL1eSiB+JjXQGA
	iZ5pNKWqcS/ncYuRs5lvvT/WFTrmMCCgt/V3tHtYiDAgmr5Y67DQ812VxrJjRnGlMu60ewymfEQ9z
	SE8rIg0MgoaAkqKd8P6SzOaEA24PyDgwyqlsnU+VU2oDf64F99xt1sib5xuP6Qp2gN20HvrJNxnHe
	n3ovEc5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2ao-00000006YNf-0VUk;
	Thu, 20 Nov 2025 11:12:50 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2aj-00000006YMA-25YJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 11:12:46 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 20 Nov
 2025 19:12:34 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 20 Nov 2025 19:12:34 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Thu, 20 Nov 2025 19:12:31 +0800
Subject: [PATCH v3 1/2] dt-bindings: hwmon: Add AST2700 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251120-upstream_pwm_tach-v3-1-eaa2f9b300a2@aspeedtech.com>
References: <20251120-upstream_pwm_tach-v3-0-eaa2f9b300a2@aspeedtech.com>
In-Reply-To: <20251120-upstream_pwm_tach-v3-0-eaa2f9b300a2@aspeedtech.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <BMC-SW@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763637154; l=1136;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=jrpiq8xW/VHPB3RrV1Az+oFlae8Vnr8Mhyy66AqgzTc=;
 b=M6A3kKIiiCGLB1Q6l96/zkUfNG6Ml7CYM8l6u6kb7CTnAN8GwRcGj+Bj6X8OtBaE20UAsPs6O
 0lp+U3FB+LnBJBr+OGdp6nEuHnGVMLJzLrpZ2F8y3fqrLkU3wJr2gzn
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_031245_540511_6DFA428F 
X-CRM114-Status: UNSURE (   8.83  )
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

Adds support for the AST2700 PWM/Tach controller by extending the
compatible string enumeration in the device tree binding.

The AST2700 PWM/Tach hardware is compatible with the existing binding
schema and requires no additional properties or modifications beyond
the new compatible string.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml b/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
index 9e5ed901ae54..851fb16ec7fa 100644
--- a/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
+++ b/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
@@ -18,8 +18,11 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - aspeed,ast2600-pwm-tach
+    oneOf:
+      - items:
+          - const: aspeed,ast2700-pwm-tach
+          - const: aspeed,ast2600-pwm-tach
+      - const: aspeed,ast2600-pwm-tach
 
   reg:
     maxItems: 1

-- 
2.34.1


