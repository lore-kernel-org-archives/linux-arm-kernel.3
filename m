Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCCCD4414B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 11:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZ1OW/WC4lLUbDBhfZ31lU2trA6p1gD8h/FiaSXZqWk=; b=R5Z9sZ9MdhItvTwk5nGvSr2QEh
	MOtScl+dxAEmaNJovaCKR7/aw8JEL+1GwWxxubpnT6Robf4ZI0JA7HoB8vNaYFpnhtxd0royQ9dJG
	5pDhnVkiEVwEXMc9TE20oNATndtbexFVRHn388UsdwXmZ1O4PyfNV+HKDNMsoTBQlknM+5BSm47ir
	Wl6z73FqfPj9cYjqR4xCACS3ZTH1Rd/zuGL0UZ3Oxmph1PlFt08GIBaKNwX0vMO7rWyVKTGpGQJY+
	PrQ5MOzvS2scRX+kbVpy+FcFtUFB4DqKG97q9Yqsb74IYGNkDmHsD9ZM79IdwGvbnX128h0FDDm3J
	fvTD4JNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDMZS-0000000CF6H-0sdL;
	Tue, 19 Nov 2024 11:39:02 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDMVn-0000000CEH8-1ej8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 11:35:17 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tDMVk-0004ex-8V
	for linux-arm-kernel@lists.infradead.org; Tue, 19 Nov 2024 12:35:12 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tDMVj-001Ye7-3A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 12:35:12 +0100
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id 908F8377055
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 11:35:11 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id CFA0D377035;
	Tue, 19 Nov 2024 11:35:09 +0000 (UTC)
Received: from [172.20.34.65] (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id 6601b311;
	Tue, 19 Nov 2024 11:35:09 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Tue, 19 Nov 2024 12:34:59 +0100
Subject: [PATCH 2/6] ARM: dts: stm32: lxa-tac: extend the alias table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241119-lxa-tac-gen3-v1-2-e0ab0a369372@pengutronix.de>
References: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
In-Reply-To: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=4/0nP6y039SdOp5+OOU7PlcTIP04z82jYwEbyNDvpjM=;
 b=owEBbQGS/pANAwAKASg4oj56LbxvAcsmYgBnPHfmcPHax0Degh2+FdA7T9xZcMkb5yvqAREbe
 ZeoVU9z3OeJATMEAAEKAB0WIQRQQLqG4LYE3Sm8Pl8oOKI+ei28bwUCZzx35gAKCRAoOKI+ei28
 b8jCB/wIKQpO5H7/AStDUmRAXNbzh+Z1Ng3wVpPv8z9yDOsbw0acb7kZ+h0xjdYH3JNEU5U+RcD
 rvvRj+D8foe59+27NWoyKAA1a5jWzDNogKluwXv+E75rceFWHOAk+H3fG8bR4jco9yp9PxXc8n6
 OeS4lf+yRcoEVl1QP42+bBeWNU5Q+OXERlZ3C9CHB8SHdpV4mPqvS1zwSEOxhRRImic2iz2UdzR
 qzJIOdsxBxHL2vNXEnovyKIDcj8XdDivyOWm7ZdvSWhbZpVm4Wopo6wfC71PaIM+g1AYHNv9HO5
 WB5LcO2zB7UEm2wh3MO75xVaSrGiRwXYCF422WsYBufx1aDG
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_033515_431615_E533B32C 
X-CRM114-Status: GOOD (  13.19  )
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

From: Leonard Göhrs <l.goehrs@pengutronix.de>

Some of the userspace software and tests depend on the can/i2c/spi
devices having the same name on every boot. This may not always be the
case based on e.g. parallel probe order.

Assign static device numbers to all can/i2c/spi devices.

Signed-off-by: Leonard Göhrs <l.goehrs@pengutronix.de>
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi b/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi
index abe4c7fe7678f2801683e0995dadbfecce434e81..a97708423ec8f2ee2c471b07ff9dfac19e605b3b 100644
--- a/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi
@@ -16,12 +16,20 @@
 
 / {
 	aliases {
+		can0 = &m_can1;
+		can1 = &m_can2;
 		ethernet0 = &ethernet0;
 		ethernet1 = &port_uplink;
 		ethernet2 = &port_dut;
+		i2c0 = &i2c1;
+		i2c1 = &i2c4;
+		i2c2 = &i2c5;
 		mmc1 = &sdmmc2;
 		serial0 = &uart4;
 		serial1 = &usart3;
+		spi0 = &spi2;
+		spi1 = &spi4;
+		spi2 = &spi5;
 	};
 
 	chosen {

-- 
2.45.2



