Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC759C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 15:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XrOdE+R8rQ7wb6yuGln1m7tHcIz53gAsWt13GY/qj+U=; b=LPumvmT/AMawME/qMH246KfIcq
	1UMKoxt28hqVVYwZghOqxJG0h6Y5r+IdcKR1j6pHg3fVl695OKZptF7G/UdXwbJ7jbjMbHfhhkLaM
	XzkzAfcoU8k4Hm+Y9cR5H1i9biPY5EN7evR2eBzTombiI3zbC14YA3AfdD9yWnZtgjNWox8pVSKZB
	IUJVsZ7GDb//dQxKm18QovH5ZqbP0eGj4gtnuwztYct2JSVanoZC5yUEc6RPvYNc8bOLdBKDRad/K
	tx73L3Ean5RJLOE+bWUFrPMYwumJTg+UIeR+mPX/xKu7gSHpPfq/BJb6+vetYLxTFYTjPMxCosLE5
	489ZBbVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5v2-00000006Bwy-3OAb;
	Tue, 24 Jun 2025 15:50:44 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU45Z-00000005nCU-0xKm;
	Tue, 24 Jun 2025 13:53:30 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-551efd86048so466442e87.3;
        Tue, 24 Jun 2025 06:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750773208; x=1751378008; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrOdE+R8rQ7wb6yuGln1m7tHcIz53gAsWt13GY/qj+U=;
        b=jSq9xmFYbJ7uAjyTEBZFUF9+NAD5AULUKZFhFP29VpFOnh/eAoEixSQExzozgyMOOG
         Vzri+f46E5lZq9UzNP9VxvRSrHpAYwfuvkUwvdTyPkXu3L2krlpWgZZYxWds6HSiy9l6
         8xV7uleDqTBl91sDjSTYwWoQAOLn5n5ZLcXwOcJC/kVFysnT8SZ4ofe3dm7pTfCa7sX2
         ItYfHFOkag21T0vcnfMCgFmO1I8tcp4694/t0jJ6b8sr+LISEdOSIJfuy+0X1xWPOlcM
         28v13ZJFEuDBLjtJUZA94vNpskkETMF6mkChGJgeaxOPOgxplNImJ3oFeQIHhXcQ5Fty
         kHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773208; x=1751378008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XrOdE+R8rQ7wb6yuGln1m7tHcIz53gAsWt13GY/qj+U=;
        b=GJpqJHClnxx5s0RHOMtAYpa/cdGzIkmiFMBoJZMAxfckjiWqEsqdEx8rX3kUUDTQTy
         uC7mwWIy+Emt04Zw9OuOd03ndxNwHfn7uvUWY+IAEqXYglfS436mZNyzJMhc2OXRLrMY
         P0YpXmZ1MmGD2STNuH12L5O72SGYq7BePEoqhrptQ7AiCVJ1m9avonSLtmWR89n89P84
         nWXFQIQMNCydXtEwn6icn6/eyPpGWWpPZrshL3qT3jhXzhR+rtPtEh9YZtIFj0oKviKE
         V6uzV/yvr4CLZYcYvjHnZqCZgfqX6a4uKiSOdAJTDerRFaEYiFJfOs8nN5yMGVBTTmY+
         92sw==
X-Forwarded-Encrypted: i=1; AJvYcCWYZF2fK1sftN/Wii4fFpiQsrPNtafTMbA66mRWExH2xRjGf7AzviZ8hbQ0qCR9/keFo+kE5JqyyHzRhvqn@lists.infradead.org, AJvYcCWjrAyD6RIuI66UQDSNI/4XcJVdVAWEWqOrCS3xnqMJT9S6teaHjmTlZkgDUFs99y8J0ayQD0lIGKXUiN+jhP3xKg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyK0kOvQUuGg9RAPV8ZzYmWrDXdO8x00qVdyPseGWkJcSxawp7C
	8RV9APbMGPmQ87AaTVJn38+8xQSveMVm4tKalwUGkpC+bEvbPSTOKLea
