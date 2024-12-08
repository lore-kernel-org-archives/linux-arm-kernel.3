Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7283EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 00:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijn5hxrkaTVmMCGK2s49Fof0nRp2zbU7nwPzckeCES8=; b=VLRnnh3trt6i4j5oRyK9dAtUJl
	Fo3CTRVHxW7ZVbwnVfXWpg2f9kyplHRewv1tqJDOSSPCIHRHyElT8pLmuj48JpOCoDDiU1UGGasYc
	G8BFHkGc+FL1ikZnbohwscWpLtcWWTK13v3zJnXn+EtZuN48X9L41fhoU5KfWlIf35NHLzBdGMu5B
	aBVDurbkQC2Xn0UmADTw9tOA0TRcAE72+m9QFUO5VI6G5edjoJ/MwG4C2rKGYrMCvAsS9EnUt/74C
	lg2r+mrhsSiwwhJCMzAzh9fGB1Gny6sthNavO85LZoM3tw1ycGW+/SOYMyB6yjA6xtOyOi5V6RWbl
	2/P1WsRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tK55S-00000004bh9-3qNQ;
	Sun, 08 Dec 2024 00:23:50 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tK53R-00000004b8u-0KO7;
	Sun, 08 Dec 2024 00:21:46 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-385e27c75f4so2507348f8f.2;
        Sat, 07 Dec 2024 16:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733617303; x=1734222103; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ijn5hxrkaTVmMCGK2s49Fof0nRp2zbU7nwPzckeCES8=;
        b=Rfe0+RxVsKySikYqp0TvXRZKD2ha1/W2P8TTQ8kbw8lttla2VUok8Gv72E7+C5qeES
         EtLZPFvfw+8/IvGzQIWPH+TvB7dFf5SGp22CeMxRQBvny3JerLt3wVAiBZ3ufP7azFVX
         fvnQHXOYgrGBP3vM4WTDfyv2DWDjUH0S+sx0CL4pjvHBRYmi5WiMuzlo8jhVB/VYixpU
         UII2R9UH/VoBNuoaLE1XVmgHSmqeM2AWYuQnmfMeNdelVKcw66VmjQmwcPX1OyDh13o5
         fi9tjL6ELhe2j7ebOh/9kd+40DBRgh3mZI5CTWJ73iYJ4Zbrczm4Zn4uGr25RB1V1Tkk
         ILZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733617303; x=1734222103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ijn5hxrkaTVmMCGK2s49Fof0nRp2zbU7nwPzckeCES8=;
        b=ZgjG0ii/RmPh4B97Yz3mtGqb+Ls9mFdnBF2RnoYkpAtJzVLVEZWclrwibblGG56dvv
         WMkfVvuFtcONPs0cn6YFAb3OO1rgQjhTMpMTNXRFHXuJXPsFjk8LV4kiE5JuY2VkrvZV
         b3BSc9XBHqIFQPpJgedIYgC/kM7ga/bEyvmmntQqXCdoK1Jj5vxO9WGBZeFRLDuFgeDO
         kGbuOHNInXke7Rr5uGeeiovrLNbEw63TdG3N7pECrGRNqs3BNM653Ukhc6op/d/5vlxU
         diIPUy1SsrD06F3WJr7cFw7aZjrJq5QWIZTF6K5WesGUwXk410UK5zLiNjUGasU4924Q
         T5Pw==
X-Forwarded-Encrypted: i=1; AJvYcCUMhkUfBA3MjUv4pW3CArQ4bSxmXNGbgvidqy27lGqSgXJa74bFNCy79/Tuzc55jU7/SatMQt2SgPJPKhFmQvM=@lists.infradead.org, AJvYcCV8RAI2Tb/WZ9nyFv1mHGb/Npzblm5JlMhgERTUsTA+3GnN+eiR6v2QKT/acxr6ZwKDI13R84uBBGhGSccRtdxY@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc7TeLQGGoHdsED68AeJVOQHjch1eysHcY2yul45ocMiq0w9Vn
	skbqxYSAlbGsxZgqcqpaWqCSkYs6KciHBwk3Pik4qqoA7SXYqy9K
X-Gm-Gg: ASbGncuoPNXmtD9zbNNaeHJY0+KtMf1MzJGDrFmBNHphCNecw8BehM9ydtThArQSLBM
	jHkgE+e3lGWAc/FRPCW8EbXOk1dfTIrVMQ9By/YSmNs9v0IS1MsN8d4PDPbniShOZ8u1et4jAlg
	Yv/9aohkEmFDQx+rjymmSCYDfP+TLn/KvLvHY93blBRPrPWRgVsSLNua0Kam2ccnq4J9/TpqNSe
	mzkpxDvrcYPBp4M6pQppraDZRuS6wNYX8RbOAAUGWQCxFxfLZ09h3hcTjn1bGquKT7R6QubDANy
	JddV8iaHtawvBwGmoqc=
