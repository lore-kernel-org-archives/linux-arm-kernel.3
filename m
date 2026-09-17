Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC9DC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r97vUqT1ja7wf7CQfDpydnbQb4qTll+mzO8+xNFHdt8=; b=TMjWdY72ubWaoMd41N9XKosY4Q
	QhpbqqENX/ehZKaktoJNG/Ty4ngjIDAjdL+TC21uL3nSgIhXl//dYqx1pibWulJy3VX7Y72Ssj1wE
	ie8/b7sgWzpEkgcP31kbt+/BKuXTIk3dYIu7sMh0vZewhl1NvZ0WoKWZCCINkeXGy4QFZziVhO6AZ
	pmvdP05ZTdb0++7wORrTqR3kOkHnKCKOVCYouazHyoafXHEjDeWmWhUco8m5bIzvhg5KFYx2EMrWG
	ICzWfAHwUbvNQlHFdMr15zJaC91NBoEuOQYaVqV+ejHQNAMAs7O6G/XfY7dUeiMmbQuJ4LxzdVwNi
	wPkO30VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CUa-0000000BRR5-2iam;
	Thu, 17 Sep 2026 13:49:36 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CUO-0000000BRIv-3PEp;
	Thu, 17 Sep 2026 13:49:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789652961;
	bh=I5wKmiysBTuYLPKycTb4r8SCqRgtc3YcQ663wjfvpFY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fmY0pZ0ijzex4HtptD/UaC0jxHsIKAnVKRmVtmxi+ObVR6pvnHypESo33jMrxO6xO
	 MYvtlyJTET0DxpBrQXjH66LFnmunjq/9HGnMvVB70Gg+7h5Gb9QHttNPNRIy7rQb6E
	 SR7/+6GvJUJaDrkjwFRcFenjuM5g0oFARGh6P63/l/ow9HQUjYcKmSVLVjfV1Uo8bf
	 W3tdUlvxr8gvH1uJ3sg/pOHZTBYw8ubsbnevItrQP6/c1sjeJBeTt6LOWIbT9GUHQ1
	 iROOd32glafkfuwh2hHJsQRuAxzRPte/qfVHnPFV2i6rhX6daaHnUKiFCGgWUYk8HY
	 s0OhYFuEns5Dg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C623017E07DB;
	Thu, 17 Sep 2026 15:49:21 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 7BE6348002F; Thu, 17 Sep 2026 15:49:21 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 17 Sep 2026 15:49:14 +0200
