Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E035E668A0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 08:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r4wZNAYoXyTS6KWqhdId+e/j9up0DyZ5zMGlnmmsV7E=; b=hdHyEgecKBtA2yZU4vmOyZVEU+
	qpTScEJgI1M/xYga+u/WDbOy/KQnBQCq+Vaw85WecFL0pIB6JwF8Ck8Z7+X/4H9VuJbUaHpHtTEsg
	Pti4ZhZzemwR8PYNUrA9STuU03AHLYu4j77wdtTgCXoey0q/p558Ll06VuWw1xt++JBKthwse5af9
	9NOQ7mn+9DsLii2XxgzIBekyQnwTQxSWr3VKY+4ChwOrTAz8C6Pnrj5h2LOEQr7SELpQcJlXhQOeA
	N/gUEZnB/8l/D/qSXtD4fN+VyOF0nooNq94XAxLNa4EQ2uijZngSGfpgHxN2/Gum09KctfmHpBGnP
	6iGqFWCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tF862-00000005U8H-3JzF;
	Sun, 24 Nov 2024 08:35:58 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tF856-00000005U2m-0sdK;
	Sun, 24 Nov 2024 08:35:01 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3823eaad37aso2766307f8f.0;
        Sun, 24 Nov 2024 00:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732437298; x=1733042098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r4wZNAYoXyTS6KWqhdId+e/j9up0DyZ5zMGlnmmsV7E=;
        b=GYUNbtWP0tGorfR+dx+CyJq0SPgUxIN03F14vBHb4s7mmnl1zJoOwgkWY7iRkigEbo
         0boEV/3U2AeYe+guwJArEbaxIzWgiO7XB2XBgsOIxdwVrbmzDlAiUjZqTrX0af+sKuUi
         47RpC/NIXWWO6aHdOM+elJNpTXbjq3pBGW3UQJDHRIRmMLZTlkjEwE8NYi7fmelxxWXX
         vjifAVHdKkoxQ6lMjmhrQYshSX0CD5K4EojL5N73GrvTMCspjLl0MFJOuTpbqKIxM+2W
         xbVyXbf7uS85p+3w7MTN0mGrp1I7PhPo8EKDN4SSnA6m/GMk3tA/uQZPXknfztxkm18Z
         Z4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732437298; x=1733042098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r4wZNAYoXyTS6KWqhdId+e/j9up0DyZ5zMGlnmmsV7E=;
        b=OEY29VpFf4KylMcSyz2gu4DGdKqSRi9PLA1XCH/6sJZlescy2n3x4Jm+T945EWzcT2
         4GuVGX55+7hPxmpQKHFpmVJ4UnGjUYH1kiX4Iz3Fg/ke4kGHXIPWuIECDVwOIS5v9BHV
         faN4llRqLFE1MoVH2IseDoeW7czLFVhN+1olL1dJvpTV8S3n2otH/cxgCAeXKMn3O1KU
         BqJ7eLpeRu2swU48OPw5JCbPIAj1F5fxVdpMRUmkkbueiDLAbJryOVViAsfa5/Ju6/Wi
         puugPqJIuPut9UPcaiI2JWVJ9ZJTx/xmv/mO4Xjrh8Y6RuPJGBDfwuRN7bQkRy4Ya0dE
         Kmsw==
X-Forwarded-Encrypted: i=1; AJvYcCVt6FlaIuHuOegPa0C+oXrfT+dgc6Yg1ClOVagDUNSuWPWPGTvMnqBTTk3IxY6PzGdF7IurN82kbm1Hx611hfwqyQ==@lists.infradead.org, AJvYcCXk83gkE9NTQpS7W0P9SyZruv6o3zc0w95zQ8Unw4BdcMTIvs6EislfElgOq9zkyxtnt1Kbc9/ZV2ecleah@lists.infradead.org
X-Gm-Message-State: AOJu0YzRxhedDRgGY6UAOAWlyl98uzmextk5Cm+P7oAM5bHnfKdDrCxZ
	4fMMYJDjF7Uee8SEbzt7TT+nwdKXPKLMBQNFSC/8ZZ2BkKGFPtMW
