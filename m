Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01ECCC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 06:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YKjxZqI4FktMbAujigZpXSj/I+ehV/Ya+tt49xCes+o=; b=WiAJQRHZq+cCdF
	ImpXeeNxvQ1m4WauzOoZTed1gPW39cKFgY79kOFIPhVP/b+Xf2mqPfmsiuc+UiC8qkozldf136nAQ
	1+yRFRrEcrv0/n5EH2VD3a6PdXOH3kqkhRW6bnJXgEJgKnflDA2gIKYgnGNA0KzQaHZl7ZGXVya0m
	KUPcQIBn4xyxu8GIg+L9WYGMSwSB6blAw30hvRiWJIMoGaH838oIt3wlJ1zI1bKm5hVGKbQNbDh1N
	vW4/gu6IYQUek4u9YZfpCLx8KJN8HBfIczIcG3sxSGtL6wOZrVQGIYQHocUNeXKIeuROG2g7w4wpx
	zED8inDDsLw061aLnj2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhV8-00000005xbY-2otj;
	Mon, 20 Jul 2026 06:29:18 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhUr-00000005xMs-0jTW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 06:29:02 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 585911A0042;
	Mon, 20 Jul 2026 08:28:57 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 29A131A0040;
	Mon, 20 Jul 2026 08:28:57 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 193C118000B1;
	Mon, 20 Jul 2026 14:28:55 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Subject: [PATCH 0/2] Add i.MX952 FRDM board support
Date: Mon, 20 Jul 2026 15:28:52 +0900
Message-Id: <20260720-imx952_frdm-v1-0-6d145eaaa5c4@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACTAXWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0Nz3czcCktTo/i0opRc3VSLtCQTQ9PEVJMUEyWgjoKi1LTMCrBp0bG
 1tQCKYaayXQAAAA==
X-Change-ID: 20260717-imx952_frdm-e8fb415ae4d4
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 qijian.guo@oss.nxp.com, justin.jiang@nxp.com, joy.zou@nxp.com, 
 Joseph Guo <qijian.guo@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784528934; l=811;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=SYmL2yxbUbMx5yLLjsJOBqmUBV+i6ecNo6KLOjxQn8I=;
 b=94YVHE9ZHDtU2SEPVEZVdVZiSmKMYw6RnEQqmwuo9yY1xwvv+off9DtuRSAiU1kL0CNF1yHPS
 kKcK3FKZruDDbfZnURludpx/kQ5QEMCRnidmgRNA+amFgtQjYfjQaJ9
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_232901_378889_504DE0AC 
X-CRM114-Status: UNSURE (   5.58  )
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

i.MX952 FRDM Board is a low-cost and compact board featuring the i.MX952
application processor.
Add dt-bindings and basic device tree for i.MX952 FRDM board.

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
Joseph Guo (2):
      dt-bindings: arm: fsl: add i.MX952 FRDM board
      arm64: dts: freescale: add i.MX952 FRDM Board support device tree

 Documentation/devicetree/bindings/arm/fsl.yaml |   1 +
 arch/arm64/boot/dts/freescale/Makefile         |   2 +
 arch/arm64/boot/dts/freescale/imx952-frdm.dts  |   9 +
 arch/arm64/boot/dts/freescale/imx952-frdm.dtsi | 727 +++++++++++++++++++++++++
 4 files changed, 739 insertions(+)
---
base-commit: 139fb260e37938042c6ffaad796e236fde2bafed
change-id: 20260717-imx952_frdm-e8fb415ae4d4

Best regards,
-- 
Joseph Guo <qijian.guo@nxp.com>


