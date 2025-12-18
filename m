Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA14D68BDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 05:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PFc2qzz4bWX9cECX96Voz8rpV2vKfaPOUnyXeRviCDQ=; b=bl6lbvSgNdkrL3
	WmmSUJbRFA+vS9IBLUDpE59uqaSxPt2S5y3gSqMQGU8EY0pOk1lbUCp4byFKcHzjHa8BHj2ATJdVT
	iXXlsw9kMK/DsiQMrvx+uLoohYKMkGIQTWVBzPBZSsa7fSFGhn65nIylJ/urMpp/iww1MvBZLB/LA
	jmZ3nm1+23jhY95/er8AEl0AeO1MvkYZE1qcZR89ffrf7tWrDxx+LvqV/T/u9YBrcCgJy1Yi+ZiVn
	/rMx63yIPgaUbTFvP2sPb46QV9ztVDSknOQ5ODRUP/CzdAEr+JvzS4jiwS38ycQvCctRjQMKKpdWt
	Cqygrdqy+kRYtsQXZgtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW70D-00000007rQL-0tGG;
	Thu, 18 Dec 2025 05:56:41 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW70A-00000007rP4-2qes
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 05:56:40 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 28AB120208B;
	Thu, 18 Dec 2025 06:56:34 +0100 (CET)
Received: from usswic1srsp001v.us-swic1.nxp.com (unknown [10.114.8.222])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id EBDC1200736;
	Thu, 18 Dec 2025 06:56:33 +0100 (CET)
Received: from lsvm07u0000156.swis.us-west-2.aws.nxp.com (lsvm07u0000156.swis.us-west-2.aws.nxp.com [10.45.140.59])
	by usswic1srsp001v.us-swic1.nxp.com (Postfix) with ESMTP id CCE9F1800310;
	Wed, 17 Dec 2025 21:56:32 -0800 (PST)
From: Lei Xu <lei.xu@nxp.com>
Subject: [PATCH v2 0/2] Add device tree support for NXP i.MX95 15x15 FRDM
 board
Date: Wed, 17 Dec 2025 21:56:27 -0800
Message-Id: <20251217-127-v2-0-67cb12e56242@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIuXQ2kC/1WMQQ6CMBBFr0JmbU1nYgVdcQ/DosBUZmFLWtNgS
 O9uZefy/fz3dkgchRPcmx0iZ0kSfAU6NTAt1j9ZyVwZSJNB0q1CatWFO2OQu3G2DupzjexkOyq
 PofIi6R3i54hm/K3/fkallbHEPF5vDo3u/baep/CCoZTyBTo2njaUAAAA
X-Change-ID: 20251207-127-4e8551e8bdaf
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 justin.jiang@nxp.com, qijian.guo@nxp.com, lei.xu@nxp.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766037392; l=1219;
 i=lei.xu@nxp.com; s=20251205; h=from:subject:message-id;
 bh=67DEaW6RDZrattoYChlas5jD67OOmeCLl/JFoGPVb8E=;
 b=lK66SOlkudbpxDksbfMH0bDDuoSv8y1cQqfod4CfntqpLVifHqFEEwEeHkFMDmAxhN44gG8gv
 qJLJ1LPS/WcDPnbTO7O+MTRXI15iIc2bJBjtvpP30tUln58N6DhwJyi
X-Developer-Key: i=lei.xu@nxp.com; a=ed25519;
 pk=faUN/3jfazJOPNYhE9pN+nzvk+lrEm64ZRf42Yeum6U=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_215638_855997_7FA6FEBD 
X-CRM114-Status: UNSURE (   9.03  )
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

The NXP i.MX95 15x15 FRDM board is a compact and cost-effective
development board based on the i.MX95 applications processor.

This patch set adds device tree support for the board:
 - Patch 1 introduces the DT compatible string.
 - Patch 2 provides the complete device tree description.

Signed-off-by: Lei Xu <lei.xu@nxp.com>
---
Changes in v2:
- Switched from 'xceiver-supply' to CAN PHY nodes using 'phys'.
- Added CAN PHY nodes for flexcan2/5 with shared silent-gpio, removed reg_can_stby.
- Updated MSI/IOMMU mapping comment to match the i.MX95 15x15 FRDM board.

Link to v1: https://lore.kernel.org/r/20251207-127-v1-0-5a2eeb69f150@nxp.com

---
Lei Xu (2):
      dt-bindings: arm: fsl: Add compatible for i.MX95 15x15 FRDM board
      arm64: dts: freescale: imx95: Add support for i.MX95 15x15 FRDM board

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts | 963 +++++++++++++++++++++
 3 files changed, 965 insertions(+)
---
base-commit: 6987d58a9cbc5bd57c983baa514474a86c945d56
change-id: 20251207-127-4e8551e8bdaf

Best regards,
-- 
Lei Xu <lei.xu@nxp.com>


