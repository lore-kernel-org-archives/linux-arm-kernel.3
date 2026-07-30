Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81D2C55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 23:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wy+7pP6/2786p1cEJdzAOhNBv0+Zz/x0WQIVBEqSFIU=; b=kU6HpL2r2Cv8hrvEPn+Ncz0KLz
	nbTf5xKFxvLHf7fXKJoOeEIvwXoKUZth7N2psqAPZurL3micPTef4sYDXxOdq+EbZq2WujWD1Dztz
	3yxJBp5hOGcIZfQuQOJHfFwEwfh0m99/2HBEsvyKkDL1OC+WTu5Betw+RpOwy4GZueocSpu1vph92
	ShWzjdsXHH/bP9ONXxE4JjZAiGY2BrY9/pA6RdxwsN3KEpcjnsemsDaQN/gY/5wfaCwBzCVi4LVDy
	2i809qbFBvAc8tODPpvsJid16Fl3PZfQf9EdtMCfhWbOyZQS79oyxeZmUMpJhstnCkpJiG3gD6o2T
	LW/qSQrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpZU9-0000000BRNr-3cUW;
	Thu, 30 Jul 2026 22:44:17 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpZU3-0000000BRN4-3G4A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 22:44:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 818D911B91F;
	Fri, 31 Jul 2026 00:43:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1785451441; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=wy+7pP6/2786p1cEJdzAOhNBv0+Zz/x0WQIVBEqSFIU=;
	b=Yc+SrsCYWQCVEePKfmFCdqfH+82wm8HVFHjD/EhN2wSpB7xFgggWS1/JrBy+wYsO47jl8n
	IlFcfXkB2hFKlRGlG7Kj5Sy/60PMQrl0rQP3yoG5XY3Y29yX380LfHN0t9v1yPuGX4ek8k
	q74F4rRLdNx41LjuOzk0TDpfZpIm7Ap2dqYiLB/ZeEP2j0MfJsBG04y8TZIuvu2dnpn5DY
	/ljtOj7g7kJ07Xdh2Q1+QouGzAD+4xT5gnVPzRQXglv7WddzCBxBpVwyT4my7aKpukIlz0
	HArekm27iUUsfUcTer91FbbNlNWmlheyBs2QlaFt0MUwEdMbGxdIRHrmH5halw==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/7] arm64: dts: imx8mp: Add DT label to SPBA5 bus
Date: Fri, 31 Jul 2026 00:43:16 +0200
Message-ID: <20260730224351.95006-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_154411_989392_2ECC34CB 
X-CRM114-Status: GOOD (  10.44  )
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

Add DT label to SPBA5 bus for usage in board DTs.
No functional change.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
V6: New patch factored out of previous
    arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
V7: No change
V8: No change
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 9cf9f6f08654d..bec64cbb36347 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1437,7 +1437,7 @@ aips5: bus@30df0000 {
 			#access-controller-cells = <3>;
 			ranges = <0x30c00000 0x30c00000 0x400000>;
 
-			spba-bus@30c00000 {
+			spba5: spba-bus@30c00000 {
 				compatible = "fsl,spba-bus", "simple-bus";
 				reg = <0x30c00000 0x100000>;
 				#address-cells = <1>;
-- 
2.53.0


