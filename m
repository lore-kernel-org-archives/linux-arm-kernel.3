Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E000ECAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1Rt7Xhagla/1sOuAXTb1PZ0PCjuu0lMg8zPkfBBc8c=; b=kjXnR58gnFsTm0uRxuCExuemuM
	ee7W7lVbBsRcmJAS1eWPNjOPnv9PD+TtStWTzIUDxa34rd+MJP7Uyyi9otNbKe3BFZ4mgJuTU72HP
	ReiKT8JcggPph0YZu9Kx8g+2KMXy9+LMr9wTyLH4HCLLf/awsW1zGTfrVEZWC83k8uuSyiD6S7EXr
	hplxgMzoDo/Jd/bQgzfN3SfaSG8hlz9BCKpZSYAOIiuOOumEOI/Mh/0QklrP4IZijJ0ZZRj8hyFdU
	9vXCdHUgQHJu9zcBP/VTJTol6Kc0usT0OQ7sct+gVhQ4mbFAUck0NKzbgb708KAIGD2XYiWQgZY6G
	3ZswlXTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsFO-00000004tvL-1E4l;
	Tue, 09 Sep 2025 06:54:34 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvmSl-00000003I1E-3qJG;
	Tue, 09 Sep 2025 00:44:01 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45deccb2c1eso2807815e9.1;
        Mon, 08 Sep 2025 17:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757378638; x=1757983438; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S1Rt7Xhagla/1sOuAXTb1PZ0PCjuu0lMg8zPkfBBc8c=;
        b=HDdVVzZtGfwYSmGoqfs07ruQtxqFmC+w86Q8RjZ3qpLzmRS780UCgrBCFW6q3SMyw8
         ndVOPOJXnf/V+KHEzmHOpc8afaa2UT7f+XisNA/Y69bmqCaiWZ323mMtuUw/7zB/787a
         iu1IxfthyMeYQety4zIy+yeryWKEF41ha+zMXp8wdJ4JgHIC4Ey4KlbhZbtK3k7G3YPq
         ViJ89Ysrvk7rTY/A0om9zCHH0Zw9s0lit4QrpAOwcHyPiz8heq+PwwtnEZtdzLXv35VB
         WZ2+VXbpyMQh5V0GvjChw+cimZ73TI4iW2L8eUWGOpuYh5riQETeAOJ3z6nBLmDL61yf
         WiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757378638; x=1757983438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1Rt7Xhagla/1sOuAXTb1PZ0PCjuu0lMg8zPkfBBc8c=;
        b=gl5m1rhMbMKSs199tJ8kiVhzenxVeP96cYRIGpSgjUGhPljgrxQDyXeEZF1m+WGGmy
         I1QxjNtgQSyHRP79dTrpfm1+cioHcG8+DuJcDu1AjbmPTd/+P28+8o/nIkpsdTy47kfz
         Abavzm+35Nu1OD3WhSnF4LehqRTeu+7o32h8tOI15/Caq4r8xOPuNHEsCIf7hLQHQUXM
         b6QIx147kXZR1FPq0UgGjpSE27ICrYx9qr5P7//EHKC3eZNsQcoxW2njmr8NJk5TdUhf
         xXFMkFK08DNUtiqOXf92EjHgmfGmsZ7z6ln3gn21lfoLi0uwJrP/ojF755WjXWMETGsd
         z5Mw==
X-Forwarded-Encrypted: i=1; AJvYcCVcUR6p1DF4DpSwxOnfGWNVEfiFGzZHle3yMtnORsRFyfeOPcpzC1oDQIEmEWGfZX+ikXNpjsfI6tHaoovuBU4=@lists.infradead.org, AJvYcCXjLjiuPIdf9RMDoRfajrPbX7qV+5oWAtw14X2+XmEVGsAGU4TKR3FjNc+TsNoCJ7jbSeHzhrBHhH/lgfwHg34A@lists.infradead.org
X-Gm-Message-State: AOJu0Yxzthk+f1W3ITJoYbMSUCBpHvUdqI2CmeXykF68QPPRJB4SKqlV
	KRV6cgJGNSiL2vACCJQGyu1gQpyqXMAZa5Mqq2JDDVkIzsUHujdkyn+A
X-Gm-Gg: ASbGncukevcEcnKMKavxvPGfhVWbytGbUp19IEhb4tuTE5q8pCml77xz4pFS3PvuzCS
	eNd9Uc6bHWAUqsXuIO27BwN+sNMbm1LkPW89Lr/k8Mi2mKqLZ43QmkgPPrxHDGKpD9Jw3rvxh1X
	y5YEJ35kpAI2aGpkb2U/JmxcZEcZ2RKkwqS11BkdWTSnlUhkcdFBE9uk3NV2e6etPEYBWHYVsc8
	r9QQqSP6vy6pnEtnuuAv+2FK8vOw0hE/8+OBsNcfF5cL0yZmxSkZ0NU4rc6OSRn1kAMkxquTolu
	fdHh9apwirMVYXp0tx1O1Y1+ZtekKc9AfxwLkxL6qgetYlfkNHnqpRd6Shywveo0mo7eeayOnzv
	GfdVx15EalVvvQqElLmpcKCaWBhFjf1WVvgbR1vd+VgdMXUeoD1rb7wTzXeebFh430STCg5I=
X-Google-Smtp-Source: AGHT+IH4fR25pWBi+Eso5eUx8LzkAeJgMnV5or5n/TPST37oWJJmARJzYxZ4bt16tKNwwHA9njw+KA==
X-Received: by 2002:a05:600c:4513:b0:45c:b5bb:7b51 with SMTP id 5b1f17b1804b1-45dddeef994mr102260215e9.30.1757378638283;
        Mon, 08 Sep 2025 17:43:58 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45decf8759esm13526385e9.23.2025.09.08.17.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 17:43:57 -0700 (PDT)
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
	Srinivas Kandagatla <srini@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH v16 03/10] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Tue,  9 Sep 2025 02:43:34 +0200
Message-ID: <20250909004343.18790-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909004343.18790-1-ansuelsmth@gmail.com>
References: <20250909004343.18790-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_174359_952750_615889FD 
X-CRM114-Status: GOOD (  16.02  )
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
2.51.0


