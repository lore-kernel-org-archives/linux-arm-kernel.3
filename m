Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF077CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 08:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDJs1dSvI17A0lB0Ca/iiGUhzIQUZ+524bkDCCk8Vf8=; b=rZHfgKjfYUlb4ZB9IkbIQGfc+E
	soQR7N9jblMmMTnG+hvAj6SoV6QOGY+hsElYpPGq/UUZtMinn+PBDlghNw4vcKwq8BGYyW2uo4BZx
	ARC/sVa74FanzOwD/IlBbE3erUM7RzskzrHllCfsJ1OvuQ1Thk76SPRsqoMudWg2F7uovb+pFsI9t
	oKzhBJ834EIlSrVqkJIsbV75Dhb1+DYltQcuUDGQP3W2T+A+IGr8oh7BQ89GLCSuUk29bEpJFUTUE
	xlRJl/MeY3iKV8AmE2/w7f7NhnGe8wb5i1w2cmyuk3RLSQy0k8O0Ij34MpCaLyMVRZ3+9cj9Qr7Q6
	eey8rfyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umq6u-00000001uJv-2aRS;
	Fri, 15 Aug 2025 08:48:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umpwU-00000001sSH-2CUC;
	Fri, 15 Aug 2025 08:37:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CDD134631C;
	Fri, 15 Aug 2025 08:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E7DFC19422;
	Fri, 15 Aug 2025 08:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755247061;
	bh=5yLR73S69Dza2YSwslzv9M45RT0dAh/D/n8Q4U3GUj0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jGXrrp0qxYVImzDOQxKoRu1G+G/wn+x6tJfhfm46tNT4S/i3tOyLlE4risb1tZMXV
	 Adeiw2ZwJV71e7hyUHJM4KnXgxYS47Ep8eWkMGdkkaeX4pDs1PVXl1+5dV7BDT2lEn
	 792VQrF796kBZcvVmMSrtqh/yrTLbU1ys61SeOV59TjTxJUDGqMwxT3bCsXWbdvtHf
	 eTJKIg1CbWZYn61uNmts4NINgU+KoPdks7kdMgTsrdhWS4eDqm7NDfFtFGcMNJME5Y
	 ev3SNdg4wnB61cw790tQhIFnZGVh7CTmI+ftnI0l3kvEJr4YNoDbxfwDWJf+ytlBBu
	 veWW4YsR2ffnA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 869CECA0EE6;
	Fri, 15 Aug 2025 08:37:41 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 15 Aug 2025 16:37:34 +0800
Subject: [PATCH 08/13] arm64: dts: amlogic: Unify the compatible property
 for clk-measure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-add-more-socs-to-support-clk_measure-v1-8-59f04ba67457@amlogic.com>
References: <20250815-add-more-socs-to-support-clk_measure-v1-0-59f04ba67457@amlogic.com>
In-Reply-To: <20250815-add-more-socs-to-support-clk_measure-v1-0-59f04ba67457@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755247057; l=3522;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=EHJwnnddK5r6qztNb2TJl7JYxmXy90quB+2alicslFc=;
 b=zv242H2x9f/LEwB89LfCTL3Z61M1JxVpanUqgW4kxMvHUmoNhs0D9AxOm8Z5gvO/ddNsWqG0v
 va6BgMWpjgGDcMk0PIbiWWiDNCXJscS56n/rDO9UWGfJHIWQNOfPSMD
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_013742_622147_3F591277 
X-CRM114-Status: UNSURE (   9.93  )
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

The clk-measure IPs across Amlogic SoCs have minimal differences, so
they can be managed with a unified compatible property.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi       | 2 +-
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 2 +-
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 2 +-
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi         | 2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi        | 1 -
 6 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
index ab9ebabce171..570cac451d63 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
@@ -761,7 +761,7 @@ internal_ephy: ethernet_phy@8 {
 			};
 
 			clk_msr: clock-measure@48000 {
-				compatible = "amlogic,c3-clk-measure";
+				compatible = "amlogic,clk-measure";
 				reg = <0x0 0x48000 0x0 0x1c>;
 				clkmsr-reg-v2;
 				clkmsr-indices = <0>,
diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index d4a4a037e0f6..e939ec6186c6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1858,7 +1858,7 @@ spicc1: spi@15000 {
 			};
 
 			clk_msr: clock-measure@18000 {
-				compatible = "amlogic,meson-axg-clk-measure";
+				compatible = "amlogic,clk-measure";
 				reg = <0x0 0x18000 0x0 0x10>;
 				clkmsr-indices = <0>,
 						 <1>,
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index dcc927a9da80..54220f105a4d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2385,7 +2385,7 @@ i2c0: i2c@1f000 {
 			};
 
 			clk_msr: clock-measure@18000 {
-				compatible = "amlogic,meson-g12a-clk-measure";
+				compatible = "amlogic,clk-measure";
 				reg = <0x0 0x18000 0x0 0x10>;
 			};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 4510e3403174..4330a6284873 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -365,7 +365,7 @@ uart_C: serial@8700 {
 			};
 
 			clock-measure@8758 {
-				compatible = "amlogic,meson-gx-clk-measure";
+				compatible = "amlogic,clk-measure";
 				reg = <0x0 0x8758 0x0 0x10>;
 				clkmsr-indices = <0>,
 						 <1>,
diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 21a9fb27ee3f..8df234ad78e8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -630,7 +630,7 @@ internal_ephy: ethernet-phy@8 {
 			};
 
 			clk_msr: clock-measure@48000 {
-				compatible = "amlogic,s4-clk-measure";
+				compatible = "amlogic,clk-measure";
 				reg = <0x0 0x48000 0x0 0x1c>;
 				clkmsr-reg-v2;
 				clkmsr-indices = <0>,
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index 8ecf876c73ee..2279237db793 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -478,7 +478,6 @@ &cecb_AO {
 };
 
 &clk_msr {
-	compatible = "amlogic,meson-sm1-clk-measure";
 	clkmsr-indices = <0>,
 			 <1>,
 			 <2>,

-- 
2.42.0



