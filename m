Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8018FE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 13:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijn5hxrkaTVmMCGK2s49Fof0nRp2zbU7nwPzckeCES8=; b=3kmS3MLsIAzCeq5Z179X2nDsIN
	Xj28j9cW/g39gpzXdg8C7ueWsit5s5snUYfVrOo5mpPrK+jcmkZ1gyqN8+6wDtgVvOMbCtX8uBnXw
	kVcmwMGXesiaXuamS7mrArUR12UprTDjP9v0jCysGFfxFwDEZpb1Qu5qmz2vpzC3f3JFiJro4HbcI
	lVg/Ll/hpoHrIp7eg0fAE/JDF1TN51Rgt7rX6xcyYhQaw2JHiHxkalTd4qfkC6WpeGAyLzlO80D2A
	wyoRqvqaCqc3dTuReJ95eja3npas2FCb1N3DWi2+OTVMy/A/NW2MUdiS+pdleL3TqTShQU42lOeHq
	/WxitndA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKe74-000000084AH-2Jk3;
	Mon, 09 Dec 2024 13:47:50 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKe50-000000083Wl-3opc;
	Mon, 09 Dec 2024 13:45:44 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-434e8aa84f7so18771375e9.0;
        Mon, 09 Dec 2024 05:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733751941; x=1734356741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ijn5hxrkaTVmMCGK2s49Fof0nRp2zbU7nwPzckeCES8=;
        b=Uvk7enMiAhwb+C18zJoDTeh+6D4tx8t6p2JbR0kDwUFQ1xrl1UU6lJR5yavlhidGTz
         gdptD1Z6le5HxAopqiMzES+CmjDR8OZYZjjY/HkO5xZCeIZ9+RbJY2VFQuPbNTJKqYki
         OSPrKhwP7R2azb16mmelz4CLBGFdyCaiz7wQKrScRqJWszHU0K9594KSK/+UifGmlC3g
         WL9YuEX/w8ESHqKA1bZ4tYBCaaaKTlBO0otF3eOxUdf7QU70orBt1IOvAOhCTd8Q3mbT
         DZrbRxWUc7sM1TAPuhVP35Z0JNe3c9hZyfm2aTY00T7zPG50me7Y9w5C1XD54Z/FyPei
         h3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733751941; x=1734356741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ijn5hxrkaTVmMCGK2s49Fof0nRp2zbU7nwPzckeCES8=;
        b=Cx3DPjNYYiQz2OfNxQ3XFuZbduK43hfindE21V8BWJZeJLPWFmQwZNASAvLOWLXCpY
         Izm8K5NVsjtgu0ln5GxRdOsru+m9yhcELwgxzATlf7aX8hgqSfqix4NLI+UWLN48SHMi
         9xEBoWhslv2h3Zb7SzbnPlmjkAVWHQdsTd54kW2k9WoLq46t+SL+DsnguiAg7KRHEfrZ
         FnNtz0kSlMrWzSCh20H09cQAsazQ+v85mRQx04AmUnl5VGSzJOu5DmxTtbtHrYLTYTSH
         vuCmPMBx6hqy6VMBqKsiRxDR8HDwko9xuMGu7/qViu1p6MXrBkEVw6bDz09GulgIKPKn
         +kUw==
X-Forwarded-Encrypted: i=1; AJvYcCUqi339vmK/6IW7qhB0bZoFjNOxh6AGwVlYFlBaCvTH4JeeuxPfMckVb2D2ipd57qwrh62x32Yds8OFPZsFWqQ=@lists.infradead.org, AJvYcCWcAYEshdh88vLoLENR9v1i54e0ne/gpULKOpPwijGyD4ZZJONYPW9Oi0Yl51JNjwGzWDISRmv/7yC/Mw/rzLo0@lists.infradead.org
X-Gm-Message-State: AOJu0YwZNNi0tjJjRIL4N1nkBFxkZnqdImIHW4VjrT9pk0Bm6YoV+IOi
	SOOUcHg2A3Ss+W1pqTxOqjXy0R650twJ5tcxBGCRC/oHfJkTKkQc
X-Gm-Gg: ASbGncvPEoc8czN+5IhKlfKvIIYN1oyurcTG55rovgOsUpuEPQbopO/oqHFDC69BEC/
	+L58oECprmrVF39P2GZ/xyVgoIhhpM6u9gjatoB1CxeLn6twskXrMUh5SS0VDu8yIT0o/pYK+CD
	eoN0xgIid11aRq5Xr1YNXNVF6k0hWso60+h853Mjt1w8vPR8vgagqASZcBSGtgqkGBeNuuXyS1W
	3l1/HS5Nu/JYAvNHjLOs1duVnkYd/MRfRFRNPOrI6LEUSMRRAGHkLqRwYLdC6SevcGecrF6qf7N
	Gz4KB6uEOvSf9jmOidU=
X-Google-Smtp-Source: AGHT+IGWqj5/Oh5M7zFpGJF+yqoShftiCGH6zZImg0D9CX8FZjiXi5JfZ9Wc/Ter+fABZOmFM5Yrlw==
X-Received: by 2002:a05:600c:b94:b0:434:f753:600f with SMTP id 5b1f17b1804b1-434fff502fcmr5087855e9.19.1733751940844;
        Mon, 09 Dec 2024 05:45:40 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-434f30bceadsm62705135e9.41.2024.12.09.05.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 05:45:40 -0800 (PST)
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
Subject: [net-next PATCH v11 1/9] dt-bindings: nvmem: Document support for Airoha AN8855 Switch EFUSE
Date: Mon,  9 Dec 2024 14:44:18 +0100
Message-ID: <20241209134459.27110-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241209134459.27110-1-ansuelsmth@gmail.com>
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_054542_942876_3AA651EA 
X-CRM114-Status: GOOD (  15.45  )
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


