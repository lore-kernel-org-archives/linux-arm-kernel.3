Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2628CC282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 15:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HxbU9/lVcZnDhkufqcOR854Ftnj0pgTJtJXi6NbhlOU=; b=BUYhXXiY12OX+v7wPSwM4ZmxSN
	HdkDiEIuqsZjnC/L8nilVqmmsWKMVMRiXuT83YjsVbgi2QLJ+k3iLWuKMySL7/Egd9aKg6a0QRfhq
	RdOWJZl0PETRKQYGVs4IncZk91dap+7STLbEd1SMYYPfXOxuc8OgE7eSOscF1RXqKlg5IYEScPWjB
	iNnkwFMP/UZpSwCQU1UNT53cZ0gaHxFIIM246ErlRmGlBqXX+qsu1dxZbVn2o674g5MAxALtPML2a
	5iXL2QyDsWhQkfwPof0GSigYSzD+FvTGiJbk1gt1yhaYsOJ4UXH/HHyVCj7sQl+N8yKqyEGUWEqQb
	ScYMTFbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to2Pi-0000000BUeF-1FXW;
	Fri, 28 Feb 2025 15:36:34 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to23t-0000000BPj6-3NxM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 15:14:04 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 0E3CE1FA0A;
	Fri, 28 Feb 2025 16:14:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1740755640;
	bh=HxbU9/lVcZnDhkufqcOR854Ftnj0pgTJtJXi6NbhlOU=; h=From:To:Subject;
	b=eOkmF1kk+qZGNGFlMXU4IOBbgmp+X9kFgWq+WPzoqFedKkrAvZjXcCQkRplZ6ipto
	 xipdRs1PpJVsRGw81zpvx7hhPVl2qFM50QW2iZOwPzb1MEIZ/POHY52+jUBV/+zAOg
	 ++HUHbeEhdUrTCn5vmDLVgLu8kgz4ph6uiX1PZfQe2SkjgZ0njtHdkVDZv+5bVnaFg
	 o+9UnuTqrlcV0/U72jdWC+D9cIiygk5IsNclaEaTAzgYocDLD0IGE3Jo1kOUARoE16
	 5OBgu5fFKD1fdiY0Wt4/fivAsF5YZIV4C1mMB8y2FNVtjuEhaI2Tw/saVT52h01RXb
	 SSceBwPDhjSCw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/4] arm64: dts: imx8qm-apalis: Remove compatible from SoM dtsi
Date: Fri, 28 Feb 2025 16:13:51 +0100
Message-Id: <20250228151352.91768-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250228151352.91768-1-francesco@dolcini.it>
References: <20250228151352.91768-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_071402_174972_60221670 
X-CRM114-Status: UNSURE (   8.96  )
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

The SoM cannot be used standalone, this compatible is invalid and it is
always overwritten when this .dtsi file is included, remove it
therefore.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: new patch
---
 arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1.dtsi | 2 --
 arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi      | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1.dtsi
index 81ba8b2831ac..b1c3f331c4ed 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1.dtsi
@@ -9,8 +9,6 @@
 
 / {
 	model = "Toradex Apalis iMX8QM V1.1";
-	compatible = "toradex,apalis-imx8-v1.1",
-		     "fsl,imx8qm";
 };
 
 /* TODO: Cooling Maps */
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi
index 4d6427fbe875..c18f57039f6e 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi
@@ -7,8 +7,6 @@
 
 / {
 	model = "Toradex Apalis iMX8QM";
-	compatible = "toradex,apalis-imx8",
-		     "fsl,imx8qm";
 };
 
 &ethphy0 {
-- 
2.39.5


