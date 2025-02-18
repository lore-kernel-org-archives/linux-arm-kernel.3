Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8658FC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 12:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fL9rLjdGWzxinKft3YC/Oz604GLR1yXfh7MYptbag7M=; b=zmcU09gPykc+h0NbQ1ms8NcUVq
	W7xPPT+bnsWzQJmoMu1HLo3y90N7eE/0YFi+An85HVkKTHTrfBnvG3M19Ug5GxgpsKeg2LPF2m5Nr
	rTRI5bcqdeZeuKrPI0lURGK+wmqTtu9dH3qVRTdV9IMvclpXwxRWyanaVFqNn+126DjX1TywswB3D
	pP+vs9mqKrCbm1SoEejNBp4kWxTiE62eoAggMdZ43nM6+gguwJN3es0KGLEqkXraB0JVegPsiZfuz
	0OCsOiQVRC1chmpG43AEvmuEMJaKzfKGnx09ctADVPZhaECTgkMuH+NBoFiTAgCLcX3eZfF+3LmDE
	XWXizk9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMYq-000000087N6-05wd;
	Tue, 18 Feb 2025 12:18:48 +0000
Received: from smtp-bc0c.mail.infomaniak.ch ([45.157.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkM6X-000000081WD-2goT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 11:49:37 +0000
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YxyVg2sRSz6J3;
	Tue, 18 Feb 2025 12:49:31 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4YxyVf6L2mzkNs;
	Tue, 18 Feb 2025 12:49:30 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 18 Feb 2025 12:49:15 +0100
Subject: [PATCH 4/9] arm64: dts: rockchip: disable I2C6 on Puma DTSI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-tsd-align-haikou-v1-4-5c44d1dd8658@cherry.de>
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
X-CRM114-CacheID: sfid-20250218_034933_871265_D18B47D4 
X-CRM114-Status: UNSURE (   9.83  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Quentin Schulz <quentin.schulz@cherry.de>

The bus is only exposed on Q7 Camera FFC connector which accepts
external adapters such as Q7 Camera Demo.

The enabling of I2C6 should therefore be done in the adapter Device Tree
Overlay and not in the SoM DTSI, so let's disable it by default.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
index f398a55408ee2c8259085cf2325da97cdce3e4de..548bd7b486c185c80be87d433f149c3fac65ae8a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
@@ -395,7 +395,6 @@ &hdmi {
 
 &i2c6 {
 	clock-frequency = <400000>;
-	status = "okay";
 };
 
 &i2c7 {

-- 
2.48.1


