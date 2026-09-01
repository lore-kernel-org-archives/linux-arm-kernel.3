Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E87C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 12:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3SoUapY3IA8tD1+b3WHVHM5822Ty391/3XnWQKi5WWU=; b=N4Uw7seO6eIXQ1o2QHEvXv/Nq0
	G0T0G+7BQhFzMbP6IC4x3Huu8HIijep/7K79eQoeV/MiVMi5aYq1UM8Zo79Xt6eavcBLSELJFgYgG
	4pV3rAu668Wg15Zoc7Vilqh3Eh5rMkpdQhfMMatEKMwlZ2slGm93UyD9E1Ln/zRdCyI8OMEWCpApn
	4VIXXY3G/cIpaCUIFgEXhhSPRxabh/ywVg4UUkiWLliqJy/0MbCDIXGTDfBrPGodKNulwH+PTj1GY
	w3zAYDxrHEVM3ciaoOOcE7A9vxHppQ/uujJ+qlajmgtzs3XfN8u5CjfW7F2iFnweDXGk+UschIvOQ
	0uCISH0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1O4R-0000000C9D9-2DDg;
	Tue, 01 Sep 2026 12:58:35 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1O4N-0000000C9AC-2fcn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 12:58:33 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6a668cacdadso2050012a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 05:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788267510; x=1788872310; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3SoUapY3IA8tD1+b3WHVHM5822Ty391/3XnWQKi5WWU=;
        b=ePPYjQC6ZkumV82wFe5Zzjmo/OEROCwsFwGzanI5/KFWBWrz9FPXBcIpTsH1da3Aqg
         8al0Y7hWBLRsOZQ/YDf2OaUdv3/DfoFmuSxkBczias4rMyNJV5rL6ipHfVuPyXyYYHvn
         /gs74OGB55BfBytSvM6l9zHB8GuCtg47d9ysOneUV5lGycRiJvcFvxc4BtXoXMzfwk5t
         J/qth+adWsCtNwuFu0Q/DK8/Yex1knWWYXn4/ueNPguMveyv/3ri8rF4mGf1jFUf4vs8
         XbOy0QSAAPnDQo0vDCcz2qURKABIgDeg8GWzCLUZAem6zRwF2SCpm4ryZB16nsmkpPWa
         oaoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788267510; x=1788872310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3SoUapY3IA8tD1+b3WHVHM5822Ty391/3XnWQKi5WWU=;
        b=T6nPi7YSVaWvAP2wHXyb9NEOC6V4j52KDVvZdT1bdRpL9KWKsIpt+8i9+D7Ywhs5yx
         Jt/bPnmCDhDNNFuueRbqd8C9o8dCquLTwVqflTnWCx42+iiok8NW0R5UIPTE89Tg/hp5
         NjUmDyk35eSOdCAsyBGEYCBjFvytYAP3zup4hMczn4taUG12WjynDOgyACJOxUXHblzL
         y1iyOTz7AB3JU2LM19OqKc82zR5yFeo2EhKPJcMVNunLbTU23ipXxDQ9okzr9n9E5Qam
         w/9vV26N2L1NgyhQZInB7H2haJrsS/xcChFJ7OG45RfwEIPhOlPjrip3p64JkMjLZu9g
         6Z0Q==
X-Forwarded-Encrypted: i=1; AKwUvByGrdKw49mVi+4Ltn0QYu7mgDZVrNT45AcgA8d9JAVU0mgxmRmh00vIhulEQ8GJfwlfhNSmyL0CtLKM21zfiX2c@lists.infradead.org
X-Gm-Message-State: AFuF++n2+09cFuiq398SnmadCDEHbGp1ocVEkxfzL17dg53g6trZdqaz
	A/dV5CgiSbeD1bwPNNPaL98zs1nnJwTg9QC+Ur5r6X+3zmSFqQzdLrSG
X-Gm-Gg: AYBFou2MpESUSnFeSJvW2kKlzdzmO2Xg4847Z9SqICLYA8YNZm3/Cd9/txbBCgE05TG
	pz+Uo4DF6vmRiQwCJJJLJhMGg0K7vAYgOrCyO+y4adQqhZiiy/WKmeaWEfhsLpYVX/9Nl9XRSVz
	ii/yDKeLVQt9KE7j+nbhRR/H2G5OINKAPEqwzcOeOW1oxxmdtu2ifTsc+YASXiezjjAxqz221wZ
	CFD1OVGk+nJha+5/3ssA7qiYFwopP2ivnetq3GIu3/SGyjaDhYHvqTHTm1O6toLdtxDIymadwEF
	vlGoQzjCjXA1PWidwwnp72LCtJNzKutv5weRES5gcbXcRule04gKxHumlApOfrbMMfO8d5siAYl
	HrnNXoU/RdfOLjXWO1aiylsTMuFdXu87+qdC1u8gDTP8Eogsfuq9iR+xKc9HwrA1BHUVTrUnjel
	V9wvCIdmDPLavedqYxoHQRyTfUoeenJlTHsQPcaW9bA1se9TtScFShJEgtJGZUYjYF7OL0Aq/v9
	jFw7FdPk1O9kXOSBiEeu2W35a17OQLQbEWZEVgKWCy1b7DE6pr5NzX//Ep8M6M=
X-Received: by 2002:a05:6402:5048:b0:6a6:32f9:d7cd with SMTP id 4fb4d7f45d1cf-6a632f9d943mr12264712a12.18.1788267509677;
        Tue, 01 Sep 2026 05:58:29 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6a66d15d10asm773959a12.28.2026.09.01.05.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:58:28 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: phy: airoha: Document support for AN7583 Gen3 PCIe PHY
Date: Tue,  1 Sep 2026 14:58:17 +0200
Message-ID: <20260901125819.20378-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901125819.20378-1-ansuelsmth@gmail.com>
References: <20260901125819.20378-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_055831_744202_7D45EB51 
X-CRM114-Status: GOOD (  15.43  )
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

Document support for AN7583 PCIe PHY used to make the Gen3 PCIe port
work. Add the required register to configure the PCIe PHY and provide an
example for it.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../phy/airoha,an7583-pcie-gen3-phy.yaml      | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
new file mode 100644
index 000000000000..a8ec5ac781cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7583-pcie-gen3-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7583 PCI-Express PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description:
+  The PCIe PHY supports physical layer functionality for PCIe Gen2/Gen3 port.
+
+properties:
+  compatible:
+    const: airoha,an7583-pcie-gen3-phy
+
+  reg:
+    items:
+      - description: PCIE G3 analog base address
+      - description: PCIE G3 PMA base address
+      - description: PCIE detection time base address
+      - description: PCIE Rx AEQ base address
+
+  reg-names:
+    items:
+      - const: g3-ana
+      - const: g3-pma
+      - const: xr-dtime
+      - const: rx-aeq
+
+  phys:
+    items:
+      - description: phandle to QPHY phy for Gen2 support
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - phys
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/phy/phy.h>
+
+    phy@1fc7f000 {
+        compatible = "airoha,an7583-pcie-gen3-phy";
+        reg = <0x1fc7f000 0x1000>,
+              <0x1fc7e000 0x1000>,
+              <0x1fc30044 0x4>,
+              <0x1fc35030 0x4>;
+        reg-names = "g3-ana", "g3-pma",
+                    "xr-dtime", "rx-aeq";
+
+        phys = <&pcie1_phy PHY_TYPE_PCIE>;
+
+        #phy-cells = <0>;
+    };
-- 
2.53.0


