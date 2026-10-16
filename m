Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0582CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 07:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5xMolcA2jijade3hq2GliWPHkN3pbidlI2m81QLD6M=; b=N54dkRgaj3FeHoZ6SezhV8H/s5
	kUBvIYA4xajVwN7KSv6soPVDJLv8XlN0ycElISgCsFVLpXu8zTzrGqOygJYzp5qlUU5ZZ0m1rQRwV
	Qury0zJiYr7zp7A/LVV5KGnLUm+9WjsqaVadPIo0u0mw2SGRI0ccy/Uow1DMfdi/edtf+TJBvSPBE
	HBAH62F+33Dw1rZHWEItBL9ZqLOrJhB3VTmhKKSFmXsB2A3PIhx39dOOWngCgyL7UFasUktgSxSw1
	oU14HNqRXFRpmgDuDiERkJPrnrZ4dJD3s+byxuwf9466bsxdW1oOdPl4xYna8TTX+TidprREgetVC
	Iw9r/qwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHc7V-00000002DC5-0Bcx;
	Fri, 16 Oct 2026 07:12:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHc7Q-00000002D9j-2ad9
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 07:12:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=J5xMolcA2jijade3hq2GliWPHkN3pbidlI2m81QLD6M=; b=UY9lSJXk28l0CirKK4S4M8417z
	C+wVWhEJAGV9PpfzeXb6xiO2hOvmjAvztw2JUkOYlNWuEB3x4q01xU+/ww9KmBoHn75mSqjQw81E0
	G0Sg5mBvrIuK4GuzQz2Ub7q278yHBQTfIMCZBpuR9YVLpZN7Gwd9QkSLEzWSCg0SPzi3CoMxwCfty
	CMlNUgAwAW6ReHrghpQLPT3FquVK+shU/4bq+zgTEE1+tQuiwtg9548A1c2WE9wKvkDOd/ogZbec5
	HCL+ocbyvGCukBJBs0g9cbStCSBiYlHGVQ4aW89/W3x7yjOA/GygIiq1t480R+bNQ3x1albhEBHAd
	7Z0CHM+A==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHc7N-00000001CQl-1324
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 07:12:43 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so25514885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 00:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792134760; x=1792739560; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J5xMolcA2jijade3hq2GliWPHkN3pbidlI2m81QLD6M=;
        b=SpFjO1uhQkxkiPKLdnMn1CYFS4ybYpACYkjMHosC51vOOtdfzTqz/UszPM6up4htbz
         xbdM/6LoJ/kObJGiRlRs+Z22wdJQUXLWxNkUKr+X6J7njvZHPLygVbwnQo+aJPRV5kfd
         d3uIbdKWMLC/yZEhOzSKRjw6TrQecCNceD5IgS/AeAVeYIyRGBdA81LFkC9mXFscWbs1
         YjiI3BBmk5vBreFTtmSpkIvCrN5+BDlvxpqE0cijSLPj6F92lRwHc5Lce0vpi6s0V1eI
         21Q02C/mIx3Gi6l8UclnJtxlVGr0U+UBItQ4T7OrPN8E0tHut9Ux9y+OWOmRr99QKd3m
         dfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792134760; x=1792739560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=J5xMolcA2jijade3hq2GliWPHkN3pbidlI2m81QLD6M=;
        b=PtoC/SPuB6/b6hzMR8B0pxfQlBpjX6zSSEk7BgFbh1++sB3umBjGHi0tXR1URs1GJ7
         /By4ydLwJTjJWyDUIvSW1Ry4Vd/88X8mPENtNwxS4P/nWTUUhZacWX/tkTpOdnT2bxWu
         zyiS/0VOcNuYtf8TiNEDCzXP9zKoZD63R3q2Yzp5TzuOPGOlXu7CUbHkDwtYZx+4WpVF
         6WLgtBk19c/O93t9avddkRatVXRm22aRbL0YoVpIX0c4z9VQim36X/P4BpWaei0keDHR
         5SDZ0DuzSqSEzERVFjZRTl9/rxB8rm6TSSuBM5dDN4P3QDpngpnesaat4nInOW6MktXk
         abkA==
X-Forwarded-Encrypted: i=1; AKwUvBwCz32ydTWduxEDx47PkK6ISQzgvrChbm1nXxRrPVFcmyXBYeLmcoj9RjDtxeJmFJGNA3qB8apj1xxLbesjwu7+@lists.infradead.org
X-Gm-Message-State: AFq9FYJCOnnpNYsSMI60zQFh1PbQbn0lG9ti+H1FfZTgxm3WZCHp/Fhe
	hii32LXgKhc/3Ilp5N7dL8b1N1a0Q3b1SUCMez12ShRKt9hFoeyMZm5G
X-Gm-Gg: AYBFou1QyNcL43m+NXgHHtSSaunUOvAinlOvxYF5Q+TlSXGEQ7i0/BIN1Sjw5Myiv/G
	H3/rtHv17XaT3wB0Of9nGhgyHo6gpStQjCEotezeiaJ9btEIqi74V+UYOi8eqqIasWJSnTWON8i
	3Lsjm+YwnTBYRYCwselGX1jqOjptpWCNsRbT3SHMU6hzYWym2/UJJRUsmCdNjxtaTvlS4ylcAeU
	LtUHTwhFez+Xqm7eQDTReHqO7/qhXMe10gyXOLXaVYFXlVnOio1P1h0gSDqv4/KRsf+L3xiR0a1
	fYIkUuKUMQJ0qzGSqX4NslWEPg42Sp4U9E7pbzHvGWbSELbp+IiQI3Z6PgdNT58VB6wRG/UFQ2+
	us/TPCVM4rt2JmB9EAXmczZZazB9x46mogNBYFxLSCeY5lOnijhLD5gwf9tDSKs6ahGG5Zc6Vs/
	FJLXmhB44if9vAzToP/5vNMObl5NK7/IjFcDWK9s9r+6k8P18RjiA/jCHQZcZNE11n6EXYn3npv
	zfRF0pMC+luTSql8TI0x+YJSgmBgyTjwOKsNzWu8nOlQaqc67Y5dIV7pImFbnZnaDV7EoNUaWEL
	YWnikpvHX+So2zXmlX1vyFkH6ev5o4+vmg==
X-Received: by 2002:a05:600c:870e:b0:4a1:6dca:51e3 with SMTP id 5b1f17b1804b1-4a18e4487ccmr433992205e9.3.1792134754909;
        Fri, 16 Oct 2026 00:12:34 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a1b377sm61802015e9.0.2026.10.16.00.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:12:33 -0700 (PDT)
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
Subject: [PATCH v4 1/2] dt-bindings: phy: airoha: Document support for AN7583 Gen3 PCIe PHY
Date: Fri, 16 Oct 2026 09:12:23 +0200
Message-ID: <20261016071225.2092-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016071225.2092-1-ansuelsmth@gmail.com>
References: <20261016071225.2092-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_081241_450662_F6022EB2 
X-CRM114-Status: GOOD (  16.26  )
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

The PHY link to another PHY (the QPHY as described in the YAML) to
correctly handle Gen2 speed and mode. It's mandatory to have this PHY
configured for correct functionality of PCIe. The QPHY is a unified PHY
that both handle USB and PCIe PHY.

It's also mondatory that the QPHY setup is done in the PCIe PHY setup and
calibration phase or calibration might fail.

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
2.55.0


