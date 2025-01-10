Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12ADFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 10:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fQeTqch9j+53iKjXj8MrgWaUt7dPLQ7MpkAT3KGPZVU=; b=ZZu6hFhyx8s+pA4flWRxgoEZPC
	iEMwFG/nSFM70h02UxQrrFNeVVN7o2uC1ucPDN96aNQL6uSm+JXV+wORFCaLVC3yaxnCnGdgA/1eZ
	zsK+ZYJCSlO/+pWypr5oPJpbmhgaGWv1ONuW/4ZmjJ57C3ybRn6LV/dJbm/DznK6kTBudCOv82dfh
	W+9d/DRzeLE+RgeAn/dmKtl956OB85dYgLsYozb/JR0LhWmEc0VlRAAgbbiXNGQ1QIKj4wVXCs38V
	6hXrVVjnr4MeVn2wF+tpk8v3qNVAtPCJXn0I23mJ2CcQCyN2A1Zs2q6wUwZeAvCqhLRhmtbP2NJZr
	XL7LiyCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBsr-0000000EsCd-2TzL;
	Fri, 10 Jan 2025 10:04:53 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBrd-0000000Ervr-2XZh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 10:03:39 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-436341f575fso19708185e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 02:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1736503415; x=1737108215; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fQeTqch9j+53iKjXj8MrgWaUt7dPLQ7MpkAT3KGPZVU=;
        b=P6sf4afo0PZcUaKZAqnthGIgQhmggtNP8ZmU+lXl35sx8/tigqv6hD03eHgRjTqeho
         yXQjr/OmSk0Ufgdu++bKZ+k1fwI3CehWbklFqj09N3muLqsd5O4cXBiIDw4LE/LVLenM
         KXmfo35GtJm0jbqbSMrBjyHXkzBWXu56O3yXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736503415; x=1737108215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fQeTqch9j+53iKjXj8MrgWaUt7dPLQ7MpkAT3KGPZVU=;
        b=tDHxkylvKR6iSrTvATOdq/OA+EtOqcqhdyaHdV6UGxTRqirav6n+mRpRevQjEe0r2Q
         NvDPF77xokkzEvZqH1uBiuzqcLPBFIW+XBKw5hq+IyEb8eS2fTjnyoAvO/H6Q5cZtEVV
         v9CoJuWfBiDx+9ha2rLRpqIViUjaMEfmrgypvkpc0ytLdhUrUBQyDtoU8/aLHH8+8uv3
         YbhVkMtq7vWcwY1OOtpN0DaXU5zixcs8YErqbK8Y9LEeNLHckLfQGPMHT9/Gbhf31H4o
         ENfFuJ+oVlmVf8c3TvgQ/ZjiSyhaMsfMaM17yr/QGmrfZ4x8cfyHYmEm8StcrYEJUmai
         UmZA==
X-Gm-Message-State: AOJu0YwfrcDqxNwOm5OkR2JAkLysOFPGJYt4ZDWU/y1zbxqaBULKdUz+
	pkL+62SecvONL1tRU5y1jD06jtYAj9HjnEzD3Tt+cKQN0ADujOv3OXeI92H9AP1ErnDNsrp//+K
	j
X-Gm-Gg: ASbGncuyEG3jh2K9XecD1fy47y+UN66Rag6v+rMYAGQ0Al7ihmRbV+bm9nf6OutAuvH
	3mlymE0b3aecPjIvYXoeACyPcvRbGqg3MIyBCx2FZCQPrwYzKG333CAB5159RL+lYFn7BOEb9SB
	jA9Fmbi2piMpXCQ4qVsbK8jhH0gIBIlrHunuK7tuWCPR3ap4aaV9Li2yHaTDK6MBSAnyyGYBLUl
	GVYQ1jNF00iS/geBgwNNJIJKjhWKw4dtbmw1ljdKQgkrnee/ujj4GbcN3pkFBHLqYhpD0If3Dsj
	I8yhmci6ugocoTBy7kFG6u/tYeoogp75bRzqB2AMCt/F36BtZZvG7Q==