X-Gm-Gg: ASbGncsTW+klIAF0xau7lOq4oUBliM+lKqcVdy/gEFq4udhhr4Z4dwU0RbmUYWY9EMZ
	qVKX+pD5aJ4dKy9TJhMCbJDx98oU1+MFZs0l1OYYVmJ4uZFt0goEu9MsxTbhOt0qhsrIMMRkTCO
	mmuahw+6ytQMvkP2icTjplaNOTt3Gs2Iz16pD0E5Ct7XwuDLAwFOsfwUXgQRMVznty8LJAiP0U3
	wnqqyPbiVbOGJMwkyrQBCageonR3rCVD98qhqAI3JJAQX4tOvyDi5k=
X-Google-Smtp-Source: AGHT+IF5cabE2Tx7RTeVKjrsbOyjk5UWacuIke+YxdcwrSskiev6s1JwXABaTjTX/jeVSCAVboeljw==
X-Received: by 2002:a05:6000:79b:b0:384:ff3e:e0a6 with SMTP id ffacd0b85a97d-384ff3ee0b0mr3986555f8f.5.1732437297456;
        Sun, 24 Nov 2024 00:34:57 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433cde1151esm84949895e9.16.2024.11.24.00.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 00:34:56 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH] WIP: arm64: dts: meson: drop broadcom compatible from reference board SDIO nodes
Date: Sun, 24 Nov 2024 08:34:53 +0000
Message-Id: <20241124083453.900368-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_003500_268010_DC73A102 
X-CRM114-Status: GOOD (  10.10  )
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

Drop the Broadcom compatible and use a generic sdio identifier with the Amlogic
reference boards. This allows a wider range of Android STB devices with QCA9377
and RTL8189ES/FS chips to have working WiFi when booting from the reference dtb
files. There is no observed impact on Broadcom devices.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi      | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts  | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dts  | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts        | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gxm-q201.dts        | 3 +--
 6 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
index 52d57773a77f..1736bd2e96e2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
@@ -178,9 +178,8 @@ &sd_emmc_a {
 	vmmc-supply = <&vddao_3v3>;
 	vqmmc-supply = <&vddio_boot>;
 
-	brcmf: wifi@1 {
+	sdio: wifi@1 {
 		reg = <1>;
-		compatible = "brcm,bcm4329-fmac";
 	};
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
index c1470416faad..7dffeb5931c9 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
@@ -102,8 +102,7 @@ hdmi_tx_tmds_out: endpoint {
 };
 
 &sd_emmc_a {
-	brcmf: wifi@1 {
+	sdio: wifi@1 {
 		reg = <1>;
-		compatible = "brcm,bcm4329-fmac";
 	};
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dts
index 92c425d0259c..ff9145d49090 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dts
@@ -21,8 +21,7 @@ &ethmac {
 };
 
 &sd_emmc_a {
-	brcmf: wifi@1 {
+	sdio: wifi@1 {
 		reg = <1>;
-		compatible = "brcm,bcm4329-fmac";
 	};
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
index 7e7dc87ede2d..b52a830efcce 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
@@ -134,9 +134,8 @@ &sd_emmc_a {
 	vmmc-supply = <&vddao_3v3>;
 	vqmmc-supply = <&vddio_boot>;
 
-	brcmf: wifi@1 {
+	sdio: wifi@1 {
 		reg = <1>;
-		compatible = "brcm,bcm4329-fmac";
 	};
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
index d4858afa0e9c..feb31207773f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
@@ -72,8 +72,7 @@ external_phy: ethernet-phy@0 {
 };
 
 &sd_emmc_a {
-	brcmf: wifi@1 {
+	sdio: wifi@1 {
 		reg = <1>;
-		compatible = "brcm,bcm4329-fmac";
 	};
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-q201.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-q201.dts
index d02b80d77378..6c8bec1853ac 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-q201.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-q201.dts
@@ -21,8 +21,7 @@ &ethmac {
 };
 
 &sd_emmc_a {
-	brcmf: wifi@1 {
+	sdio: wifi@1 {
 		reg = <1>;
-		compatible = "brcm,bcm4329-fmac";
 	};
 };
-- 
2.34.1


