Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078DBCD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 07:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=41yo9eF9eE/W57xOSWNSe9/Hf6kKPXo4YFFQ3bBNlmU=; b=pR34PBp/BBsMFe
	CJLwKSAVsprJB7as3WZnLU0qkKleDpeSxWBwYYFTojEjhwyDOU5Mv6XE1lc4J8OF941r5XA31/WCw
	fL8NRu/uzw36eXJF2vNjtpNwSj67sjlKuCqtgLHUAHJgdSevVK5hYk0RgZSYjl31Vw2lu97uXfpLF
	h+hjfoiJksYpU5T2bLswVV2SIlwbPH9t0fY3IO3xyW1coyVvLiVdD5oaoUeGaPpv4ynHLCxihMfMP
	mIL0T8ZI6q14RPgHMDuxSoI5DHE57ar3Usq0J9F7bIe+8GhGOWDNLOUNTf/SDvq9eglDHz6S3wMqp
	um3kxDAdhmcdQciGguZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLc0C-00000008T5u-0jXp;
	Sat, 09 May 2026 07:21:32 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLc07-00000008T3N-3221
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 07:21:29 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D1E711A39D7;
	Sat,  9 May 2026 09:21:23 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9A0CE1A2413;
	Sat,  9 May 2026 09:21:23 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 62E2A18002C9;
	Sat,  9 May 2026 15:21:21 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Subject: [PATCH v3 0/2] Add NXP FRDM-IMX95-PRO board support
Date: Sat, 09 May 2026 16:21:13 +0900
Message-Id: <20260509-imx95_frdm_pro-v3-0-96290b471396@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGng/mkC/2XM0QqDIBiG4VsJj+f4/dVmO9p9jBFZujwoQ4c0o
 nufBSPYDr8P3mch0QRnIrkWCwkmuej8mAc/FaTtm/FpqOvyJghYAmeMumGuZG1DN9RT8PTSqA6
 4llApJDmagrFu3sH7I+/exZcP791PbHu/lPqlEqNAVQtgZGVBM30b5+nc+oFsUMIjFvgfY44FF
 yhAlxKtOOJ1XT8yYJbj5wAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778311281; l=1190;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=e7feVXRt8YF18HtNxdbrCQf9zi+oyqiTuXLIliRn4/4=;
 b=6zDrA03bjP7dgJmPInl1iH+jtlFPbTDJzNYdrk3jrs7dr35LrdsOeveyJqVWOojfCKG1R7wfd
 Pq87IkKG5NMDVHeHEMM3ZMAB05m0RYbrvYYJKj7lNH8mPKG8OZ1zWQJ
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_002127_899979_D1A7A4F8 
X-CRM114-Status: UNSURE (   7.65  )
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


