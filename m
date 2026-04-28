Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17677FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 08:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dni9N7eJQBSss1mOkw/B+gA22XnT/taKvtT5lZRp7bg=; b=vDGrN4dVXvkssH
	oEHmpqE0n7ZDubBVDi7511DsUeGnKcnnUhNILOWND9oXoTqK1I7+JzAPUXs2W1Q2+CnrFvlrS0UGp
	llbVg8gZZjgG86KlojrP32Kme+OW7t3ldnqNpuFdGrSmDAQzbsKQYM7Zdl+Mfdn+MeT/p8BjiVvRW
	2DhZQIjqQJtysCYrrVWMRTkM0Q/Ibs8vjWgS3xAO/Cx1U867hJbegGurVSkd8B5tIqgcwySodUcis
	m+PWT7u9AOpwKGLIcwklnE5EB+lf+F8hS6epdIpq5fIW31PcDKsbdJvvN/Y1wBUnxd0985jucUb/r
	5P121ZqfqZiEIHWkEmCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdPi-00000000pxo-2cGR;
	Tue, 28 Apr 2026 08:03:26 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdPc-00000000pvU-039c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 08:03:23 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3C4932011DC;
	Tue, 28 Apr 2026 10:03:16 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id F1E762034DC;
	Tue, 28 Apr 2026 10:03:15 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 6DBE21800083;
	Tue, 28 Apr 2026 16:03:13 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Subject: [PATCH v2 0/2] Add NXP FRDM-IMX95-PRO board support
Date: Tue, 28 Apr 2026 17:03:11 +0900
Message-Id: <20260428-imx95_frdm_pro-v2-0-434240b652f4@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL9p8GkC/13MSwrCMBSF4a2UOzZyk1JNHLkPKaWPxN5BHiRSI
 iV7NxacOPwPnG+HpCPpBLdmh6g3SuRdDXFqYF5H99SMltogUFyw5ZyRzaobTFzsEKJn11Eu2E4
 dKimgnkLUhvIBPvraK6WXj+/D3/h3/VHyn9o4QyZnRN0pgxOf7i6H8+wt9KWUD+RMdlyqAAAA
X-Change-ID: 20260311-imx95_frdm_pro-7a8d03b50982
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 xinyu.chen@nxp.com, qijian.guo@oss.nxp.com, justin.jiang@nxp.com, 
 Joseph Guo <qijian.guo@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777363393; l=963;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=CkAAtD5YmfCNBOnuQOiQRptEzghvDmFA6t0i/Us/rmk=;
 b=3A++Sago1au9eBWxxqbp/XVHvpZHP+RAgcot14Rg0lzwzVdKg4Vw4BuDcJ06UMG0HguZJFJf4
 Z3cFZwEC587DpBxAPBx9IcRHOh2vPiSwmSdJ1bUecyZB1r3Y5YqJEgI
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_010320_190683_BC1D6C8F 
X-CRM114-Status: UNSURE (   7.17  )
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

This patchset add Devicetree support for NXP FRDM-IMX95-PRO
development board based on i.MX95 19x19 SoC.

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
Changes in v2:
- Run dt-format to reformat the node order
- Change compatible of mqs to audio-graph-card2
- Add imx95-19x19-frdm-pro in Makefile
- Link to v1: https://lore.kernel.org/r/20260318-imx95_frdm_pro-v1-0-8c00e59f0b1b@nxp.com

---
Joseph Guo (2):
      dt-bindings: arm: fsl: Add i.MX95 19x19 FRDM PRO board
      arm64: dts: freescale: add i.MX95 19x19 FRDM PRO board dts

 Documentation/devicetree/bindings/arm/fsl.yaml     |    1 +
 arch/arm64/boot/dts/freescale/Makefile             |    1 +
 .../boot/dts/freescale/imx95-19x19-frdm-pro.dts    | 1049 ++++++++++++++++++++
 3 files changed, 1051 insertions(+)
---
base-commit: 7109a2155340cc7b21f27e832ece6df03592f2e8
change-id: 20260311-imx95_frdm_pro-7a8d03b50982

Best regards,
-- 
Joseph Guo <qijian.guo@nxp.com>


