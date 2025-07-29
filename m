Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E97DC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 03:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sC97MWLobOh/S2qDxEqJvrCM9xsOzzvzOwHMArgbe8c=; b=kvcMq/lWvk67EctwsOqPYcoGp6
	lB+qW0Bb0ELt2V+3n4/JL0D0qL7bRA38ErwZ0QS+1DFFWdnspf9raKBLmH4SF0NyPdtTAxQxYth+9
	K1HU2MaNrV7tJgTbMofrvOPwtM0d0Q6O7bzJud6Z7XRXGYualLQGeNkZ6UGxBXYyPNDix+3t4m6fC
	FVPg6/qEAmXpTmmWzpbDrSFxeGib8MUu5QOf5n5Iuf6MsHnaAZ9oqUZ7tJ1vd2hdBDu1RytEMLOvo
	NfiOpXdw2ksdgvp8C+1EDzQhKxV8a/vq9ug5P914AJiMgBcNUMQmY6F1Qcvu5uFd4nzaBugYzVxH3
	3Kj1wlnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugaqD-0000000FpaK-08i0;
	Tue, 29 Jul 2025 03:17:25 +0000
Received: from p-west2-cluster4-host10-snip4-1.eps.apple.com ([57.103.69.182] helo=outbound.mr.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uganj-0000000FpNh-0MKD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 03:14:52 +0000
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-6 (Postfix) with ESMTPS id B8440180024C;
	Tue, 29 Jul 2025 03:14:47 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; bh=sC97MWLobOh/S2qDxEqJvrCM9xsOzzvzOwHMArgbe8c=; h=From:To:Subject:Date:Message-Id:MIME-Version:x-icloud-hme; b=0gPJpvq9GIWB9lQIYyyY7S688ynFOZ8bBLnWcYnrLFzqZq81T5ESHgzIJMXttkTQdm268c7dtoCLcXaSNOls5DW5GLsouSlTHPC/Y4/3B3DEM7cJ3UG8VpiwFksQJSV6DMOD4wegUpB+EuJaZ75m0RajIb4m7tlbecPfpCMik3bVIG0R2DXPMtfd/GSprOOeREy9wtabsVQZo4EyOeXCeyKerTIaSo98bXS3aRgCUMMVsoL17YWeVbIK311ScZQgAE+8ZM2CiOsQyG9Jjj8Vif8FRGY1UKHFV936MVsidqrKl+Xx/Rb76ujeUpGxwdsE5RDvivtry75ke30g5R03Ww==
Received: from localhost.localdomain (mr-asmtp-me-k8s.p00.prod.me.com [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-6 (Postfix) with ESMTPSA id 34D6D180027D;
	Tue, 29 Jul 2025 03:14:45 +0000 (UTC)
From: WangErQian <WangErQianY@icloud.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: WangErQian <WangErQianY@icloud.com>,
	linux-arm-kernel@lists.infradead.org,
	john@polyhex.net
Subject: [PATCH v1 dt-bindings]dt-bindings: debix-model-a: Add bindings for BT and audio
Date: Tue, 29 Jul 2025 11:13:52 +0800
Message-Id: <20250729031351.3875406-1-WangErQianY@icloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDAyMiBTYWx0ZWRfXwzx+dO4htl4w
 AhrHQ4R3N8JdKVBf6l4vhOGp4E93H7+OINGlzTxj8zUCiZoGuxxCj4y4zaFOSJpBM3l9nuPNWCm
 SeSGnxE50hTvzkQtsSZfB4TxObXPVushzfJF9fPygyIOLZZlcuxJ3Wj5ssKLkfLvfB+DHMIv7eG
 9wNTGRk2HCmYHYS46ufPHgU+jDx/IlfRbcBP4c+sl0ZesBzeQ5IDQ6Qyki+Roowh7EMkp+jdPpc
 KkXyN3l1cENhKukZ0EmbLSd5xwzIxnEHytFX/75FGs0WBVAkBITcoWyG+KHJm/D6HDBfC2qLI=
X-Proofpoint-GUID: akMr2Fnscu99z0MYAZvhzYhSlFvXBvn5
X-Proofpoint-ORIG-GUID: akMr2Fnscu99z0MYAZvhzYhSlFvXBvn5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_01,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 clxscore=1011 mlxscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2507290022
X-Apple-Category-Label: MTEwNTIxNzAyOTk6JGNhdGVnb3J5JF9QZXJzb25hbCw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_201451_156440_9029CB56 
X-CRM114-Status: GOOD (  12.78  )
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

Add bindings for Debix Model A Bluetooth and audio

This patch adds device tree binding documentation for:
- fsl,mxc_bt_rfkill.yaml: Bluetooth RF control node
- fsl,imx-audio-es8316.yaml: Audio codec interface

Signed-off-by: WangErQian <WangErQianY@icloud.com>
---
 .../bindings/bluetooth/fsl,mxc_bt_rfkill.yaml | 70 +++++++++++++++
 .../bindings/sound/fsl,imx-audio-es8316.yaml  | 88 +++++++++++++++++++
 2 files changed, 158 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml

diff --git a/Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml b/Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml
new file mode 100644
index 000000000000..b173de7a4102
--- /dev/null
+++ b/Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+$id: http://devicetree.org/schemas/bluetooth/fsl,mxc_bt_rfkill.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX Bluetooth RFKill Controller
+
+maintainers:
+  - WangErQian <wangerqiany@icloud.com>
+
+description: |
+  Binding for NXP i.MX Bluetooth RFKill controller, managing power and wake signals via GPIOs.
+
+properties:
+  compatible:
+    const: fsl,mxc_bt_rfkill
+
+  pinctrl-names:
+    maxItems: 1
+    items:
+      - const: default
+
+  pinctrl-0:
+    type: phandle
+    description: Phandle to default pin control configuration
+
+  bt-power-gpios:
+    description: GPIO controlling Bluetooth power (active low)
+    maxItems: 1
+
+  wake-bt-gpios:
+    description: GPIO for waking Bluetooth device (active low)
+    maxItems: 1
+
+  wake-host-gpios:
+    description: GPIO for host wake-up signal (active low)
+    maxItems: 1
+
+  status:
+    type: string
+    enum: [ "okay", "disabled" ]
+    default: "okay"
+
+required:
+  - compatible
+  - bt-power-gpios
+  - wake-bt-gpios
+  - wake-host-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    pinctrl_bt_ctrl: bt_ctrl_grp {
+        fsl,pins = <
+            MX6UL_PAD_GPIO1_IO06__GPIO1_IO06 0x13059 /* BT_POWER */
+            MX6UL_PAD_GPIO1_IO07__GPIO1_IO07 0x13059 /* WAKE_BT */
+            MX6UL_PAD_GPIO1_IO08__GPIO1_IO08 0x13059 /* WAKE_HOST */
+        >;
+    };
+
+    bt_rfkill {
+        compatible = "fsl,mxc_bt_rfkill";
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_bt_ctrl>;
+        bt-power-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
+        wake-bt-gpios  = <&gpio1 7 GPIO_ACTIVE_LOW>;
+        wake-host-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
+        status = "okay";
+    };
diff --git a/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml b/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml
new file mode 100644
index 000000000000..35f13d656caf
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+$id: http://devicetree.org/schemas/sound/fsl,imx-audio-es8316.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX Audio Interface with ES8316 Codec
+
+maintainers:
+  - WangErQian <wangerqiany@icloud.com>
+
+description: |
+  Binding for NXP i.MX platforms using the Everest ES8316 audio codec.
+  Defines the connections between CPU DAI (SAI), codec, and audio routing.
+
+properties:
+  compatible:
+    const: fsl,imx-audio-es8316
+
+  model:
+    type: string
+    description: Descriptive name of the audio setup (e.g., board-specific)
+    default: "imx-audio-es8316"
+
+  audio-cpu:
+    type: phandle
+    description: Phandle to the CPU audio interface (e.g., SAI node)
+    maxItems: 1
+
+  audio-codec:
+    type: phandle
+    description: Phandle to the audio codec (ES8316 node)
+    maxItems: 1
+
+  format:
+    type: string
+    description: Audio data format (e.g., i2s, left-justified)
+    enum: ["i2s", "right-justified", "left-justified", "dsp-a", "dsp-b"]
+    default: "i2s"
+
+  hp-det-gpio:
+    type: phandle-array
+    description: GPIO for headphone detection (active high)
+    maxItems: 1
+    items:
+      - description: GPIO specifier (controller + pin + flags)
+
+  audio-routing:
+    type: string-array
+    description: Connection mapping between codec pins and audio components
+    items:
+      minItems: 2
+      maxItems: 2
+      items:
+        - description: Source endpoint (e.g., "Mic Jack")
+        - description: Sink endpoint (e.g., "MIC2")
+
+required:
+  - compatible
+  - audio-cpu
+  - audio-codec
+  - audio-routing
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    sai3: sai@40031000 {
+        compatible = "fsl,imx8mp-sai";
+        reg = <0x40031000 0x1000>;
+    };
+
+    codec: es8316@11 {
+        compatible = "everest,es8316";
+        reg = <0x11>;
+    };
+
+    sound {
+        compatible = "fsl,imx-audio-es8316";
+        model = "imx-audio-es8316";
+        audio-cpu = <&sai3>;
+        audio-codec = <&codec>;
+        format = "i2s";
+        hp-det-gpio = <&gpio4 29 GPIO_ACTIVE_HIGH>;
+        audio-routing =
+            "Mic Jack", "MIC2",
+            "Headphone Jack", "HPOL",
+            "Headphone Jack", "HPOR";
+    };
-- 
2.25.1


