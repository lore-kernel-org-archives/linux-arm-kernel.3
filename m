Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67D9C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 19:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5GEf6kEPNtA5FLbGic7DPjqE9UvrGi4qpC5CByFjtls=; b=LoJSng5CUlVzNoWG19n6V9DVk2
	vFGxg6uJYaQ4960LdsL/PbinhcLMqJdH7IhQRMoVfYCpe/nqChdgYUQuRgBYAkVtquN4rnL0qsMWg
	XczEDN/NjfYHQogitvfAfjGFxHoX3B6Dprf71EDZSKmmGb5VlXvaT1n2NbWkpOKlKvyVGOaX5NjjH
	JCZ3x0nqvF6B+mJhu6zWc3nXZw7M28T4pwoJIP1kFnewrnJWawJYKdTfSVnnchNyKoOz/gpovkRfa
	ylLtTxUg5EhxOsV2ZxEkRVYE8EOCaKbWxAmtV9saySBPP2r6AaaZLj2raHUCzZ7llpKBARUDGVdFz
	d6AJWcsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNcme-00000000stv-2OMA;
	Fri, 06 Jun 2025 19:31:20 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNceJ-00000000s5y-0T5s;
	Fri, 06 Jun 2025 19:22:44 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so31362685e9.1;
        Fri, 06 Jun 2025 12:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749237761; x=1749842561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5GEf6kEPNtA5FLbGic7DPjqE9UvrGi4qpC5CByFjtls=;
        b=Ux3uoJnSAiOoJUOI5w72o8y06n2tCayfjvzvqxczyXP6oOEZ0T0t320BUzy7bMSoWX
         DiMsr6rai+xGWDjGxbYvki8eyjoFRF871BRNjRkkt9vl1ZbNindflRwEasqxRjzlY9EW
         4dtR7eZM/jV59PmvL4GHoTvCDD2elsJM0NRVt3sH0G0wKgeEiGCD3yysA+oDsm/FL1gQ
         sMV2Lqkkjv1EmwIiNujNA9Yoyife9tKoo1S10e2PxthddnHvunt/C/MmCNQTvBeJ083v
         TJ545KUcC/OD+4Te+UuLqXtlG1rK6RUsbD9zJ6eZEZLjzqADOm1Vc4sB3eE1RfIrBPXZ
         DLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749237761; x=1749842561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5GEf6kEPNtA5FLbGic7DPjqE9UvrGi4qpC5CByFjtls=;
        b=dslluPf9/cdjZO74eHiWa9UQs+gRRElp8KdAn9qpNToaUCJIrcFwe+GDDKCOIuNraw
         V/g0z3mHMxpcSKn6ciKo3Iky89VEq2K7pChXFXuntAbzF7vFNlJ9rGQqptMZfRcwXCfo
         mwM+Y2K36pF6Fna3KKII601qnGd43CAXt5k7fpwBE6GS8rPakV6TZJiLnxz9udWKxlUA
         Ti2PiAbO0mlfF3J69p8TF/GJnyvJQljwoNUcva3LaLVBMfWgOQb2piifsP2sAaytxDFF
         0hiXahSuvGWBAmtFP875FGxx36EbU+wxrcwIp8NEAnUylbguPdQIpglsheWnT5kfGJE/
         VUlg==
X-Forwarded-Encrypted: i=1; AJvYcCXYN6+eNtkJm0xHdW75+ByOrcB5UITciNkoZrOFx5te+UN97i2lJ8K4zg3WZvkdjj0UnfDihMHOzkjI@lists.infradead.org, AJvYcCXjrsk16C8xG1EFTqyikVEMgTYO3rq6TwlvdrpQSbIkeRUOmQ5uJykMcU42yja6lOuboHtrMaugZgLv0FdZnQRy@lists.infradead.org
X-Gm-Message-State: AOJu0Yww4wS52fnCMmY7BfHXOtUZeI1Atxjt73wlWEZpjuQR4B6TjS7Q
	YYKFpHaolb1x8TyuJj3+HA7u96WkZRk0o6xNGoOptyvQD7Ns1bQvBcQL
