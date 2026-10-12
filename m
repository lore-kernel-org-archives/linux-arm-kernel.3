Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 681C3CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 06:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0YeFbqI9jChUEohbrQpD0CokfPutK/1MCz5spsJNN6w=; b=3WoCIppUzDTwerWP1XP7h4Rzip
	b2DuYLlO7tKIS+It7zZZjQMy9WDhgQFiRIR5LO4+J12JU0tjU3K1XyqUmyJPYhqfttUVdet31fbwC
	nu9Ym+YxU9oyd0ZLC0WwrVFoqqFHqQHVkOHLAfENBOzcOsbuPz8t8xhPQmUvUxhtDSfq7rMdK5FJa
	p+jMssMUfPPPiZ50W4y/+tU0T6LagmUTNSfcE71srAEPILeOiq3ORke4lkM7GK/1R7W4v2Y9Dn2bI
	B1Kpm5KcinKHLQA30km99uM/UIotmeyNaqbJYL5iBlZkdjpY6daDUVLH/O5mo3hV7JpvHqjXkG/dy
	1aAX9aAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9ZP-00000009jxH-3vOX;
	Mon, 12 Oct 2026 06:31:35 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9ZD-00000009jnj-2Mf1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 06:31:29 +0000
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:2b01:a03:2f4:308a:7b52])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 4DA27201E76;
	Mon, 12 Oct 2026 08:31:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791786680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0YeFbqI9jChUEohbrQpD0CokfPutK/1MCz5spsJNN6w=;
	b=GFqI4zi9ww8IsY7ynQe2drNWYenuflsDMJdoK4c+PzO37cGHah3UvCaCuAaGhYWW4nuA6U
	TdJ8WWGoh7/7CW7xMsowujSkq0cT2d7/Updg3lidZ2lguqr5k/cwNOR2dlLpn4V40WJw4b
	UTK/XhnbCkYeO/5J2E4QjpLBU6FU9MNsRrrLewJwOCdsGwR8x60oDBlg/AJzXzurrujjRl
	E7CPN3JM2rWD1eUf0cKfDBMk4VAUN9yzUgeD7kRswgAXFBxHut+RzWTAQLZ9LZJMy5Iqch
	aXp+RY0Bad5/SDomVgjttvIinZwPZHTdo5dpJRFDl4j8YrDfqDQPb0DVbjk3rg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791786680; a=rsa-sha256;
	cv=none;
	b=Xoy6eP5gPq1x+IeY/1cxWV5AR/HHi22CwpnPidvl7rtZOgbirVanzlzr+TKY9ATthau96G
	buNrewDdIxxDOnbuYx2QAt9qjG1aw590qyscVCKSqA4yVazNKDDJcc8cDd1GvvwSV8KGdT
	lwfUeA+HSMpKvPwr0UB3MTi1lRFYR0gKREXbHO7O2zN4WoU4AJPGY9BTzC9E6b3+pAFEMT
	z/ePMQrCGtVo4gcE9woX4L2/78nFHJQsssz36gzVELKg0R6MJE43SXRklc43kyfYkaFBKI
	6tPShvJf6luwPlMFg7xTGPoqlPOn4t8g4NFMhmBwcZNaxBk3qkXF9V0rzsxJOQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791786680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0YeFbqI9jChUEohbrQpD0CokfPutK/1MCz5spsJNN6w=;
	b=d0Z5/HtQecEC/N6xMmMxGVfkslnzKDzJaJYH2SgdmW+ibzMuVYeDUCOYTJ0Z2ESJQ6HGhZ
	tc7qpE4cISfYyAfIukOKXaQ8inEzopLOwZi5Y2ed5458UbN94qGF13VTLlK5fnoODnblaY
	UyuRX3vXHjg/O0uz2ni9DvNOvmGNnAA7PUU1k6jbGXzvergHtGDP5hBg6VlG4+nkc90f68
	pX5R/ydALQnZXZtYpndOWA9oEccLjZrzZCkB0o4lHNyTHlUk4Si9hh2f/aOPpaLU8MmdKg
	SkvHLzbq3sd2+56+52pyMSltZkLOGM2H7oejUMFZm5dkYTP8cr/atz/CvviMPg==
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Mon, 12 Oct 2026 08:30:33 +0200
Subject: [PATCH v10 4/4] arm64: dts: imx8mp-skov: support new 7inch panel
 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-4-0906e57486a3@pengutronix.de>
References: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-0-0906e57486a3@pengutronix.de>
In-Reply-To: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-0-0906e57486a3@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 =?utf-8?q?S=C3=B8ren_Andersen?= <san@skov.dk>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2667;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=P5vuRBOhbsEcKT08GtUQmWhheq+TMxl8t6Locrjd+DA=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9aZum23whbdz4tOk8s5ajqfRe3m7ygZhd8fWKod58tI7
 +vl8LreUcrCIMbFICumyKKysIJP1OODZ+Q0ES6YOaxMIEMYuDgFYCLCmQz/C/KXtPLVG7pvLtTz
 ab5RZ1PxJcPywryLM1R+i7dExpw9xfA/zULFOf0ez6yGrwFLN2/4o9cts+2k2TKNHWfcF256c/4
 vLwA=
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_233124_145291_63AAFFA6 
X-CRM114-Status: UNSURE (   9.82  )
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

This board is similar to the already upstream
imx8mp-skov-revc-jutouch-jt101tm023 but uses a different 7" panel.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/Makefile             |  3 ++
 .../imx8mp-skov-revc-jutouch-jt070tm041.dtso       | 38 ++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 7c1b61249778e..d06f50bfc2043 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -708,10 +708,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
 
+imx8mp-skov-revc-jutouch-jt070tm041-dtbs += imx8mp-skov-revc-touch.dtb \
+	imx8mp-skov-revc-jutouch-jt070tm041.dtbo
 imx8mp-skov-revc-jutouch-jt101tm023-dtbs += imx8mp-skov-revc-touch.dtb \
 	imx8mp-skov-revc-jutouch-jt101tm023.dtbo
 imx8mp-skov-revc-tian-g07017-dtbs += imx8mp-skov-revc-touch.dtb \
 	imx8mp-skov-revc-tian-g07017.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt070tm041.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.dtso b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.dtso
new file mode 100644
index 0000000000000..7b3535f47f3ed
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.dtso
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	model = "SKOV IMX8MP CPU revC - JuTouch JT070TM041";
+	compatible = "skov,imx8mp-skov-revc-jutouch-jt070tm041", "fsl,imx8mp";
+};
+
+&{/panel} {
+	compatible = "jutouch,jt070tm041";
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@2a {
+		compatible = "eeti,exc81w32", "eeti,exc80h84";
+		reg = <0x2a>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_touchscreen>;
+		interrupts-extended = <&gpio4 28 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <1024>;
+		touchscreen-size-y = <600>;
+		vdd-supply = <&reg_vdd_3v3>;
+	};
+};
+
+&lvds_bridge {
+	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 7 */
+	assigned-clock-rates = <0>, <358400000>;
+};

-- 
2.51.0


