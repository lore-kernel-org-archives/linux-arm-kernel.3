Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B4CCA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7GIq7Ytb6z2nu4Eac27CSfcHe824GRgVKa6PJ9EW5sg=; b=m/elLHMSLn9chnUDpssdwF/u++
	RTh9bpIMqk7kkCNJl0cVmsS47RRbwkCiGAE7P84lONyT8zorGw8gpVMI8VsWWk6CdEdh5w1dcsvCW
	jkcY6OCmSUnCkvWGt5IYSEMq9xDatFlL1XOCqokyBX4iC6/4Zs9AcKO+L8PxxkGtw8U5p0IB59x7a
	h9t3hYG6kt78ImMSTAFQMlGqIrXhlELAie4igIsIqW7Ou6yN0VeY37r3UeullzopuvE+Wa/oJxas3
	SKAvBki30ieUtUqpPiRYynOMaZ8S02E7mXCpBil1BU3kR0CvDyF8Vq3Rg11RZyAz1insbB/YZBww8
	H6Z3g7rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBF2-00000007zuZ-1K0K;
	Thu, 01 Oct 2026 07:30:09 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBEz-00000007ztx-0ouS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:30:07 +0000
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:41660 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xCAvR-00000001Ztc-1s4Q;
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
Subject: [PATCH v2 3/3] ARM: dts: imx6: phycore-som: Add phy-reset-duration
Date: Thu,  1 Oct 2026 09:09:47 +0200
Message-Id: <20261001070947.1815279-4-primoz.fiser@norik.com>
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
X-CRM114-CacheID: sfid-20261001_003005_400791_F9BF2507 
X-CRM114-Status: UNSURE (   6.59  )
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

Without an explicit phy-reset-duration, fec_reset_phy() defaults the
phy-reset-gpios assertion to 1 ms. Extend it to 10 ms for a more robust
PHY reset pulse as otherwise Ethernet PHY probing occasionally fails.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- drop patch #3 from v1
- convert patch #4 from v1 to phy-reset-duration instead

 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
index 9070388eecb0..977cf7825e78 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
@@ -57,6 +57,7 @@ &fec {
 	phy-mode = "rgmii";
 	phy-supply = <&vdd_eth_io>;
 	phy-reset-gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
+	phy-reset-duration = <10>; /* in msecs */
 	status = "disabled";
 
 	mdio {
-- 
2.34.1


