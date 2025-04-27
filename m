Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF728C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 08:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFIDnjjBixCsqIHSTkUHSF/akN3O0qOzMZ/jw6UNaRw=; b=gaIpoeHMGtwkdfbf3ZCF9yrN9x
	GlmxUAGBEy2HuugA9JIOVjwUs1auje2nd10VOtOaD1CF5wfQcuvNQ+XH27Tk8WVBJ3NxaKp21VM7T
	i9bS2QmfM91JJnm9OTBP3K2IrmCC4MGS5lujcMv0IjGm9eztRf+WhmoBtfeOwdIOuh7mbhpi0p+BE
	Ut1aVad/J0be6ZXnUrnRezfwjR0qVT/C139mIRpBFCnwUEW8M4Pb9YFtBdJfq1zWBVS7+M1CNFHmc
	Cz1dhiOpDQ6XweeXCf28XGA+xLXHyIZp5All2wHQ1v5kT5qnMZwRIfrh0noSMrpew4USjK94ShnNF
	7DcXXVpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8xSQ-00000003Bou-1BOF;
	Sun, 27 Apr 2025 08:33:50 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8xKi-00000003Amg-1YKP;
	Sun, 27 Apr 2025 08:25:53 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-736c277331eso4550337b3a.1;
        Sun, 27 Apr 2025 01:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745742352; x=1746347152; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFIDnjjBixCsqIHSTkUHSF/akN3O0qOzMZ/jw6UNaRw=;
        b=fdk/+a3XS5nDbMZ+JHJUVTLwTFfYBaMmHjLNnmCQHpdANMnd9Oe/KgHM1v+hjEf8zM
         SFWlep9ZNTCAWvHsWo2R7BF20QhnAXVz8uZaRim/3u/3RberSb+/AIAIGmcjixtowl4h
         /U5W+jD+vvHSOhSjPR3fD8VZooqJRYgKzQv9KONBdHnEa+2VvVpDfZ63H41NFtJV+fhU
         kXhK7MzWELg2cgmopUB/a61j6goBuvaQnbpYJi1jvEDmiKJ4uOeOhbEBTmW5YSRzT87j
         r/XCDVI7k/U8kwACjHO6/pKzHnStI7A4UZ9zwd06qIKIQxK+5x9D8H8Y6szPnikWmgKr
         NHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745742352; x=1746347152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pFIDnjjBixCsqIHSTkUHSF/akN3O0qOzMZ/jw6UNaRw=;
        b=ZznYotBtcXcDeylPm/4HPJ9WzCgi84eD4MbAarIzGsiBerna0pLkbP45IFSKf2ncwH
         OZZF3o6pmAh4LBVORMmr8ffom7yzuoWSWReQuLt1zddzUOKitqCdvhVmEEfsjAgsqywX
         WNeDKW2mIgeOZtSetIpjGmyDBvzZIzLtAjwKm9On5b50jvYrlUndw+irPoKHjmxa7QQ/
         fH9WJmnDvIXkUGVwew9twsQv61+pVb+ODmjyP9dfA4HCA6k0xElYNJOGvvAGt99p1MAR
         zgb35BJlygbhIcePACjVmXjciMEExUBs+0YC6X9vvuqOwglTNIphdbPQFsnYAGKCCKaE
         yCkg==
X-Forwarded-Encrypted: i=1; AJvYcCUGz/D8wniWAWZA5bbwIQTqqIrOKXGvgtW++KARoslGBiWh/t75R2SsalZmfMWEwKYByJm2RSRndaoBr3zbOqyy@lists.infradead.org, AJvYcCV9+PfSO7QmotxjJseFkQGZWinZaXpdfIlpWosJHHy65SwlUW3IbcNHpuv2MflvdT5lsySfuCfOvAzUUVP2D4Qw1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzYo5P8H+uc5yDwOosFgiMvBB4GwUT/jsBHss3dempMuFoT4O92
	yeP77/sHdcez3i3FJNSFK3xZxGM319sFgg3PtgSk/WHqTxxI/Yls
