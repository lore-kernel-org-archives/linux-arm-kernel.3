Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5278CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 07:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FtE8Jsv/VcdHJakg77w/FsP+cpPksGP+MXsLf2hvKYQ=; b=R+xN2OJ1WQ3ncaith6V7qIp3A3
	x08zMT+2hKarEGo4WmMHBmpHWQqwnqt7jOQKyfPu2nrYf9//rJ7eNpiXGz9iT3rxQDbPlA8YNKO8z
	1qqCWERgxZWQP/ALEOZBH8r53qmSYUSI2HVlU5FUDNlfpW4hAmVuZdE/j3zCZaPSIS1UesGhyx1gG
	0vnZub5PMnLUXwX4euY6bsT0tALFLb7FBZeOKPhiMktjI0dmWmX6Lre+SgaKYphLMzSZZV0fewz26
	6Ham85WFwfqsvt1XvyCmovnWkDWX5HdfRU6N7B3KoANihnV9fsMFtGeKf/Zn2UlaTrSnbSkz+wlRi
	KmfGlZHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkIPU-000000078b6-10nD;
	Tue, 18 Feb 2025 07:52:52 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkIFj-000000076YN-1A2m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 07:42:48 +0000
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:52604 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tkIFi-00G0MD-1a;
	Tue, 18 Feb 2025 08:42:46 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v3 05/15] arm64: dts: imx8mm-phycore-som: add descriptions to nodes
Date: Tue, 18 Feb 2025 08:41:46 +0100
Message-Id: <20250218074156.807214-6-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250218074156.807214-1-andrej.picej@norik.com>
References: <20250218074156.807214-1-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_234247_476598_D1F586F0 
X-CRM114-Status: UNSURE (   7.89  )
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

From: Yannic Moog <y.moog@phytec.de>

Add missing EEPROM and RTC descriptions. Also use eMMC with
lower-case "e".

Signed-off-by: Yannic Moog <y.moog@phytec.de>
Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
Changes in v3:
- no change
---
 arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
index 7e859c65317a..cced82226c6d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
@@ -290,6 +290,7 @@ sn65dsi83: bridge@2d {
 		status = "disabled";
 	};
 
+	/* EEPROM */
 	eeprom@51 {
 		compatible = "atmel,24c32";
 		pagesize = <32>;
@@ -297,6 +298,7 @@ eeprom@51 {
 		vcc-supply = <&reg_vdd_3v3_s>;
 	};
 
+	/* RTC */
 	rv3028: rtc@52 {
 		compatible = "microcrystal,rv3028";
 		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
@@ -307,7 +309,7 @@ rv3028: rtc@52 {
 	};
 };
 
-/* EMMC */
+/* eMMC */
 &usdhc3 {
 	assigned-clocks = <&clk IMX8MM_CLK_USDHC3_ROOT>;
 	assigned-clock-rates = <400000000>;
-- 
2.34.1


