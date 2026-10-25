Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59972606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 05:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JvXVkCfC;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HvY48u6p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ao0LzEZOUNstisYoUSRpO7xtRQdZ2FfSYO9nengEgWU=; b=JvXVkCfCfM33OH
	qQ/lb+fhAYR9JTkoMUyp7dkBF/76AyCKy567msogecvrMKNta/AcOakyYsCxp6toAmuBnJP3x6XYX
	uRf27hN+xTWLbELkNYTrQzSCIEx8EpImTu3gNoyMrETPBDe9rySvJVBIh8CFi9CxDMbGeIfORHhR9
	024rW8ORDkeuQsiHMDAaf5ZY+oPmIVVScEFUymXH4072y5+2z6hJOIrHFg8GK/csXnOYvZrXDTHMI
	yBH41UO04WAavOdk0u0Bz6inASZ0DhjVcBPBLg5AZRtUf54eA2n6cQDMdiYZ9m1D0mZ2Ysg+8GqJf
	o43qmuQ7sJEDR3YNcoUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKqcg-00000000kdv-40lo;
	Sun, 25 Oct 2026 05:18:22 +0000
Received: from mail-yx2-x03.google.com ([2607:f8b0:4864:41::3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKqca-00000000kaK-1m0B
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 05:18:17 +0000
Received: by mail-yx2-x03.google.com with SMTP id 956f58d0204a3-67a3f22cee8so828296d50.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 22:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792905495; x=1793510295; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ao0LzEZOUNstisYoUSRpO7xtRQdZ2FfSYO9nengEgWU=;
        b=HvY48u6pT2SFum+8LAuRNXwQs8txG7nhEyRQd3miitj8B1gAV2xmGzXts5PyV2TG6W
         To3L1/U5P/WnskRNKuTfMD2+3ta75e2OBmssCftQ8dj/0chBq4BetngbdTK3XyacE/qX
         Sa3nEjVyjFwlFyjuaEaG+CFEnUPwrw5edrc3HaxfGxabNHqrkybfyG2FKoj5insD0yP+
         bDMlyAeQdJvlypy/GbyFajzvbJko3XL64SR297FbMvWF7lDU/95npNgbAp1boBXvoHR/
         bt1J9zlpHa5u5Ory8YZp6EFNmeKq9U+iHcl1Wu37+hwZksGOtdNBM56Rz89r9f+Jawgh
         7f5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792905495; x=1793510295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ao0LzEZOUNstisYoUSRpO7xtRQdZ2FfSYO9nengEgWU=;
        b=S/jU1wP+/m4Wz45qxPbl9zwoYjhDSRwGn5IXVy55GGOAEpwZDmF3RxkoqDFSe5eWLO
         pAdiJ5z3AkW0rakVIzJ0HZgga4ASgermFRO+TCWI4SWBW1GqQQNVZdJecgoGqn6Dm6XA
         ZEejqXTkZEC/vuIWOu5NuuKWwTexqukyzOt8hkN7xssiQ+Yc7zSHDAOXINskn0NeztPV
         sXN6UDYZZEyq2hh9w8Ydjx4x3us1PyU9g4dNgJMv45cs2GWcQNfU0BGcZkKbhFXF1a4g
         TFGup84diMrDXOaSySsBlXt2r/tAs+gBbQWynbXjO6RV+6UzQs88O+NV6IAJIiYdVzND
         gPgA==
X-Forwarded-Encrypted: i=1; AKwUvByYJVcl9blJVPE7/tA+8/MTcoPGcuLJJ98CONaVIjPJ6urR/gGXWXnPRAYN/K4Jjz0INFMd/v6REcNPDrgBXBCo@lists.infradead.org
X-Gm-Message-State: AFq9FYLQ+tUlWnTt+EiYbe5Ka0+rrE/CTjnix2b9xLP2x/bPShfOvo7o
	m3bjc1jot7lMO1khLbh2GulhPJIemDc/ANzz7hzBRNH4YPGCAqh4dFya
X-Gm-Gg: AYBFou2FwnRWsuNKwiJenMFCy8yhqm+RfBXk0QmKw43EGd8SetEbKclpsgDw5CBabOp
	ZyboFjrAbKKAyBSCrE9FEu6p24gdXEVUJIdcwnwA7Hkgo3tTkMfJu+uOJRRe63dZ8TS8ULssVsZ
	1CBbQEHj+omKp8vwU6s91TjOC/ZC2rx6qOPtWZTSkBQWfbiLYZxhcZxe8/MbIF9TXZ9CAGvsDvZ
	kE8/1hsyRKGU0J9xUHr1zkaRrkuyHk1HyFGoFWDK9DjhfSGlSdWU/nz/PyumITy8os2c2m3cyD1
	rH+qWFCq6iLND4PuFPvVAxnex+4arJ4ZKOLn2aZaYomNyNbAs/Kgqs8F5ta6XFH1gAOK6hkKtm8
	2m9MLh3XHwEJAa2P+M2Oa0GErCEPmTwaP4+EzMcte98O4Dyoys9S1GcRNG7WKG6NxyLkt28eIML
	636SrMeDOVstq93zXqtsyqkQguyRSE4a3650cIkVcGRzeuWdOZhkzkKnwq5Ea0hiZJGVVkcvD8b
	DIMIUV3T0t151yDLr4NEh9b6ESlQi1a4ot12clpYjoBVQ==
X-Received: by 2002:a05:690c:c4f9:b0:8a0:e27e:8e75 with SMTP id 00721157ae682-8b166c6f987mr22449797b3.82.1792905495289;
        Sat, 24 Oct 2026 22:18:15 -0700 (PDT)
Received: from [192.168.1.91] ([2600:1702:894b:4a00::12])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b166c5d605sm16477797b3.5.2026.10.24.22.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 22:18:14 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 25 Oct 2026 00:18:08 -0500
Subject: [PATCH v5 1/2] dt-bindings: iio: adc: mediatek,mt6359-auxadc: add
 mt6397 PMIC AUXADC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-1-5c3c7a5a1851@gmail.com>
References: <20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-0-5c3c7a5a1851@gmail.com>
In-Reply-To: <20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-0-5c3c7a5a1851@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792905489; l=2798;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=JdiGQh0KVm70DbIkS0pQKFBLtV68drIsj5z75XBPwxA=;
 b=YQht8FlXebiSXOai3WM/zuvpDL9fEatxuBpgvv5MqOVMjp8xIC+PbWFLP4Kp0ZyoptsaARv3W
 OS3S7UU/Wv5DKYeQ8hVE8LNFldXHmNwewYh+zNK82rW2cP6MJ9/KpZd
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_221816_546574_BC191369 
X-CRM114-Status: GOOD (  14.86  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The MediaTek mt6397 PMIC includes a 10-bit AUXADC used for battery voltage
and battery temperature measurements. It is not register compatible with
mt6359: a conversion is requested by writing a channel number to a select
field and pulsing an edge triggered start bit rather than by setting the
channel's bit in a request register, and the results live elsewhere.
It therefore gets its own compatible rather than a fallback.

Add the binding and the header naming the channels a consumer puts in
io-channels. The battery channel is named for the input it measures,
ISENSE, which is what mt6323-auxadc calls the same input.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 .../devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml      | 1 +
 MAINTAINERS                                                      | 6 ++++++
 include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h             | 9 +++++++++
 3 files changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
index c2f7387e4bfc..2847bd5d5bc4 100644
--- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
@@ -26,6 +26,7 @@ properties:
           - mediatek,mt6359-auxadc
           - mediatek,mt6363-auxadc
           - mediatek,mt6373-auxadc
+          - mediatek,mt6397-auxadc
       - items:
           - enum:
               - mediatek,mt6365-auxadc
diff --git a/MAINTAINERS b/MAINTAINERS
index 02426f316faa..b5417c02eb01 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16780,6 +16780,12 @@ M:	Roman Vivchar <rva333@protonmail.com>
 S:	Maintained
 F:	drivers/nvmem/mt6323-efuse.c
 
+MEDIATEK MT6397 PMIC AUXADC DRIVER
+M:	Ryan Brue <ryanbrue.dev@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h
+
 MEDIATEK MT6735 CLOCK & RESET DRIVERS
 M:	Yassine Oudjana <y.oudjana@protonmail.com>
 L:	linux-clk@vger.kernel.org
diff --git a/include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h b/include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h
new file mode 100644
index 000000000000..b696c1cb5ebe
--- /dev/null
+++ b/include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_MEDIATEK_MT6397_AUXADC_H
+#define _DT_BINDINGS_MEDIATEK_MT6397_AUXADC_H
+
+#define MT6397_AUXADC_ISENSE		0
+#define MT6397_AUXADC_BAT_TEMP		1
+
+#endif

-- 
2.55.0


