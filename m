Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED655CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 12:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jqvBXeJXJh63I38FnftbeguVo8Usv6dqi6l9cFjldQU=; b=Cbpa+2cY41KhxSSDoovWhEKQcn
	LryuAeUoVZymVEL7ErW1oVgjZrhptziAvH16dIm5DB3dnempqHcZc1FRsP5fT/D3bbLkipHDToB3W
	leRkKFaiBXIAIg8gdu/7T0sJMRYvVZ+TohLxNwgotH/kWKGqa2P88GpBBbSvYqFjNBm3//T7iuxpp
	R6jkyWO1YaXy5h+ugFJTn8Uya/oDiaAstRIpgi7oECsBnFu7N959UqO3aujRwJ1G5WynVylVCACTt
	iXPmxDb29uwn3LSO7gZ274MOl5vrB6sLr3WXPrLRMOtElvEvL7SLNVfXxPDjhwJYPSqpg0zNI4BPh
	Hru9GrLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8rQ-00000002WUN-0KB8;
	Wed, 13 May 2026 12:38:48 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8rN-00000002WTr-4Aph
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 12:38:47 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c70fb6aa323so2948649a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 05:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778675925; x=1779280725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jqvBXeJXJh63I38FnftbeguVo8Usv6dqi6l9cFjldQU=;
        b=QaRF3yHmdH4KB9SzbSydEHk2QqAND20ZmHSoATllvCd9F5gBkX8rcMBP+bYfGZC1BC
         JL2BrqwYzvn1GKHQP2vmxWDpaBLFo0s2uwg65ZfKHrbAjNyNDQUZ8zOTLvBbi3Jk+vzY
         cpk4m/9I2zf/EgZHw2L5yjSdT71ectHzX0eGdmPhxG/X7hMis5juVnbmqyCilgyAv2kP
         eaF5mb0LWbDxdSeN2btHqgQLclEINhELqDMu8LjvE1NpqhjXVDI76y7TqSkULPqduTDi
         yIY7H6WBf2DfHFs27ZAER3ssctDv90kTSOAi5y30OMzkZnaXm/2s03N+4bIKWai5Ftbc
         j+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675925; x=1779280725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqvBXeJXJh63I38FnftbeguVo8Usv6dqi6l9cFjldQU=;
        b=QW9ThypJVGXj60//i94sw20l/XpIGsh39CyMYi8pCNOjfoCGUIXVgxK4jRX02os18E
         JRcdfJln9iDx6tI5LM7rvzNNclus5WevWbwvlRkOf/8VnXHyhhKy5vZMjABNBab608Dv
         EvXJsXzBYXmIN5UQPRBPXAjAbc4XV2wE7iyv2DyHWRIVKqGLionc/leNLB8y7MPNuh9P
         8VeoMSlZ0aghnZWBlTSvtvNBVbikiWRnncvKDQPnE2KBqWzj73wn8t8iZ2YzLLSWb4BB
         9TUDkEh4UjXlYD39aLavlZumtMPanuSXGyp/LBggUtKHtQXGGws0F547i721bHzqT5qn
         IPmg==
X-Forwarded-Encrypted: i=1; AFNElJ8ZRqDEuK+nrDUuj/IucqvIjJVCt3iyYkXKXTo7X9BpBkvC8HQlO1Kn5D6xK2OGVxpERC4IpxrUJ0sViSgG+ajQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/Y/3yoo+wvSoyqoAd/jtjf4Bmg0/KcI9TS2fXOL5Vgb7OlSNH
	nwf06LClkMH6LYuxHaXkfx8tGtgtTF5/j7Qylo3pJ89mynscfze9pQoA
X-Gm-Gg: Acq92OHj+1iJpjIsI7KpFdh11QfZTJwBGTlpl9qCWNXOJiRcUPfxbwbE+4ar+2Mnkyg
	xV/ePcV9QwEGEL2zxz5xim6hBaWNn7k6s0+EudPF97I1DCWqZOtu7QcUCoDz9BdG9FjBaPwJNSa
	gp2tD3ZZYw6a5uYAxCMntpoDfAx92t780t5lreiZllOjuZvh6Q2QSf1jSStVFJE++IWEjgv2pWt
	NScZvVxdYoqc8i90/Xs0JQSH292d1uIjBguRXAGTzz0MA1AENMA5opJPgs36R5W3zD6GHsS4o5Y
	z+UDRUBcpASe3YkobM0wUJLDkc1QYiIfqysncalssQJdGJhAIopY9JpE7shTVQ5haKG6PYS/Vkr
	Fpf1SQxCdkEJ54TkMrWZXeAt2QrxKY66PhRX6C6U/Y6OxKjHsxYSi47D5qDCDceclf6r5WZL7WU
	6+Zyr2YU7ctp38OncE7MG6/QPWqMyWfLS+cW0qBHufRwCmJAwpDhCyLTljFnXSW24inMtHC8Ml
