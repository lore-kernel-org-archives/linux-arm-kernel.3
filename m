Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E745C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 00:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJQ05XQw2SGsZrQOnKICN1vnZehkhp7bZBsJB2GkEB8=; b=EFPmjboQFCuDtnLPg3y8sd8ey+
	Rffs7CpaTBqZzaxVJt6OfHUO1Vb9luBufTfC2drljocZUfbPciRSPrLzkKV56uBbCIamDlE3Jd+Fj
	8ksqOw8xBHkKOyO6cBjWteoosJYfjalwtoPqg2e/3qIAXRBkdV/jMo6zUkBoRuwr4x5q+5QCGc86M
	WZR0CPV63tw932RWwQitgcldG070vzsPu8CaRx+bBf1QM0u98MpVsFaewZ2I68UiVhpta9tW74z6i
	/weYsgOvPQKD4y6LEBgq694De8ZEY9yqJS8EHpnGFH8BBsF6urzMoIdR40lcCzD4xupLvl4+DjUsq
	NTeCQI9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpxhO-0000000DlgR-2XTc;
	Sat, 01 Aug 2026 00:35:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpxhM-0000000DleJ-45Li;
	Sat, 01 Aug 2026 00:35:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EAC7445061;
	Sat,  1 Aug 2026 00:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B74AEC2BD05;
	Sat,  1 Aug 2026 00:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785544531;
	bh=1aOmVYCg03e1PY/bmjnJWyzp3iYiKyxizNXP+wV+hl4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OZNPxc5pZsccMGx2kIB+RPauKTJW2m4OOc3J3TL0t901o4HgeU7CdLZg4IMcKu9Li
	 GaTk9WCObzU4zgatm4q4BxM5GVFRr3HlPgMyT8w9ZxFUka92bDZ9GVhna2tK/OIQKq
	 5begqC31jeK1BO2Bb+jOiaFAw3JZh+UCQC7ZtgrD0mIhKviPKxDwhaNBh72zV4EFH7
	 AZVqi3ugSgRF0dhIgBbPi9hxNXTYTozf0nRvnYTvuzz55y1EaBiHPcRGZqz5i6eVcX
	 CVJGvstXpK9Gfn8Xb8xdFfSfHSCjl77jIe6nIWf2XxliqVoYumjvgPcZO0Mj+9VnmO
	 PPdLtx2E29bgg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B316C55178;
	Sat,  1 Aug 2026 00:35:31 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 01 Aug 2026 02:35:23 +0200
Subject: [PATCH 4/4] arm64: dts: imx8mq-librem5: Dongwoon DW9714 coil
 requires higher voltage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-pp-pro-camera-v1-4-7b4d90788f9f@ixit.cz>
References: <20260801-pp-pro-camera-v1-0-7b4d90788f9f@ixit.cz>
In-Reply-To: <20260801-pp-pro-camera-v1-0-7b4d90788f9f@ixit.cz>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Ondrej Jirman <megi@xff.cz>, 
 Olivier Benjamin <olivier.benjamin@bootlin.com>, 
 Manuel Traut <manut@mecka.net>, 
 Alexander Warnecke <awarnecke002@hotmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Martin Kepplinger <martin.kepplinger@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 phone-devel@vger.kernel.org, imx@lists.linux.dev, 
 David Heidelberg <david@ixit.cz>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1318; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=ESuNmKUilcBmwkhuW9k8KZuVDiNGOXfVNdzvY5NO83c=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqbT9SUDUWs1RjnpAKhNFn6KNoQcgRVwd2qcbcu
 CY9ZsnEs/SJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCam0/UgAKCRBgAj/E00kg
 crR1EAC31s20oGV+f/ztpNaROw1wIlei9thofJ3Isn/pL2saX+KwwalKn7SezGY9tzifXXjBFPA
 mEito6c2HHrmp45mKDMRJWT8NO9E+IKnu7gO5kXj6fg/AmP2onSNeFRZtInpNDvQCRTs2u1EfK7
 fKlNCy0dAcaPOc021zYB71n5WKK+mtc8ge9ttymu6pEtLGno2lSTfUgrwCcowWCX/UZqfLZWs2Q
 5ljMvkeVrJ3Nx4m8oR5qBo1JETFHfz1hMVmqA9a5BX0hs15rbhjTVrE0BBWfwf5UBx0O7pQ3Zor
 qyRNfrnIhOP2j2wYhscXxtEwhYC8YgJTR9QlAlEcOJT+khdamQz9JPpLGtdt8F9KBD4wbYbfro1
 ePLcDfRQG236Cju7wENdMZkzsIN9ObKSiBhfn7M3Y2wu9qczYsd2oU5ywl94N1CyjQAHZ4B3Mr3
 ZRp+rROZTKLr2bapQFeXPD/7fZzvr0U8Ss2KHDdv6PM0b38TrjgDy2bQTBhx9DxwS9KoERi8anX
 ZrFUORtSQPUNWRd04z/3wu3KwePhUOl2Ea77nTZuY/hp2a1Sxf76VOLbrfU2eluzVaEhihZop9z
 fbR2dPlUKAh80T0EvdWyuhCSIe9idmAkhCrq0TSz4PS6TfAucHZizmIpoamUCnBCoVbzBIsAxgt
 mSYT1tlax9RnfdQ==
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

From: David Heidelberg <david@ixit.cz>

By datasheet the VDD (in-kernel named vcc) range is between 2.3 to 4.3 V.
Usually it's around 2.8 V. Here it matches the reg_vcam_2v8.

1.8 V here is likely used for i2c level shifter.

Fixes: f00df2bdb512 ("arm64: dts: imx8mq-librem5: describe the voice coil motor for focus control")
Cc: stable@vger.kernel.org
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index f5d529c5baf3e..583cba2d3bebf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1167,17 +1167,17 @@ &i2c4 {
 	pinctrl-1 = <&pinctrl_i2c4_gpio>;
 	scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	vcm@c {
 		compatible = "dongwoon,dw9714";
 		reg = <0x0c>;
-		vcc-supply = <&reg_csi_1v8>;
+		vcc-supply = <&reg_vcam_2v8>;
 	};
 
 	bat: fuel-gauge@36 {
 		compatible = "maxim,max17055";
 		reg = <0x36>;
 		interrupt-parent = <&gpio3>;
 		interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";

-- 
2.53.0



