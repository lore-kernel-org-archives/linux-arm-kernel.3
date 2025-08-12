Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25D4C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UIMOvue31dwc/J4aquxw833RlbJuhQchriCV8fOzVLE=; b=NjE+ZCoDzgAUMExmt3Rx9m19b+
	7ViDHsA2UpEY2fxIZyu4x9myXHALECyAmcmRJwTLrvXlLIH1jfnN56Y0Axos/UAuLGZwKcZshY/oV
	ZJEbNyvMW1MXetC+gjIne6oWxUIWPyAqSQ5tyJTZXjny7Z0hl4o1hEl9aBRKKVW5qg5TLl2Ja0RZ7
	agY5rIByVYtWgYOCyhCeh4gyL3DCuvSDtErxR7MIUOSS92beM1x8ecJSrzOK1EGHsJxpDpmhwDEDv
	v7O+Ywa/k8Ba3QJTT4JCcUmb/qd1oyrZDZ2iLyQO21wiHoZ9X71mOw9SKcxoTKL063jlPoNdNQUQB
	F29wEyCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloHT-0000000AlN9-013f;
	Tue, 12 Aug 2025 12:39:07 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkcp-0000000AHWE-2OIc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 08:44:56 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-af66d49daffso869938266b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 01:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754988294; x=1755593094; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UIMOvue31dwc/J4aquxw833RlbJuhQchriCV8fOzVLE=;
        b=byiwgO+esT8bsXMVU5bR+L0A24L+mEsBKaIMbhjpBo6t/elXPrENRIY8WGpgM+Accq
         r6bLz/Z/iNeqDx2dOFQXE8oWFmBlyZMSMVsWQYigzVh5W1d4eiTECjLwHEFgWAYKcCUz
         CSVZLfId0Cxe3T48PXGL+KynGApceMEq6cFyisTjVbb6vEqsx/RK/uYFWzJU/KlUTLYM
         G6nOqH74gZN4+qMXQeIOuXfAefzxrqVjfuSrUXO8W8fK8HEbG8h0/8peme0kUSShNXAs
         2ZxzkDihRxuuoiX0YLO3gKHvVEU/z/xWHZrb/zpfozXTywXD4sOWstbFhkt+JZ4x++bB
         Fmow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754988294; x=1755593094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UIMOvue31dwc/J4aquxw833RlbJuhQchriCV8fOzVLE=;
        b=Yp9Cs2VrEqLHLd3meu+aiTxvU3QsixMRSDILf9A6L0V3Lvi7W63vL2mKCw+PzhdXaV
         dEHS0YWXzuR80KWnudaaf6cb5hRzahMLg2fOG7VxlLW8vTG9Q9lcyNe86IP/ApaaG444
         l2lBjVWFnbNGQWr9GDHApnbbDnj0um7e7XlHb563rWcJaqvSaOOo06rjgW0S6hPDW0x5
         8SxcYmff7+LjlT6aLaNcvnvQT1IuBlf3Omksp6ZhT6emgJpW3R40Q+Rq4bou44xSswMh
         xM9S9AQ5OcBuR7Q01gjjFvmvNQf/2dDxn/kxtHSwSgPQI0/A/ID1oP7pj7lTL6sJvLAI
         izwA==
X-Forwarded-Encrypted: i=1; AJvYcCU3HraRKx4Uit2xKwG3jDE8Gou41iKbu20E+ruLAihZGvBnxhSsYfGcAVLWJOr8cExUaze+wjgyjRFUM5oxwwnG@lists.infradead.org
X-Gm-Message-State: AOJu0YzlgdVp2OWZM6s+YJjNbIlivF6RexXnYdS5MSjQkDTrahX9plX9
	+lMgArQxpUFLVthrQVBf1CEdIxF1wRyi2uwZFm+2drFNhqkwrCSAoR4oDummCiZVGWQ=
X-Gm-Gg: ASbGncv5y0w0txmusYY93DALv/LZjpzECjPskpUJeZQw4C0oVvyP1fzywcmjnRM28U/
	41VL5s9YPg67iAG/NuxE4lNHq3q0gHItPFpmu9X5FIQ4BQgDEMF4aEmsitXt5ToaM/Al5Zn22CF
	QnXsiWzH7OWq5WNhiSQTgBINyzrNBRH/nSDB94JEFbguGAOYf+yjyA0gjrESJU1wk+bpVgv0cML
	ua2WqYMs47XqbQiC4xVyPurV+Ec6O3HH06cBejJUfNqa6ac2URGahQFIh23KPSNQnDhM1GP0a6Y
	D+S0ZmbyKOmz9OSDsGHY8RBMiL85YSSmPlF5dFWnbqGFi9vYlb9iRM24/UKtU9YBhqI2yzaMUm2
	+M0y030J/1xjjo/xXKSuV4nAC8ufHSwOHt79RISMdnWAJ3XFUprgvaSDlp5eOfHiJ4A==
