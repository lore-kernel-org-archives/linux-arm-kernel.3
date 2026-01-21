Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F17D262AF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 01:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKv5wVK8nRb4b7txOcECJgvgeaF9EZ//mNn9FBi7zhs=; b=0JBet/dAf3PNW/+5sRlw37DVcA
	zmxDNzhhB23m9DjVO6Wv4+VrczAh1+t/fYVnqpN7YSZCF7qCsyQqO7GNBziZ+NmCML5Y/+2QdStQO
	+p8LsONymEikyJznoahzM0jVWFid42w2ssxcTQ3pTgOXuLdk1IP+Wt5K//I+8lJ/hm99Fp2rfs3zz
	4cjSq4ilt+SuUWSCgXG6UXxVHoxnJt09EAppa+4ZfTqL/m4mIusRNl84BDKLSPdASSlk43s76uzVG
	lU2QflgnzQbyj01ps1Ey8HaAFgggV8x2xjjpM4XMh2/J9hqeARVNMIHaW7DxchY8NXZbXudqBFpCh
	g4/w5/sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viMa7-00000004gXC-2RxJ;
	Wed, 21 Jan 2026 01:00:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viMZz-00000004gSj-2T8A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 01:00:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A89E4440F;
	Wed, 21 Jan 2026 01:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D23FC19423;
	Wed, 21 Jan 2026 01:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768957214;
	bh=dg+XxL9XY+wzHYQdqDR4J365iBhBDRk23IX4WjYc5yw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RuyFmR7uchaT2T1/fUsr4ZvbmT1P7RxOOC52yjf5q/M537IW50IYUkD6n2SIUpc/o
	 EVJMMVOWpdC51DWc3VOrB+nXRg1sS2IBL7vuqs//hUFpk/MKvPYP5rYNjUERNRuhzp
	 si3s2BESye16kghsRf/M9Fggg0ma44SmP0z6GlXwUbO+xkCpp5n4oMqtrFFkrLBe7y
	 gXHQE3Ipd/lv9mEWbtCSjnpJG/aKTxushYD+3BrlJI80ii8GyZr9f5g2T89sbx/RPd
	 J6SMjhZ/6p7dNppKLeAdfXMos8bVzWQpmthpFM32HerixnToBIrsH26R2wOPRWOpNG
	 7soXMpGR9qUvQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F0CCD262B1;
	Wed, 21 Jan 2026 01:00:14 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Wed, 21 Jan 2026 00:59:36 +0000
Subject: [PATCH v4 2/5] dt-bindings: usb: maxim,max33359: Add supply
 property for vbus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-max77759-charger-v4-2-694234c8ded1@google.com>
References: <20260121-max77759-charger-v4-0-694234c8ded1@google.com>
In-Reply-To: <20260121-max77759-charger-v4-0-694234c8ded1@google.com>
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
 Amit Sunil Dhamne <amitsd@google.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768957213; l=1328;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=bsP6JJcyAtqzU3VaAyhlebaVphcNa5Zmlwk4Jwo9CUI=;
 b=sF5qx01hnWQLxwWcP2LXqsbzRbJyXhP5xYHHo3Y3KW+cDqk6m0H5FAt4NamtG7TN4ikPLfb0R
 cJOOehV5PbYAx49nP4ad5ebOUminwiCq6wVmEmmtmz+0Wa3GkYmQJOX
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_170015_689754_8F96A176 
X-CRM114-Status: UNSURE (   9.02  )
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

Add a regulator supply property for vbus. This notifies the regulator
provider to source vbus when Type-C operates in Source power mode,
while turn off sourcing vbus when operating in Sink mode or
disconnected.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/maxim,max33359.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
index 3de4dc40b79192b60443421b557bd2fb18683bf7..e652a24902eac93396fc61281cc9e2cb1d37a390 100644
--- a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
+++ b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
@@ -32,6 +32,9 @@ properties:
     description:
       Properties for usb c connector.
 
+  vbus-supply:
+    description: Regulator to control sourcing Vbus.
+
 required:
   - compatible
   - reg
@@ -53,6 +56,7 @@ examples:
             reg = <0x25>;
             interrupt-parent = <&gpa8>;
             interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+            vbus-supply = <&chgin_otg_reg>;
 
             connector {
                 compatible = "usb-c-connector";

-- 
2.52.0.457.g6b5491de43-goog



