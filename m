Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B6CE67A8F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 07:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogVuliILTgQ7lmLfFFLWO37gkXLhMoltF4GUADLYm6Q=; b=JACFi6XMyDnBWCpD8zumtNuBoW
	USgi0y1Rk5OPGVPAhMB+a1vGPUdnRU3ju8JO/UsehQr62RFjkMgT8VA29iqklZbXN8KYcC7NmAY3s
	vzNYL4Fi5HutLMxbh1EHnQXt+LpdF25Ee2gebsCFzdKOHsioD+uOHO2UX2MYfiXoxgR5MUO+/FuGD
	SaIjHQ1Yd4uI/rVeyqEF468yfJb2jXFddlgTDQOdS1Tio5luSy0SbN1c8f5PN0VKiNOhP8thNaSUt
	TtZe1lrPsXWEeIw8+0frpw+AB09Ah8AnujDWI88z6qifidgatN3AF831Tfpcqqq/IDrEb1u9k0sSY
	Ufn2N5iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxKCW-0000000Efuq-0CmC;
	Tue, 03 Mar 2026 07:29:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxKCV-0000000Eftq-1ZTu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 07:29:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CB08D60128;
	Tue,  3 Mar 2026 07:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 320A9C116C6;
	Tue,  3 Mar 2026 07:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772522990;
	bh=lDoMiCuYUhxLB7eIvq/u26hRTu299Ft1QzBtocD5oqw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jVxzY8t2zguUgX6FLB85gmPeCTrDdTTF8XPCeQh24rEcHtFwIwCpNScR9tela4fRg
	 CbnfmnSMJ2VhQyJxDoCTeGG/TF+se/PgGHt9IHAYo7SNge/5mjIm7kG1s9BoSWqtxd
	 f+4La/j+C/fn69dJcq5h++U/m6HJxJMr/sZRaak+1x3buEq/ZQljvnjR1J+FRBFYx3
	 xuasNxwhYXHUgA6KI6b4X/oaunzKk5r6kvi7ddR8u9pwFw43+gE1s7JmTPr1HRE170
	 uby+g99FKNk7cFLKQrchQ3OzNGATI1tSW7UbJCmQs+w4RB1SmY1mEM2jpHTsi/XHb2
	 mqy6d08U7iyUw==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 03 Mar 2026 08:29:37 +0100
Subject: [PATCH v2 5/8] dt-bindings: arm: Add two new Gemini devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-gemini-dts-fixes-v2-5-5b92ced841ce@kernel.org>
References: <20260303-gemini-dts-fixes-v2-0-5b92ced841ce@kernel.org>
In-Reply-To: <20260303-gemini-dts-fixes-v2-0-5b92ced841ce@kernel.org>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

This adds the Raidsonic IB-4210-B and the Verbatim
S08V1901-D1 Gemini devices.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 Documentation/devicetree/bindings/arm/gemini.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/gemini.yaml b/Documentation/devicetree/bindings/arm/gemini.yaml
index fc092962ab56..dfb11244b57e 100644
--- a/Documentation/devicetree/bindings/arm/gemini.yaml
+++ b/Documentation/devicetree/bindings/arm/gemini.yaml
@@ -55,6 +55,11 @@ properties:
           - const: itian,sq201
           - const: cortina,gemini
 
+      - description: Raidsonic NAS IB-4210-B
+        items:
+          - const: raidsonic,ib-4210-b
+          - const: cortina,gemini
+
       - description: Raidsonic NAS IB-4220-B
         items:
           - const: raidsonic,ib-4220-b
@@ -70,6 +75,11 @@ properties:
           - const: teltonika,rut1xx
           - const: cortina,gemini
 
+      - description: Verbatim S08V1901-D1 NAS
+        items:
+          - const: verbatim,s08v1901-d1
+          - const: cortina,gemini
+
       - description: Wiligear Wiliboard WBD-111
         items:
           - const: wiligear,wiliboard-wbd111

-- 
2.53.0