X-Google-Smtp-Source: AGHT+IGV8wNb5pRGJC8CELqDHhfCA3lINL4YQa3ZSVbVGyS6LeSFPXZb6mq2DxQh1UMN01mIMAx/uA==
X-Received: by 2002:a05:600c:1d03:b0:434:a781:f5d9 with SMTP id 5b1f17b1804b1-436e2697b32mr39134015e9.11.1736503414860;
        Fri, 10 Jan 2025 02:03:34 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d085sm4198483f8f.13.2025.01.10.02.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 02:03:34 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	kristo@kernel.org,
	vigneshr@ti.com,
	nm@ti.com,
	afd@ti.com,
	Romain Naour <romain.naour@skf.com>
Subject: [PATCH v5 1/2] dt-bindings: mfd: syscon: Add ti,j721e-acspcie-proxy-ctrl compatible
Date: Fri, 10 Jan 2025 11:03:30 +0100
Message-ID: <20250110100331.1642242-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_020337_646342_018FC652 
X-CRM114-Status: GOOD (  13.37  )
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

From: Romain Naour <romain.naour@skf.com>

The ACSPCIE_PROXY_CTRL registers within the CTRL_MMR space of TI's J721e
SoC are used to drive the reference clock to the PCIe Endpoint device via
the PAD IO Buffers. Add the compatible for allowing the PCIe driver to
obtain the regmap for the ACSPCIE_CTRL register within the System
Controller device-tree node in order to enable the PAD IO Buffers.

Using the ti,j721e-acspcie-proxy-ctrl compatible imply to use "Proxy1"
address (1A090h) instead of "Proxy0" (18090h) to access
CTRLMMR_ACSPCIE0_CTRL register:

  CTRLMMR_ACSPCIE0_CTRL Register (Proxy0 Offset = 18090h; Proxy1 Offset = 1A090h)

"Proxy0" is used as the default access path that can be locked with the
help of "CTRLMMR_LOCK0_KICK0" and "CTRLMMR_LOCK0_KICK1" registers.

The Technical Reference Manual for J721e SoC with details of the
ASCPCIE_CTRL registers is available at:
https://www.ti.com/lit/zip/spruil1

Signed-off-by: Romain Naour <romain.naour@skf.com>
---
v5:
  - Add missing change to the J721e system controller binding
    to avoid DT check warning when the new acspcie0_proxy_ctrl (syscon)
    will be added to J721e system controller node (Andrew Davis).

  https://lore.kernel.org/linux-devicetree/90f47fae-a493-471d-8fe6-e7df741161be@ti.com/

  - Explain why "Proxy1" address (1A090h) should be used while using
    ti,j721e-acspcie-proxy-ctrl compatible (Siddharth Vadapalli).

  https://lore.kernel.org/linux-devicetree/begojbvvrpyjfr3pye7mqwiw73ucw5ynepdfujssr4jx4vs33a@pwahnph3qesl/

v4: Add missing change in the second list (From Andrew Davis) [1]
  Rebase after the ti,j784s4-acspcie-proxy-ctrl compatible fix [2]
  [1] https://lore.kernel.org/linux-devicetree/20250103174524.28768-1-afd@ti.com/
  [2] https://lore.kernel.org/linux-devicetree/20250103174524.28768-2-afd@ti.com/

v3: new commit
---
 Documentation/devicetree/bindings/mfd/syscon.yaml           | 2 ++
 .../bindings/soc/ti/ti,j721e-system-controller.yaml         | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 0e68c69e7bc9..1f3e67f432e7 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -115,6 +115,7 @@ select:
           - ti,am625-dss-oldi-io-ctrl
           - ti,am62p-cpsw-mac-efuse
           - ti,am654-dss-oldi-io-ctrl
+          - ti,j721e-acspcie-proxy-ctrl
           - ti,j784s4-acspcie-proxy-ctrl
           - ti,j784s4-pcie-ctrl
           - ti,keystone-pllctrl
@@ -213,6 +214,7 @@ properties:
           - ti,am625-dss-oldi-io-ctrl
           - ti,am62p-cpsw-mac-efuse
           - ti,am654-dss-oldi-io-ctrl
+          - ti,j721e-acspcie-proxy-ctrl
           - ti,j784s4-acspcie-proxy-ctrl
           - ti,j784s4-pcie-ctrl
           - ti,keystone-pllctrl
diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
index 378e9cc5fac2..16929218d611 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
@@ -68,6 +68,12 @@ patternProperties:
     description:
       The node corresponding to SoC chip identification.
 
+  "^syscon@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/mfd/syscon.yaml#
+    description:
+      This is the ASPCIe control region.
+
 required:
   - compatible
   - reg
-- 
2.47.1


