Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1297C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 06:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dy2RzqWiPQ/3SOizXSjTaUnMOtpy5JNfDjjPJHM24fU=; b=HaQj4iSfL3tZrS0lq6YY7zaLpk
	C+UgjhZO9Pl1eXcUkHubPzW/yUJVoRvHbNyqWA9TyhGre6zg6P1Xgpnq9lPmui2HJldqLJDAHQUX/
	TgJ0dhfs1ayuch5prO1rsrwJA67MgNzkRevJauUtMCETkiMtmH4tuk0WkzRfKWtBvUnVyjXRrLkUE
	tfNymvH1B96CXSLFDJMAODAQD5gVHNKO9qXjKqd8CjipSV3ocSvgt66JLXQl9tBx+8UFP1HdMcktG
	HF6ircRCA98IycmPHmVJB06Tfq+YAtDpWCjza7UQWoXYIFkLtH/7Mj5RhMRDd0e1NqB39P8TVreTa
	RnQiUcUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fUa-0000000FJ2Q-3NVw;
	Fri, 18 Apr 2025 06:46:28 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fFo-0000000FGeo-2JEG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 06:31:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Dy2RzqWiPQ/3SOizXSjTaUnMOtpy5JNfDjjPJHM24fU=; b=Jy8Mi28ai7YsnPGMKTpp8kjyXF
	TOh7n8z8J/cJ7P63pIKuJMFadHL3QnJylAVrExRg5t+3Szt2UXuBIE301v5Tc12LPFoU/zRBbfh2B
	P/ekWcOHlCG+Dg70iBDHu0jlnfmRMlG1AXXc1tUtY0B8waAeutUgJNEFhhpuE3u3vXvMTpYmhu8uN
	YGXngUQTFgPnmjV9aTbKmiiDuAfXjDhJMyDj/iNGYr9pGjfNcMlQWWiJFBqygHGMfNcDwAthh6+mC
	OqXLu8xiyKZ+kL5NxFG2EOSJLsTKSBqry9c6yF+3GJI+aEp8drD2WirPLwVun5S3UJs7Qgt8lynyF
	2usO9a0Q==;
Received: from [89.212.21.243] (port=56446 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u5fFn-00AbM0-1Z;
	Fri, 18 Apr 2025 08:31:11 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v3 06/15] arm64: dts: freescale: imx93-phyboard-segin: Drop eMMC no-1-8-v flag
Date: Fri, 18 Apr 2025 08:30:55 +0200
Message-Id: <20250418063104.2202085-7-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418063104.2202085-1-primoz.fiser@norik.com>
References: <20250418063104.2202085-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_233112_741404_80AD2B95 
X-CRM114-Status: UNSURE (   5.31  )
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

Drop redundant 'no-1-8-v' flag from usdhc1 (eMMC) node. Flag is now set
by default in the SOM include file (imx93-phycore-som.dtsi).

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v3:
- no changes

 arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index 85fb188b057f..902b523fc92c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -40,11 +40,6 @@ &lpuart1 {
 	status = "okay";
 };
 
-/* eMMC */
-&usdhc1 {
-	no-1-8-v;
-};
-
 /* SD-Card */
 &usdhc2 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
-- 
2.34.1


