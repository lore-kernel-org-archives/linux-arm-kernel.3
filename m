Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEF0606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 20:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FXYbt0yO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QqXWTwTTRqCzzF0bQdyuAykpcOnACxEXXIFplcbdvJY=; b=FXYbt0yOPCgVoo
	1p3TyhqCW70cmoqfdFN8YobMrzQ/fxeO4XW03q5zsqC24Bo0+zHHdQDY1sBK2D5bS6P0kBjxgN30J
	2XfDvyH+26+alH0mFMdyZ7GDS7Xcql63ACGGkq1jPtWz4hfxAB+r/CIp7JyyPuM3ABcpPcABLGW6F
	hrPF7ZfIKW8b8ulD1iJ+q2kEPCnFX+ZI1mlX8DE+ICijFZQhPEITouyS2ker4DJTJXtDUiH1lV0lG
	0tCLClPf8ZRJw7cz5bCf4XZjEZe3Q0Jtiiw+xrS5FK8rcDAbWneGps5qhQ4Cq6JR01aW3FrNRmS2s
	kQeadJkTYAAeavQ/qqsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz3x-0000000Et9H-2nF3;
	Thu, 22 Oct 2026 20:06:57 +0000
Received: from mail-wm1-f46.google.com ([209.85.128.46])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz3p-0000000Et1u-1D7S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 20:06:50 +0000
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso1827595e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 13:06:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699607; x=1793304407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QqXWTwTTRqCzzF0bQdyuAykpcOnACxEXXIFplcbdvJY=;
        b=pIb6C0QBwbiDB2CXZ+6U5AQla62dCVTL8zDvyGxqxFouktrwMPNDPW0fIbJPGSDHSl
         wkhiEdJeDI1pbdtF+3qGInir3Utf1Onr7m51S6LOsDU5yD0VJt9T0yMch+Ks0omzbTy1
         lZDAF1kjCyywuh+5QeU1306pXl+apdg1gXB3fpO8ovzATSZhMSLrEQEQeiR9cA+TXTfl
         N8MD8ccqk8jBtDd34INv0GX1mWDetg+7qeeoVFwFtF9RmXgGNG0ALOvfoL0aYUTyOvQx
         maV0vHWagicNvannJnNL9F3NjshZoI5I2zblEpYTMoaHEdZsD3G1/4ZhO7EycTLpDQDD
         lF9A==
X-Forwarded-Encrypted: i=1; AKwUvBzi3i+jfzBOsev236izfiq3FkwJIAWhC6lVIgud9wH/gupMrQO5jR6sSJhAEV2jN6xOCljqHibaEQHEZ8VgF51o@lists.infradead.org
X-Gm-Message-State: AFq9FYL+IuePfpU583YMT6usF2Y7wh1AQFLyLtKYlBpN32RQynGjChw8
	jktWBNHDGEClSI7SKkjw0AtAv1UXmmX+zf5JpGV2IGQfXtMwaYrCxyjh
X-Gm-Gg: AYBFou3y8xLy3EANh65bmvk93YsLROMkesuao99HFxrdO9AE1qdipfb0IrezGuW1Z8j
	5gE4R67o4kvJQsoS77OoeKiPje8aYOoth2v4C1oFEx29S3klVB/Y/rRNfTX48yPOSDq7v9RgXYj
	F8bCdWP8Gdh5SopQvwLFrT3Ix8sX8adz3l1Ef8UmFX7gYf27ruQ379mSOYQXR2JlUB8YcDN5qTT
	6khbYeIabXO0L/DNISB8norOsQl7sUx+TDewaG0u4o+QJGGSM75LsAZvcBGt4zOdlYxP3Q0QaVK
	MlCowdGBSmo/ihK/pbvQwvdWGQTCzRyBiaUI9sxbmmbe6wp/1dE1sMG5jW7ywdCsXQyyZa3LGCK
	DXJo9MHxmWG7xyaHAsPdM6EULGA/fFygZwmQ6HJJ1ukrLgoDDmuit9JV+rN36JMUj4gi6/mJlVt
	8zXf7Uq2ZXw4GReq2fyQTyH02YmoN+VhA3Z7yHIPLdltg0EYYoGyYZtCB8DndeJQXD0fpR1WFkP
	O3o/NnmLCB/GVlZCqXEJkCVa/w/HqSK6B7IaMPf2+EkqiHMnOwHWqQdFQWOOo6oGhDsV6Dvr8xI
	VqXwPJZVm+ACcZZk6vcgAG53DRHZKFBcuF85
X-Received: by 2002:a05:600c:5247:b0:4a0:263c:704f with SMTP id 5b1f17b1804b1-4a211caf3a5mr2595685e9.16.1792699607284;
        Thu, 22 Oct 2026 13:06:47 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2123a1797sm35965e9.1.2026.10.22.13.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:06:46 -0700 (PDT)
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
Subject: [PATCH v4 1/7] dt-bindings: net: amlogic,meson-dwmac: list the compatible combinations
Date: Thu, 22 Oct 2026 21:06:34 +0100
Message-ID: <20261022200640.3101932-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022200640.3101932-1-tanure@linux.com>
References: <20261022200640.3101932-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_130649_373727_78D77928 
X-CRM114-Status: GOOD (  12.09  )
X-Spam-Score: -0.7 (/)
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
index 5c91716d1f21..69244afc4ff8 100644
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
@@ -172,7 +171,7 @@ unevaluatedProperties: false
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