Subject: [PATCH 2/8] dt-bindings: devfreq: event: rockchip,dfi: add clocks
 to rk3588
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-rockchip-dfi-cleanup-v1-2-4f00a97a69a6@collabora.com>
References: <20260917-rockchip-dfi-cleanup-v1-0-4f00a97a69a6@collabora.com>
In-Reply-To: <20260917-rockchip-dfi-cleanup-v1-0-4f00a97a69a6@collabora.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3824;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=CMJKlCe6bEkR7uYuohkbQVDQ2FF/s+dLQ5XKL7udDIg=;
 b=kA0DAAoB2O7X88g7+poByyZiAGqr7+GjOYD9XgQwPQo4FjhjYoSNVwOC73J35EGjf1ULcUn+T
 IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqq+/hAAoJENju1/PIO/qaDRIP/iF+
 L3Z3wPL14QCK2IB9xToLK1Mqu5oCNh+8aeBgN0cywq5NCujKDyT6nFPngIeAKrHTee0vKdYNquf
 W5wOrwwwDtuMZIS9G5hkJLaqSOuClUNVlDvWay0uyIWh13cS3eMSdEEIs1R9xYziyHrS8kJC80w
 abkCpCRd+cDfBBGBdV+1Y6JRavDl8DzPbql91RUlinkTc8wr8eKGjBYTE6oHC2DqEzxddsGsPTx
 FNciqNMzXtrZxEu39JupEN2zgyuiEFp+2qde7JyBePmyuGsQ5RachDXkZi0TzrWfK88+S3/2rbV
 M7VD1Jyg3vYVRwcCAc1FeJXE3kBzgYUauA9eOGnQiWeg7Sj2a5b68SzuB6me1DgUqUG27aER3dB
 IK5o6U9kiGdnQ6FtFoS+aWnJJKMlUXdkjNTqxo1KNZD2KV9LdwnXs5vEcdtABI/CVc5BN9XGJUO
 RSWxIdjUh1bxSvGLk4lMD5Zt8phLTux5SmXDXZr1Metsdvul9HPTpPRHvz0QKkl2aJ6QTo4H+Hw
 EUysmUCFKzctrKPWPd55V0WZ8lIlXZROvTZueMEa7IVNiwl5yzvzCw2VmSw4sPnx3TvCCtEZKa8
 eyEfekjgjwYqxNTVFVC5i5eucnpugBF92jBzcMF8B1xj8+c1K4+FttqO6sa1KIhouZaCY3IDvkf
 TGz7p
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_064925_012226_5E0122A8 
X-CRM114-Status: GOOD (  13.41  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

RK3588's DFI has pclks for each channel. They just weren't noticed as
missing until now because nothing ever gates them, and they're ungated
by default on power-on.

The RK3399 clock situation needs no changes, as there the hardware
really just has one monitoring unit for both channels.

Add these clocks to the binding, so that drivers for this device can
properly know about their existence.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../bindings/devfreq/event/rockchip,dfi.yaml       | 84 ++++++++++++++++++----
 1 file changed, 72 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml b/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
index 50d3fabe958d..d6e06a9bea19 100644
--- a/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
+++ b/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
@@ -17,11 +17,19 @@ properties:
       - rockchip,rk3588-dfi
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 4
 
   clock-names:
+    minItems: 1
+    maxItems: 4
     items:
-      - const: pclk_ddr_mon
+      - enum:
+          - pclk_ddr_mon
+          - pclk_ddr_mon_ch0
+      - const: pclk_ddr_mon_ch1
+      - const: pclk_ddr_mon_ch2
+      - const: pclk_ddr_mon_ch3
 
   interrupts:
     minItems: 1
@@ -40,17 +48,50 @@ required:
   - interrupts
   - reg
 
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - rockchip,rk3399-dfi
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3399-dfi
+    then:
+      properties:
+        clocks:
+          items:
+            - description:
+                clock driving the DDR monitoring logic for all channels
+        clock-names:
+          items:
+            - const: pclk_ddr_mon
+      required:
+        - clocks
+        - clock-names
 
-then:
-  required:
-    - clocks
-    - clock-names
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3588-dfi
+    then:
+      properties:
+        clocks:
+          items:
+            - description:
+                clock driving the DDR monitoring logic for memory channel 0
+            - description:
+                clock driving the DDR monitoring logic for memory channel 1
+            - description:
+                clock driving the DDR monitoring logic for memory channel 2
+            - description:
+                clock driving the DDR monitoring logic for memory channel 3
+        clock-names:
+          items:
+            - const: pclk_ddr_mon_ch0
+            - const: pclk_ddr_mon_ch1
+            - const: pclk_ddr_mon_ch2
+            - const: pclk_ddr_mon_ch3
 
 additionalProperties: false
 
@@ -72,3 +113,22 @@ examples:
         clock-names = "pclk_ddr_mon";
       };
     };
+
+  - |
+    bus {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      dfi_rk3588: dfi@fe060000 {
+        compatible = "rockchip,rk3588-dfi";
+        reg = <0x00 0xfe060000 0x00 0x10000>;
+        clocks = <&cru 0x53>, <&cru 0x48>, <&cru 0x49>, <&cru 0x54>;
+        clock-names = "pclk_ddr_mon_ch0", "pclk_ddr_mon_ch1",
+                      "pclk_ddr_mon_ch2", "pclk_ddr_mon_ch3";
+        interrupts =  <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH 0>,
+                      <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH 0>,
+                      <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH 0>,
+                      <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH 0>;
+        rockchip,pmu = <&pmugrf>;
+      };
+    };

-- 
2.53.0


