Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259DB60A3821
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 09:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xop7NDVS;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=r1S6aeMh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EtzUSsQ05RhzEVHsJvkbPqMye6Kh3/PXjMKcbrv3o9Q=; b=Xop7NDVSEX9rzrNUAnmB3ZBX4a
	IXKRoMFv9cr3wNzzNioJPiAaUvAaA+vrkEz8VDxNTE/FnFrMQ82/9LXCUuJHfnmYmvqGUudcaVWeG
	jOsOyVsP8HCAKe35nA6f58Q++lVOcaH0TmwaJBKTz4/hudIqbK+Lr71FEzfVuezUTo1mlI+Bo/Ac6
	th64vsWdzXmDOXscAKMtRU8rMa6KAksxVl3/rVV1gfPmE4cQv3hbJOLyxTXhOs/Q+i9f1DRRgIvbx
	Ni52nmsoKhn+pWeXXkYHfJufwlXZMfWWjFDU9HeJmtwprZGnvX/YUO7cgB9LeQu8uogQfREIB7kj4
	6rZxNdlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6JS-00000009J1J-2jZo;
	Tue, 20 Oct 2026 09:39:18 +0000
Received: from st-2005d-snip6-11.eps.apple.com ([2a01:b747:3001:202::29] helo=outbound.st.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6JL-00000009Iv5-3avs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 09:39:13 +0000
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPS id F14661800111;
	Tue, 20 Oct 2026 09:39:05 +0000 (UTC)
X-ICL-RepId: 01a158ad-c638-7623-a036-481a4dd862ea
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXBIYXBRcUFgeRhJWDV0JGRhGXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOAl0FWx8RTxweGwRGA10BTVAPVgoAQQtNV1V3AlEcVg1XQ1QEX04ZDEodUlZbE1UXRgk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1792489149; x=1824025149; bh=EtzUSsQ05RhzEVHsJvkbPqMye6Kh3/PXjMKcbrv3o9Q=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=r1S6aeMhRsQeFvCT88HDpI94DRctMTm0m7z6X9ev/hs/6HyCq0oJvu7rjZHkLAqgUcrQkqdKRXsIKE0Ypb3WhSNiin90gUN08NP6jjal+l40fY3BhLKo/Vkt9xscCg5ntBi0chb6AQR1oez3zNGvWgam55jzrHtmGMOxLoxHG3HVxpBwm9Pe4RlK50/vk0YAw4pDn3eoECVWncVojdy5LWQTt0jw/g6wNllq+W4flQBAixBitH81Q1IihOQlXdQ8nye0R+AdMXN2ZJfULiUDJzWjl0l9elxXC/Uuh9Y4CYqRjmCuOvcM99RaHnaZVXh1OZqkCb7EWsllLae1+DRmog==
Received: from [127.0.0.1] (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPSA id 55A071800231;
	Tue, 20 Oct 2026 09:39:03 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Tue, 20 Oct 2026 11:37:42 +0200
Subject: [PATCH v3 01/17] dt-bindings: media: add apple,avd
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-avd-v3-1-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
In-Reply-To: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sofus Forstreuter <sofus.c@icloud.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzOCBTYWx0ZWRfXz8ndQ2ZE6bPG
 SQnwzhhBdR8yEHva5YEs1W9iLlxYx4oZPvsQASnBXF4elD9uK0/G/Y2S7NnGF05DvC5IU3w6Xj+
 Qu/bpV0zynqPYbdHK5CmETPT/XYmmeqhXLrhAt4S9gi8ATKRjDoQx3dmMaXpeops6rmQ4Xh424Z
 K5WSMSROrtz10cQSvut5azkK82sGVOOHr9ERQiOudovVXR+OlP3qTFk28uevmhwiBliXowFlgZm
 mb3rGHiw7o+xOpCol7907rn3LGiraBQIS/ENcGY4v625wxqlUeOZVkfmR/smC+rh+sEgqoymwQ1
 yWJTnIJ6YZ+XTVR7bKpofR6jgoN9ZJoqRWk43My75SemgEknAVmHRHibUsj/yA=
X-Proofpoint-GUID: gr1U8FhkXCl1X_zPvamuB6qgiUCO9EpB
X-Proofpoint-ORIG-GUID: gr1U8FhkXCl1X_zPvamuB6qgiUCO9EpB
X-Authority-Info-Out: v=2.4 cv=BqGQAIX5 c=1 sm=1 tr=0 ts=6ad736bb
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=v3ZZPjhaAAAA:8 a=WCOQ0BZNcKcpk45iT-AA:9
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
X-JNJ: AAAAAAABOdUjdhU7wci/o/nBlm003lo1KZGX2dTjkjqOVPDB8gAxb0VB2aOd9XWwvq97WlnwwooT9Ts1d/nfKTDM0h98TJ76fc/XYwjPibnBa1BzW9i9w9FbSfr9yzFJ+zwXvSS/F2NCGlMC9fty1zV9ofCnedRX3ujEf2bkcpoyxqr/nZX32saZx5ppCWo5tXsLmwajjerWPZ2E6jvEl3y9dFzxRlrJujMk158eICcGxdL11KU6ZTkBHNdBQ8W7XpGRLd42YLUyaT/HMqLKSXYg4P96XuvMiOMKcmCwyD/sWMEqQ8Z9q4FQeSSEFs79Img0a8xoiI7gqWkLk1lNwZ6T/VO8Dl7ai5Pyl0DHErR4IZzvqaFdyDGFCOgwOi/mq6Rftie69y2YXqPhck0I6vemW+uIYLQAIwPxZPJE/5yZ6AjFFXUykUEiJ8eeks7C0B6oJhf7J9jEeDfqoe2S9kn9BPxvDrWOjOXqq2EgN43Oie+rtCcIPIvrIWxyzbHcOpEFSnaJhbZOx5vEoP+h+eWa1nPFP2lPEi5xrxshb7w90HR0u1fy0pprrJmuJC+i5qlxqg8Actg0yHp8bldkLosNkQtXSCLyBDkkNNtGilnea/NiFDBxHrRjHIG+dgmgdu8r6InFSidmJHuFqmiI/CtOuAWkwN8xjyS69cBYnKd3Veo9f4vSBKtr+sfUR1tbx5nTc4FDiaE7Ldw0+Z2MPbf3QUvXWJ42fTOOkPt6hhPy9IVp6SpWJHvU13P8a0p3tH42vbFWyEl4lUbx16D16R7IQUyyVn+1sJzAcKBLPiPF5nKqmD0FbqogGsUQLLGiw9atuwejMYFBroPKhqnhD1HKzk7APYiYTk8wEhm2I/j8OcQ0nX0Oa4Dtub6gUmlN/08oYw3EIRmCg1579AncdxEb2gPaFEjbdzlqGYg09oC6FL++leD4ysztI5SdHsCep8hQlGvihA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_023911_970591_7163F0A1 
X-CRM114-Status: GOOD (  13.33  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the Apple Video Decoder. A hardware video decoder present on
Apple hardware.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 .../devicetree/bindings/media/apple,avd.yaml       | 127 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 128 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/apple,avd.yaml b/Documentation/devicetree/bindings/media/apple,avd.yaml
new file mode 100644
index 000000000000..108b4971914a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/apple,avd.yaml
@@ -0,0 +1,127 @@
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
+  AVD is capable of decoding H264, H265, VP9 and AV1 on newer SoCs.
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
+          - apple,t6000-avd
+          - apple,t6020-avd
+          - apple,t8103-avd
+          - apple,t8112-avd
+          - apple,t8122-avd
+
+  reg:
+    items:
+      - description: DMA control
+      - description: Cortex-M3 code (unsigned)
+      - description: Cortex-M3 sram
+      - description: Mailbox
+      - description: Video decode control
+
+  reg-names:
+    items:
+      - const: piodma
+      - const: code
+      - const: sram
+      - const: mbox
+      - const: ctrl
+
+  iommus:
+    items:
+      - description: Decode related
+      - description: DMA controller
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
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
+  interrupt-names:
+    items:
+      - const: mbox0
+      - const: mbox1
+      - const: mbox2
+      - const: mbox3
+      - const: flag0
+      - const: flag1
+      - const: piodma
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
+        video-codec@289070000 {
+            compatible = "apple,t8122-avd";
+            reg = <0x2 0x89070000 0x0 0x4000>,
+                  <0x2 0x89080000 0x0 0x10000>,
+                  <0x2 0x89092000 0x0 0x14000>,
+                  <0x2 0x890a4000 0x0 0x4000>,
+                  <0x2 0x89100000 0x0 0x10000>;
+            reg-names = "piodma", "code", "sram", "mbox", "ctrl";
+            interrupt-parent = <&aic>;
+            interrupts = <AIC_IRQ 679 IRQ_TYPE_LEVEL_HIGH>,
+                         <AIC_IRQ 680 IRQ_TYPE_LEVEL_HIGH>,
+                         <AIC_IRQ 681 IRQ_TYPE_LEVEL_HIGH>,
+                         <AIC_IRQ 682 IRQ_TYPE_LEVEL_HIGH>,
+                         <AIC_IRQ 683 IRQ_TYPE_LEVEL_HIGH>,
+                         <AIC_IRQ 684 IRQ_TYPE_LEVEL_HIGH>,
+                         <AIC_IRQ 685 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "mbox0", "mbox1", "mbox2", "mbox3",
+                              "flag0", "flag1", "piodma";
+            power-domains = <&ps_avd_sys>;
+            resets = <&ps_avd_sys>;
+            iommus = <&avd_dart 0>, <&avd_dart 1>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 760791e3635f..4fabca992fd4 100644
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