X-Gm-Gg: ASbGnctVelGBOFEzzPUAJx3yT6P4chdc2i/Cvn371XNf5HJzrRghwRLN/4Lzn7yG3/K
	jM2yzGTq9DbuL1cu0hlR+KQYJAUWR2U2oQKQ60UxcNOiSkeSClDRuFc1+dAtux4yiRTak1EOBW6
	Z9UTNJ3wJyiHoKuZOzvTSRIXhZdaq4BGKbU1AsUKI3OnNUkEEGfjlnAofk6AjKvnUlfhIJyroAV
	0Vjxi3cWmgoZVcn9ioWaaUyTi8acLJpnqbYDDWvkithVEjKru2pEZt7vxCaj/KzICtYiOs9nK6K
	VNOY+hDHb7K8XNJSznIs8w70Gpk1i6AdPmmtTnW5XN3ttqeVMROwgjI/Cz/eLksVHrvZvLRjCBl
	4MnLdqWVqOH4So3QbSEiuC01kDJ5uR/T9gGWpc+sIr4cPt0B8YxKMy/TNwjGuSA==
X-Google-Smtp-Source: AGHT+IHafsnl4ECTZ03u9TitK28MH2CBXpSvgAgKY7MlFSCMzj5F1inb04eM/bVapqiFOJ6IXEiRzA==
X-Received: by 2002:a05:6512:3a95:b0:553:aaf1:f63d with SMTP id 2adb3069b0e04-553e3cfd76fmr4317885e87.29.1750773207460;
        Tue, 24 Jun 2025 06:53:27 -0700 (PDT)
Received: from user-A520M-DS3H.sberdevices.ru (broadband-188-32-30-96.ip.moscow.rt.ru. [188.32.30.96])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-554e6dc186esm1282905e87.114.2025.06.24.06.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:53:27 -0700 (PDT)
From: Alexey Romanov <romanov.alexey2000@gmail.com>
To: neil.armstrong@linaro.org,
	clabbe@baylibre.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v12 16/22] dt-bindings: crypto: amlogic,gxl-crypto: correct clk and interrupt lines
Date: Tue, 24 Jun 2025 16:52:08 +0300
Message-Id: <20250624135214.1355051-17-romanov.alexey2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
References: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_065329_269387_1BB3A8D6 
X-CRM114-Status: GOOD (  11.54  )
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

GXL and newer SoC's uses the DMA engine (not blkmv) for crypto HW.
Crypto HW doesn't actually use the blkmv clk. At RTL level, crypto
engine is hard-wired to a clk81 (CLKID_CLK81). Drop clock-names
field from schema: name "blkmv" is invalid and "clk81" is confusing
and sounds like something global.

Also, GXL crypto IP isn't connected to the second interrupt line.
This binding is useless, there are no users of this line.
We must remove it from dt-bindings.

Fixes: 7f7d115dfb51 ("dt-bindings: crypto: Add DT bindings documentation for amlogic-crypto")
Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/crypto/amlogic,gxl-crypto.yaml | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
index 948e11ebe4ee..fdc39797a2a9 100644
--- a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
+++ b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
@@ -20,20 +20,15 @@ properties:
   interrupts:
     items:
       - description: Interrupt for flow 0
-      - description: Interrupt for flow 1
 
   clocks:
     maxItems: 1
 
-  clock-names:
-    const: blkmv
-
 required:
   - compatible
   - reg
   - interrupts
   - clocks
-  - clock-names
 
 additionalProperties: false
 
@@ -46,7 +41,6 @@ examples:
     crypto: crypto-engine@c883e000 {
         compatible = "amlogic,gxl-crypto";
         reg = <0xc883e000 0x36>;
-        interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>, <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
-        clocks = <&clkc CLKID_BLKMV>;
-        clock-names = "blkmv";
+        interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>;
+        clocks = <&clkc CLKID_CLK81>;
     };
-- 
2.34.1


