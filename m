Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1402ACFD313
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Nov 2025 08:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZH+/M0g93i43lr39fY+fWJEfAiUOCkaXxDWstEduOE=; b=c/XkXgNAkN4bLtGG2q64w2ma4i
	+ImK96yt34dDg3colQY2Y89H+Wdvmq8MNaVCQquKQSa4ts+/av/HgBRPxg4F0xumrgPg8VMBJF/aK
	O4Yk/hMjWaKUq4Smiyl4ImQaKtqJU0VexaRLYWjuTLEelb5ruQU4RNxzWQd2+OUe9i4Jqh4zCS96b
	952Tb7W/dYVjHVeW9hy+gqpnLfkyYd4+Ba3UJTP7Sqc7/aJWMPMThKhjo4sBHDIAhxxxrlStWbpUc
	ELFqn39S4eNRN1mSKwm/0+lBraq9iXWRBkpv0OXFAd+xH6S+pNLInyawfeLbEWGEbTxdI54jXNPOM
	ewu+jNIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN5a9-0000000AFkE-2hoQ;
	Sun, 23 Nov 2025 08:36:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN5a6-0000000AFhp-0Rsg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Nov 2025 08:36:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 991CC443B0;
	Sun, 23 Nov 2025 08:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 708B0C19423;
	Sun, 23 Nov 2025 08:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763886984;
	bh=r5AXU9CyKQzJCp1wGf8E69DJrr7/2kmGZppRmQDXWQc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hK8wbjiucVE5Lyw7Nw47ddXi0ltGzV2NlA1rr54UKhwSlVHvjQsd2FIOGFxAGOY3Y
	 Yjw2xOLyoo6lJUcXdbsD3++A6PRUJuxAzXHAtFktr3FN+UiCsGiG6o2VVgEuP4imX9
	 WAod9g3mNKML9t5ZgYvIQ0b8rjB4dBzYcSDtO003RzV0VaupNChph0fDJZjdZt7+nj
	 G/wLc1RUC9QfPdv2yqLMHHVNhf+m+LlDxZV1LYddwPdheZYRWnn4Q9mYtzQMyCu7WH
	 OEcgzVm9YVRKjWgN/rzFvreeHSzCADtn7WCZldc7Z3m38u15u+GF46pJCYo5vLlgdg
	 XfCxiYviKRyug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F91BCFC518;
	Sun, 23 Nov 2025 08:36:24 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Sun, 23 Nov 2025 08:35:49 +0000
Subject: [PATCH 2/6] dt-bindings: mfd: maxim,max77759: add charger child
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251123-max77759-charger-v1-2-6b2e4b8f7f54@google.com>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
In-Reply-To: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Lee Jones <lee@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763886983; l=1264;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=qOK5jNVcnx5bjegC1dKWr0w0HMDBjskPRuyCz3Ci8qg=;
 b=qM5W227Kwrbrd0isfNpZBNhXmIQ8NbswaD5IYEMdymoheJrpiELbZYNT2HWxJ2SRpSo+eXcXG
 MwinsnfaCqxCyl++OgYXy2PKQWkgwjfJjmK1q419ZJ3qDZP8wc8PQ0m
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_003626_209539_748450E3 
X-CRM114-Status: UNSURE (   8.66  )
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
Reply-To: amitsd@google.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Amit Sunil Dhamne <amitsd@google.com>

The Maxim MAX77759 MFD includes a charger function, hence add its
binding as a property. Also, update the example to include charger.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
---
 Documentation/devicetree/bindings/mfd/maxim,max77759.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
index 525de9ab3c2b..29132f73f2c8 100644
--- a/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
+++ b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
@@ -37,6 +37,9 @@ properties:
   nvmem-0:
     $ref: /schemas/nvmem/maxim,max77759-nvmem.yaml
 
+  charger:
+    $ref: /schemas/power/supply/maxim,max77759-charger.yaml
+
 required:
   - compatible
   - interrupts
@@ -95,5 +98,14 @@ examples:
                     };
                 };
             };
+
+            charger {
+                compatible = "maxim,max77759-charger";
+                power-supplies = <&maxtcpc>;
+
+                usb-otg-vbus-regulator {
+                    regulator-name = "usb-otg-vbus";
+                };
+            };
         };
     };

-- 
2.52.0.rc2.455.g230fcf2819-goog



