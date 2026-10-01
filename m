Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B80CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jeqEP66eT2ip4FVzjQ+fAmi5N3q+KaP4bGgtZC4fNxI=; b=shL8lk8o/+2SoUV+iNw3DFvRNw
	56XL0Npu5BcY50YnvD3LRN2Zhk5M6iGbuXiQsQcm7rSEgJQMMu6rGtpmmUJtFzfRU6czQGYHJb/JM
	29GwfmKxJ/vM3VpnY3iWoTJ251FQIwgegVy5tUjcszEjsEP32sUScXmtn3khpCmN38WnkzAEqbTVv
	cCUI2qYO6aRNHyZAOLkcJixabFQTJMIu8eSCYbUXtl71gJHW61zayG/Zv8vrn1mAknFwaRSnRaZjF
	7xtpyReUfPsSbkFTH/4atEBfgUrDQHV8kfq6YVcVPSiLiVgtiE0EZk+uw4iBzJpLek6LUbgHq38C5
	y1zcw1kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBF6-00000007zvx-1dUG;
	Thu, 01 Oct 2026 07:30:12 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBF2-00000007zuY-3SNw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:30:11 +0000
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:41660 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xCAvR-00000001Ztc-1QzD;
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
Subject: [PATCH v2 2/3] ARM: dts: imx6: phycore-som: Increase PMIC max SOC and ARM voltage
Date: Thu,  1 Oct 2026 09:09:46 +0200
Message-Id: <20261001070947.1815279-3-primoz.fiser@norik.com>
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
X-CRM114-CacheID: sfid-20261001_003009_348218_086DF328 
X-CRM114-Status: UNSURE (   8.20  )
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

The i.MX 6Quad with 1.2 GHz needs 1.4-1.5 V supply voltage for the 1.2
GHz operating point. Therefore this patch increases the maximum output
voltage of the PMIC's SOC and ARM core supply regulators to 1.5 V.
Otherwise transition to 1.2 GHz OPP fails (with the 125 mV anatop LDO
dropout taken into account).

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- no changes

 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
index 205467fd223e..9070388eecb0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
@@ -133,7 +133,7 @@ regulators {
 			vdd_arm: buck1 {
 				regulator-name = "vdd_arm";
 				regulator-min-microvolt = <925000>;
-				regulator-max-microvolt = <1380000>;
+				regulator-max-microvolt = <1500000>;
 				regulator-initial-mode = <DA9063_BUCK_MODE_SYNC>;
 				regulator-always-on;
 			};
@@ -141,7 +141,7 @@ vdd_arm: buck1 {
 			vdd_soc: buck2 {
 				regulator-name = "vdd_soc";
 				regulator-min-microvolt = <1150000>;
-				regulator-max-microvolt = <1380000>;
+				regulator-max-microvolt = <1500000>;
 				regulator-initial-mode = <DA9063_BUCK_MODE_SYNC>;
 				regulator-always-on;
 			};
-- 
2.34.1


