Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42175C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 09:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TmB3VwzqmYYYrbvoIpxGgYUP5XtGUkR2yStXvoSAy5k=; b=juDI2vBwJU4CXgXXVSFpTyZ91L
	0cDbwPno3YR0g6lj9JNHxM3ilnd8GBfgZX3hoqpbE4lPPyWBMlH5rWmGid669Mo4n6SBzyDlkCXuw
	uok9UIZ+NIq3iTySo5mPVKSaeTgr5AQlb34E18ovcnNGFKrRie14EPK2rk2AzeakZJoS0+I9JtbjW
	p73e0gnVus0WCZ23g3URY/5wgK7LziK8g0NABkvBc+1zrwibkuHpikbHpUlivlmaD9AbEX+W93Spd
	sh0j9XIT15AhT8CiIT1Rlp1AxcfV4X4oZYZJl2AU7/wpLYC/zOhzyvZ6l51JUZsean4G1+1R4mf5Q
	qwcmb+Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJQB-0000000CDbs-11tC;
	Tue, 20 May 2025 09:38:03 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJ7j-0000000CAWn-1coF;
	Tue, 20 May 2025 09:19:00 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-30e7bfef364so3929801a91.1;
        Tue, 20 May 2025 02:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747732738; x=1748337538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TmB3VwzqmYYYrbvoIpxGgYUP5XtGUkR2yStXvoSAy5k=;
        b=NeUSi9ms1wM74XFqE3jlqRRYzoOGwNWBPyOymH3LetqJNNB2/R6dS+4AjONVrAlP6d
         42BSpDhEz1De9U7JeTendRidz3NkY7BZaTz2mGdzMmAk7i4JWGCL6wErhfvE7RpE5nZI
         dHdLoW8DkUslt46C3AotBlORWDVbDFSFUCV0ItarNiJuklHMPet0uVcSi2j6zWaVRSvR
         tcJpmQp6QTYLTR1xSJJMJq3cwmsEdki4DdHjH2qOK95Ge+507oFJ5PwRzv2XTeu8omdk
         FaxKyHGIy/YRiM1/2QqjyPqUvKsMvrALlja2DZxz8KUd0kHUP4VZbn8Wp5HOulckDLFA
         stwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747732738; x=1748337538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TmB3VwzqmYYYrbvoIpxGgYUP5XtGUkR2yStXvoSAy5k=;
        b=G1Z5hX5Z/xSjXFUHUxMwnxdObWy8W3OLFeQ8r6K32/XSJIAggh4pAb4ZWc44cIrQLJ
         HV6XKUbYQTn0kPtyZ3ndRKIWcW6xR4wfVrGIeITcKHCF9hBLAq1ZyOENlOCZTWkE5Cg8
         ks9ashKJmKoS+FArzauLub8uwz9N3Z9/p9zftXULyPeid/gXBC12FuEt5dq5wrY8anoy
         6Bu6z2ci2nTq8jMS0OojmbN+C+R0Mx4+kxuvHWHElHFVLYtnU9AgOAUc+c+LoJ3NgUpo
         uiKeG7m8OYsX1cUbd4zd+3kNfXtZb2oyQAS3+W1GmtPnJDN5CxCJE5VfxPiLbbK/q3Mz
         wClQ==
X-Forwarded-Encrypted: i=1; AJvYcCWM0ub1xhbw2vtgfLgDKU8QoLFOfZYHHTldbZhspQa+fHinDNvPmjkffNyBVr9Ar+22icgYPNLQulwBGdEV@lists.infradead.org, AJvYcCXPIMw9tjSEkaGxkJ1Itu/eXYLTSxQNOHPzo6LJKE42mkOo/Zqc/NhswadxrPlkXNGLZ21N7P5bokU+t1sdZ84BMw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy51jljKZ3T3CamEZSY/y1Dfe946F2L8Vt6BUS2rQr2K0PDtekt
	iKZxUKaPSiIgngnVUtf9vu5JbnM1jodOoYio0dEE06LPZtj8HEqdukhJ
X-Gm-Gg: ASbGnctknRy91AyBEzSimoo9fBnFi3dacPHBwCtyv6LEdCqSgX3djvXFDNQ0+7DSJwp
	y4bHaYU/n4y1aW4k9j5GxdhsSPQrbiBzeZ/az6l3uYO/769LYVWIw0UAjd3k/CbQF5+7543tfPj
	VsguC8Q7P1ws+8E3ySmZJoVl37OC3v8LGh42aRwZWLMtDAfqT+dLrOz6ZWnDq6658jE2uhu2gO3
	8FwJ7o3XbhmlfIgMOBZa+33TO1IjRydMRnxG9vyVZYr3RmSFMIC5jjCeB2MaSzKSIKaYtjNUmbh
	6ui+h6sfA5QnHuvgotjOolrgiogERpfK0V3sjd0uT2UScNP+haZNGgko4mKKZmL9
X-Google-Smtp-Source: AGHT+IE28a6scW2QVGOA23Pwnnww73CjLpUNOlALdPW4xW8rkWwlD+bLi3eSQOuZ/ve+uP2ennOZNQ==
X-Received: by 2002:a17:90b:5603:b0:2fa:228d:5af2 with SMTP id 98e67ed59e1d1-30e7d53fa9cmr24165884a91.15.1747732738078;
        Tue, 20 May 2025 02:18:58 -0700 (PDT)
Received: from localhost.localdomain ([45.112.0.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36368ecbsm1216868a91.8.2025.05.20.02.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 02:18:57 -0700 (PDT)
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
Subject: [PATCH v1] arm64: dts: amlogic: Update USB hub power and reset properties
Date: Tue, 20 May 2025 14:48:40 +0530
Message-ID: <20250520091842.7504-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_021859_423919_16279BAE 
X-CRM114-Status: GOOD (  13.20  )
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
for consistent power management.

Fixes: ccff36934137 ("arm64: dts: amlogic: Used onboard usb hub reset on odroid n2")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 3bca8023638d..ad959f8bc1ac 100644
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
 

base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
-- 
2.49.0


