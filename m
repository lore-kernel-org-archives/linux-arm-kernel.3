Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511D1606D837
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 10:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XOJ8yyxf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xaLsM5U5ulazZmmMZOUrbsqFBf8E5Hd+TLCd3a7zUQs=; b=XOJ8yyxfYNGXB/
	nl9HlAY5ZjtpGkqiyPVvztrwRRkvzilnP23RnqTkH/NpkATg8I3JDIU6FHEb2e8IcvnzAh/zShz0c
	4I4iR4AdSogSU24QJVIyDvahxqERQXX29t4j4ffEbrPjoWUu6OqVeCVe2m9KXbdJwnqQ1ZAXrJTgb
	1faF6YMH3+LCuVLfNBGy3kRJggDdtD7c9Cj3VZPnxXqXaDhmtNbW6CxFltjuH1pB/Xh5Ajw4Af8pw
	pz7BKOQUyiEErIygGW5eKvRFYpoQ4cpunGbLYBDAVPtiVegtCOdHLvtK/waRquP+6rrnx+sNy2Ci2
	clIUa0g0pGN/QAWyyvaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuJg-00000008ODu-3tMd;
	Thu, 05 Nov 2026 10:03:32 +0000
Received: from mail-wm1-f51.google.com ([209.85.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuJc-00000008O8z-29S0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 10:03:30 +0000
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so4947425e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 02:03:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873006; x=1794477806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xaLsM5U5ulazZmmMZOUrbsqFBf8E5Hd+TLCd3a7zUQs=;
        b=BqLlmDvAEv1ZIArlRRTibWZx7+DkNXZ+KQSUVYwiKJ72lTbdWNoVdpITUeGRl385O/
         4o5b2q5q6nv5yDOcEBlGBy6kAc/3xPqLwwWmXTuuhn/LOFcNiQp/1Tcy6LLHUq1MNC66
         RKlHZM77wgwmSm93ipEsO6L4BEddV++GFl0jU57I0IkTuQ3Jfly1J12cQyq860lH3DZP
         VQr32i5c2C/HwUbXItqPHtZ4CpSnJB4vm63B2EFRsf+YccNVDN3WXeqQSMNpQwTyz1dk
         zkxbCit1Kp3jTWp7lXhsgzZ2WyqUktjgsdT2LD52yhqoOMwd0FYnjoLB43kezaTtSW9J
         nN1g==
X-Forwarded-Encrypted: i=1; AKwUvBz07mOwHSxXx9xEZ2XGQb/jF5eXMbGUu3KAfpaYjBA9xFDnuJV8JWTiBJgT+25XBDfezfRYeM2KmBW1ioQ4dyEI@lists.infradead.org
X-Gm-Message-State: APuU4Z84k3VhUCBrpwmsHJCa1uff+5CKZmL0cQ9inHvCA10aD+RqShZE
	QZAFUU/E2pHkPw/xI1nPYHwEFU+iXm8LtW/KkPBLY5/7g//+5CAvNcJM
X-Gm-Gg: AYBFou0KzU02bTcVEBI+xuO/p4AzvimhDL8d4xafchzFZgONqrMhU+NJi35kFNmxslY
	16RO9ZLS+0nuxxLzUaYZYu0NOGGBIq37peJ6dDTyVxM+XQ1NC/Eqb7J643Pb4dmbb1LwfYC9JCs
	XonCyNLLI7iP1sgIvjU7McrvSCYl7AN8lM2ovJG3RN16zrprAaWd9yW0W0GupFBRarKczzFsOHX
	hynfiImn02qYvT4+JYrcwXcxZmnEkH9jucc/vf1h9jBid7aAJvXju9maHP1DfvG7cSLekntmNv6
	0Mj5xswe7XBxJHotAXc03pcQ3tfL+a95TlfSI6ETIaVGJBV3+40y3Wu1IX21JmJs1dFSa+9eNA2
	saM6D4Qk178MaDx+cC821OidT0KMzI4ze7d5ALHbkE2GrAtjL2Y6t7MhmXaMXScaBfdwGRPRWl1
	stAv9TugTBF9H1F05+kum2ZAD1Vo67fAgM9nR9yS2e/DKNA4AmhrNcb8rk+BDMc2tQpzL+g5Sl7
	YP42EU//S565Och0kvvW+W33Utfozk7Wc42r5zcYPrPmP0dhP9zICu083fI4XvKnTSrq0+Ne3B/
	HixveLwvMCOlFKAZMxtMiIF0S42WnpAFWr/UU9FG0J3eWG5PIGxAiawtepT3eQ51poOex5rN5zY
	P+dxH1y9BzAAsrRDVL0F/Xqbxrg==
X-Received: by 2002:a05:600c:45d4:b0:4a3:5da2:38ae with SMTP id 5b1f17b1804b1-4b55de92333mr36628635e9.14.1793873006268;
        Thu, 05 Nov 2026 02:03:26 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43342773esm53455775e9.4.2026.11.05.02.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:03:25 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/7] dt-bindings: net: amlogic,meson-dwmac: list the compatible combinations
Date: Thu,  5 Nov 2026 10:03:16 +0000
Message-ID: <20261105100322.37816-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105100322.37816-1-tanure@linux.com>
References: <20261105100322.37816-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_020328_998690_292C595D 
X-CRM114-Status: GOOD (  11.97  )
X-Spam-Score: -0.8 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The compatible property only checks that the first entry is an Amlogic
name and that "snps,dwmac" or "snps,dwmac-3.70a" appears somewhere in
the list. It cannot express which fallbacks each SoC takes, so a SoC
built on a different Synopsys core cannot be added without loosening
the check for every other one.

List the combinations the device trees use: Meson6 falls back to
"snps,dwmac" alone, the others also name the 3.70a core. The Meson8m2
reports a 3.70a core too, so it joins that list; its dtsi gets the
missing entry in a separate patch. The example used a two-entry form no
device tree has, so give it the Meson GXBB combination.

Assisted-by: LLM
Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 29 +++++++++----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 9c9cc3ef384d..e769c9bb70d8 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -129,20 +129,19 @@ allOf:
 
 properties:
   compatible:
-    additionalItems: true
-    maxItems: 3
-    items:
-      - enum:
-          - amlogic,meson6-dwmac
-          - amlogic,meson8b-dwmac
-          - amlogic,meson8m2-dwmac
-          - amlogic,meson-gxbb-dwmac
-          - amlogic,meson-axg-dwmac
-          - amlogic,meson-g12a-dwmac
-    contains:
-      enum:
-        - snps,dwmac-3.70a
-        - snps,dwmac
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,meson8b-dwmac
+              - amlogic,meson8m2-dwmac
+              - amlogic,meson-gxbb-dwmac
+              - amlogic,meson-axg-dwmac
+              - amlogic,meson-g12a-dwmac
+          - const: snps,dwmac-3.70a
+          - const: snps,dwmac
+      - items:
+          - const: amlogic,meson6-dwmac
+          - const: snps,dwmac
 
   reg:
     items:
@@ -175,7 +174,7 @@ unevaluatedProperties: false
 examples:
   - |
     ethmac: ethernet@c9410000 {
-        compatible = "amlogic,meson-gxbb-dwmac", "snps,dwmac";
+        compatible = "amlogic,meson-gxbb-dwmac", "snps,dwmac-3.70a", "snps,dwmac";
         reg = <0xc9410000 0x10000>, <0xc8834540 0x8>;
         interrupts = <8>;
         interrupt-names = "macirq";
-- 
2.56.0


