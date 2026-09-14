Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720BEC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMTtok1vGdSBVp0FFKGMeWzosUmEKZ13iMybH/0z0xQ=; b=1ZLFEFTGRdqZOFzkPQo6G5luNX
	g0wF1QTAnQCiS/2RXQBIxq8v2M5YFmjgIX6/3C1IwJWK5NdmeTsVbstmUs1P06dFTepIrFuhbEB6v
	nXEQdlETO6HoHe1aWlCgAFvqXUPpU3Eqxjxd8ZovgvzhByhAQrQ9RuMy+ydFkSSb0fkL8CuE2qKVB
	Q3OdqXyoDVBNQ6K+PG+cLpLZTJ2ZStijM0/H0zWJ4YsIdNhyzp+cmxZ61qH9l0K3DSJP6fUgDZ7BS
	PNyCd88lsa6jj8SDmDrRD2fnnBTge+K1zfwfoo+yO9eoIBCIFvXc3Fru+n5WXQpgG9G/UqGr64MO6
	NPwehC1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x671b-00000003q82-0JNj;
	Mon, 14 Sep 2026 13:47:11 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x671Q-00000003pzl-3ikI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 13:47:02 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1789393612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qMTtok1vGdSBVp0FFKGMeWzosUmEKZ13iMybH/0z0xQ=;
	b=DlJ0uIgUF1EyTLh0jVN0Lay8t2Q1t9ndv1G4v6jHd2oD7Anl+mght48W7eLfTYflPALUT7
	QTVHchWBlHfOLo65UO+GV4hkjbp5du8tczvQ9Cr+1jjp++FS+mdul0JYnDiCnFFlxtPKUr
	QnZuqz8l3+Flt/LATS5C7IHjwrOcY2Xc4uDM627DqU1nQZSQqAHltl7/rjDjWrc90w+P44
	nkLqvDldakwIJZpZ+/shPLO5RTs/1+x3UCKBH1MWtHtM7Lt5G6Y7i58jEMmgTxrWpiwmBF
	lduYz3ig7lPY92ocfL43sR8vizYvBf8u0pEZdXLuw0q011xm1r7MlIoiRIC74g==
Date: Mon, 14 Sep 2026 15:46:16 +0200
Subject: [PATCH v2 8/9] arm64: dts: imx8mm-kontron: Add SPI EERAM on BL
 device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-8-8e12bc5f1f10@kontron.de>
References: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-0-8e12bc5f1f10@kontron.de>
In-Reply-To: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-0-8e12bc5f1f10@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Oualid Derouiche <oualid.derouiche@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=856;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=ksKjZ5u1EhzkI/5X4coFdzLxHzQAXvYnHFT7bfbn+1g=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWv5r1M9CqzBCyQqtljPcwmrnXP+xvzHYfM33LcvXKTjy
 bZdOyWho5SFQYyLQVZMkUWK3+K1rVmsj/yx6iiYOaxMIEMYuDgFYCKO7owMzRbxHzq2n5j95bf4
 ATZeg5OG/059zDgoFKeYLXZm/zcLG4b/9fv+SQl1MMx+WPhOe33a5wk+ykdtfBPqP339VrWh8Ks
 3AwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_064701_188079_C8310202 
X-CRM114-Status: UNSURE (   8.93  )
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

From: Oualid Derouiche <oualid.derouiche@kontron.de>

Board revision 2 has an EERAM chip populated. Add support
for it.

Signed-off-by: Oualid Derouiche <oualid.derouiche@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
index 72588af057d2..27bfad56dbe8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
@@ -123,6 +123,12 @@ &ecspi3 {
 	pinctrl-0 = <&pinctrl_ecspi3>;
 	cs-gpios = <&gpio5 25 GPIO_ACTIVE_LOW>;
 	status = "okay";
+
+	eeram@0 {
+		compatible = "microchip,48l640";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
 };
 
 /* ETH0 */

-- 
2.55.0


