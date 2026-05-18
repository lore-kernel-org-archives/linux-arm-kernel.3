Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B419ACD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 02:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fHnX61O6uZxed9xsnOQwM4beNPtwTbCxDLQyZHp4Hjs=; b=w1y/KZbpSJCqGh
	z22rJq4UJIY/olmc5WQ0KIDWLUCFO1P/yXRDGrhLkvmYcFd3Fs2jefhiCk8uNqIj803CY94So4TXF
	++pbDiNwHvySGk1X6rplCgF0KG7kdrXcglH8cGFyrC0zocZP7Hlsbj4JDchfaOUIcOmCBkw+QZFBw
	2QSZZUK7yLW1ryoa4Zf0OLSLZPtzAhKbzPDgEypkRVFWmBw861RQqaRaoYUl2O6DYNJpik2Zg0MLi
	OON+eL5ejDpa7LcKTdF4XpinW1PjXKTK0qGoQu+ZxcSdd2CPHmKqiMGJLYQ/tn1jdmhbAqYqqu3l3
	2rs0E/NoAG0N9tgw0qYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOoC4-0000000DzYO-1PlN;
	Mon, 18 May 2026 02:59:00 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOoC1-0000000DzWZ-1j58
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 02:58:58 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 97BC31A117D;
	Mon, 18 May 2026 04:58:53 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5F9B51A11BA;
	Mon, 18 May 2026 04:58:53 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 23ECA180026F;
	Mon, 18 May 2026 10:58:51 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Subject: [PATCH v4 0/2] Add NXP FRDM-IMX95-PRO board support
Date: Mon, 18 May 2026 11:58:18 +0900
Message-Id: <20260518-imx95_frdm_pro-v4-0-975346555a9b@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEqACmoC/2XOywqDMBCF4VeRrJsymVw0XfU9ShGjSZuFF2IJF
 vHdG4Uircsz8P3MTEYbvB3JJZtJsNGPvu/SEKeM1M+qe1jqm7QJAirgjFHfTlqWLjRtOYSe5lX
 RADcSdIEkoSFY56cteLun/fTjqw/vrR/Zev2miv9UZBRoUQNYqR0YZq7dNJzrviVrKOKOBR4xJ
 iy4QAFGSXTiF/Mdp1cPmCesFWowImdcqx0vy/IBAHWJdiQBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779073130; l=1424;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=36KvpVLZ2OlTOmDx+ai6Qq77ttV27luyGGK993oHgt0=;
 b=8oK+MDmC88h8FpZTSKRofjrcbESSKd7LxuSew2ILEVR4Nxnfqpzd4W+FaVOMDSWOx3dY7l77m
 NEYRW2Z71+WAy4MKwRDmI+7ImTCKyqnadvuWwlJJXHn5FRsLgsLnVfx
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_195857_590735_33EE1B17 
X-CRM114-Status: UNSURE (   7.78  )
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
Changes in v4:
- Correct underscores in node names
- Correct 'silent-gpio' of can_phy to GPIO_ACTIVE_HIGH
- Fix typo in pinctrl_pcal6416
- Link to v3: https://lore.kernel.org/r/20260509-imx95_frdm_pro-v3-0-96290b471396@nxp.com

Changes in v3:
- Change status of CAN1 to reserved
- Remove unused pinctrl
- Explain difference with i.MX95 15x15 FRDM in message
- Link to v2: https://lore.kernel.org/r/20260428-imx95_frdm_pro-v2-0-434240b652f4@nxp.com

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
 .../boot/dts/freescale/imx95-19x19-frdm-pro.dts    | 1021 ++++++++++++++++++++
 3 files changed, 1023 insertions(+)
---
base-commit: 7109a2155340cc7b21f27e832ece6df03592f2e8
change-id: 20260311-imx95_frdm_pro-7a8d03b50982

Best regards,
-- 
Joseph Guo <qijian.guo@nxp.com>


