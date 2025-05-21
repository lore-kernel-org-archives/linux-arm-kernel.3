Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFD6C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 07:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nha0T5o4wDHhd/CGGXZ/m2HlO5ptB19/5BLoEUoqqes=; b=z5c5v3kUAgDfj9NRRNjlCdovdJ
	oscTlK46J62Ny7Kn2UoXayIbXVVs/sIa3s/6oci4uHubtGqruDv/rvCeGG+tzEct49XfcWvmTFOTC
	O4vq72QxmRdl64H6LVHEinK3LZMt9OuAQSZmui87hxzxfV/eLOFpvUA/SWmCHpvd7sjibV2R6/qv/
	6YvbphNBHnG3zhrGUFQijHFL7mqyYh6vI94A6Hp1W9FVrTa4x6FJ8g0/BNbfBHqfHqqc7i/TyUxuG
	bwrqm1ALVqpDdlMw/pmFY1NYW7yyq6cBtdy0sLxu+vSER4dDKmnxaAYphFDGOTAMmSGhphGSd+x4L
	GFod+Wjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHeBE-0000000F66q-0qGL;
	Wed, 21 May 2025 07:48:00 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHe99-0000000F5rl-2KC9;
	Wed, 21 May 2025 07:45:52 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-742af84818cso3867190b3a.1;
        Wed, 21 May 2025 00:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747813550; x=1748418350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nha0T5o4wDHhd/CGGXZ/m2HlO5ptB19/5BLoEUoqqes=;
        b=L/RkteQhH8PHJIWZwBr3dJmPwoaW2RUViKyY2POnkx7yt9xlft1cCafiGnIhVRljw2
         Du2lBiw37Qb9Iw8Bl4dagissbnTWfynkcxR1ccOkPxbWmz+zn/EB1jKAG6FCZ5nHL+uV
         KkWFzohnILENxvP7r9ZVrArOfUrd4lbib8HCeiR5DPlOGBfOu7GUiCLrJ2lng7AZ/oau
         CWkeWQ5Qebin8D3hn8fvXwgYF3N3GUfV2bKAS4ZN+dibgE4meQSqdu0SWvu6T18kG1bj
         uEFVKxtQOn6XVC+ObWWnCXk2XN+QBvO/shnF28H0gNZmpBDoHrQqzdXHuiaD7vTcKA6A
         z1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747813550; x=1748418350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nha0T5o4wDHhd/CGGXZ/m2HlO5ptB19/5BLoEUoqqes=;
        b=DlxppV/3YmBChGMgP/k2ILElGaA1MGiBe4xGvCsZUKKzaNlYsqnQj8eoiKwzf6iQYU
         A/HxF1qf3PH88l5JgU9A+eVz3ass54I4ll8z207/1GkUobCDiakH3rYxNWWH1TUq+KCk
         W6g4jfaYeGL1tW3bHAs7gY/hj4C4dKO2afUKirhRcMk0ixo7q05ejyXgA3PzC9dgQ/uI
         pM1yIiRawpRb7A0WGWDIhknR7iFD1LTK2EvncKRJxMvdOFXFIFdBKjI9rOuVq6SKjl4m
         bMvxudU30qH8SinjzkLkutzrR2WGU9fsEaP/sebEmb/A8kL0J3l1OQFLIGqDZ0do1IGy
         AdFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQ+NQwRmeMX/dbKocl6SM7hYt+RNHEEQTfDzjq+WzQbCGxzsdDziUPix1qGxuUUaGK6IVVqC8OU6UePWW9@lists.infradead.org, AJvYcCXWJWe7yqguSB1CNvn10+Ij5UNEcWLHQNJVpKLY2ccwbVYuzTvKyX4dgYqP2H6TWYxzLmwaKwgRMY7r0YosKYmVXA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQuqrJWl/JlDnlEDyHJ2JXw6cKtzRrxJyts0iUmpdKx7jxaxW/
	bFs/jcB+arYQ2MFOIhom9sj7on8mLUb3LbIvoPq/XuspCdzrhEvyDSFd
X-Gm-Gg: ASbGncsMa96KHkccTdaB67MrqQSMdXzdpjUpqiootaA+e1FJ52UZPbX0ZCIBT9nCFCs
	aGvSDWA6E0VLgO3LA+X4zyNRTdBTdlXygVFEUMgJKij2+3jlXH9ToE65iIwusVpmPAcI5Jglh81
	EqH0aIs7ZywfQ3kiZ3jI65AfHuE3pBG32y/uaIIs4IZenIGWRKARsw/iYJ7HaFhSL/skNso/HBN
	+nrCpA3kgzI/rUNngm40KIw2O2KROE9u/yB4zeLF9CMdUoBk5CzweCFx4Cw1kzkKpZbEdRuIBha
	g85jCsxd+JGta0p7Rex+2HlR/cBCzCSo6ur34ERH9Og99HH+TOsf+BlG6EXL42y6
X-Google-Smtp-Source: AGHT+IFLq4eF9bCe+UctUxF1+4yfDJzpMBHqdIf10YZab4gAoLecPeEe5Dr1MpuIPXvytZTQ6lNZKA==
X-Received: by 2002:a05:6a00:4b10:b0:736:3c6a:be02 with SMTP id d2e1a72fcca58-742a97eb61emr26036368b3a.11.1747813550508;
        Wed, 21 May 2025 00:45:50 -0700 (PDT)
Received: from localhost.localdomain ([45.112.0.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970c882sm9454464b3a.55.2025.05.21.00.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 00:45:49 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Wayne Schroeder <raz@chewies.net>
Subject: [PATCH v2] arm64: dts: amlogic: Update USB hub power and reset properties
Date: Wed, 21 May 2025 13:15:31 +0530
Message-ID: <20250521074535.16488-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_004551_591436_14648DE9 
X-CRM114-Status: GOOD (  14.60  )
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

Add missing reset-gpios property to the USB 2.0 hub node to
ensure proper reset handling. Also update the vdd-supply for
both USB 2.0 and 3.0 hubs to use the shared hub_5v regulator
for consistent power management. Remove usb2_phy1 phy-supply
since now it's managed by the hub reset control.

Fixes: ccff36934137 ("arm64: dts: amlogic: Used onboard usb hub reset on odroid n2")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v2: remove usb2_phy1 phy-supply since now it's managed by
the hub reset control.
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 3bca8023638d..d46b6aaef8fa 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -42,7 +42,8 @@ hub_2_0: hub@1 {
 			compatible = "usb5e3,610";
 			reg = <1>;
 			peer-hub = <&hub_3_0>;
-			vdd-supply = <&usb_pwr_en>;
+			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
+			vdd-supply = <&hub_5v>;
 		};
 
 		/* 3.0 hub on port 4 */
@@ -51,7 +52,7 @@ hub_3_0: hub@2 {
 			reg = <2>;
 			peer-hub = <&hub_2_0>;
 			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
-			vdd-supply = <&vcc_5v>;
+			vdd-supply = <&hub_5v>;
 		};
 	};
 
@@ -311,8 +312,3 @@ &toacodec {
 &usb {
 	vbus-supply = <&usb_pwr_en>;
 };
-
-&usb2_phy1 {
-	/* Enable the hub which is connected to this port */
-	phy-supply = <&hub_5v>;
-};

base-commit: 4a95bc121ccdaee04c4d72f84dbfa6b880a514b6
-- 
2.49.0


