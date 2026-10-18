Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E248ACCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 16:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1bl8OPVoTwnMPPl51iRYBO3yUTf6D0qWlAJVw0y0IXo=; b=owD6pTUKnmDk3vTWdXNtX2HAg8
	Tr3G6An0Gy9xWia7ZmxKld+S+qskc8GirNV9DMsx/iiwf8RpEcA05Uzd3ocXfEM8/NLpjQjAbXVjZ
	NAAXS/CJmPlLhBTh2uVvX86Fxx/sP2tNAWurrylfIl/ecO6fJYVWjErzKcJ4F4sPKULh7Y+iFokm1
	N7KuJTqp4wIvhATVruKCoiz4hLzFTmmiGy70GT78oK82JIRNwf3TWv+YtKD0y0cn1zVhDXmgY7XR8
	9KTb4iA7gQoLjBRLmsKtmUZloX2VHQ9n5PuckJDhjVMhx98t+MH2pdY+aPOVXe/U8Prkzchb0MKTU
	oyFeCWHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xITQX-000000061Tf-2H9S;
	Sun, 18 Oct 2026 16:08:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xITQW-000000061TI-06dM;
	Sun, 18 Oct 2026 16:08:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1bl8OPVoTwnMPPl51iRYBO3yUTf6D0qWlAJVw0y0IXo=; b=NYV7swH41Daf6lHKjxLxzugmgj
	/G/6bNKxik9ZsZCS4t3v6pAD+noTKDIBIT8QHbKbsFOSMpyPyihD4d3bbyrHbBJo6AuZyz4pO/ODW
	y98Di6diOtnZzZcK8Dv20ya+oQNOfS/dKdULhdnSF5pCv1yyiW6Vnp969dqEqlZDv7t9BVw6yV3IB
	oVaXAxsYfBO94LKDuf2qH1fcXshOdOA5w6vTWoi5REHDGcRmYJ9NtdIp/QP/ZxCFiI/L9B82OVcfI
	gFycjemcXW4O4lkD61aYwPVlJmejTK06nWB2p6mhd16N23dIMfb09xbqP68sSRatV/fSc7OplUt4c
	kGw6fENg==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xITQS-000000031BZ-1fGp;
	Sun, 18 Oct 2026 16:07:58 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69IG6rwnE1115120, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1792339613; bh=1bl8OPVoTwnMPPl51iRYBO3yUTf6D0qWlAJVw0y0IXo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=qlgSC/gp9H/IqxDELVlBhwlU2iKfJOPTLETis6p66zyJWuj5PltBBUfCikrJbzDd1
	 ys6ZI8iQzK4FMBN0/rc6sQd3tMk5fYbHAO8tglbctiIV1SBzHyoI6+jc9CcEyq7wkx
	 +YKibbO4NQ4ksTF8r6Aegu88RFKE2EJYXdopq3sPEWOLpHRhDTSP/nc36Cjd7BJjyG
	 hdO58gS0494Sfu+XF8JZqBqjYIEF/uzb3EqVN0+nz7bKw3oMWT0KLbAcdS0WuHs6P3
	 b2ANjZ702drUJ7LsrUo0WYqk17HwwqFrW6AUaLh2RkFazDk/bzL/fhviX/tgAZYulM
	 XUvBeOf7kQrUg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69IG6rwnE1115120
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Oct 2026 00:06:53 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 00:06:54 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 19 Oct 2026 00:06:54 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <tglx@kernel.org>, <radu@rendec.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <lee@kernel.org>,
	<afaerber@suse.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<mfd@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v5 3/8] dt-bindings: mfd: realtek,rtd1xxx: Add interrupt controller child node
Date: Mon, 19 Oct 2026 00:06:48 +0800
Message-ID: <20261018160653.3940371-4-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261018160653.3940371-1-eleanor.lin@realtek.com>
References: <20261018160653.3940371-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_170757_129301_DE29D086 
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

Allow an interrupt controller as a child node by referencing the
rtd1319-intc-iso schema, update additionalProperties to
unevaluatedProperties, and append a usage example.

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 .../bindings/mfd/realtek,rtd1xxx.yaml         | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/realtek,rtd1xxx.yaml b/Documentation/devicetree/bindings/mfd/realtek,rtd1xxx.yaml
index 717e29c37b36..b21e14df2879 100644
--- a/Documentation/devicetree/bindings/mfd/realtek,rtd1xxx.yaml
+++ b/Documentation/devicetree/bindings/mfd/realtek,rtd1xxx.yaml
@@ -65,6 +65,10 @@ properties:
     const: 1
 
 patternProperties:
+  "^interrupt-controller":
+    $ref: /schemas/interrupt-controller/realtek,rtd1319-intc-iso.yaml
+    unevaluatedProperties: false
+
   '@[0-9a-f]+$':
     type: object
 
@@ -76,3 +80,27 @@ required:
   - reg
 
 additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    syscon@7000 {
+        compatible = "realtek,rtd1625-iso", "syscon", "simple-mfd";
+        reg = <0x7000 0x1000>;
+        ranges = <0x0 0x7000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        interrupt-controller {
+            compatible = "realtek,rtd1625-intc-iso";
+            interrupt-controller;
+            interrupt-parent = <&gic>;
+            interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+            #address-cells = <0>;
+            #interrupt-cells = <1>;
+        };
+    };
-- 
2.43.0


