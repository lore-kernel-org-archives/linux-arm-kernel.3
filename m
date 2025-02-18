Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B938C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 12:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cjuzB3PnxWm2GvO1it31XcsyxP3Ff33L2IJJIbzXRNY=; b=R4N52eb1a9d5ChfrjgRzUNcdGa
	02youJOuTbWAzqiu28zhM4TcQlPrmW8GMoMJRgU63jPSnd67BVq+/ZkFVQOVflHxw3cTkRsok/83W
	hS2BK+5rEnsaYIwZoAoN+ZXG1YTuZbU8rzy3KfcDFcq7Z4XsTc1UviKWrIIgC1Umg7knXFjTQKEio
	hkDVwJ2eEcZri8N4m2IZQEvqdDaICoo3JLmu0k5yIEJnAhGVioGfFCkUbZuJO8EuPFWqeTpVSsoaM
	8mJQG70xBf2+yGaYF5N9KEv4yGHDKN8PaGn6zawtqesAweV7FmjfVQ78uogXZE+3iDjfaD+DDJfQ5
	Bon1O8xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMd8-0000000886e-46zf;
	Tue, 18 Feb 2025 12:23:14 +0000
Received: from smtp-bc08.mail.infomaniak.ch ([45.157.188.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkM6Y-000000081W3-2Q90
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 11:49:38 +0000
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YxyVf6QLBz7Gv;
	Tue, 18 Feb 2025 12:49:30 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4YxyVf32JtzmXD;
	Tue, 18 Feb 2025 12:49:30 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 18 Feb 2025 12:49:14 +0100
Subject: [PATCH 3/9] arm64: dts: rockchip: move I2C6 from Haikou
 carrierboard to Puma DTSI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-tsd-align-haikou-v1-3-5c44d1dd8658@cherry.de>
References: <20250218-tsd-align-haikou-v1-0-5c44d1dd8658@cherry.de>
In-Reply-To: <20250218-tsd-align-haikou-v1-0-5c44d1dd8658@cherry.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_034934_749339_33030E55 
X-CRM114-Status: GOOD (  10.46  )
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

From: Quentin Schulz <quentin.schulz@cherry.de>

I2C6 is not exposed on Q7 golden fingers which is for routing signals to
the carrierboard but on Q7 Camera connector, for routing signals to an
additional adapter (e.g. Q7 Camera Demo adapter).

Therefore, let's move the modification of I2C6 bus to Puma DTSI.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts | 4 ----
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi       | 5 +++++
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts
index 4a1a71995bf5da65d59214711671d87c9ea2de62..327fbc0a56655d5e544a99cedbfb1bcd39ad769a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts
@@ -185,10 +185,6 @@ sgtl5000: codec@a {
 	};
 };
 
-&i2c6 {
-	status = "okay";
-	clock-frequency = <400000>;
-};
 
 &pcie_phy {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
index f7548613ac46e190972d549271ec0bbc0c8a9b92..f398a55408ee2c8259085cf2325da97cdce3e4de 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
@@ -393,6 +393,11 @@ &hdmi {
 	ddc-i2c-bus = <&i2c3>;
 };
 
+&i2c6 {
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
 &i2c7 {
 	status = "okay";
 	clock-frequency = <400000>;

-- 
2.48.1


