Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43DBC5DF6E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 10:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4eceDsqSjj99vq4YSGbw8Dy4bNzTm+W6fU1EurOD8rs=; b=OwaNd7KTrBmxFpNxgT0lIy6MFl
	adiGlBRy/fuc1jwMov9wGQRGjUnAWj9DBMXKh1qwHXm9YZsVveCuBnmjNI39UAmj9qyn+6bsYzNEy
	qxkT7VP2/9Nf2vYX+8X/nMChTsyUr5laJNXTAVcYVlnNI1v+jyHvfiVwiGDon0RpNnmscAtYFnt7k
	Lx4O2lB9PjvBHBAWVAlWFzhA9WI2nDIX6AvLTLlf3TX5hwqUmFm7Rbh5xBTKMZIvDAuw3/+VsgvuR
	DN7+XVCO9XT39qctuNusemm64lbOB0QhNzUp3UFWUQkOg7k5nRgHove/Z0gS+WVDcAYbkqLnJ9JC0
	iR1I/Lfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvYJn-00000004ebt-04yl;
	Sun, 16 Aug 2026 10:42:19 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvYJf-00000004eYk-2lCQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 10:42:12 +0000
Received: by chaosmail.tech (Postfix) id D51151C889D;
	Sun, 16 Aug 2026 10:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1786875994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4eceDsqSjj99vq4YSGbw8Dy4bNzTm+W6fU1EurOD8rs=;
	b=SC+32rN5GKvVb687Fu9WV3MQctxPvciRGURnGtHdm9LsaiuNtWpHNykGvxW8ET0y4510o2
	Luxjd3XwTTJrxNqwfn0TynJDDwG/OEcdAVofmbrX1iupAUrsDaQhVlS7dscECr0tT35bvw
	AUWI8SJGubX4fpZgVjwL0vaEghGENWQ=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sun, 16 Aug 2026 12:26:21 +0200
Subject: [PATCH v6 1/6] dt-bindings: spmi: apple,spmi: Add t603x and t8122
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260816-t603x-spmi-v6-1-c5ab87aa447b@chaosmail.tech>
References: <20260816-t603x-spmi-v6-0-c5ab87aa447b@chaosmail.tech>
In-Reply-To: <20260816-t603x-spmi-v6-0-c5ab87aa447b@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786875992; l=1492;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=XC8UjN7V7OAUYnYp8DhiPaqOWzgm6qjWeGjtme4Eml4=;
 b=gMN83pbQJwN7jI0NDIGxDCW9Xk4nBpZ12mn9btMD1WHRTBVK8iEfVvAgUQBmoRF8tlwfKNBlp
 NLODqqll2EWC506huD72WYI2zuQWUE1/Ml9Og3EDrqR0ZIeGK+Ciz67
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_034211_857712_A0855580 
X-CRM114-Status: UNSURE (   8.77  )
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

Add t603x and t8122 compatibles, interrupt support, and support for
SPMI controllers that are not always-on.

Keeping the "interrupt-controller" property as optional, as taking the
j514c as an example, we only need this functionality on 3 out of 10
SPMI controllers present on this SoC.

Reviewed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
index 3e5b14bc8c31..fceed47b2cd1 100644
--- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
+++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
@@ -20,8 +20,11 @@ properties:
       - items:
           - enum:
               - apple,t6020-spmi
+              - apple,t6030-spmi
+              - apple,t6031-spmi
               - apple,t8012-spmi
               - apple,t8015-spmi
+              - apple,t8122-spmi
           - const: apple,t8103-spmi
       - items:
           - enum:
@@ -34,6 +37,18 @@ properties:
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


