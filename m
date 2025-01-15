Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEE2E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 01:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Snarum8RemNk17GrbLyNHBNd9vFMQQrcExzWnVGfdHE=; b=I/9MMPityyt9fWYCI6mLXrYcCP
	yIK1c5cazM4E6zuxrmGzAhHI1tCr8EWP+6LErW52chPJL1miRxX6UEKdS/T2VCaVgAZyb58Lu9uj4
	r+mCsOex0Yp2MNM8L2JIqqPeuYfOijWMJHolNUlAC66NUPLMCJNYgJIniqtAWcophOMIogn32/qU4
	YYYjibWSNgKRvsUKUlbE5oEqhRto9K+LXRlCke9bg7f+vcusdHnB8NWT22Hnd7dN97vZbru8i7nr4
	d9Vn+RpjE84/gGkYZga5TMTU/2D91Adts+FiZowDqoaORYZpSUH0o8ZNxYTm6xPe0SVzvIZZRnQZg
	sy+aZ0eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXsEo-0000000AIkl-0J4Z;
	Wed, 15 Jan 2025 01:30:30 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXsBA-0000000AHoc-1xAb;
	Wed, 15 Jan 2025 01:26:46 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-467a1d43821so3505131cf.1;
        Tue, 14 Jan 2025 17:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736904403; x=1737509203; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Snarum8RemNk17GrbLyNHBNd9vFMQQrcExzWnVGfdHE=;
        b=RlBYqpQXSMclrLIkK5QJFbvI78cdqlLqLmzIAEK8cFPPMU4mvWWtX/hIuIqzzkLsDO
         xEU+sESSometqu8KewDHVzsvUmFzLMyCyvWB/4qTQZ1IPO4RaPWTEebLpmpI9pGrGhWS
         kQweic6NWvy9F4fdXGilhik/XRXFzv1F7eBfeiGfb3PBR32X/2iqe7asGlxf5rFeugLo
         cn9XzVaik3yocq5h9il/eeB8tmIc8PDVxORK0Kzhnpl7IeoLnZwVUhdmL6JlEXQvL6oR
         +IoOXYogUAgOcR2BrVFtLJZKEC+BlY00Yx3WOjMdofp/+wlD4lWz2g/NjKiSC0U8sAsd
         qzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736904403; x=1737509203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Snarum8RemNk17GrbLyNHBNd9vFMQQrcExzWnVGfdHE=;
        b=sVvhPjA28tPYivE5MDrjaI5OQjsnjedvJekDrVjGWPFdTwYDvQGIHvtMpMdTYvhuIo
         NZGA8MspeN3vfSfDTybS4vaLVs8hTCTUVzYjosckCPyXlIg7WQc24Ek0dRsSD3xHeKrC
         vaMW4lAuNwsaZsPM2slPhMzx08EmQZeRZIuy1OrmnK5etmko+0zdcb7TGmnvHlo3jO/A
         FTN+i6to4NqMOjv4GtCk8vl8pvQx261dzsMiFGhdeCdq5rYv2yBxc53cZlHagU0wtXo/
         jX6H93kW0ajZipkFez2QQSYaWt3APpOhV++/fOCe/pGfO+hPU6JlqgwXivz9Jd1qJNsr
         pfTA==
X-Forwarded-Encrypted: i=1; AJvYcCUVpZf+lh5thWDhtyIBHsO0bUVslh16lz0dMUooTKyWy92CBdnSWoXc7cOTmUBUM+mT89udHobHjAAz@lists.infradead.org, AJvYcCV//CWQRPgwvJz0JQ3V+37ebRkbDeEFgZu0/i4dAOe6hk0A2jHczOkVgtrSAb8KWqkh4wZx2djO0ObAeoNzNEc=@lists.infradead.org, AJvYcCW41DwUIZxfTiYeT9Kv6jVCDNtp3ziAQcDu2wx3NosV4kdzyV/uU69Z8fgsavcerNk5iGDTspnmBPxhqxKGoj+w@lists.infradead.org
X-Gm-Message-State: AOJu0YxZuS99uVOjAi0nKWbpCXUsQ6txW8cWr8ohfMBQfD4Ub0uirQvd
	DdPKvWR+Lmw2BeOY9nNbdVGfRjq/myjMGa1jw3W2IXott8B0PQYO
X-Gm-Gg: ASbGncsjCrYjHUDHGAk49PXv6bdZL6mWi8xZ6qzeWZ73dzrzAZ5q6ZDQxINIqWbjVqg
	IDCI9QB4NZNqwWidfORbIxevkz9eTdUNAyNPUDxnk7QOmiUQ0ffxrp0+osghJdjE2vN+cYKdBj2
	A48E+jShSYHaEbUnO73WvdqRbJEhTc4gsYfL0oV6hZP2ArcH9dVbU4zvsBp90Ef+fo5m+cajo5x
	kdqY0DMpyj02m0bCCZ43ySDZ+JF47Sf5yd8aju6wjwxZE/nq7E2nS8Q8gwRsp+mlmnq
