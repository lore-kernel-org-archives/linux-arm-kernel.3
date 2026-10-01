Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE46CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5yO5cn1bI9HpM8oJJCtxSSRIgqf0OSZ3yTc2at/4Ls=; b=0Dply3xDDL+D2dU58jsGdPszuC
	7FuhLFJAJUSN6kIE1H62Rq2jVrGj1dynO57qTHraXAQjanXCHpEVdIOUmt0R6wgiDFnoAOS7P2GSx
	vDaLalYyc+TXSgo5qOIUOGIp/ff2vAw/LdBahxsSPKup7UyL7gJzRSi8FfkMAXYpV2ev4/zYeKCLE
	zcIIxW6xdI3cs9HlmNYvZHdsfU734HiPcZ3+mHnrgvA6ElBxrVlso1qM26McxbS6GyZuh2YvZ8X5P
	x5OdCsXvp449zfOmY3AufCbP5aTzKjd+BPxLGZ7Mv9sbdUiD1tOo50G01ayuxtixBS1FGkotnQP3r
	7W73RQQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCAvU-00000007xNT-09ET;
	Thu, 01 Oct 2026 07:09:56 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCAvR-00000007xM5-1wLB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:09:55 +0000
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:41660 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xCAvR-00000001Ztc-0zR9;
	Thu, 01 Oct 2026 09:09:50 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v2 1/3] ARM: dts: imx6: phycore-som: Set PMIC watchdog alias as default
Date: Thu,  1 Oct 2026 09:09:45 +0200
Message-Id: <20261001070947.1815279-2-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261001070947.1815279-1-primoz.fiser@norik.com>
References: <20261001070947.1815279-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_000953_663425_0F206A71 
X-CRM114-Status: UNSURE (   8.22  )
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

Pin the da9062 PMIC watchdog to /dev/watchdog0 via a DT alias, instead
of leaving it to be assigned dynamically by probe order. This SOM
already relies on the PMIC for reset (see commit aa4f48a4e06c ("ARM:
dts: imx6: phycore: Rely on PMIC reboot/reset handler")), so this
makes that the predictable, fixed watchdog device node.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- no changes

 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
index ddbfecd591f5..205467fd223e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
@@ -11,6 +11,7 @@ / {
 	aliases {
 		rtc1 = &da9062_rtc;
 		rtc2 = &snvs_rtc;
+		watchdog0 = &da9062_wdog;
 	};
 
 	/*
@@ -112,7 +113,7 @@ da9062_onkey: onkey {
 			compatible = "dlg,da9062-onkey";
 		};
 
-		watchdog {
+		da9062_wdog: watchdog {
 			compatible = "dlg,da9062-watchdog";
 			dlg,use-sw-pm;
 			dlg,wdt-sd = <1>;
-- 
2.34.1