X-Received: by 2002:a05:6a20:2454:b0:398:b178:a53f with SMTP id adf61e73a8af0-3afb001eb6fmr3057937637.40.1778675924611;
        Wed, 13 May 2026 05:38:44 -0700 (PDT)
Received: from chaitanya-virtualbox.. ([103.249.241.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267688fe2sm19800776a12.9.2026.05.13.05.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:38:44 -0700 (PDT)
From: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
To: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	brgl@kernel.org,
	bartosz.golaszewski@oss.qualcomm.com
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Subject: [PATCH v4] dt-bindings: i2c: convert davinci i2c to dt-schema
Date: Wed, 13 May 2026 18:07:57 +0530
Message-ID: <20260513123758.4955-1-chaitanya.msabnis@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_053846_041539_E69C54E7 
X-CRM114-Status: GOOD (  21.71  )
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

Convert the Texas Instruments DaVinci and Keystone I2C controller
bindings from legacy text format to modern dt-schema (YAML).

During the conversion, the `interrupts` property was made required
to match the strict requirement in the driver probe function. The
custom `ti,has-pfunc` and `power-domains` properties were also
properly defined to match SoC-specific hardware features.

Signed-off-by: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes in v4:
- Added conditional allOf block to enforce power-domains requirement for ti,keystone-i2c compatible.
- Dropped automated bot tags from commit message per maintainer feedback.

Changes in v3:
- Fixed a typo in the author's email address within the YAML maintainers block.

Changes in v2:
- Updated MAINTAINERS file to point to the new ti,davinci-i2c.yaml file instead of the deleted .txt file.

 .../devicetree/bindings/i2c/i2c-davinci.txt   | 43 ------------
 .../bindings/i2c/ti,davinci-i2c.yaml          | 70 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 71 insertions(+), 44 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-davinci.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/ti,davinci-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-davinci.txt b/Documentation/devicetree/bindings/i2c/i2c-davinci.txt
deleted file mode 100644
index 6590501c53d4..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-davinci.txt
+++ /dev/null
@@ -1,43 +0,0 @@
-* Texas Instruments Davinci/Keystone I2C
-
-This file provides information, what the device node for the
-davinci/keystone i2c interface contains.
-
-Required properties:
-- compatible: "ti,davinci-i2c" or "ti,keystone-i2c";
-- reg : Offset and length of the register set for the device
-- clocks: I2C functional clock phandle.
-	  For 66AK2G this property should be set per binding,
-	  Documentation/devicetree/bindings/clock/ti,sci-clk.yaml
-
-SoC-specific Required Properties:
-
-The following are mandatory properties for Keystone 2 66AK2G SoCs only:
-
-- power-domains:	Should contain a phandle to a PM domain provider node
-			and an args specifier containing the I2C device id
-			value. This property is as per the binding,
-			Documentation/devicetree/bindings/soc/ti/sci-pm-domain.yaml
-
-Recommended properties :
-- interrupts : standard interrupt property.
-- clock-frequency : desired I2C bus clock frequency in Hz.
-- ti,has-pfunc: boolean; if defined, it indicates that SoC supports PFUNC
-	registers. PFUNC registers allow to switch I2C pins to function as
-	GPIOs, so they can be toggled manually.
-
-Example (enbw_cmc board):
-	i2c@1c22000 {
-		compatible = "ti,davinci-i2c";
-		reg = <0x22000 0x1000>;
-		clock-frequency = <100000>;
-		interrupts = <15>;
-		interrupt-parent = <&intc>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		dtt@48 {
-			compatible = "national,lm75";
-			reg = <0x48>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/i2c/ti,davinci-i2c.yaml b/Documentation/devicetree/bindings/i2c/ti,davinci-i2c.yaml
new file mode 100644
index 000000000000..b94ac06dce36
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/ti,davinci-i2c.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/ti,davinci-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DaVinci/Keystone I2C
+
+maintainers:
+  - Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,keystone-i2c
+    then:
+      required:
+        - power-domains
+
+properties:
+  compatible:
+    enum:
+      - ti,davinci-i2c
+      - ti,keystone-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  ti,has-pfunc:
+    description:
+      Indicates that the SoC supports PFUNC registers, allowing I2C pins 
+      to function as GPIOs for manual toggling.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c@1c22000 {
+        compatible = "ti,davinci-i2c";
+        reg = <0x01c22000 0x1000>;
+        clocks = <&i2c_clk>;
+        clock-frequency = <100000>;
+        interrupts = <15>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@48 {
+            compatible = "national,lm75";
+            reg = <0x48>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index bc3bcc641663..50a11a8d71a2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26396,7 +26396,7 @@ M:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
-F:	Documentation/devicetree/bindings/i2c/i2c-davinci.txt
+F:	Documentation/devicetree/bindings/i2c/ti,davinci-i2c.yaml
 F:	arch/arm/boot/dts/ti/davinci/
 F:	arch/arm/mach-davinci/
 F:	drivers/i2c/busses/i2c-davinci.c
-- 
2.43.0


