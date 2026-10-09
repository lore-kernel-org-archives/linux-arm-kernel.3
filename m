Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA180CA9EC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 18:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=; b=us2uJvbEfyCO/HpDAOASS4NQcJ
	qYc6fsGzpVG4p/iX7CJ/FNy821I8VTj/awgze//sJQRmoJVF8HqEyrK+hoUxGvQjZMT7hCL06Cb2h
	p09EVthoC+kD6eKQQ2yJkFDn7neRxevGOzQt0wYi5iv7WdgXRfxO5S5FKN2CcuUTmtIv4mgffdzd6
	PxVVEV5j+srCU2Et8feLSO4M4/wblnNXWJS56gS8+40aflK6460MjJ87wUOMuHTMa3k6yAlr9Y50/
	oT8x9nb4n+FH/QHHKHoinhEeTTkonodFDU99wcVMxjwCYdMP+L1pxxPW3NbsbU4xHWvUcgzgOaURD
	8myW/qxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDBr-00000006cR4-1g0u;
	Fri, 09 Oct 2026 16:11:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDBn-00000006cN9-30bk
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 Oct 2026 16:11:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=; b=FqvkZTxDej7Sb2TALyo7TQFfA3
	ALISoulVjsB+12xYCSeZh8lOTw8v3XsXWRLTqID4QAwWIVxcSCMy4NOqe9vzk/ruVMxdQ+T64svIP
	d8mwoeFIlBZt03xSyUNxKSAG/w15Lt9NEYnrSEnxjPABMelvBQWXonPPIIEnPNdEdua4dGgCGaCMh
	+AlHjG/kAPBe7uIYAVg0HKPckUXD/Z9sSvW+4b0m6eis6OD+MTzmxVOOKTg64U1FebCSPtv82Z14d
	1Fw3uHAFar2uVwhtqr9QZCiB6mGdcJngOwovsAORaY2bgkPvguPj0LT1ycuJTpw2c1ICa3VBkxoI6
	SjnxVjPQ==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFDBk-0000000BOk9-2XiR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 16:11:18 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so142495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 09:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791562275; x=1792167075; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=MFjPsqeUJpzCkq3qtX2AlSDnyvEzTf0fozk/L7K+uwfktc7DHl/17fF/1/DB4ZF2v5
         rOYpf06x/9e7F2uYQZMt5m8IQTlen50yjeta3sQqvXHJgEVvbfeQm2pzJRM6pG/pctoN
         kFDdDO2aTqrWIhYabz2nq8FibZ6JZEFrnh/rccsw2N2HmTIYPEEivWiR+5r56ih288lN
         jsLRBmGm1AW3R5ptzuB4c0/oeMJWNITZyU5xLvlsxCMavv6NV+hFcWpuoYSV+fm7X2RP
         agrz0nEbh7RXn6aH7f4xy3+/nbYhjqdd7s308VEXFEDTjxh5CttG65CHbVxVlo8S5jZT
         vMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791562275; x=1792167075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=wa1J4ZP/yMDs3IfCueVSVHqMsR04J2z1NxWmR566KGogvKWXBKjurClpCi+VMwLiaq
         7ftCojSJ8zAI9CHrwiaJrHVEJhIz9hR3BwmwOey8/cfr7D+0d6hYOlJUPFyzYYnQ/pC8
         KClEjkCFuOq7ITIu5xl4YAi43LgRrjagrZszaIuiZOV1R8jEQgeEu18zX38VNv14hYXY
         +De7JN3IbClSxB+Cr25uAB9rkzDZKjIuudjY9uKy9PER+hpV0E6tWcxAUPcPMyqYeagj
         dV/F51oONI5/LqAzizDJByqwmOecpknkwkNCNrdOnRu+jxGLavyW4sZonZEeEB9qKQ1h
         meCg==
X-Forwarded-Encrypted: i=1; AKwUvByF2c3qx3i2JFVapXhQq64DOS7hiVGL995jBL8qbgUKqkLaf1wrxcTNeV2JNvHRvGBmInEqYZukUqdAuR0FIODb@lists.infradead.org
X-Gm-Message-State: AFuF++lQj+EQrRNFSWUhpVcEVe6hcBYkXmLHYuefwBDIVBgxt6mYkPFU
	kVAHDYWZn5kGx9uVNGqlBSdCGCQMX9xSEe3kHhdlVb1DU7trSF0YP+Et
