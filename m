Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9F0C4450F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 05:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ShjHDNLCNRRENRzsS0gJdIUws8zMJPIgpMZ0KEZYhRo=; b=eFAWflBVJBP3N/
	nmnOdennkFZhS1OHQb2OMXeViDCkWe+8BkEBvEeK/GEPKkOMcK0UHLok1AXJlDj7L8RrNnnQYaZ4f
	qXVVRcuxZhawERfR3modOd9+GoglltFPSDCXHkouiQUY6YXLlWNPt95Tr+g1Fi2zsuPabbB+G1iIJ
	GBmw0Vx0VjgM6myMt8sJjGjfDAK0PdlxGnqbVkEPr3S+tVK0NK7Ivn+0DcIrqjwoihs09qliXcX4C
	aJulLyYHN0VKuBYQmcA+g2l/gs5XeVK4qzCNTg8WsE7cYlTotdtqusR5VDfUTYejzyu+9LqTt1edV
	XJkZ5pMpRu5/Ly5ww4xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkaro-00000001ACJ-2css;
	Fri, 17 Jul 2026 05:12:08 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkarh-00000001A9u-0DuP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 05:12:03 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BBC3D1A0143;
	Fri, 17 Jul 2026 07:11:56 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 75A571A013A;
	Fri, 17 Jul 2026 07:11:56 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id A768E18000B5;
	Fri, 17 Jul 2026 13:11:54 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Subject: [PATCH 0/3] Add i.MX93 Wireless FRDM board support
Date: Fri, 17 Jul 2026 14:11:51 +0900
Message-Id: <20260717-imx93w_frdm-v1-0-0cca6c0ba2f5@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJe5WWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0Mz3czcCkvj8vi0opRcXSNTI4vElERzI2MTYyWgjoKi1LTMCrBp0bG
 1tQDcJy8LXQAAAA==
X-Change-ID: 20260716-imx93w_frdm-2528ada72343
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joseph Guo <qijian.guo@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784265114; l=1190;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=Pz8rjupJB2ZM6ycmPL/h9gsGIcaLh9i3O3s2e7rrrGY=;
 b=a2PwV3YNEBSPZgtC+a9YakjggLlvUrI6SOSWUjI9WZ/Gi/4gJrkgfNk83DPdKLyh3jlruo/ha
 czGTOozzcDdBYfvmDw+87k5bs4YNxiK/BBF6SfI1cTgWPQXjoXH4baR
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_221201_235605_2C89DB61 
X-CRM114-Status: UNSURE (   6.38  )
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

i.MX93 Wireless FRDM board(FRDM-IMX93W) is a low-cost and compact board featuring
the i.MX93W applications processor

FRDM-IMX93W board basically reuse the FRDM-IMX93 board, with some minor functional
and pin connection differences. Factor common parts of FRDM-IMX93 and FRDM-IMX93W
into imx93-11x11-frdm-common.dtsi and add the board-specific changes.

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
Joseph Guo (3):
      arm64: dts: imx93-11x11-frdm: factor out common parts into dtsi
      dt-bindings: arm: fsl: Add i.MX93 Wireless FRDM board
      arm64: dts: imx93: Add i.MX93 Wireless FRDM board support

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 .../dts/freescale/imx93-11x11-frdm-common.dtsi     | 692 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 686 +-------------------
 arch/arm64/boot/dts/freescale/imx93w-frdm.dts      |  23 +
 5 files changed, 719 insertions(+), 684 deletions(-)
---
base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
change-id: 20260716-imx93w_frdm-2528ada72343

Best regards,
-- 
Joseph Guo <qijian.guo@nxp.com>


