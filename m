Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DABDCA5FBA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 11:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z9e30zNnkd/2aGEdqLw0xnKg0Po7szNciJvZ2BImHus=; b=Wy1G4l31K3wsuAbur5loxfd+mn
	5K+8HOz5Fa5hMcJWgFB02J5aSNLtR+3GLLPDiY3T4qBjGaJ0W2caVi+SEvCG5Ulcikc8Joi1mfTPi
	ojKFJpFGT1kiuCdj87hta7VTm7GTqanrSfe4/iXhHcNPc0nq8TLknnv8DNpxkokTQ8VQUodE4hbH2
	sFgXogyd+/ia3ralbcsQEqEb9xCfhA1ZCgWzwl9Lyy9vSmuWJuS06r6G2GNZo24GGuOcERtHNmCQW
	gW7U60jduUCSvJeUvRMOGbPGxBVoFKofsrfHsNGc07Z8R7NKhAGfVoG1fm5DQbl/VcHRfN+KG8fXR
	qxRh7nvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsVv-00000005sK7-3m9f;
	Wed, 30 Sep 2026 11:30:20 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsVp-00000005sHL-45PU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 11:30:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=z9e30zNnkd/2aGEdqLw0xnKg0Po7szNciJvZ2BImHus=; b=Ar0TxQoHRF8w7MryRBOKObDH1s
	41jIUGrWNTTPRPkPK7DCOJS8xwcorjCbtJvF4+7dqcue0Sz9r1BeZZ9ublyUv4sArMQ6DeSn+zK1W
	1EW5NWLHOEBJw+u86dr38uLQkP5lpEACgFTWxnerPfzgWgJPO4knU4PQqU/52BpEQfRkLGb7BXBrD
	gBd6f60zmqwwjJHu/oDsZ+hwTUYLNsTU/ZKl7uw6XHQvDWCXFLMRIyxsroenboLxdRYj6dIfEEQeP
	DjAAjIDYSSI/Jen/j07p5ceMWevbnW7wHWzBC3aM966bJvywdgVbYpI//+MNVc1sT2ZcB2fXOKAUn
	rZF3xWCQ==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:46122 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xBrds-00000000Z3d-3fYe;
	Wed, 30 Sep 2026 12:34:26 +0200
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
Subject: [PATCH 1/2] ARM: dts: imx6dl-phytec-mira-nand: Enable all peripherals
Date: Wed, 30 Sep 2026 12:34:24 +0200
Message-Id: <20260930103425.2315286-2-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930103425.2315286-1-primoz.fiser@norik.com>
References: <20260930103425.2315286-1-primoz.fiser@norik.com>
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
X-CRM114-CacheID: sfid-20260930_043014_482213_E6A71C62 
X-CRM114-Status: UNSURE (   7.11  )
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

The current imx6dl-phytec-mira-rdk-nand.dts describes the LC (Low Cost)
variant of the board. However all phyBOARD-Mira boards in-tree are
actually the FF (Full Featured) variants. Now, sync the i.MX6 DL NAND
variant device-tree and enable all peripherals (CAN, PCIe and no speed
limit on Ethernet PHY) to enable all RDK board features.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-nand.dts | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-nand.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-nand.dts
index 8ec27080ca1e..c2780ecb5936 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-nand.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-nand.dts
@@ -22,8 +22,8 @@ chosen {
 	};
 };
 
-&ethphy {
-	max-speed = <100>;
+&can1 {
+	status = "okay";
 };
 
 &fec {
@@ -50,6 +50,10 @@ &i2c_rtc {
 	status = "okay";
 };
 
+&pcie {
+	status = "okay";
+};
+
 &uart3 {
 	status = "okay";
 };
-- 
2.34.1


