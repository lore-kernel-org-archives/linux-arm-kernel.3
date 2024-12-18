Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A72E77184
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 00:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t99gi7wKTizFuiwTq7PjwijgNkljtHLeLL3wkOetILI=; b=4m9p0MKNeaojz+H92XmWvmjkG8
	Xv7sXBim2uWjxK37KY4loFGQjrXS+sC+X3lQ7Fd1AjEDXFDvo99LlUB710rv5XjuaG1uhXBcBnetC
	LJdQMssAoZX4/Y5lDq9po/avCla639iVCfzummwO37L8sIacDq+V6IuPXrxWstStEm90qg3al5YDI
	wKqByNlpPfc0KklhF/5hgZNTzkDcUExtcpHCQ89vxF4X2SyvKIcH5g5LZSlz5Jerr7kQR7yynFlRn
	KSV2fjqc5JbQS4uyomzGpgRszVd+7/X6QHk02p5eB9Oe/NHqBwYpy31ofYdfUvCS598RJsU6I8BDq
	aUDPMKBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNhXZ-0000000F9gN-0qG1;
	Wed, 18 Dec 2024 00:03:49 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNhWT-0000000F9Oz-1PwL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 00:02:42 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2161eb94cceso39801625ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 16:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734480160; x=1735084960; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t99gi7wKTizFuiwTq7PjwijgNkljtHLeLL3wkOetILI=;
        b=C67F9OqdXsRQWSRKlKTIiXbsZn6z+o1qNAf+kOT5Z5L7URoS837cjJE631q9u3hlRu
         3JygcRu7Bj7wnLpEm0Ctjl87t81lc5kZ2soitm2fWY/0X72FTV8+O4zFoeOjzG6bTTHh
         bosQNer4gQx0BrVGNpzskit+UCR90EGBHUNtTzpZABytlohE2dLVHAdoEYUNdNI0zVys
         n4PNHi6QQ+RTvIg2XwkVFz6Ravgsuph/MeowPJFdAP6AbwsjQNj8435TIoR9vijOCMgr
         I6ghy5JLy8Bevd5IlkxLtaYDG1Jv5cEZw22VfafjdmEri7ZehlRaNkAjpeKyK0LtjxXf
         H6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734480160; x=1735084960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t99gi7wKTizFuiwTq7PjwijgNkljtHLeLL3wkOetILI=;
        b=QHdZI9Yb40f2nCs5gYUYMMGinsDD3cGMqGJWZyrtVEbhqCkDIVin0FsIVQD++4Tcw0
         MJv851vCejOIdN2IzXldWUn0plZM/S1xb0TU3d5kB0Jq3/F0xSc96HmFsOPjr7tdDChY
         1/lfq5JsAwGjDureutfaEczlwYSroLR+C9gM9N5PG7bQa5LqGM5I/3FPZlnpkisU8LrN
         q9YZdrxTciQraHzEjgOXhn8QWuGrFWwjJ/L4pxZafWIss4Eg0AYUH9jntvQ+LUGOJc6j
         Lw0x+kIQdlrE0wyb0NKl8JRslc6UaEmvlbIZoDzaJF3OOrw22/qkHV8kMYRRXKwNBbwb
         r82A==
X-Forwarded-Encrypted: i=1; AJvYcCU9HluNLVBvVLJDMl7BTLnUhadLs8Zu+372lmusSzGh7McFaIYfOxVVNuWctPodz2EGWZzG64U80T6ZqXKhHpag@lists.infradead.org
X-Gm-Message-State: AOJu0YwuYMmjQUvFwbUwFBq0ZiacLNallPO18iiEuvBCkUBhloWQu6Lj
	QfiRzJ5XWCFcYB3I+npV0FAyn1nbU8WdlBKtsNBXnLeoEW6C6PI1
X-Gm-Gg: ASbGncufaOupAsYDqRgikO+4cR//Vv0VQK9y2E/gdSdDXF73SN96KhAbm72RNL5RA06
	NEAIDUZnKye8t+tnCaUD4SojVtMgd+5+EmjuUA6TYbMbM2C6I96PdQhWVglc0BUoOwQlq4tUxT4
	HNhEUp83iJilKXEhRAccpIVgzPUQyPJqPVWPooMVEzrbxRdAyyZx7sL/qHfrUepMKAU7Yj1XqI2
	xs18U3gAX08e6fIFIEuAEv3DwtJbUlu1izUYRPZiMR1EVIXYcAgF0ReaaThsgS/4lmHHQ==
X-Google-Smtp-Source: AGHT+IGeC6FgH3X6Be4rp6wQPskxuhh/LlFSfe4W1ii/eQE70jRdVxcaUGOa2QTgpUGoXlzRMIGdEA==
X-Received: by 2002:a17:902:d488:b0:212:996:3536 with SMTP id d9443c01a7336-218d6fca29amr10645515ad.10.1734480160259;
        Tue, 17 Dec 2024 16:02:40 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:9c22:b0c6:8519:2b7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e50300sm65217505ad.164.2024.12.17.16.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 16:02:39 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2] ARM: dts: imx: Use the correct mdio pattern
Date: Tue, 17 Dec 2024 21:02:32 -0300
Message-Id: <20241218000232.74643-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_160241_403188_007424E3 
X-CRM114-Status: GOOD (  11.58  )
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

From: Fabio Estevam <festevam@denx.de>

mdio-gpio is not a valid pattern according to mdio-gpio.yaml.

Use the generic 'mdio' name to fix the following dt-schema warnings:

'mdio-gpio' does not match '^mdio(-(bus|external))?(@.+|-([0-9]+))?$'

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Fix the Subject.

 arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts      | 2 +-
 arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts b/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts
index 7cd17b43b4b2..06545a6052f7 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts
@@ -160,7 +160,7 @@ eeprom@0 {
 		};
 	};
 
-	mdio_gpio: mdio-gpio {
+	mdio_gpio: mdio {
 		compatible = "virtual,mdio-gpio";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_swmdio>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts b/arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts
index 625f9ac671ae..26eb7a9506e4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts
@@ -37,7 +37,7 @@ usb_vbus: regulator-usb-vbus {
 		regulator-max-microvolt = <5000000>;
 	};
 
-	mdio_gpio: mdio-gpio {
+	mdio_gpio: mdio {
 		compatible = "virtual,mdio-gpio";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_swmdio>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
index c1ae7c47b442..aa1adcc74019 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
@@ -94,7 +94,7 @@ aliases {
 		mdio-gpio0 = &mdio0;
 	};
 
-	mdio0: mdio-gpio {
+	mdio0: mdio {
 		compatible = "virtual,mdio-gpio";
 		gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>, /* mdc */
 			<&gpio2 7 GPIO_ACTIVE_HIGH>; /* mdio */
-- 
2.34.1


