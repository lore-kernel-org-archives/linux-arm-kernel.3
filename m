Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F2DFD0073
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 17:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zhInBc9xBjiN/WB6ThVtfJ9uDChq69SJEtwcmq3dwfc=; b=ampe9vEb7gPGc+Whr9u0OGWW5o
	7RXFnE7ADNV+raO+4BtwzFn/wVE8hoPpPvXBfjeL4AGOg8xGlVramrTLt0+A1gqJRR+7JoocaGv1/
	znrbmTDcV6W3m0ENDBcFPWkYuTGXR6PYOCR0O8vnV19CrzLbsmmOTtMD7eXQlzpJssJmKfXL2/oi9
	R5c28VYfJ6wJ/sKlPjsrCv8E1GrQyBoMUZ3l/H48oHjkW1vkTo7T0KTrTPqGyK3qW0JI1XCwMQZZH
	mJw0XOS1LzjQELOKZ4RDsOjx27XYmdIV4av9eUq3oN9ORVi4vegUP8cKhpE6oMlMXbFn7LfisDU2F
	ae37u1aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwkwt-0000000BjrM-2Cg0;
	Sun, 01 Mar 2026 17:51:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwkwr-0000000Bjoo-48Ui
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 17:51:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 709EE6132B;
	Sun,  1 Mar 2026 17:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32520C2BCB3;
	Sun,  1 Mar 2026 17:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772387480;
	bh=W6cSrGd0y+hrVmL05+ccKmQuO7d2OHllkzkMpslpFb4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=stX4SPXDwpSTyym0Pc/k1PVxPfqXK73WCgkdk873AKI8DSR7H+Tg1Zga+lwuAwI76
	 0/N2F7myFUzWOWVzPhStrjs4LXBc0oyJfYhZ+tpCEVXbWmBh10ol0eBCtRCoK4MhMs
	 aHDzRwuRZ5Ie4vszBeaz+pZEzh7hI+3PGCgsg1nPSa7eqq/DTDjvV+u2E++1xJ+nVo
	 BS0Yrldt9MgdJLDz0au/PXz9HE3e49TKaAFvumLea6B6jMP1WgvFDuK0mLu3hPoi7b
	 WO+Ol2PkpQY5wxaz3mLgeXUqayApkbf4l7+st+nCz+im1TQc/btzQM3LXgc74etpyA
	 6HQ1SgYC4lmMw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F3DFD0075;
	Sun,  1 Mar 2026 17:51:20 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 01 Mar 2026 18:51:24 +0100
Subject: [PATCH 10/10] arm64: dts: qcom: sdm845-google: Add STM FTS
 touchscreen support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-stmfts5-v1-10-22c458b9ac68@ixit.cz>
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
In-Reply-To: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1269; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=4/lfzEYYZjUSxYP/aTkLrRQ2VN8Psoxavi/IstIzuL0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBppHyVaCX9KjhoeEmo7YHELzM8zuZw6Mbc4G6o0
 VIq1w9OLZWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaaR8lQAKCRBgAj/E00kg
 ciBFD/41NrAOanfs7cx7e+2sECckL6NCNiYD4+R7Ez7hXveR0nbWJxveRy3dbRvMv6/MSxR/3M7
 9xyS9sWp24g3qnPNugFmVr5Sw7L5EXuW0dq7N56JBE9aAEab3D8E5CDyqqoNxYItk5Liv1oCvke
 oG2ZF6RO4fAEIdfScDi179tNE050cB3ddgWCm7kxwIh98oxNSUfVdYzXY2X3zDOeCyqs1xOrK1c
 JBRKed9j+vcJ22XL/nPZvN30P5EaD/yzbDJALiBdcZInagRoYRYrDLm/NIr09Kx85a5c/wQNqaA
 TTG6kv+SNNF/w3wuxb86eDrEegWJFhztfew5zKha8AQP/ikCnUwOT5OG8G9tyPkiG3YlMX861MG
 e9EYqc/JPDmpR0g3V/6FNqfO+nrfQb72T3n2ZgnRq/Q//+G+waw+uroFZuPEQRpb4lXqtJmZK6w
 cv74HQ8VTmTjzlGHOAeWPZuPyOKxZSmo1zIGlYRy9idGqNvkx+D8a5TGkDJXrqO+zXvXy1BuPLk
 LNU5vQm8hXUcmWFuIScQvTeeXX4B6Ucp27RDqM0fykYu6kWLj5mBUVk+C+Xy5jFQU/ZHLZIMhEx
 ZyAreXzqU3StjwAJx69dWraCNBF4HfZH8aB+r9LYuWOYOaLrra6j6FgOSYjx+Zxi3BID/E88zIL
 RvFppiUpphwbgLA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Petr Hodina <petr.hodina@protonmail.com>

Basic touchscreen connected to second i2c bus.

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
index fa89be500fb85..2501104b06e1b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
@@ -26,7 +26,26 @@ &i2c2 {
 
 	status = "okay";
 
-	/* ST,FTS @ 49 */
+	touchscreen@49 {
+		compatible = "st,stmfts5";
+		reg = <0x49>;
+
+		pinctrl-0 = <&touchscreen_pins &touchscreen_reset>;
+		pinctrl-names = "default";
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <125 IRQ_TYPE_LEVEL_LOW>;
+
+		irq-gpios = <&tlmm 125 GPIO_ACTIVE_HIGH>;
+		switch-gpios = <&tlmm 136 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&vreg_l14a_1p8>;
+		vdd-supply = <&vreg_l19a_3p3>;
+
+		touchscreen-size-x = <1079>;
+		touchscreen-size-y = <2159>;
+	};
 };
 
 &mdss_dsi0 {

-- 
2.51.0



