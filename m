Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1EDCA5FD9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 15:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xreQkLTfr4EnWmasn1726NMPTL4rKnykYzYKu9Ts+w=; b=imEuX1k8ZZ3LF4FxQvLSXxUJZa
	6RFSGba/sP5iT14TILwc+o433KFdMJUMN5WW3XFBgbboCSCeF6Cjb6uUQUAAYJGFoicxyw/IMes9g
	HZRAAiIuyBMaRViawoNytHpnMC462Q3VdUB/dQl6V+yzedUKXhp/AHD2VrHFBKbBpfhBYZmAmMaz8
	d+sJt7RR464hGIIPDpTCTHrKHgbbIxWEJ8tMdNdNpv8cOVwaSTjlXOR36hqhbuJLkfsK/MGx0PZr0
	w7F3rMyF2GocldryOygTELWOknc8751eBuDpE66cmPqTG7LTqKAlXkDhMHL/c7K+wxodSd9ql4itZ
	Wmxj+WPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ6z-00000009bBN-09ZE;
	Thu, 01 Oct 2026 15:54:21 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ6q-00000009b8Q-0hv9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 15:54:17 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 7CB9D1FC8B;
	Thu,  1 Oct 2026 17:54:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790870049;
	bh=4xreQkLTfr4EnWmasn1726NMPTL4rKnykYzYKu9Ts+w=; h=From:To:Subject;
	b=QSC5cCzim/N9s4EI5RmBwM41nD26tPsvtWdYmJfDD89RFLaUsz4Z0gqEsXjRbYqPH
	 IfEs/42kXnxsBQ2b5FXMhb8hgzW4GLjadsqaCO+U9hjAyZmiSe0TAqeVruxUJ2AvLE
	 Jm8pxa+AyO//yuriUx+5M+he3WM8VBrHh6+vlaXcLS/UOA+TRRGDrqFATLdnGKqpBT
	 NE5r0C0yOrWS3jgD1wLXPQLMjvanMeOb/pT/SxxIVvXNaB9J/2e7Di008Kd0p2YwpG
	 odyQhsXeyNmACrOPQ/IHVl0y1/c0sZbfwR1VaULpD8mdSm6MCX2t1aVG8gVNMTk+L2
	 nOf1wLNNeRZcw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] ARM: dts: imx6q-apalis: enable SPI1 and SPI2
Date: Thu,  1 Oct 2026 17:53:58 +0200
Message-ID: <20261001155401.2584935-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261001155401.2584935-1-francesco@dolcini.it>
References: <20261001155401.2584935-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_085413_110022_5FAE3579 
X-CRM114-Status: UNSURE (   8.81  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Apalis SPI1 and SPI2 are routed to user accessible connectors on both
boards, X27 and X24 on Ixora and X38 on the Evaluation Board, and a
device can be instantiated from user space through the spi_master
new_device sysfs interface, so enable the controllers here too, as the
Apalis iMX8 boards already do.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi      | 10 ++++++++++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts | 10 ++++++++++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts      | 10 ++++++++++
 3 files changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi
index b6c45ad3f430..a2ab075ce120 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi
@@ -31,6 +31,16 @@ reg_3v3_sw: regulator-3v3-sw {
 	};
 };
 
+/* Apalis SPI1 */
+&ecspi1 {
+	status = "okay";
+};
+
+/* Apalis SPI2 */
+&ecspi2 {
+	status = "okay";
+};
+
 &i2c1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
index 3ac7a4501620..6ef2a986ca8c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
@@ -100,6 +100,16 @@ &can2 {
 	status = "okay";
 };
 
+/* Apalis SPI1 */
+&ecspi1 {
+	status = "okay";
+};
+
+/* Apalis SPI2 */
+&ecspi2 {
+	status = "okay";
+};
+
 &gpio1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart24_forceoff>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
index f338be435277..6b5393accc09 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
@@ -65,6 +65,16 @@ &can2 {
 	status = "okay";
 };
 
+/* Apalis SPI1 */
+&ecspi1 {
+	status = "okay";
+};
+
+/* Apalis SPI2 */
+&ecspi2 {
+	status = "okay";
+};
+
 /* I2C1_SDA/SCL on MXM3 209/211 (e.g. RTC on carrier board) */
 &i2c1 {
 	status = "okay";
-- 
2.47.3


