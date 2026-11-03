Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31934606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 17:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TX3+MuDq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xaLsM5U5ulazZmmMZOUrbsqFBf8E5Hd+TLCd3a7zUQs=; b=TX3+MuDqFbzmFD
	c2WTYoalkKXUBFJnUe05liAaY8G/okyKBR7/kYzS7zxWkIJocWbnfl3s0Jia/VmjTSyYaDDASDRWU
	tBngp2+vn8Yl0dSaBHL+hp+ASZjLoV+DYVT+yHRySJRClMrmGPoC6pEjLve3zFjWbpdCwo976PpNR
	9J24n7/qmNaAmkWjK5xM6RkFFe02oltQwgyFYLXYSxL5QZJnP5pXJz/m8wOjYU5Em34vFg29MlPFJ
	o/nOT6COSqECLsAcUILdWm4X8aE+kWAG6y6451Ve/YudVaQcwdz+P+nssdL2K3SRZCXIFZstXo9rO
	Gbr/htRfKznN6QE5PCyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHVk-000000039Wh-2EGZ;
	Tue, 03 Nov 2026 16:37:24 +0000
Received: from mail-wr1-f52.google.com ([209.85.221.52])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHVg-000000039Rf-20kP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:37:21 +0000
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e0d1da913so759908f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:37:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723838; x=1794328638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xaLsM5U5ulazZmmMZOUrbsqFBf8E5Hd+TLCd3a7zUQs=;
        b=lFhOunb6EptZcvGVeytunU8HQTTCQbHBh1PaAhonbcCr1kBAA4FJQ8VgGuOHnuXWfQ
         qQB3se5jNFZCUCUtldpaFYk3Gxq9AxvKXcoxIbtwEWBgUYFicxZRGE7HD1c/j+my9Mf2
         /Y9/A2WekE0Gfc/VKLw9Qu/O19OBawksNiNcdCCHQQ/qMvHD50vOciKDNVmGX/UFNiyV
         vLPurhD3rZZey62AvSewKqabCh4KqHtwb3zlIpqKE4w3r9XcDtMxXD63HlokbOId8+1B
         sWsJQ7FdAhwtnBIL6/+fh7e+5AIzZPVVfUGaP8b5XUzlyUoDZvUpCYCJciHBhyxN2RXA
         P3Aw==
X-Forwarded-Encrypted: i=1; AKwUvBzN18FnA8A0Z/EX1Vq3oiMhbWO+n0VT5zdlzciLJi/D+6+AuZfefSZiVJBlX4FSKj5XzrX4zzcBpxmkrbIJYI4Z@lists.infradead.org
X-Gm-Message-State: APuU4Z/E30hz9Uiwc+xVXA/JkqX8fT3V9ic6AKKuejvIWPm4cce4ZEPx
	kaGuM3saEk/kAWpaiSiCpTtoBLWOe+w4XpAw7Vnh76nc5Nqj1zUrfk57
X-Gm-Gg: AYBFou1Oi0p3OMBLa7sEdnCJ78jftzH2cl5aS4jv76q6/bCadE4TxYvGUwBlU1Zy/xJ
	s5HtOmE6weezk/thoB+SyxUxyfZxftRM27ZMdogqt6ik49yESypzXVFVfwONEJzDgFiXJZEP92Q
	z8ez3XVsrdCM7JcGP5cxb6wL3yxL7ZTHDWJzyDZrCUT9iPT/CSMMDyMbAgfRuJqd111zBhtfYR6
	Q4dW4A3QimJAZtcEToS/+r8bmqCy8/9VUhLizzWlg3s1iX/64vyTQLP1ZQnEKWFgBEfltIyDLu8
	9A5aKwvE6EyWweKbtLRwJ6U1XKSjDJBwIeJjqm+T0o/boirq9uyYyjeVGP7lvabDA54IgeM38cf
	/hQXXDlicLyXtbAmaH/Ue37Rp2YCcXTBgQXgKwZ2iE8TcAGfLAPS+lAsjeQq/n4pUJSzsKxZP76
	ZJHQzY7tFUwKkmr7COeKH+gkoy3UsIODaytO6JX+omAaRhl/L1+FK6QX9uKVcmvKZdyY8yx1vjR
	yj+9dPfzrWescuAjnumdof1vFTwcPONHxz68pjOZz9P88oKE+kbsmcj8WIiB7jms0DcT+WW724x
	QJW2cL/AGZX0Y9b6P77e3+x3j5NMohqUIyRKIviGk3vV8uhiV73Ps8IMmqQydpmKxu0ebRDEW49
	HrNQKiDOf+ksKqBLOt+pk3T03kuTm+OFRauCntTVWLSrzMR0=
X-Received: by 2002:a5d:59c3:0:b0:48e:76ab:78f3 with SMTP id ffacd0b85a97d-48e76ab7f04mr25543431f8f.15.1793723838237;
        Tue, 03 Nov 2026 08:37:18 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm29044772f8f.6.2026.11.03.08.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:37:17 -0800 (PST)
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
Subject: [PATCH v5 1/7] dt-bindings: net: amlogic,meson-dwmac: list the compatible combinations
Date: Tue,  3 Nov 2026 16:37:09 +0000
Message-ID: <20261103163715.385394-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103163715.385394-1-tanure@linux.com>
References: <20261103163715.385394-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_083720_544076_412567D8 
X-CRM114-Status: GOOD (  11.88  )
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


