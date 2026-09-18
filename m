Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30833C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/XQOq37LtwyxJqEa+VJk2M/nXUic2niECbJ04vPEb8=; b=oDP41wW0vL/FwqJAPah7ukbElF
	TQpoKjDyTQTi51j/AjfnywCkmkTTf8ZZ/YTynMmKdt2zf0p9lKkL/lz9OxvLCvgl9abrh+xK8Stc8
	hInZr8NIQy16Ob+5RKL4ska4FegivAKe1cjEDKudUGOVebdOfF7fzdysuyPz31Fn24suqH1BkU2uu
	bXfrtFxLDM4xAeM+5lfMe+nBjP6V4uI8F2NzvpT5TApnZtVr0LFSD26tyynYhCGWN1x+vX0QH4sFn
	6NEYh794P9rqZptDls2YEQSv7xbDZJdQYIB1VI6VMAseC1bvgwpVNRkqjBi34jUitDTaThRDNobDc
	pDbtaHgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YRZ-0000000ESEW-1ZSU;
	Fri, 18 Sep 2026 13:15:57 +0000
Received: from mr-2006f-snip6-5.eps.apple.com ([2a01:b747:3000:204::38] helo=outbound.mr.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YRV-0000000ESBZ-2N1O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:15:54 +0000
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPS id 87C401800870;
	Fri, 18 Sep 2026 13:15:48 +0000 (UTC)
X-ICL-RepId: 01a0b4a8-ad48-7976-92c1-2cd601067d2b
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOA1QGUx8RTxweGwZGAF0NQQpaAFIBQV9MBlh3AlEcVg1XQ1QEX04ZDEodUlZbE1UXRgk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1789737353; x=1792329353; bh=6/XQOq37LtwyxJqEa+VJk2M/nXUic2niECbJ04vPEb8=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=smzzl1SyxTSGFgsZ2zESyuwnhfR4TWW2TmGvXn5V3zWwpy5WR+RNoXrufR9dOnmtKoB3xOY/gZIDBZCCOQywTpQLAZUvSq+LDN/Quo9T4nKSToLUw4XRr8awtJoiM7I4MJjd7JOCvuhXKdxWWiYN8XJ6w/Rf+ag13FiQC8jj57pbPthb9Z31RNmG9IibbBPc0a6ag45rX6p8rbff2fbuItF8Yki3pOXEGuhOIQzeKtlpgMeZEFg1IkliHnUAoqhLYR44C7kD1MSdqcY2gG8y+WPnne5iq6fqz8830lJLOQ1XVgH5wCns+c5Cc994ux773VmuZ3CnNailyYyMy8JtuQ==
Received: from [127.0.0.1] (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPSA id AB1EB1803F1D;
	Fri, 18 Sep 2026 13:15:44 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Fri, 18 Sep 2026 15:15:07 +0200
Subject: [PATCH 02/14] dt-bindings: media: add apple,avd
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-avd-v1-2-49977931f455@icloud.com>
References: <20260918-avd-v1-0-49977931f455@icloud.com>
In-Reply-To: <20260918-avd-v1-0-49977931f455@icloud.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Sofus Forstreuter <sofus.c@icloud.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: W3r0z4ne5IPIn0SGTBMu_VtDNz50gufT
X-Authority-Info-Out: v=2.4 cv=VaD6/Vp9 c=1 sm=1 tr=0 ts=6aad3987
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=v3ZZPjhaAAAA:8 a=8V0BG8AgQ9fJwKtalr0A:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: W3r0z4ne5IPIn0SGTBMu_VtDNz50gufT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4NyBTYWx0ZWRfX/cKuMXzpoaZW
 /rPfeVZjakGuLMiOzOOidUpxHBpChRXgn3xRkTjf2+810il822wVXNMjpLXHts1Vc2Rpe6hV19O
 vvNOr0qhExW22afXpuGPBOKygYRL5Y/rNJlmPSUuIOC3onrUlbn7Lk6VJmYiFpOqkjmVfiYkxWN
 IvTY+0ys/GnGqnwzTg+JVJW7Qme1ulsC/GVFdOOKb+AifVn5pb9eq5f9xd3NSI7JKxY9x0y3Bqg
 Ke8ugyV3YeLeFSX2dTzHnpwPxEogibf/IZYlpq6GP1kBfaowsYE5GHULwLCfRuBK8LYYbrVuuwl
 fJLhyxsA6a8fDPni/ynUg7GSMus1BbTUbTv61+nyq9CzBtlWaxZexFISUTbAqI=
X-JNJ: AAAAAAABprNxh1+Kh1JswuyRdL5YgfFMxBdQf4Np6sMGUExWm7kEcd6Zi54fXr8uN71/ynXGd2Tbi8Iv28uNAUncTW6p+66B0p92ML/OyTjLHj56XecCZTqvM9MfwS+i22P3hj1jjuM/EpSxl1gk8vVzNrTthv1sVUxkbEvPHB3lU2TviX+4x6omNDBzvxsHDXAD/JPUBzwGfJ1bUsfT2idK8boz/WQQ2rxzEewe/5v+rqsvK0J/M7daNBtmpXS6X3cl7YheK0QMKllKSgsvgT1SVA3HA/+iutCwcpZfljdrwzB6ozkL5vaUEd1TiS4WPl+n8XABBl5pgHDY+hLJgq3Q/RVm8EkbDDWppwGZYvpg17Tl6lgiCoQwr9W84YQr8Xa2RMjPvHmtEE6rNCQL0csxp9Z4eGADow4I6BKK1rKHDpTGd/RA7PFIlnh9hzNjJNP/Nm5sgK+cmq3rZmPYlQERcTsl7EjteHvUkSpXxaVYkS9NEkdchPa/0RiDYI+I7eCyo7qb59V8/761Rp2Ps+6vlB31NujMxIUciIGGhMQI8BAAQV0N3+zSFPp8xB6wudTXqHsWUx74jB8w26VRVnyAgUJF1axTGjqK9fhhf0jbP59rjpGUQIzaPy+jD3ZD82Mv3jVulgufVbi9Ir1dT7q8tiA2p6qVOWPhrl8cnt8OVZWnLtwSj28ISkxV2vaUKA2gv4P7RxuZdZylv8UzHHJTirTGsTKLc9jkrzdPTx0foJ7O15JyLYSwfTdnO10sm4ZMfHrP/R3+ABUteVEkVxiE7Av7m3hObCDCFIyeCYxoK15lI35vByR+kyUzq+RG6tQEKdFTlFxuCkNcgAR5M00PKnt5eI7OE8bu4orQQSg2GoY0kRzwFCVvBOhSeu0F+deIJ+XuHkeXaw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_061553_611100_D41FA9B5 
X-CRM114-Status: GOOD (  13.99  )
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

Document the Apple Video Decoder. A hardware video decoder present on
Apple hardware.

Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 .../devicetree/bindings/media/apple,avd.yaml       | 112 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 113 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/apple,avd.yaml b/Documentation/devicetree/bindings/media/apple,avd.yaml
new file mode 100644
index 000000000000..34a4129d6a46
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/apple,avd.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/apple,avd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple Video Decoder (AVD)
+
+description: |
+  AVD is a stateless video decode IP block present on Apple devices.
+  Notably it includes an ARM Cortex-M3 and associated DMA controller.
+  AVD is capable of decoding H264, H265, VP9 and AV1 on never SoCs.
+
+  The IP does not change much, with changes being mostly the CM3 having more
+  memory and interrupts.
+
+maintainers:
+  - Sofus Forstreuter <sofus.c@icloud.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - apple,t6030-avd
+              - apple,t6031-avd
+          - const: apple,t8122-avd
+      - enum:
+          - apple,t8103-avd
+          - apple,t8112-avd
+          - apple,t8122-avd
+          - apple,t6000-avd
+          - apple,t6020-avd
+
+  reg:
+    minItems: 4
+    items:
+      - description: Cortex-M3 code (unsigned)
+      - description: Cortex-M3 sram
+      - description: Mailbox
+      - description: Video decode control
+      - description: DMA control
+
+  reg-names:
+    items:
+      - const: code
+      - const: sram
+      - const: mbox
+      - const: ctrl
+
+  iommus:
+    minItems: 1
+    maxItems: 3
+    description: |
+      The block contains 3 iommus, one for decode operations, one the DMA
+      controller can use and the last for decoding drm-protected content.
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    minItems: 2
+    items:
+      - description: mailbox 0
+      - description: mailbox 1
+      - description: mailbox 2
+      - description: mailbox 3
+      - description: flag 0
+      - description: flag 1
+      - description: DMA status
+    description: |
+      Notably there are no decode related interrupts. All decode related
+      interrupts are sent to the CM3.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reg-names
+  - iommus
+  - power-domains
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/apple-aic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        avd: avd@289080000 {
+            compatible = "apple,t8122-avd";
+            reg = <0x2 0x89080000 0x0 0x12000>,
+                  <0x2 0x89092000 0x0 0x12000>,
+                  <0x2 0x890a4000 0x0 0x4000>,
+                  <0x2 0x89100000 0x0 0x10000>;
+            reg-names = "code", "sram", "mbox", "ctrl";
+            interrupt-parent = <&aic>;
+            interrupts = <AIC_IRQ 679 IRQ_TYPE_LEVEL_HIGH>,
+                         <AIC_IRQ 680 IRQ_TYPE_LEVEL_HIGH>;
+            power-domains = <&ps_avd_sys>;
+            resets = <&ps_avd_sys>;
+            iommus = <&avd_dart 0>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 4cc4a2dc6d30..3c7c5fe3f0bc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2643,6 +2643,7 @@ F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
 F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
 F:	Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
+F:	Documentation/devicetree/bindings/media/apple,avd.yaml
 F:	Documentation/devicetree/bindings/mfd/apple,smc.yaml
 F:	Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
 F:	Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml

-- 
2.55.0


