Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1195BC71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 08:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/yiAY4Q83bBJo2+drko8BS93Fxqshr7ucprcwVtMnHY=; b=mCq3FmjYNeMhmhz0E2TNunEGqG
	w8Vaisv+cYR/wNmUW4n8DXQ+viegUuzYTDxDFlEjnzcYG/iVdpI58OepaElQ0yBdAzrOVS4ASUBe3
	suZVa7WWcgU3Rq8Vx01OT3c4uoM3txcW+/2g3g7vlwJ9wszwmAYpnPACpDz/EQ2engFUTRXNyfwY9
	l5Sr9EPvkEB5yCZWyC4UAuT6afCYqjprF2bq4qeLkZEKgN6TdaLHWqNgbrkO160uudQTRxLS/dkem
	yLGrPiTdFI6CMWzTbdHFBiHMUdUEIa7PsPQ/+PwekKN0cXbBqXJpyP/10jhCPu48hC+zHbg/azGK0
	OF77NE7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGw6-00000009Hgg-0ymh;
	Wed, 11 Jun 2025 08:35:54 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGSl-00000009DHT-1tVH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 08:05:36 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2363497cc4dso19563975ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 01:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629135; x=1750233935; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yiAY4Q83bBJo2+drko8BS93Fxqshr7ucprcwVtMnHY=;
        b=cin84x/eHXnuHlN/j6e9WMz3Rvt8PycFdWHuQhdgImPNzP0KjMJN997fPod3fblPZe
         YMBK7BQfuphXExw+WCHS701fQXdA6jsontvyXG70bJti4B/2U9m2Sqz8JpfXx3hkRAWv
         iaTVYBPAxPT+DbH8dhRORX+Hz7uIenajwo7yxOHaB6bHeMNWLO4kULxrCAeQ+24A+rsg
         YC+1OcIN3JCgvRAY3sVg0BKh4oXpwtt/E44k4vKinTgurx+CItrBcv2V/n72N7eASxAS
         3tTGvo9P2ogKrO/eq3JAAXtm6IXSGus/VWdiOrSKIy3Oh6o5u4bzvFRm0MuGzgLkeKAq
         dbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629135; x=1750233935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yiAY4Q83bBJo2+drko8BS93Fxqshr7ucprcwVtMnHY=;
        b=ZQFGa9wDDHFpEiSUiCl0hL9ZpskbJ/KTRY0YOQC1jbaq+fqOjcXXryVlBQOVns3Zdc
         d9eqbwGL7Ac280x2F2jxOhPHs1jlxYSNppQYjEBpeZIo0csunog0xQBun0VTNM7yRMV+
         hi/ivL5dfkktMKOnVCdrIui4g1SgvZMpWfE2kSDxIFdThKLaEJRzX2e4IbJHbBct92Tr
         WL626XC6yYnVHg6nyIhxAHzDohmqugCGrt624gyReCoXqB0LgT+X8n0daa0Y0RDttVgD
         rtlcjnb0QgtxdWAwqDB6ZvFLCG2chWh/nONqQLWAlu1QOMm43VchDZS+b29hSJvTpiJX
         uiRw==
X-Forwarded-Encrypted: i=1; AJvYcCU23F/emkTkgbG7sD207RsAc5AQEHm59sQNiARKkR6cuP52D6WU8fedG9kEjdmd17PrI4zszETOcGd2mUlyy6d0@lists.infradead.org
X-Gm-Message-State: AOJu0YzSasW2vvKs/gpQxDQF3s0fezWdr/bf8GPgoIjMb+92+df4xB3k
	+clN3zfr0LQYfOjtUspAdv8wVXY4nbUyF/kdmGY8RfgCj6bD+zMZ4HKt
X-Gm-Gg: ASbGncuMEyB5x949NFf/7nET/vkO4d2cVi3pWyE9zE+c4PclNTfjS2Z+JV2x15p7N9/
	ng9E2J82EtmQJRXi1+K3sJ1DcEkqDqspUYFg3qcL9lqhrE86dJ8W3Aw1Qu4ymNkR/OvTQqRa40c
	D8NkDkixTipW8ncZcWNEoNdDi/vpLJCL4DC/OPZQWbB6wJ62i0FAz/z7AYg9eaJXxzz88SPWU1E
	kbb/KSEr6Eie0EF0SAi2A6vmu32qTSNEwwzkR9HbUbjOBh7HmnGl80c/x7eDzeZ2pJy9+6iynaQ
	859zrA2Idp+PvI5KXEZKp2eu28XZlTHw1i2irGaGTfrDKjc0pptSF0NMVFCPr985oFoT9csWupU
	k7RfMwZBMgb7Huim2JUKVlAYFLaLeaQDpkYr8X+RsJyv7iDG3xisoWJJD5e4fWxoYEum88PfyqZ
	8LmwIkbQ==
X-Google-Smtp-Source: AGHT+IEzwF+A+5L5D4Y4qNQiMWPC4Srdbngbqeik56tXJV3s90XynVUFJWSxoFJi+YjtiMgfTeH52w==
X-Received: by 2002:a17:902:d60d:b0:223:4537:65b1 with SMTP id d9443c01a7336-23641b28de4mr37862505ad.36.1749629134891;
        Wed, 11 Jun 2025 01:05:34 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e357-b8a8-7759-271d-6134-9aa3.emome-ip6.hinet.net. [2001:b400:e357:b8a8:7759:271d:6134:9aa3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2363ad90982sm21283835ad.220.2025.06.11.01.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:05:34 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: peteryin.openbmc@gmail.com
Subject: [PATCH v2 5/5] ARM: dts: aspeed: harma: add mmc health
Date: Wed, 11 Jun 2025 16:05:14 +0800
Message-Id: <20250611080514.3123335-6-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250611080514.3123335-1-peteryin.openbmc@gmail.com>
References: <20250611080514.3123335-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_010535_495139_E3745DDD 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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

Add a GPIO expander node at address 0x13 on i2c11 bus
to monitor MMC health status via a dedicated GPIO line.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index fb026c8fb0ee..b9a93f23bd0a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -454,6 +454,25 @@ eeprom@52 {
 &i2c11 {
 	status = "okay";
 
+	gpio@13 {
+		compatible = "nxp,pca9555";
+		reg = <0x13>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <222 IRQ_TYPE_LEVEL_LOW>;
+
+		gpio-line-names =
+		"","",
+		"","",
+		"","",
+		"","health-mmc",
+		"","",
+		"","",
+		"","",
+		"","";
+	};
+
 	gpio@30 {
 		compatible = "nxp,pca9555";
 		reg = <0x30>;
-- 
2.25.1