X-Gm-Gg: AYBFou1/HBpoIyszKfpICpu1Y0CmRZDFO8/oxxrVcIo/UnL+2GFdRxN8udsHDaEoGfy
	bPuFYIAuhuljCQSTCsny7Unv1tJIbulycga/XAp8hoyLzA20mB5v94nBIJ0uAQ2+RpS+cBlPhSu
	TaWno5dRq+Kh5GfKVkvqNwlTrcC1wWRtKw6Ad1uZNYzcaU+HFZVQBzG1c/sW2sN9hMhAI/2wy73
	EeBYnOtlkCxAZkgq5XyV/Rf7eUkj1IsKdnoT8HdFQzO3XK8/InKx+I4yndRkflCVJ/bRW+jSn0z
	M6VSbkagVGDhLrxdckpjAuAgujQKzk+eYMGQd8DxXVtep0uW8vvJdcaZxzPHP28AnL3bbeUcNGu
	GLcM4tdx2tqCJrBXIvj1YFTd041VVBUQkNFMnYecPvXw4M//J63ZudJnrWV2x6a16c7aToqFmPj
	pHBIm+h8cBdDtV0+N1ztbjtH7CAglK6NhxTU9HAAfIsZl9V3ttyLj+5bH1o8ry9O9ohUm9GCtd8
	E6Odbt+VztLboyRcpLkVVunZLxam4EAs1OXzjf69RfGQAapK6vovjl2OXtatv2Pg4l1KaOkiFVw
	bJtFRHNrxawNygC5Lg==
X-Received: by 2002:a05:600c:37cc:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4a18e44396cmr51955465e9.2.1791562274820;
        Fri, 09 Oct 2026 09:11:14 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db94e2f08sm4744701f8f.15.2026.10.09.09.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:11:14 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Joris Vaisvila <joey@tinyisr.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v25 02/10] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Fri,  9 Oct 2026 18:10:47 +0200
Message-ID: <20261009161102.38961-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009161102.38961-1-ansuelsmth@gmail.com>
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_171116_934685_FF298373 
X-CRM114-Status: GOOD (  18.04  )
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

Document support for AN8855 Switch Internal PHY.

Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
PHYs on the MDIO bus.

Each PHY might need to be calibrated to correctly work with the
use of the eFUSE provided by the Switch SoC. This can be enabled by
defining in the PHY node the NVMEM cell properties.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/net/airoha,an8855-phy.yaml       | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml

diff --git a/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
new file mode 100644
index 000000000000..d2f86116badf
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/airoha,an8855-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch Internal PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
+  PHYs on the MDIO bus.
+
+  Each PHY might need to be calibrated to correctly work with the
+  use of the eFUSE provided by the Switch SoC.
+
+allOf:
+  - $ref: ethernet-phy.yaml#
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - ethernet-phy-idc0ff.0410
+  required:
+    - compatible
+
+properties:
+  reg:
+    maxItems: 1
+
+  nvmem-cells:
+    items:
+      - description: phandle to SoC eFUSE tx_a
+      - description: phandle to SoC eFUSE tx_b
+      - description: phandle to SoC eFUSE tx_c
+      - description: phandle to SoC eFUSE tx_d
+
+  nvmem-cell-names:
+    items:
+      - const: tx_a
+      - const: tx_b
+      - const: tx_c
+      - const: tx_d
+
+required:
+  - compatible
+  - reg
+
+dependentRequired:
+  nvmem-cells: [ nvmem-cell-names ]
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@1 {
+            compatible = "ethernet-phy-idc0ff.0410",
+                         "ethernet-phy-ieee802.3-c45";
+
+            reg = <1>;
+        };
+
+        ethernet-phy@2 {
+            compatible = "ethernet-phy-idc0ff.0410",
+                         "ethernet-phy-ieee802.3-c45";
+
+            reg = <2>;
+
+            nvmem-cells = <&shift_sel_port0_tx_a>,
+                          <&shift_sel_port0_tx_b>,
+                          <&shift_sel_port0_tx_c>,
+                          <&shift_sel_port0_tx_d>;
+            nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+        };
+    };
-- 
2.55.0


