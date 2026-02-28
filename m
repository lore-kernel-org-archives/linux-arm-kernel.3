Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11A21048926
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 00:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+NeEpzRQmj9HQYB43w5IF2yW5cBIjWDjGe2ippJ0Ds4=; b=H2eR7zXE0RSWKN3saUiEShhGxp
	kIgZnuY4EeQs+UeXkjNKxNXzjCc73Qv50r7hVpi0rI6whhHNK/2X47K2jZgRJ0cqna++bgQkEAeTJ
	gHnimko8GwXNEN7bb5JOZM7k4RgGOrzJVskGmO2WVvLdOxKkgVMMvxbQ8mrC9eZ8GVavyjc0wKEta
	QVlhzdQQaEeUXzGa6LoVARf06Kwy7khfA/57iAMsN5U68xwgdmJV0LnT8bqF2yRDjZ5dbMMcmf5Qr
	jYflat4FpL931lc1hhj6KDP2XqXY9bJl8FYJAlcu64VYbaPMKLYEzVxIxa4W3MexxNkte72EvJSWr
	BSGY3PRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw7qI-00000009IM2-2EcL;
	Sat, 28 Feb 2026 00:05:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw7qD-00000009IKt-32vI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 00:05:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AD81760142;
	Sat, 28 Feb 2026 00:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1034BC116C6;
	Sat, 28 Feb 2026 00:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772237152;
	bh=elY+CZyZdiBR2XlC4Wmh1wlATCX04DwIBCppVpV7a+g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ahh+EnrrDUNaqs5JvkK4I8eVXCaKWn0fSQTnqW0UwK1fB+kg2oc3OaCFMtt/C4O8N
	 EY0vWd+wLtGaFQsiUgP1o9VhbYHH8JoTBmySMRO8uPMN4FilP3FzW5SiqNKDg7NQG4
	 Z1m6+N4nVyE8VT+SrCmnHRLP8ZDW4xgwvVr62uAp4VXiVd1PQfwKVT4HXCe5QRKU5B
	 xyY0rhL9+dGnIzadHdBHcKSapDvul+ITxybJFU8qTf7KGJhcs/sqkELnSkzbYPiIM0
	 aDryaRNiJHZC+wxUHRFEACdzpkSHIik36EbmAVO0EoS8+kjXVLCXdtr5dV5EGmkgmH
	 mvBVrTAjPDy9A==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 28 Feb 2026 01:05:43 +0100
Subject: [PATCH 3/8] ARM: dts: gemini: Add SSP/SPI block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-gemini-dts-fixes-v1-3-0c6f6d0fb4bd@kernel.org>
References: <20260228-gemini-dts-fixes-v1-0-0c6f6d0fb4bd@kernel.org>
In-Reply-To: <20260228-gemini-dts-fixes-v1-0-0c6f6d0fb4bd@kernel.org>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

Add the SSP/SPI block to the Gemini device tree.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/gemini/gemini.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/gemini/gemini.dtsi b/arch/arm/boot/dts/gemini/gemini.dtsi
index befe322bd7de..23e68e17ffbb 100644
--- a/arch/arm/boot/dts/gemini/gemini.dtsi
+++ b/arch/arm/boot/dts/gemini/gemini.dtsi
@@ -61,6 +61,12 @@ mux {
 						groups = "rtcgrp";
 					};
 				};
+				ssp_default_pins: pinctrl-ssp {
+					mux {
+						function = "ssp";
+						groups = "sspgrp";
+					};
+				};
 				power_default_pins: pinctrl-power {
 					mux {
 						function = "power";
@@ -228,6 +234,17 @@ intcon: interrupt-controller@48000000 {
 			#interrupt-cells = <2>;
 		};
 
+		spi@4a000000 {
+			compatible = "faraday,ftssp010";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x4a000000 0x100>;
+			interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&ssp_default_pins>;
+			status = "disabled";
+		};
+
 		power-controller@4b000000 {
 			compatible = "cortina,gemini-power-controller";
 			reg = <0x4b000000 0x100>;

-- 
2.53.0