X-Google-Smtp-Source: AGHT+IHGS28WyNhkMEqCYl++k5tXKsI+SYF4vISQjhRE5gJkG3IUVoDSvuT7pIyGxqFMWkpcex+/TQ==
X-Received: by 2002:a17:907:3f94:b0:af9:14cf:d808 with SMTP id a640c23a62f3a-af9c654272amr1559960166b.55.1754988293947;
        Tue, 12 Aug 2025 01:44:53 -0700 (PDT)
Received: from localhost (host-79-44-170-80.retail.telecomitalia.it. [79.44.170.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a078afbsm2158282666b.4.2025.08.12.01.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:44:53 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	andrea.porta@suse.com,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: [PATCH] dt-bindings: pinctrl: rp1: Describe groups for RP1 pin controller
Date: Tue, 12 Aug 2025 10:46:39 +0200
Message-ID: <20250812084639.13442-1-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_014455_635937_5721EAAA 
X-CRM114-Status: GOOD (  10.97  )
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

The DT binding for RP1 pin controller currently lacks the group
definitions.

Add groups enumeration to the schema.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../pinctrl/raspberrypi,rp1-gpio.yaml         | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
index eec9a9b58542..af6fbbd4feea 100644
--- a/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
@@ -72,10 +72,36 @@ $defs:
       pins:
         description:
           List of gpio pins affected by the properties specified in this
-          subnode.
+          subnode (either this or "groups" must be specified).
         items:
           pattern: '^gpio([0-9]|[1-4][0-9]|5[0-3])$'
 
+      groups:
+        description:
+          List of groups affected by the properties specified in this
+          subnode (either this or "pins" must be specified).
+        items:
+          anyOf:
+            - pattern: '^gpio([0-9]|[1-4][0-9]|5[0-3])$'
+            - enum: [ uart0, uart0_ctrl, uart1, uart1_ctrl, uart2, uart2_ctrl,
+                      uart3, uart3_ctrl, uart4, uart4_ctrl, uart5_0,
+                      uart5_0_ctrl, uart5_1, uart5_1_ctrl, uart5_2,
+                      uart5_2_ctrl, uart5_3,
+                      sd0, sd1,
+                      i2s0, i2s0_dual, i2s0_quad, i2s1, i2s1_dual, i2s1_quad,
+                      i2s2_0, i2s2_0_dual, i2s2_1, i2s2_1_dual,
+                      i2c4_0, i2c4_1, i2c4_2, i2c4_3, i2c6_0, i2c6_1, i2c5_0,
+                      i2c5_1, i2c5_2, i2c5_3, i2c0_0, i2c0_1, i2c1_0, i2c1_1,
+                      i2c2_0, i2c2_1, i2c3_0, i2c3_1, i2c3_2,
+                      dpi_16bit, dpi_16bit_cpadhi, dpi_16bit_pad666,
+                      dpi_18bit, dpi_18bit_cpadhi, dpi_24bit,
+                      spi0, spi0_quad, spi1, spi2, spi3, spi4, spi5, spi6_0,
+                      spi6_1, spi7_0, spi7_1, spi8_0, spi8_1,
+                      aaud_0, aaud_1, aaud_2, aaud_3, aaud_4,
+                      vbus0_0, vbus0_1, vbus1, vbus2, vbus3,
+                      mic_0, mic_1, mic_2, mic_3,
+                      ir ]
+
       function:
         enum: [ alt0, alt1, alt2, alt3, alt4, gpio, alt6, alt7, alt8, none,
                 aaud, dcd0, dpi, dsi0_te_ext, dsi1_te_ext, dsr0, dtr0, gpclk0,
@@ -103,6 +129,13 @@ $defs:
       drive-strength:
         enum: [ 2, 4, 8, 12 ]
 
+    required:
+      - function
+
+    oneOf:
+      - required: [ groups ]
+      - required: [ pins ]
+
     additionalProperties: false
 
 allOf:
-- 
2.35.3


