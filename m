Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C2EC02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 17:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lsh895Q8WtDScWQk6Rn2jKxs4D0R+v3/GWuWWLF8TXE=; b=HPEZhaIyOYdiML+oJPJ358f4xE
	ND73B9+3Xlf4448rYgubBbo3n1J2iwtkYyGyoL4lCtiUe2u2WJtEz4zB461RRUaLDd7DjfsmZkrF6
	NzpuAsKmA4hUBqBhxYYcZVnG9/dJIskU6SY/5cIGyAB2dAeJaq4wUjwaYUv+28dQoQe1yaJGrRG3M
	HhfXhWWi4LX1pNslsnFnO94/GE5fal4cPlxOz7kwY2edEi6NYR5Ol5FsCiqSeMYBpyXhqYa9gsJJo
	PoZ3jhlmd9+ksk9wkYKOMCcnOdg4hiJ8/G/QaUn018+vb+uWkqteNtmnYjR7TAjxyEIzMtKcQH3bf
	rCPbhNNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7KV-0000000Ccrc-39VD;
	Wed, 15 Jan 2025 17:37:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7Go-0000000Cc3f-156A;
	Wed, 15 Jan 2025 17:33:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DECA65C59C2;
	Wed, 15 Jan 2025 17:32:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2BD4C4CED1;
	Wed, 15 Jan 2025 17:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736962413;
	bh=ARIk+9NqKhtoui7VcoODdebFlMlXwR30ub418qR58tU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TlSy8LDzXzOpjtwdPVFvEoFYT5N4F0Ihzwa6yNDZcOwznO6ZdICydVjtcR5R7K0rV
	 uDKvTGYd8ZabNxiBnJVuRmUtzg1WukP5y48WbmZXSRbeMhAqQmTj4jDJHfl2NNmFvq
	 VuLIOKm/3Ged7F72b4oM23o6MYD/K0oZ4r7/Y1W7HaWAJ8hREhayGbOeZmlM2KFYVw
	 WYu8IJxt7mtbXxDy60i523oY75EPjXOmA+hjWHtp5tZwG/v/GoIsnI0QJbKffWOFTl
	 +zMnA2SiScgNhSs86S+uP9/VzdVhgwL4hCNsno3PWeLhTBhz4yCOSffOE19tT/9/Mk
	 qOIt2wgF3GZJg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 15 Jan 2025 18:32:30 +0100
Subject: [PATCH 1/2] dt-bindings: arm: airoha: Add the pbus-csr node for
 EN7581 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-en7581-pcie-pbus-csr-v1-1-40d8fcb9360f@kernel.org>
References: <20250115-en7581-pcie-pbus-csr-v1-0-40d8fcb9360f@kernel.org>
In-Reply-To: <20250115-en7581-pcie-pbus-csr-v1-0-40d8fcb9360f@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_093334_346890_D5BC951F 
X-CRM114-Status: GOOD (  12.75  )
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

This patch adds the pbus-csr document bindings for EN7581 SoC.
The airoha pbus-csr block provides a configuration interface for the
PBUS controller used to detect if a given address is on PCIE0, PCIE1 or
PCIE2.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../bindings/arm/airoha,en7581-pbus-csr.yaml       | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/airoha,en7581-pbus-csr.yaml b/Documentation/devicetree/bindings/arm/airoha,en7581-pbus-csr.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..80b237e195cd3607645efe3fda1eb6152134481c
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/airoha,en7581-pbus-csr.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/airoha,en7581-pbus-csr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha Pbus CSR Controller for EN7581 SoC
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo@kernel.org>
+
+description:
+  The airoha pbus-csr block provides a configuration interface for the PBUS
+  controller used to detect if a given address is on PCIE0, PCIE1 or PCIE2.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - airoha,en7581-pbus-csr
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+      syscon@1fbe3400 {
+        compatible = "airoha,en7581-pbus-csr", "syscon";
+        reg = <0x0 0x1fbe3400 0x0 0xff>;
+      };
+    };

-- 
2.48.0


