Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA266C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 15:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SD1ypckQPz/e5+np0Vv97QKMQE4pfeJTiekREC0gnfc=; b=iI5EOdOYRj8iKL9kxZM9ge4Plr
	5wYa7CAbVZS+kf2iV9uMwESzATsIigBQzFYFt2n5+vqKzE1QHaHuwc8ql0Wgs6fTurHk/uIWXcI7L
	C7D8AbU97TlH8ylDkcFlGz6GUFf+uBICs3iC4wLpqWPQlOP6pUm4HxSbk7p2idjS1UGQORO2EpdgC
	H03duCwNOprFTh7GnQ9UIDJeZpTvJsw3Jk8KIoGS154bYaPZTM0ZtzxbQMMPx09GUmVOGsecHN6Gc
	UKgo6TQvdasUgrTCxWDKXJwycH7hUettK26CAY4qLNrfBxu2sYbya9sbPHJ1439ZMgy76TOmMcdbg
	T4y1OKIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7dR-0000000DjR1-3TAu;
	Fri, 25 Sep 2026 15:14:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7d4-0000000DjBI-3K3i;
	Fri, 25 Sep 2026 15:14:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B9CBA602C8;
	Fri, 25 Sep 2026 15:14:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E89DC2BCB8;
	Fri, 25 Sep 2026 15:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790349264;
	bh=m9d4wVem58v8DsnpYMJqcpiHnmAE/BxUBPN1Xs7PVkk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uKdVdV8xGTbMVqd4tzgVuE0ngb41r7aHYK8hOtg5dpygd9s5GVMmwsocEl8YPODQQ
	 X6HxYJ/8Hr7BKvSrJ6rWrpUcCEcI3weGOd2IJR8hnktXRhmG4kJpUosnI7F33hVod0
	 gNL35mutbXRS/AVefrr3HQuLYZOFDMTdi0sRHa7ZCpaRJOJIcYolcwr7ATslrwd2Re
	 W09pdwL8EA9N9n7i19XGxkb8SORUYQ0jki8U7E9ygSmjik/5kpQ7+DbUgFiF+8qpPo
	 TJFnnK1b35OWSnjxJ3l8gUO8dYb09AB6j/eUjiJHRz/Uxt775D1CUMB0rUkb1eYDXf
	 mKBok39IToq4g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA0CC98321;
	Fri, 25 Sep 2026 15:14:24 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Fri, 25 Sep 2026 17:13:28 +0200
Subject: [PATCH v2 1/3] dt-bindings: pwm: amlogic: Add core clock for T7
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-add-t7-sys-pwm-clk-v2-1-f23a22b71a5c@aliel.fr>
References: <20260925-add-t7-sys-pwm-clk-v2-0-f23a22b71a5c@aliel.fr>
In-Reply-To: <20260925-add-t7-sys-pwm-clk-v2-0-f23a22b71a5c@aliel.fr>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2352;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=75yNudVNuwQ3zdJGU8ivK4ndnUVyoW5jHITfU7O4bG4=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9a2/kOCizR8E88omVy2KIs9p79i96lthj+PlV7u33mb+
 fqaWXZPO0pZGMS4GGTFFFn651qeeHf56Jmve9RTYOawMoEMYeDiFICJGMkzMvwUXRpb3HAw7neO
 xqHs5e1Lj1tIbZ20xiEyq2Zpkkit6jNGhtlfaj5u3/ZAUzcyLlLcyNG8ZfqHkmV/wqY1FS4OXzV
 xDScA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

The T7, A1, C3, and S4 PWM controllers have a system clock in
addition to the two input clocks of channels A and B.

The channel clocks are acquired by index in the pwm driver,
where the core clock is fetched by name, with optional get
which is silent when not provided.

Require clock-names and minimum 3 items for T7, where the
PWM devices do not work without all 3 clocks.

Add an example showing T7 usage with its fallback to
amlogic,meson-s4-pwm.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 .../devicetree/bindings/pwm/pwm-amlogic.yaml       | 33 ++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
index c337d85da40f1..59320f288552b 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
@@ -62,7 +62,7 @@ properties:
 
   clock-names:
     minItems: 1
-    maxItems: 2
+    maxItems: 3
 
   power-domains:
     maxItems: 1
@@ -140,13 +140,34 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 2
           items:
             - description: input clock of PWM channel A
             - description: input clock of PWM channel B
-        clock-names: false
+            - description: gate clock for the PWM controller
+        clock-names:
+          minItems: 2
+          items:
+            - const: channel-a
+            - const: channel-b
+            - const: core
       required:
         - clocks
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,t7-pwm
+    then:
+      properties:
+        clocks:
+          minItems: 3
+        clock-names:
+          minItems: 3
+      required:
+        - clock-names
+
   - if:
       properties:
         compatible:
@@ -182,3 +203,11 @@ examples:
       clocks = <&pwm_src_a>, <&pwm_src_b>;
       #pwm-cells = <3>;
     };
+  - |
+    pwm@60000 {
+      compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
+      reg = <0x60000 0x24>;
+      clocks = <&channel_a>, <&channel_b>, <&core>;
+      clock-names = "channel-a", "channel-b", "core";
+      #pwm-cells = <3>;
+    };

-- 
2.49.0