X-Google-Smtp-Source: AGHT+IGGiL/FLsNBOG6vRPCUswcq+8Yc5dOijL51ipWFUFNJsZCfrAtvBpeSGrtsADSVQ5NqdZOxyw==
X-Received: by 2002:a5d:64af:0:b0:385:df6d:6fc7 with SMTP id ffacd0b85a97d-3862b36aaa4mr6007262f8f.25.1733617303105;
        Sat, 07 Dec 2024 16:21:43 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38621909644sm8719170f8f.76.2024.12.07.16.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 16:21:42 -0800 (PST)
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
Subject: [net-next PATCH v10 1/9] dt-bindings: nvmem: Document support for Airoha AN8855 Switch EFUSE
Date: Sun,  8 Dec 2024 01:20:36 +0100
Message-ID: <20241208002105.18074-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241208002105.18074-1-ansuelsmth@gmail.com>
References: <20241208002105.18074-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_162145_127384_0C019E9C 
X-CRM114-Status: GOOD (  14.83  )
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

Document support for Airoha AN8855 Switch EFUSE used to calibrate
internal PHYs and store additional configuration info.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/nvmem/airoha,an8855-efuse.yaml   | 123 ++++++++++++++++++
 MAINTAINERS                                   |   8 ++
 2 files changed, 131 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml b/Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
new file mode 100644
index 000000000000..9802d9ea2176
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/airoha,an8855-efuse.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch EFUSE
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description:
+  Airoha AN8855 EFUSE used to calibrate internal PHYs and store additional
+  configuration info.
+
+$ref: nvmem.yaml#
+
+properties:
+  compatible:
+    const: airoha,an8855-efuse
+
+  '#nvmem-cell-cells':
+    const: 0
+
+required:
+  - compatible
+  - '#nvmem-cell-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    efuse {
+        compatible = "airoha,an8855-efuse";
+
+        #nvmem-cell-cells = <0>;
+
+        nvmem-layout {
+            compatible = "fixed-layout";
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            shift_sel_port0_tx_a: shift-sel-port0-tx-a@c {
+               reg = <0xc 0x4>;
+            };
+
+            shift_sel_port0_tx_b: shift-sel-port0-tx-b@10 {
+                reg = <0x10 0x4>;
+            };
+
+            shift_sel_port0_tx_c: shift-sel-port0-tx-c@14 {
+                reg = <0x14 0x4>;
+            };
+
+            shift_sel_port0_tx_d: shift-sel-port0-tx-d@18 {
+               reg = <0x18 0x4>;
+            };
+
+            shift_sel_port1_tx_a: shift-sel-port1-tx-a@1c {
+               reg = <0x1c 0x4>;
+            };
+
+            shift_sel_port1_tx_b: shift-sel-port1-tx-b@20 {
+               reg = <0x20 0x4>;
+            };
+
+            shift_sel_port1_tx_c: shift-sel-port1-tx-c@24 {
+               reg = <0x24 0x4>;
+            };
+
+            shift_sel_port1_tx_d: shift-sel-port1-tx-d@28 {
+               reg = <0x28 0x4>;
+            };
+
+            shift_sel_port2_tx_a: shift-sel-port2-tx-a@2c {
+                reg = <0x2c 0x4>;
+            };
+
+            shift_sel_port2_tx_b: shift-sel-port2-tx-b@30 {
+                reg = <0x30 0x4>;
+            };
+
+            shift_sel_port2_tx_c: shift-sel-port2-tx-c@34 {
+                reg = <0x34 0x4>;
+            };
+
+            shift_sel_port2_tx_d: shift-sel-port2-tx-d@38 {
+                reg = <0x38 0x4>;
+            };
+
+            shift_sel_port3_tx_a: shift-sel-port3-tx-a@4c {
+                reg = <0x4c 0x4>;
+            };
+
+            shift_sel_port3_tx_b: shift-sel-port3-tx-b@50 {
+                reg = <0x50 0x4>;
+            };
+
+            shift_sel_port3_tx_c: shift-sel-port3-tx-c@54 {
+               reg = <0x54 0x4>;
+            };
+
+            shift_sel_port3_tx_d: shift-sel-port3-tx-d@58 {
+               reg = <0x58 0x4>;
+            };
+
+            shift_sel_port4_tx_a: shift-sel-port4-tx-a@5c {
+                reg = <0x5c 0x4>;
+            };
+
+            shift_sel_port4_tx_b: shift-sel-port4-tx-b@60 {
+                reg = <0x60 0x4>;
+            };
+
+            shift_sel_port4_tx_c: shift-sel-port4-tx-c@64 {
+                reg = <0x64 0x4>;
+            };
+
+            shift_sel_port4_tx_d: shift-sel-port4-tx-d@68 {
+                reg = <0x68 0x4>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 79756f2100e0..53ef66eef473 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -711,6 +711,14 @@ S:	Supported
 F:	fs/aio.c
 F:	include/linux/*aio*.h
 
+AIROHA DSA DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
+
 AIROHA ETHERNET DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.45.2