X-Gm-Gg: ASbGncsM6uaBFnNhn+AT2jGYNQmTOkZN9WmrkadTX+CYomHrsXjudl1Dgv4B9I9bqmo
	iEA/dqEU7ldfgtkB4zJ3k6QOWCEP1kG7fPZo8vm9hUesa/MgZUwUhuNOClCVvJCgEBHCmf27vLL
	B1W66rNbV4QIvkNIBNLjnKvzVoM53Cc+9TGD7bmL6WQfqUPvU+GhSCXIn8WAj3MEvwMzgYJhcQZ
	pfHI4DcBAQ50OM7Ed0+bUkiRKh1bJ3F1KTqr/yFPqP2AQG3p0K16SmlCCGzPSUpDsrJZorwpaY0
	p+OXCX5aZGkUsNDX6PLTXdYe2KO754sGfNcU0Hq9bY/pBIo8slfxynn9yAcuXCY6H9K4DaWADn5
	7mJMk50gdY+H12oOvoq1c
X-Google-Smtp-Source: AGHT+IEC3Sjc2VlYygLATA0RuWgVQsarnnCoqzFIWxR4i0/tT0CzSrNBQ0SYjbZbfbyjlO6aHoDzMg==
X-Received: by 2002:a05:600c:8b72:b0:439:9b2a:1b2f with SMTP id 5b1f17b1804b1-452013683b6mr51761175e9.3.1749237761483;
        Fri, 06 Jun 2025 12:22:41 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-452730b9b27sm30951595e9.23.2025.06.06.12.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 12:22:40 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: phy: airoha: Document support for AN7583 PCIe PHY
Date: Fri,  6 Jun 2025 21:22:04 +0200
Message-ID: <20250606192208.26465-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250606192208.26465-1-ansuelsmth@gmail.com>
References: <20250606192208.26465-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_122243_147737_007EBC9E 
X-CRM114-Status: GOOD (  13.17  )
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
work. Add the rwquired register to configure the PCIe PHY and provide an
example for it.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/phy/airoha,an7583-pcie-phy.yaml  | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-phy.yaml
new file mode 100644
index 000000000000..93252092c2e3
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-phy.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7583-pcie-phy.yaml#
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
+    const: airoha,an7583-pcie-phy
+
+  reg:
+    items:
+      - description: PCIE G3 analog base address
+      - description: PCIE G3 PMA base address
+      - description: PCIE QPhy analog base address
+      - description: PCIE QPhy PMA base address
+      - description: PCIE QPhy diagnostic base address
+      - description: PCIE detection time base address
+      - description: PCIE Rx AEQ base address
+
+  reg-names:
+    items:
+      - const: g3-ana
+      - const: g3-pma
+      - const: qp-ana
+      - const: qp-pma
+      - const: qp-dig
+      - const: xr-dtime
+      - const: rx-aeq
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/phy/phy.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        phy@11e80000 {
+            compatible = "airoha,an7583-pcie-phy";
+            #phy-cells = <0>;
+            reg = <0x0 0x1fc7f000 0x0 0xfff>,
+                  <0x0 0x1fc7e000 0x0 0xfff>,
+                  <0x0 0x1fa5f000 0x0 0xff>,
+                  <0x0 0x1fa5e000 0x0 0x8ff>,
+                  <0x0 0x1fa5a000 0x0 0x3ff>,
+                  <0x0 0x1fc30044 0x0 0x4>,
+                  <0x0 0x1fc35030 0x0 0x4>;
+            reg-names = "g3-ana", "g3-pma",
+                        "qp-ana", "qp-pma", "qp-dig",
+                        "xr-dtime", "rx-aeq";
+        };
+    };
-- 
2.48.1


