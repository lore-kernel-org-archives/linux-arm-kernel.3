Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BF7C54EFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 09:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4efewOwOQSfoE2iJKEquU+SnNeVRr2+GI3bic4fnfx0=; b=CKQ+dgrnQd1fqnoQXQuoFEsY+6
	ezYoD+i8ne555KdLrFBxNf6jZwmdBAfUD0Ahk1N+sIs2NNdvKd4QMk+VBDqAk/Hdb1rNYnXazmaRU
	QHIlZpF/iQhNVcA3BKN6qf/KB8MDdpnD6crpehBknDs85v6zeHhh8UNQLJDLdDxzHPC6YA/QXmiJC
	l8DKQTsETwFCOrAKd3r1kmLKNRvHI+ZpXmR9hUNo62p/V5yvmq+KmTgyCX8eTVxvMUJsh45jfoCQK
	XY7oe5LvQHxG0KK5Zwv45U11CxBRY871wyVxrLW5DOOYB4Yt2bbeHOBSLZJKyfG8CRztEzdlOJp1q
	huc2kdOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woe75-00000004orl-0yJd;
	Tue, 28 Jul 2026 09:28:39 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woe6m-00000004ojK-3IXv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 09:28:23 +0000
Received: by chaosmail.tech (Postfix) id 199341C975B;
	Tue, 28 Jul 2026 09:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785230897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4efewOwOQSfoE2iJKEquU+SnNeVRr2+GI3bic4fnfx0=;
	b=rtmz2AY+1UHXzmvBdcmDB9GmwWxGKvTJt3dGynvzlzmOsGK4gFzxUmLzichSbwjLBowBYF
	baQX9mpxVtFYOtCLPAlNUVz5r8rAESZNIaGS5rR93XVi0uQEiFRbslTYNn4eE6SKEaYWhb
	3HeagdJlIHpgoGa2ZhxvMqv20ENml8I=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Tue, 28 Jul 2026 11:28:07 +0200
Subject: [PATCH v2 1/7] dt-bindings: spmi: apple,spmi: Add t603x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-t603x-spmi-v2-1-f43e5f10e583@chaosmail.tech>
References: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
In-Reply-To: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785230896; l=1366;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=SSqELiGIheZUAC6pRoc9/Zh0HI3umFoPJqIqs6RN2fY=;
 b=8LrG0MuRdrezDeJHHgdfaRe+SeAvMYEj5KLQdiB0+hvaivHEbB4FqDlsuWwdkaXPdkWNtCduI
 84z3dbQxsyfDU+gn0KlypnG6tKNOSweDsulpPxOA/5rTKqWmNveKh+z
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_022821_317224_4CFB1100 
X-CRM114-Status: UNSURE (   9.08  )
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

Add t603x compatibles, interrupt support, and support for SPMI
controllers that are not always-on.

Keeping the "interrupt-controller" property as optional, as taking the
j514c as an example, we only need this functionality on 3 out of 10
SPMI controllers present on this SoC.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
index 3e5b14bc8c31..9fc511bb0cb8 100644
--- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
+++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
@@ -20,6 +20,8 @@ properties:
       - items:
           - enum:
               - apple,t6020-spmi
+              - apple,t6030-spmi
+              - apple,t6031-spmi
               - apple,t8012-spmi
               - apple,t8015-spmi
           - const: apple,t8103-spmi
@@ -34,6 +36,18 @@ properties:
   reg:
     maxItems: 1
 
+  interrupts:
+    maxItems: 1
+    description: Optional, operates in polled mode if not present
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg

-- 
2.55.0