X-Gm-Gg: ASbGncvKjwN3XX98RFW7NfxAiolfjunA90aRqZiTie/A1byFl7bdK954jKWWEOoKcmD
	j2ZcNDQC102xgqOhJ97K4Jl5Vrl9+wemtBSkgS0nJtptT4BEG658X3/tcc+Z5b8PTrJ/0pi8Dft
	8h6EEBqglQjNjGHtGQIm2B1temL3bs3pfjqDPX4LWnj+Zo6e5iNsN88YxZtg3JZKfoifYgzFnJG
	vC/GaE4EwImnNvCtPpxTJF555ZosqqtbQbwzguSy1QdjtwAfdCFYDoyB1j1fIGMDOY6ATzb5SW1
	4zba32bcYMWSuAzeng8imYsNl6D1YjH4++qC3/Wc/PgxI24PugTGwg==
X-Google-Smtp-Source: AGHT+IEE9tESNitS340243NR75TTRy3mJOc1Opl+pT6NC9QcFHEBSD+U1fuYWl2jRI5ij6l5EOhyeA==
X-Received: by 2002:a05:6a20:3d24:b0:1f3:26ae:7792 with SMTP id adf61e73a8af0-2045b5f6042mr9104900637.18.1745742351816;
        Sun, 27 Apr 2025 01:25:51 -0700 (PDT)
Received: from localhost.localdomain ([14.171.43.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e2549f570sm5900852b3a.0.2025.04.27.01.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 01:25:51 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: andy@kernel.org
Cc: geert@linux-m68k.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	christophe.jaillet@wanadoo.fr,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Nam Tran <trannamatk@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 1/5] =?UTF-8?q?dt-bindings:=20auxdisplay:=20add=20TI=20?= =?UTF-8?q?LP5812=204=C3=973=20Matrix=20RGB=20LED=20Driver?=
Date: Sun, 27 Apr 2025 15:24:43 +0700
Message-Id: <20250427082447.138359-2-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250427082447.138359-1-trannamatk@gmail.com>
References: <20250427082447.138359-1-trannamatk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_012552_409269_BDA5C751 
X-CRM114-Status: GOOD (  14.04  )
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

The LP5812 is a 4×3 RGB LED driver with an autonomous animation engine
and time-cross-multiplexing (TCM) support for up to 12 LEDs.
It supports both analog (256 levels) and PWM (8-bit) dimming,
including exponential PWM for smooth brightness control.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 .../bindings/auxdisplay/ti,lp5812.yaml        | 46 +++++++++++++++++++
 MAINTAINERS                                   |  6 +++
 2 files changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/auxdisplay/ti,lp5812.yaml

diff --git a/Documentation/devicetree/bindings/auxdisplay/ti,lp5812.yaml b/Documentation/devicetree/bindings/auxdisplay/ti,lp5812.yaml
new file mode 100644
index 000000000000..fb94a6336e16
--- /dev/null
+++ b/Documentation/devicetree/bindings/auxdisplay/ti,lp5812.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/auxdisplay/ti,lp5812.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI LP5812 4×3 Matrix RGB LED Driver with Autonomous Control
+
+maintainers:
+  - Nam Tran <trannamatk@gmail.com>
+
+description: |
+  The LP5812 is an I2C LED Driver that can support LED matrix 4x3.
+  For more product information please see the link below:
+  https://www.ti.com/product/LP5812#tech-docs
+
+properties:
+  compatible:
+    const: ti,lp5812
+
+  reg:
+    maxItems: 1
+
+  vcc-supply:
+    description: Regulator providing power to the 'VCC' pin.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@1b {
+            compatible = "ti,lp5812";
+            reg = <0x1b>;
+            vcc-supply = <&vdd_3v3_reg>;
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 7940ddd91196..241c5441e239 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24016,6 +24016,12 @@ S:	Supported
 F:	Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml
 F:	drivers/iio/dac/ti-dac7612.c
 
+TEXAS INSTRUMENTS' LP5812 4X3 MATRIX LED DRIVER
+M:	Nam Tran <trannamatk@gmail.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/auxdisplay/ti,lp5812.yaml
+
 TEXAS INSTRUMENTS' LB8864 LED BACKLIGHT DRIVER
 M:	Alexander Sverdlin <alexander.sverdlin@siemens.com>
 L:	linux-leds@vger.kernel.org
-- 
2.25.1


