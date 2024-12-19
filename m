Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8442E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 12:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fcM1j2hse9IPX30avtg6nunUHpH7/PsjwT7KWjawNRc=; b=nT/kQnlyRgiHYYrqEXXFChJlNU
	pblLSmREG1VfC35wlGmPDcJC9/TUQ6PiGuRiHb5CVNG7vBC6oUXwx8HiuI3e3Op+8QoB0XuPtOAOu
	Go95WxRP5GTabqYJpRH4m5QarEBIIfz/9IMelcJ00j/uWZMvbx3ocla1XF6Le0STPQi8nBqs8ga9Q
	foxLtmcB4BtrBBz8KGdscD0volFs3LYrrJKi8qfkJL3XTnh3JFBz4MvfRju8IpP1Icurtzd0V+rTk
	m0z20kMqOlhVAA1vWzOKj9aOWUX/HyQlO81xLlbXd0MIBfq1CFD9cNkIDQKudaxmaidr/8WJrq+9H
	6EcgCeAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFr4-00000001qNJ-3ach;
	Thu, 19 Dec 2024 12:42:14 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFk5-00000001odE-0fS1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 12:35:03 +0000
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1tOFk3-0007aQ-Um; Thu, 19 Dec 2024 13:34:59 +0100
From: Jonas Rebmann <jre@pengutronix.de>
Date: Thu, 19 Dec 2024 13:34:57 +0100
Subject: [PATCH 2/2] arm64: dts: rockchip: MECSBC: Add FRAM MB85RS128TY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-mb85rs128ty-mecsbc-v1-2-77a0e851ef19@pengutronix.de>
References: <20241219-mb85rs128ty-mecsbc-v1-0-77a0e851ef19@pengutronix.de>
In-Reply-To: <20241219-mb85rs128ty-mecsbc-v1-0-77a0e851ef19@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jonas Rebmann <jre@pengutronix.de>, David Jander <david@protonic.nl>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1087; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=E1s4a2ms1r/LLu9PQwkbyMglWJ/KeTIY1ewv3e06R4U=;
 b=owGbwMvMwCF2ZcYT3onnbjcwnlZLYkhPEfo8/b14sfHXt6rHT7Z98xL0WLJg6U2N8z63lpwN5
 56enm64vqOUhUGMg0FWTJElVk1OQcjY/7pZpV0szBxWJpAhDFycAjCRZA5GhmVdWW+NJa//FzjG
 LOH/udVJzv0YT6u/0TaZukk6BotlDjMyHCz+xX3LStkq4djvbOej95b0GZYoaRuf6WXu1C2af+c
 yMwA=
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_043501_219941_426C6B77 
X-CRM114-Status: GOOD (  10.76  )
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

From: David Jander <david@protonic.nl>

The board features a Fujitsu MB85RS128TY FRAM chip connected to spi0 CS
0. Add support for the MB85RS128TY to the device tree.

Signed-off-by: David Jander <david@protonic.nl>
Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
 arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dts b/arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dts
index ca041b4d2d38a4e06cd0a54a806fed2ab723c94d..c70f6df537596a85528e4e0b499e59d71f05b4a3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dts
@@ -240,6 +240,18 @@ rtc@51 {
 	};
 };
 
+&spi0 {
+	/* use hardware chipselect on cs0 (cs1 unconnected) */
+	pinctrl-0 = <&spi0m0_pins>, <&spi0m0_cs0>;
+	status = "okay";
+
+	fram@0 {
+		compatible = "fujitsu,mb85rs128ty";
+		reg = <0>;
+		spi-max-frequency = <33000000>;
+	};
+};
+
 &i2s1_8ch {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2s1m0_sclktx &i2s1m0_lrcktx &i2s1m0_sdi0 &i2s1m0_sdo0>;

-- 
2.39.5


