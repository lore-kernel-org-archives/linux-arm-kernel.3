Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A32CD5A6DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 04:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nE9I1uPOR4sQF959XXKFUqSwci9J/1L0qLYIRegyl2k=; b=htYIznsjwOc2MZQl2Fc/G/ESBO
	G8TOigTvbUoNH0bSYvUGdqkU53t8dDmeZxTRG2XuCcsiY5kOFz4d0E7WV2sUPDqLcFwVJPZOzQwk+
	tjz6HVhSSoHHQxWL6l26FOiZtSRTvtLpOIZzA2is36wGKSjFCMcCeYDlfi3BUWAK+vE0uL+5AZ70R
	FU84m54NGGlOOC2fzTGRZdeZZ79SvSicKZclghxGhozSpKov/q+n9ZTBbYpoXdNZQ2YdZC6ZT8r8z
	L21jEffW50eP2JdqSWyP3GzA4pZIHLDajjE+tGSEIwHp/sFp5T79/CLI7vij2CQ7dsrb0sMbOz8VC
	tdblVzfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG9lZ-0000000CDQ6-32Rm;
	Wed, 27 Nov 2024 04:35:05 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG9kb-0000000CDKY-0nQO;
	Wed, 27 Nov 2024 04:34:06 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-434a1833367so2065195e9.1;
        Tue, 26 Nov 2024 20:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732682043; x=1733286843; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nE9I1uPOR4sQF959XXKFUqSwci9J/1L0qLYIRegyl2k=;
        b=RcQ9JACJxMijjLISClh+bmZK02GbRb2ao2tfE/u2pU9eu7BTdPY9VOJpo4G9eVakiP
         hZaWnNPtpcFbxoN63P7ZQnta1iCLtESXoHsbDuvTHi+prZoj2d9XBm+2MbaHLTf3yIfe
         Cucm4ZEqeZhyugdhS8+GlufAWtA4n9OOfhyBN8mcMOm15qPDHmGbTZscywNo6n9nms+l
         cB1fBsOOknhKDexHGU8qNk8eWKLR+W3HeFGPHcj1xd+n30U5CwOmV3y3Q48RfbSrk9GX
         3+zX2tQh5JAuXnUKQEmt8ztuKOX9cH61Xp91jBoER1YmlT5R9qdV/OX2Rui7Hs6iMp15
         Tb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732682043; x=1733286843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nE9I1uPOR4sQF959XXKFUqSwci9J/1L0qLYIRegyl2k=;
        b=amSs44363800I+0hRn4OlY5VBoxgzNviTxp0l2UVxcc1S4GJPa1dY577uzMRZCb7bh
         twKsH5MFWZ3X5cp+gBaiiQ2267ZcgWRWF07/OIC+CML119iQVmA6qStdDMaQv30L+Fcs
         WUtNe76P6Nun7Z+tW8a8U5bC9jGnOagbgIGVl+IrROSdLphqxI76otakb0cwKYyxAPCR
         G2yst55azdhVESFpTzUR9xUy0tBQBWTXJP5PUqOqGQxLZwSnfTROti9g6SuomWH5BHNm
         CWHzL52cq4xU/z4Ik3tDVlPSTwfT1rXGxsSwz1Fc3K3dyXlczTsHl6LLSuewlRGHpaWX
         oQGw==
X-Forwarded-Encrypted: i=1; AJvYcCVDkZYR3PbzXtW/YBHKaGaDdshjXWyWsVTd1hKLK4beNNsr1YBxIDpQnBh/v42hQaW3+ljF79ZYb9LdVhD/@lists.infradead.org, AJvYcCVS5DDF8pV99bVeqAafBU/b/CS2w2/648gAwJ0LKnF8IrcLoXXZCnqi45y5POFLFbPFLe9Z7C6s8IQz3dIPZKNt9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJRBz9Igu3oYraVyktVUeTRrlh1nIKHepnBl3nLIxfYGNU6+hW
	zPPDXpUW4PUzcYjL5y6QmIfrY3Y8+O5K4p97rhZM0b5FSb5q69Id
X-Gm-Gg: ASbGncvJiVPIAbK4Ri82gKseOYERAPZzde+L7qztZgdODCu/KKJ8R7ZaffOLDf+lvt+
	LsSBZudGNQDHlQDCd7S8suSjPbTTuI6POv83ZNHqxsnLNU1WcheC0qFbuLKvLLbp5PNHCIVWap6
	JZKEKe6s7QbyLqqfDOexnu0C9u2D0kSAthvNXv7CD8OobuWipPOL61AWGJuxNIpl8f9zMXtvWvk
	f3cdSfE2P1uiG6kK13JX/1J6Lvk0lF3Xroy6o7UevFgHf/noTswlz0=
X-Google-Smtp-Source: AGHT+IHFTh4QPCHLqYQqSQVx7EWaLp6Y5TlpjfC3lTUuw+N9BykWXKF0iN1qJk77JxXDjEBKXKGF6A==
X-Received: by 2002:a05:600c:214a:b0:434:9d3c:31ec with SMTP id 5b1f17b1804b1-434a4e988b5mr44514395e9.10.1732682043182;
        Tue, 26 Nov 2024 20:34:03 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7e256esm7503415e9.32.2024.11.26.20.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 20:34:02 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH v2] arm64: dts: meson: remove broadcom wifi compatible from GX reference boards
Date: Wed, 27 Nov 2024 04:33:58 +0000
Message-Id: <20241127043358.3799737-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_203405_228881_706D50FF 
X-CRM114-Status: GOOD (  12.11  )
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

Amlogic GX reference boards shipped with Broadcom SDIO modules and
this is described in device-tree files. These boards are rare, but
their device-trees are commonly used to boot no-name Android STB's
that closely follow the vendor reference design. For cost reasons
these boxes often use non-Broadcom RTL8189ES/FS and QCA9377 SDIO
modules, and for availability reasons the chipset/module used can
change between batches of the same device.

Testing shows the only requirement for WiFi driver probe and load
is presence of the correct 'reg' value, and all Amlogic boards use
the same <1> value. Removing the 'brcm,bcm4329-fmac' compatible
allows a wider range of Android STB boards to boot from reference
design device-trees and have working WiFi. Also convert the 'brcmf'
node name to a more generic 'sdio' to reflect we are not always
using the Broadcom brcmfmac driver now.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
Changes since v1:
- correct and reduce subject/description line length
- provide a better explanation of the change

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


