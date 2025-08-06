Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878E0C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 09:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A5XWDwVGnEQiGkPjEIEkwbmBvjSkcaLou9hrLpEti5Y=; b=4mGhoRNCCHpCF8PHwGYBbw/eBz
	q07J9yxJO1ChDR4sefOsH8BLouEvW+Zc3Cg/gM9sMMnec0j+xAJGhA0qt0rnTlPVrW/aUE5DVlotB
	8w8K+wEbYSEiRZoLcRSBqB6YcPxnVwwirqo+5IyKGHrx5TSPyZBOMMbjRAmrB4lUSn31pA30xZYdw
	0aST1PqRbqnjO9lQKNv4s1e4/06RY6eTCZQhHd1g69l0d1gXYc6z02BwiP+1KUE8YN+QbZfFgjihq
	7zHNEgdpcESr+gBinvbKwa6pWG8mwVAr11MAVaRiL/VtSU7c4WsegMMAA5sfGwzTxhSnKocA2faaq
	USOE3Erw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uja2R-0000000Ehe9-33HQ;
	Wed, 06 Aug 2025 09:02:23 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujZzV-0000000Eh0k-2AAD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 08:59:23 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1ujZzS-000236-FS
	for linux-arm-kernel@lists.infradead.org; Wed, 06 Aug 2025 10:59:18 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1ujZzS-00CBCf-0u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 10:59:18 +0200
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id E0BE6451D8C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 08:59:17 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id 8355F451D86;
	Wed, 06 Aug 2025 08:59:16 +0000 (UTC)
Received: from hardanger.blackshift.org (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id 00ed67c6;
	Wed, 6 Aug 2025 08:59:15 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Wed, 06 Aug 2025 10:59:12 +0200
Subject: [PATCH] ARM: dts: stm32: add resets property to m_can nodes in the
 stm32mp153
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250806-stm32mp15-m_can-add-reset-v1-1-9d81f9c29d65@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAF8Zk2gC/x3MTQqDMBBA4avIrDuQn2qLVylS0smos0iUjIgg3
 r3B5bd47wTlIqzQNycU3kVlyRX20QDNIU+MEqvBGdeat+lQt+RdWm2L6UshY4gRCytvSDTS8+W
 s/wUPtV8Lj3Lc789wXX+e+odgawAAAA==
X-Change-ID: 20250806-stm32mp15-m_can-add-reset-ccfc47213ba3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Marc Kleine-Budde <mkl@pengutronix.de>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1268; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=/UzzYtavlagWyGGtegXWanhdJH6wLaCLupCcryhZtHg=;
 b=owEBbQGS/pANAwAKAQx0Zd/5kJGcAcsmYgBokxlgVg8zS2uNYYWdg1S46Cypmh+yR3HopVysb
 +06kIcnXIKJATMEAAEKAB0WIQSf+wzYr2eoX/wVbPMMdGXf+ZCRnAUCaJMZYAAKCRAMdGXf+ZCR
 nOfyB/0ev9RiEJlbXX/m469X//l77QlSs4AudFDZQX1cvyMLVeUwBYvT1kJ26UI6wIW2RTc1Ntx
 mFhprYlW4a6KmvMZ2CW5GCKRnhziKFn2Zvlk8ll6dVAb+QerxknCiv6CrD98PKRG79UzWcUOZWb
 Nu6TDg5xjooAsu6SByoVFwojnFckxQ0Wm1iEqZJJIQss1hxbGgJ4gFXGOUkmDtmF/3RCCwISwn6
 RKElfRPKK7coK+aF9Cymz+1MLOobBT9/ngQ3MbJM5YI7BwYTnb913KHqMG7SJm1UtgCoPR5O0k+
 dAEPydAYN9EyctqPSTwrldXtpi9EdTzCGsjkvYp7+r1VFLvh
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_015921_555862_BF48A18C 
X-CRM114-Status: GOOD (  11.38  )
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

On the STM32MP153 the m_cam IP cores (a.k.a. FDCAN) have an external
shared reset in the RCC. Add the reset to both m_can nodes.

Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 arch/arm/boot/dts/st/stm32mp153.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp153.dtsi b/arch/arm/boot/dts/st/stm32mp153.dtsi
index 4640dafb1598..92794b942ab2 100644
--- a/arch/arm/boot/dts/st/stm32mp153.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp153.dtsi
@@ -40,6 +40,7 @@ m_can1: can@4400e000 {
 		interrupt-names = "int0", "int1";
 		clocks = <&rcc CK_HSE>, <&rcc FDCAN_K>;
 		clock-names = "hclk", "cclk";
+		resets = <&rcc FDCAN_R>;
 		bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
 		access-controllers = <&etzpc 62>;
 		status = "disabled";
@@ -54,6 +55,7 @@ m_can2: can@4400f000 {
 		interrupt-names = "int0", "int1";
 		clocks = <&rcc CK_HSE>, <&rcc FDCAN_K>;
 		clock-names = "hclk", "cclk";
+		resets = <&rcc FDCAN_R>;
 		bosch,mram-cfg = <0x1400 0 0 32 0 0 2 2>;
 		access-controllers = <&etzpc 62>;
 		status = "disabled";

---
base-commit: 1a32f7427eb3d1248bc64cd745b93f88cc838933
change-id: 20250806-stm32mp15-m_can-add-reset-ccfc47213ba3

Best regards,
--  
Marc Kleine-Budde <mkl@pengutronix.de>



