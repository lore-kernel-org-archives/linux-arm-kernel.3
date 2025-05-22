Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C7DC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 17:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9pFr/FIpQMKlaLcrurcFbynkq0Hg0CqVLJ+7C8ocO9M=; b=0dDNHv+snyabPAPXwhLR0hL8Zs
	nROFh1ekErIYqc6wWYsjjQ7rz0p1DHGJuBk73Qgtvgw+5bz1BTCIyQJl5uv9VRj+wSgpbusQIBAgD
	gkK+MPE1PqfN0HCEZjLbOQrkFS/5SoaH/p28oAk68l847G7ztfYYfcQMd9yelPQSkC+XhzuUMa872
	DfQ1zgKdu1z44rEykoYwp3zWUgNu529xBXL9Rd3ICFUTnaP0+49M4R+oWalauLoXDq6khMkB9nHC4
	Z5l4ujo6CLwbHnr15m47i7bHPgy7ZGPvLF2V4j38g1+gwjC7GJsFpZevrdTogOwVQl4G7VZw3byw4
	va8JGpGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI9i4-00000001jnN-1QdU;
	Thu, 22 May 2025 17:28:00 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI9g2-00000001jWk-0EzQ;
	Thu, 22 May 2025 17:25:55 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-74267c68c11so7190890b3a.0;
        Thu, 22 May 2025 10:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747934753; x=1748539553; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9pFr/FIpQMKlaLcrurcFbynkq0Hg0CqVLJ+7C8ocO9M=;
        b=Yu7SzaW3cRuny5DIWtV7HphHpavBNfKqT62oDGCrZcU+EZriO1PxN0V91Al5MJu9VO
         2jVslE80V++qN/nRTP1gveojK1tATZUvDwepqmN2EHrR9idEa44dkBj9IDT07nlQExHJ
         E73ONEahMbAxXDBJtZetyS19LcE9t24MF2uGNmVPo5jaio8Qen+ajzPVUepYFOcLHyAd
         pJJRquiPQ62+M7cGmiGZSvQQQ7sxEFX/48veAbZJiAlzSWYcxFYOC9Qput7SHM5y1FP3
         DWq6R6NO3DTJPtKzCThPgnfqz4ALE+7pBIg5MZQnMIDS+l1iR74OPI9fqSKMy2Wsx1CP
         mxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747934753; x=1748539553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9pFr/FIpQMKlaLcrurcFbynkq0Hg0CqVLJ+7C8ocO9M=;
        b=j6K84SHAPetH6IUlHIMpCbyJPiRTZS4dfnC9oVQoOC8DS4Kd3O7iIWH79ncZ6xvnVG
         fgqDsniS/QIzm0OK/igV4ETWTOhJ5R97erEDR2FDEKthTNaBWxmR4GLPLOIDfz+6uDd7
         yiT1azssP7YgEGuvEvpmYlzyxtWupfDZRIPdFiiVrL9moJidU26WP3sk6SL2jXV2DUCf
         T4lYeOG3O1QxnuZwnMl2744HJIO362L1S9lKIhFDl0NimjoFjBwwzUNF3K8kq3Ge96pw
         tZtHIi8VrGp0Z06W6l1JGwzZygxe2vPEKi1UHyXHGE+uD37uN+/vMOLccl0LSwznsS0d
         wx/g==
X-Forwarded-Encrypted: i=1; AJvYcCWOtLBx6LCgRo4MWF+D1L66ZdCeHjvXbbdqTrFQ4kXRDCi+m6Aoc0yfAaluOjmcYLUaujfDuYac0xjC+RnqKfsCkQ==@lists.infradead.org, AJvYcCXtMaoIcRuvDK5aEgCjKy88fxbSZoQCQ0O2xRx17DON53aUXg3qBpxUNf6mj86R0amBpNqRIsMEmq87sG5O@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2k21QMmQNsl1MibwY3Pxy7b/l4T/mRLsyuiPa2ADXC2UI8PgQ
	ug0VXy7sE1VJmOstWcYGNunD9OSrEAIX7wiTOuxBwZHIa7xf7u4xVPFK
X-Gm-Gg: ASbGncsw7TYbgUa6WsZqdqiA4iQRxxN6uijHWx5vGOXJVET1wfDuq3GOd+7PCbHq0j9
	u9XZKJOGb90SR8vpz0MUmMbtPSCQmFsHiy+/lUtB3NE7U3y8cs8NYVKkEn/FXIq40IZXo67bi/5
	7VpjfqDZk+tJ8+UaiLkPAb0/yX+ScUMXUwSaRcV0c11NpcIx4PMDe8E5d0vD5oIziuM/fwukQXp
	EQJRzFK7EN+ZS9+qRSUpE7MxI/8dey0/UeoKOgs4Jm2ltzznkIHLBkWKypbIGLw4s5BMSR4uRRs
	JGNB7heziIOXTr0gkFT5+VVzTEVzmnlZRVmflzLfteK+9DZUaH0R0VigY4Rad3aL
X-Google-Smtp-Source: AGHT+IF/flt4pJtLA7UrwpzFBJxrvaKLM4EJukN6eKdUd3/S73UJzdF9uXaIhdKMuhPjyFbvzvs3IA==
X-Received: by 2002:a05:6a00:9182:b0:740:6f86:a0e6 with SMTP id d2e1a72fcca58-742accc48a2mr30771056b3a.6.1747934752634;
        Thu, 22 May 2025 10:25:52 -0700 (PDT)
Received: from localhost.localdomain ([45.112.0.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982a08esm11471586b3a.112.2025.05.22.10.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:25:51 -0700 (PDT)
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
Subject: [PATCH v3 1/2] arm64: dts: amlogic: Update USB hub power and reset properties
Date: Thu, 22 May 2025 22:55:31 +0530
Message-ID: <20250522172535.302064-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_102554_111771_D97E520A 
X-CRM114-Status: GOOD (  12.64  )
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
v3: dropped remove of usb2_phy1.
v2: remove usb2_phy1 phy-supply since now it's managed by
the hub reset control.
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 3bca8023638d4..ad959f8bc1acd 100644
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
 

base-commit: 5cdb2c77c4c3d36bdee83d9231649941157f8204
-- 
2.49.0


