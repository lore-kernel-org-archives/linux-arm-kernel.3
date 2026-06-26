Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94135CDE00B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 00:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B4AcYH5B6O8+NoA+MxsNR6sfejyxMi7Vty97TtI0/iM=; b=D/+GyizZsYJn9MNgGannrgpJOl
	XpsetxzilB7dViDR8XC1JxshoflUE7ATgLeNT+4XWVISaslcV45+raaNGQTwFANDVMoi2H2ackJPQ
	YHIK396ihuFxnayUmYxkMmxrA41AdjK19Ex9+LcetaA2rO22FryZ+Oac1tPPAPcMSMmrxkdYPqaSp
	T2B6dWccmTQeW3e0FNjRB3MvMNHuZCOLtHOkYnHKD5qHRBCwvDqKmZuvRj/EMcjb3YiS+YTxTPviN
	DK6Kd6KmQONXMRs6WQ7dRJn6byA8S4d7Y+tUTSTiBr44jhLdrNNA3manQNpC5CYO3fCXJyM5PhFnh
	BWwtFrNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcu88-0000000A1He-3HeR;
	Fri, 26 Jun 2026 00:09:12 +0000
Received: from ci-2003a-snip4-2.eps.apple.com ([57.103.91.133] helo=outbound.ci.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcu86-0000000A1Gu-06Ov
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 00:09:11 +0000
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-2 (Postfix) with ESMTPS id 9112F180015D;
	Fri, 26 Jun 2026 00:09:06 +0000 (UTC)
X-ICL-RepId: 019f0142-3eba-7500-a9a8-e505d18a0724
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhPAEMGXAVeC1YBXwFLVxQEDloDVA5cBBcbXwJCH1sVSzhaDlsERxQXG1wAFw1WTVAbXwJCDxwTVhUTH1RWA0EZEFYBWFZdBU0aXBhZDxwTUFZaDlsERxQXG1wAFxtGAgQjAl8ARQJeCVYBMBcPVk1QG18CQg8cE1YVEwBeDw9MC0gBWwddAEYJSANaBl4cQQhJAlUHWB9DFA5aA1QOXAQXG18CQh9bFUs4Wg5bBEcUFxtcAAlLRglJHQ4EVAddBV0=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1782432549; x=1785024549; bh=B4AcYH5B6O8+NoA+MxsNR6sfejyxMi7Vty97TtI0/iM=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=F/eoIxCMjmSTYURKg65/qvYh+WssH1vGGU4I1nyfSssU7amh8m6viTK9VAq80BFonKF0UjX/VqSHM1ot3cQjgoZ1t9T/PfMRREoNernnlzlqBNZJqT0wiITwulDzrmLlkKWd6/4Gf7hZaWxCTr1UMUR+mkbnqgXzjFXeGK5X3xXhMZ9p8wejzJzUPbw6b66ihWL70BQ/WuPgBGK6fMlsoaZ7RFH9YmDZUCyaYYi7W7pKegoEqfyVZtH+XIzwyhzvSUTraQrI5YI3HVJC6BjTo7l7kAGUgVNRhWyxllbfJ5s6ZpTJx2w5EgT/QIp85eVgYf8PZV1kkHQQW6cFvIEBcA==
Received: from bigre.localdomain (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-2 (Postfix) with ESMTPSA id 4AF09180029C;
	Fri, 26 Jun 2026 00:09:05 +0000 (UTC)
From: Vincent Cloutier <vincent.cloutier@icloud.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	kernel@puri.sm,
	Vincent Cloutier <vincent@cloutier.co>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH RFC 2/4] dt-bindings: media: i2c: Add Samsung S5K3L6 image sensor
Date: Thu, 25 Jun 2026 20:06:58 -0400
Message-ID: <20260626000715.1111803-3-vincent.cloutier@icloud.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260626000715.1111803-1-vincent.cloutier@icloud.com>
References: <20260626000715.1111803-1-vincent.cloutier@icloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: R7Ncu8igebgugneeo8tkXJgKQ3BmbpgM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDIwOSBTYWx0ZWRfX26mtGJMjG9Wd
 UWbHY0Lh3A1RdrqdYLMPcqeplFPW36AIWjs57J4ilUXcoUIqj5OEDc6/HLUx4ewbj1gZQdIRD0I
 H+399ZtYiO5SKzK6n5+eyqcME0Knd4B11zqfLgKUsmJJS1mFmpPpxnSS600ggCyhu3KaqHK/UTW
 nwUGKn3Y80Rd3KMIPP1Tb5JoCS5k6eaooNeiqnl+R2VfgMpurzmFueFwMZbpO8oqJ8AjUuhA8+G
 t6JuTOwRHh8PninUf/BIlbo/XnJb+sNcW4YWnfv9h8UmozveuGqHP6LNflmKW04u1PtGt6Zkjdz
 qGElCTFIKtI5kF8ESS4
X-Proofpoint-GUID: R7Ncu8igebgugneeo8tkXJgKQ3BmbpgM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_170910_117646_E43CF782 
X-CRM114-Status: GOOD (  11.29  )
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

From: Vincent Cloutier <vincent@cloutier.co>

Add a devicetree binding for the Samsung S5K3L6 13MP raw Bayer image
sensor.

This starts the upstreaming work for the Librem 5 rear camera path. The
binding describes the validated two-lane MIPI CSI-2 configuration.

Signed-off-by: Vincent Cloutier <vincent@cloutier.co>
Assisted-by: OpenCode:gpt-5.5
---
 .../bindings/media/i2c/samsung,s5k3l6.yaml         | 117 +++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k3l6.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k3l6.yaml
new file mode 100644
index 000000000000..96150764b341
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k3l6.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/samsung,s5k3l6.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5K3L6 13MP MIPI CSI-2 image sensor
+
+maintainers:
+  - Vincent Cloutier <vincent@cloutier.co>
+  - Purism Kernel Team <kernel@puri.sm>
+
+description: |-
+  The Samsung S5K3L6 is a raw Bayer image sensor with a MIPI CSI-2 image
+  data interface and an I2C-compatible control bus.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: samsung,s5k3l6
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: Reference to the sensor input clock.
+    maxItems: 1
+
+  reset-gpios:
+    description: Active-low reset GPIO.
+    maxItems: 1
+
+  vdda-supply:
+    description: Analog power supply.
+
+  vddd-supply:
+    description: Digital core power supply.
+
+  vddio-supply:
+    description: Digital I/O power supply.
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            items:
+              - const: 1
+              - const: 2
+
+          link-frequencies:
+            minItems: 3
+            maxItems: 3
+            items:
+              - const: 537500000
+              - const: 600000000
+              - const: 625000000
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vdda-supply
+  - vddd-supply
+  - vddio-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@2d {
+            compatible = "samsung,s5k3l6";
+            reg = <0x2d>;
+
+            clocks = <&clk IMX8MQ_CLK_CLKO2>;
+            assigned-clocks = <&clk IMX8MQ_CLK_CLKO2>;
+            assigned-clock-rates = <25000000>;
+
+            reset-gpios = <&gpio1 26 GPIO_ACTIVE_LOW>;
+            vdda-supply = <&reg_camera_vdda>;
+            vddd-supply = <&reg_camera_vddd>;
+            vddio-supply = <&reg_camera_vddio>;
+
+            orientation = <1>;
+            rotation = <270>;
+
+            port {
+                camera_out: endpoint {
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64
+                        <537500000 600000000 625000000>;
+                    remote-endpoint = <&mipi_csi2_in>;
+                };
+            };
+        };
+    };
+...
-- 
2.53.0