X-Google-Smtp-Source: AGHT+IGOUmK+RMSPaiPxBiaoCjQrSZ5Ap13SAxkBgzinR11U70sZUt737IPnaRgevXgbi2ZEV1eQwQ==
X-Received: by 2002:a05:622a:181b:b0:466:9197:b4fa with SMTP id d75a77b69052e-46df5760914mr22651911cf.21.1736904403233;
        Tue, 14 Jan 2025 17:26:43 -0800 (PST)
Received: from master-x64.sparksnet ([204.111.227.95])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46c8733130dsm59933881cf.25.2025.01.14.17.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 17:26:42 -0800 (PST)
From: Peter Geis <pgwipeout@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: zyw@rock-chips.com,
	kever.yang@rock-chips.com,
	frank.wang@rock-chips.com,
	william.wu@rock-chips.com,
	wulf@rock-chips.com,
	linux-rockchip@lists.infradead.org,
	Peter Geis <pgwipeout@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [RFC PATCH v1 2/6] dt-bindings: phy: rockchip: add rk3328 usb3 phy
Date: Wed, 15 Jan 2025 01:26:23 +0000
Message-Id: <20250115012628.1035928-3-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250115012628.1035928-1-pgwipeout@gmail.com>
References: <20250115012628.1035928-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_172644_920456_D2226BC3 
X-CRM114-Status: GOOD (  13.03  )
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

Add documentation for the usb3 phy as implemented on the rk3328 SoC.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---

 .../bindings/phy/rockchip,inno-usb3phy.yaml   | 166 ++++++++++++++++++
 1 file changed, 166 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/rockchip,inno-usb3phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/rockchip,inno-usb3phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,inno-usb3phy.yaml
new file mode 100644
index 000000000000..cde489ca87ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/rockchip,inno-usb3phy.yaml
@@ -0,0 +1,166 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/rockchip,inno-usb3phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip USB 3.0 phy with Innosilicon IP block
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rk3328-usb3phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 3
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: refclk-usb3otg
+      - const: usb3phy-otg
+      - const: usb3phy-pipe
+
+  interrupts:
+    minItems: 4
+
+  interrupt-names:
+    items:
+      - const: bvalid
+      - const: id
+      - const: linestate
+      - const: rxdet
+
+  resets:
+    minItems: 6
+
+  reset-names:
+    items:
+      - const: usb3phy-u2-por
+      - const: usb3phy-u3-por
+      - const: usb3phy-pipe-mac
+      - const: usb3phy-utmi-mac
+      - const: usb3phy-utmi-apb
+      - const: usb3phy-pipe-apb
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
+
+patternProperties:
+
+  utmi-port@[0-9a-f]+$:
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        enum:
+          - rockchip,rk3328-usb3phy-utmi
+
+      reg:
+        maxItems: 1
+
+      "#phy-cells":
+        const: 0
+
+      phy-supply:
+        description:
+          Phandle to a regulator that provides power to VBUS.
+          See ./phy-bindings.txt for details.
+
+    required:
+      - compatible
+      - reg
+      - "#phy-cells"
+
+  pipe-port@[0-9a-f]+$:
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        enum:
+          - rockchip,rk3328-usb3phy-pipe
+
+      reg:
+        maxItems: 1
+
+      "#phy-cells":
+        const: 0
+
+      phy-supply:
+        description:
+          Phandle to a regulator that provides power to VBUS.
+          See ./phy-bindings.txt for details.
+
+    required:
+      - compatible
+      - reg
+      - "#phy-cells"
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3328-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      usb3phy: usb3-phy@ff460000 {
+        compatible = "rockchip,rk3328-usb3phy";
+        reg = <0x0 0xff460000 0x0 0x10000>;
+        clocks = <&cru SCLK_REF_USB3OTG>, <&cru PCLK_USB3PHY_OTG>, <&cru PCLK_USB3PHY_PIPE>;
+        clock-names = "refclk-usb3otg", "usb3phy-otg", "usb3phy-pipe";
+        interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "bvalid", "id", "linestate", "rxdet";
+        resets = <&cru SRST_USB3PHY_U2>,
+                 <&cru SRST_USB3PHY_U3>,
+                 <&cru SRST_USB3PHY_PIPE>,
+                 <&cru SRST_USB3OTG_UTMI>,
+                 <&cru SRST_USB3PHY_OTG_P>,
+                 <&cru SRST_USB3PHY_PIPE_P>;
+        reset-names = "usb3phy-u2-por", "usb3phy-u3-por",
+                      "usb3phy-pipe-mac", "usb3phy-utmi-mac",
+                      "usb3phy-utmi-apb", "usb3phy-pipe-apb";
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges;
+
+        usb3phy_utmi: utmi-port@ff470000 {
+          compatible = "rockchip,rk3328-usb3phy-utmi";
+          reg = <0x0 0xff470000 0x0 0x8000>;
+          #phy-cells = <0>;
+        };
+
+        usb3phy_pipe: pipe-port@ff478000 {
+          compatible = "rockchip,rk3328-usb3phy-pipe";
+          reg = <0x0 0xff478000 0x0 0x8000>;
+          #phy-cells = <0>;
+        };
+      };
+    };
-- 
2.39.5


