Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05112C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 01:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KDrJ8qKZmj8mBstfQ6vGXNiDtCIG1JEEtjpWX1LRrbs=; b=FnbCGf7ox+9vyxwH+4Dx7qgr7C
	4urr8n589A40jUyoTotgfopFdi6MzCDpGe6rqAMUKvfO8O1MvMqjX3As8Hcd//UGgVoj8tb4JmIIb
	/b6lEFVyoaAM9M2hXno4vSkj3xhz5N0kIto+1pM/O5d6jtSyCnw7i/3ggjLVYvBNjodUd1ahk+a7o
	DPCSY6nR5+sUFa9wKuE6c9IDBUlMZlmAqfNP0V1lOTUjZDr1LUJnT5OE02p3tZq6iw7RieReTocpm
	2z4DwC7h03b0CRR9/kXgF2FbFKae5DtBEY67ReTBooUAmp7V9WooXw7vRBYllwwwGbppwhYtG2Jb3
	+fT/hUfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1DJX-0000000Anry-0cBL;
	Tue, 01 Sep 2026 01:29:27 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1DJJ-0000000Anlp-2Xsk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 01:29:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Date:Subject:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc; bh=KDrJ8qKZmj8mBstfQ6vGXNiDtCIG1JE
	EtjpWX1LRrbs=; b=neH4wKOTMVDiAq663MQod/wpQltdEgJawCv689xw+qynvOm
	gYtXO5L2KLugIrnyAKI+/rE4K/clbNOjTLqJyFFcJTNK3j8iCCVFkVGTkiB8Z504
	JIjOIzjkxv+aDI6qSy9BI3hO25+yryPO492J0I7Uh40iuGkkD5+KOhVKEAww=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDnrwYZKpZqvx0AAA--.111S4;
	Tue, 01 Sep 2026 09:28:14 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Date: Tue, 01 Sep 2026 09:27:31 +0800
Subject: [PATCH net-next 2/3] dt-bindings: net: Add UltraRISC DP1000 GMAC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dwmac-ultrarisc-v1-2-f19454814bcf@ultrarisc.com>
References: <20260901-dwmac-ultrarisc-v1-0-f19454814bcf@ultrarisc.com>
In-Reply-To: <20260901-dwmac-ultrarisc-v1-0-f19454814bcf@ultrarisc.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788226062; l=3097;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=CYi87bj0peNiOasgsBO9R91QkY43F/FrkslS+8YFcw8=;
 b=uuv29OU19WBJ6Z9pIIHSRs3M1C3KwXTeNAyix/Y1l7CVrzlXYgJn+UEwsmv5LUJ4Acyghml7p
 lUgkIt7IJYkBrOicT04ldQCGyyvdvtuu8fFapvwBPioTe01Y6UgvL+l
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID: AQAAfwDnrwYZKpZqvx0AAA--.111S4
X-Coremail-Antispam: 1UD129KBjvJXoWxAw13Jw1UGrWxCF4xGr45KFg_yoW5AF13pF
	ZxCFs5JFs2gF13Ww4fta4xA3ZYyw18AFy3Awn2yw1UtFZ8uasYqrsrK345Zas8JrZrXa4q
	vFyY9r10ka109w7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmG14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
	WUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
	Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj4
	0_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8
	JrUvcSsGvfC2KfnxnUUI43ZEXa7sRipB-tUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAREWqVJKMAFQAFsp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_182913_991231_8ABBB63C 
X-CRM114-Status: GOOD (  12.45  )
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

The DP1000 integrates a Synopsys DesignWare GMAC from the 5.20 series with
one MMIO register range, one clock and one interrupt.

It also provides fixed TX and RX RGMII clock delays that cannot be
disabled. Board connections must therefore not add either delay in PCB
traces, making "rgmii-id" the only supported phy-mode.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 .../bindings/net/ultrarisc,dp1000-gmac.yaml        | 74 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ultrarisc,dp1000-gmac.yaml b/Documentation/devicetree/bindings/net/ultrarisc,dp1000-gmac.yaml
new file mode 100644
index 000000000000..13029302877b
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/ultrarisc,dp1000-gmac.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/ultrarisc,dp1000-gmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: UltraRISC DP1000 DWMAC Ethernet controller
+
+maintainers:
+  - Jia Wang <wangjia@ultrarisc.com>
+
+description:
+  The DP1000 integrates a Synopsys DesignWare GMAC controller from the
+  5.20 series. The SoC integration adds fixed RGMII TX and RX clock delays
+  which cannot be disabled. Consequently, a functional RGMII link requires
+  a PCB without TX or RX clock delays, represented by "rgmii-id".
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: ultrarisc,dp1000-gmac
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: ultrarisc,dp1000-gmac
+      - const: snps,dwmac-5.20
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: stmmaceth
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: macirq
+
+  phy-mode:
+    const: rgmii-id
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - phy-mode
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ethernet@38000000 {
+        compatible = "ultrarisc,dp1000-gmac", "snps,dwmac-5.20";
+        reg = <0x38000000 0x1000000>;
+        clocks = <&clk 0>;
+        clock-names = "stmmaceth";
+        interrupts = <84>;
+        interrupt-names = "macirq";
+        phy-mode = "rgmii-id";
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..3b96ff0734e6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28004,6 +28004,11 @@ F:	Documentation/devicetree/bindings/clock/ultrarisc,dp1000-clk.yaml
 F:	drivers/clk/ultrarisc/*
 F:	include/dt-bindings/clock/ultrarisc,dp1000-clk.h
 
+ULTRARISC DP1000 DWMAC GLUE LAYER
+M:	Jia Wang <wangjia@ultrarisc.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/ultrarisc,dp1000-gmac.yaml
+
 ULTRARISC DP1000 PINCTRL DRIVER
 M:	Jia Wang <wangjia@ultrarisc.com>
 L:	linux-gpio@vger.kernel.org

-- 
2.34.1


