Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AEFE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 00:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oyu3ehXETXIiFtVp5aryqXyxocs+xknXfqTCPmSqxIs=; b=05MePUp1qGWX/punB6lAw7FPmX
	xbvBtJ6NEUIutyQ2zWCNkJlgxkUoUOElcC5yHc+JWMGKWf8uTP48oYXf9bxvWKio8/S6EFHDcsBza
	CU0nm239GcKzzuvOnh0/4GTx4xIGC3jed0X22ynNLOQmdyOI2plnM/YGZ2wx7Sooq9NUsHC5uUrkZ
	jGwYz61lmK3UgPf1Pl+w8mVRVdvgaoew0+fNaCm34q7Eo3hVsQXgRDRtM9MYrtca0m8zhE6fi4lzr
	YyR0JC8SAhMnteiQcaklI961oZdgJoxGi23qHq0fbaXxmO3/1IMQTjzXuxgFV5xXETPHJYJolE1H5
	Is49Xhog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tK56T-00000004bwa-0eSI;
	Sun, 08 Dec 2024 00:24:53 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tK53T-00000004b9T-3PFH;
	Sun, 08 Dec 2024 00:21:49 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso879493f8f.2;
        Sat, 07 Dec 2024 16:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733617306; x=1734222106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oyu3ehXETXIiFtVp5aryqXyxocs+xknXfqTCPmSqxIs=;
        b=aHKXk2Ck5gWPr2iKFvcfye3ZyHMSunDMLISte26GQx28MBbkeLx1jalQwREnDpXQV4
         XGPa8ARMvK2Ni8C/vxKrpDG6/p4H4Dv4Tc6NJbWXUbQsP1fQ7ozZaub/9zO/bqNpv9vU
         23VgjJPo2KULTFcaC/Xb3y2wSUtT8R5k4OwLzgQ4yXkuk/I06NQZx2GHFFxTYNg3N/tv
         DaMkxDWGBex2F6Z8YIBIXHkFhf9KGDx8MuUmO9hV1UwL/HRXEQPsfvmLK/JZV1CVK0ZX
         p4jW8Am8J/504gmJ4MiBtHaJ+T6hW2aejBhHMSOtHxI+oD5VbpTN3mxW0bitVoZgcSwo
         x+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733617306; x=1734222106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oyu3ehXETXIiFtVp5aryqXyxocs+xknXfqTCPmSqxIs=;
        b=lGpsfafOPDtnFLFxlZ0RECg37j69jolUVcWTRXwiE6U6HzJmCXfczt5jyOjdXpdCKr
         FFV6tnTTHz2ZKnHpzHy2HC2/9hnQ5ohXqxf1ywNmnaGJ4aTzkGQVHRCjTUv9mKP4xvMY
         IXvHbQTblcrRao6NrixRWxTYCz17XuDmiv1meey8oXdsyo2s6+r3fO6wt7xvRc5AElyW
         2rJ8NcezywrqKKFqkCKuSbq+gujphJwLeP6Aw5hsbhQF8BSOlt3+3HR5iLbFj+DYUKa2
         W4j0Vf7JUgcV/fvIa0yfZxbizOA8IGTV5erziI5jKVBneWNHpur8fHhJHz7rY+FX7KEB
         XKSg==
X-Forwarded-Encrypted: i=1; AJvYcCXCZRqhPbf+Akf2fElw5cE9OL0BM29il0t/AA1Fc07XlPDZdPH3Gx22mnNCdjD9aSZhVE/FU1W/y8soDb3HM7ip@lists.infradead.org, AJvYcCXMaK/z9oH8lqNaqAxGGRPnXw+BOm3hkRgIXL/um4lcycjWcRFZkqBDFJ6WxmnUdrm4BAvInlq/0W6tZjxWT7s=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx03Hen1YxzJaxiD20feTS9TX8shwSeUcZLBVv3x46Ohh1ZroP6
	qOUo++xjL425UcUqYAPH12MlAuZfBAadnTTdJDEfFPc7JMRFvhDj
