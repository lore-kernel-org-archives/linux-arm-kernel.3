Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 515B2CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 08:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cu85tt19brw2M8O5SaH5COrWEfvrgApTOcbZRBcoE58=; b=EerZFkr7UY54Iqyah2gJk+DIpm
	XjL6t+Uh1kZKu+9kySYQk5xT4e+ltHULWHEGrolHThGbn96xxZ2sT2bzk/zRb38xQRkUMQzv06DnY
	0i+OfHGLCskA2K/+Dlx6IwRoMCNEK0KViWB/erWKNR1CL+3EkujQvOVsk4brsXTCVnZmODETVdfVa
	ed2X8/b/PpIkKCK+vHYPQHXLWzQ/cPuMhIg9FeoZ2qUUBkXk9Z+STex+/PS224RtpXE1tvd0lsYn/
	8nAuPtx1rY0l9K+XvrkrZcB/AZXy8cxNjmJ29MJdU9j5wGYib9TzU1W3cXctDVU8nh6bUfcWPqrCk
	tvy+zEKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqHI-00000001x0h-12b0;
	Fri, 15 Aug 2025 08:59:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umpwU-00000001sSX-3RRM;
	Fri, 15 Aug 2025 08:37:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0D76AA57F6A;
	Fri, 15 Aug 2025 08:37:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8531BC116B1;
	Fri, 15 Aug 2025 08:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755247061;
	bh=HXEA9l6YKygvEuv8M/1chWcv0RBJVJ1iSq+R8A6ihQc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bSvE7d5TakjlIb8jEIxsvTW1b0Kf3uGEyNv+PL1hKILLgwp82aP3iFdmO/0+pirhL
	 vpNItUZH9tT98ak0RnGqPUNHYlPDet+gZ/GYrDIukTxZdEOvxweQLxN+jC/GmSVeIO
	 n/UIc0c8RfSNIHlJvpur+dkhSdsyWHFmt9OKrNg1fOQIIxMhMioEUXsa2rcvDU/638
	 iZU3wCrbLMgEZoskQ1TJF4NUsNA64jXiLLmGpaYjIhbxB5ogjQu76xwEoDbHM+h0NV
	 gmYGZtGtCQql520sH9+6l6yLH5geR3q/2q0wbP/BjsCfaQ3H1ZnFls/or5ZK9DN3EF
	 /2C7+EXEV8EdQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE9ECA0ED1;
	Fri, 15 Aug 2025 08:37:41 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 15 Aug 2025 16:37:33 +0800
Subject: [PATCH 07/13] ARM: dts: amlogic: Unify the compatible property for
 clk-measure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-add-more-socs-to-support-clk_measure-v1-7-59f04ba67457@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755247057; l=1245;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=ogLhza13Z3+sRdNuog3wi18IBAswOBl0lnCwSfN1OrY=;
 b=I/pWu4T97rWRApNMfafG00zPnjp6BitC2JwcExuQmhW9xDCyeJcyQ2yhM37tCrDcoUd2rnXUb
 fGhA362SrvHB/Xc4jqb9tkx1TFny57iIjqx6o3+bwhiHTlcLanyy9i6
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_013742_968871_A531FFFA 
X-CRM114-Status: GOOD (  10.47  )
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
 arch/arm/boot/dts/amlogic/meson8.dtsi  | 2 +-
 arch/arm/boot/dts/amlogic/meson8b.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/amlogic/meson8.dtsi b/arch/arm/boot/dts/amlogic/meson8.dtsi
index 2f9ecd2eb4cf..db47e1de0b20 100644
--- a/arch/arm/boot/dts/amlogic/meson8.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8.dtsi
@@ -460,7 +460,7 @@ pwm_ef: pwm@86c0 {
 	};
 
 	clock-measure@8758 {
-		compatible = "amlogic,meson8-clk-measure";
+		compatible = "amlogic,clk-measure";
 		reg = <0x8758 0x1c>;
 		clkmsr-indices = <0>,
 				 <1>,
diff --git a/arch/arm/boot/dts/amlogic/meson8b.dtsi b/arch/arm/boot/dts/amlogic/meson8b.dtsi
index 74fd000569a2..3b1d2d2ad7a2 100644
--- a/arch/arm/boot/dts/amlogic/meson8b.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8b.dtsi
@@ -414,7 +414,7 @@ pwm_ef: pwm@86c0 {
 	};
 
 	clock-measure@8758 {
-		compatible = "amlogic,meson8b-clk-measure";
+		compatible = "amlogic,clk-measure";
 		reg = <0x8758 0x1c>;
 		clkmsr-indices = <0>,
 				 <1>,

-- 
2.42.0