X-Gm-Gg: ASbGncvGkpFWqeUmYRik+Ibs26FesPze2Dfmk6fcSmwIRTnGJi9MMQv3ZnStyiiuxYg
	iEeZBAbWDlF3EVFXIptQimzE/cr0osgOs1I7tumr1KkgrirrUR8YctIzycvXm1OxyqNL7EWK6HR
	9Xnwvc20Kgu/02hJfruG6YwSuOMykedvbrnOQdx8JuqIgo8q8bexzbnVJh2zCZo04DH0mZ8s/NR
	eeh1hH1e45UaOeb/mh55ce2/Rrn+Y5Cm+sPyH6/LYmzB/tCTDgUPNh9L97GTRqVzz+caq13g62+
	W7nYclKt4T9FGdk/ZDk=
X-Google-Smtp-Source: AGHT+IF6AJvvhgXizcyh7QS6Bt3PlWzOx0dC0lYX/21wuSbaG7h0JBOcjFmtUcYE5mCPGg4Q6lkAPg==
X-Received: by 2002:a5d:64c6:0:b0:386:3213:5ba1 with SMTP id ffacd0b85a97d-38632136075mr4118225f8f.24.1733617305885;
        Sat, 07 Dec 2024 16:21:45 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38621909644sm8719170f8f.76.2024.12.07.16.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 16:21:44 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v10 2/9] dt-bindings: net: Document support for Airoha AN8855 Switch Virtual MDIO
Date: Sun,  8 Dec 2024 01:20:37 +0100
Message-ID: <20241208002105.18074-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241208002105.18074-1-ansuelsmth@gmail.com>
References: <20241208002105.18074-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_162147_870598_B132F0CF 
X-CRM114-Status: GOOD (  16.81  )
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

Document support for Airoha AN8855 Virtual MDIO Passtrough. This is needed
as AN8855 require special handling as the same address on the MDIO bus is
shared for both Switch and PHY and special handling for the page
configuration is needed to switch accessing to Switch address space
or PHY.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/net/airoha,an8855-mdio.yaml      | 86 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml

diff --git a/Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml b/Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
new file mode 100644
index 000000000000..2211df3cc3b7
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/airoha,an8855-mdio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 MDIO Passtrough
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description:
+  Airoha AN8855 Virtual MDIO Passtrough. This is needed as AN8855
+  require special handling as the same address on the MDIO bus is
+  shared for both Switch and PHY and special handling for the page
+  configuration is needed to switch accessing to Switch address space
+  or PHY.
+
+$ref: /schemas/net/mdio.yaml#
+
+properties:
+  compatible:
+    const: airoha,an8855-mdio
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio {
+        compatible = "airoha,an8855-mdio";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        internal_phy1: phy@1 {
+            reg = <1>;
+
+            nvmem-cells = <&shift_sel_port0_tx_a>,
+                <&shift_sel_port0_tx_b>,
+                <&shift_sel_port0_tx_c>,
+                <&shift_sel_port0_tx_d>;
+            nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+        };
+
+        internal_phy2: phy@2 {
+            reg = <2>;
+
+            nvmem-cells = <&shift_sel_port1_tx_a>,
+                <&shift_sel_port1_tx_b>,
+                <&shift_sel_port1_tx_c>,
+                <&shift_sel_port1_tx_d>;
+            nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+        };
+
+        internal_phy3: phy@3 {
+            reg = <3>;
+
+            nvmem-cells = <&shift_sel_port2_tx_a>,
+                <&shift_sel_port2_tx_b>,
+                <&shift_sel_port2_tx_c>,
+                <&shift_sel_port2_tx_d>;
+            nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+        };
+
+        internal_phy4: phy@4 {
+            reg = <4>;
+
+            nvmem-cells = <&shift_sel_port3_tx_a>,
+                <&shift_sel_port3_tx_b>,
+                <&shift_sel_port3_tx_c>,
+                <&shift_sel_port3_tx_d>;
+            nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+        };
+
+        internal_phy5: phy@5 {
+            reg = <5>;
+
+            nvmem-cells = <&shift_sel_port4_tx_a>,
+                <&shift_sel_port4_tx_b>,
+                <&shift_sel_port4_tx_c>,
+                <&shift_sel_port4_tx_d>;
+            nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 53ef66eef473..e3569fe5f3de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -717,6 +717,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 L:	netdev@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
 F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
 
 AIROHA ETHERNET DRIVER
-- 
2.45.2


