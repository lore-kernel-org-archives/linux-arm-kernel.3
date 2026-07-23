Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED87FC44524
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 07:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vaqrhZQoA6khidZs4qSgngbpk0TIzu+q3iBtXNaiN9Q=; b=T35l+jFD95SRaA
	BQXKMHqHIIzdG4qHPga5BJb52lM+TKJLLgD2kYNEUjtdDjodxPN0g4L76pspGOY4A+fPnNFu0ieYv
	q2wRMuLhD0iNoYOFpjcUGQQWLKR22JKzmYT9TiJUbLivESYH+Q74pWjnRnP9fc85AhhmY8yrTiLuY
	AyGa6jcJ1A8x3Hxj52kCzP9qn7pEDG7XU0oED6sR8u+2H13yzdilg3ubhwoskvOtGCv0OVYVRT3jn
	jkMohebjphrSG8uBjPGTfAqo6mhJjAlahCo4a/SOQPHGGtVDXJMY//h7hwPV+xK0mnde6lKn0G5Lh
	vxSEfBVFsvgYM0JOsBvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmncf-0000000DcBl-1v5B;
	Thu, 23 Jul 2026 07:13:37 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmncc-0000000DcAW-2k1z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 07:13:36 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id DA4761A015C;
	Thu, 23 Jul 2026 09:13:30 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A33291A015F;
	Thu, 23 Jul 2026 09:13:30 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 84AFA18000B5;
	Thu, 23 Jul 2026 15:13:28 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Subject: [PATCH v2 0/3] Add i.MX93 Wireless FRDM board support
Date: Thu, 23 Jul 2026 16:13:20 +0900
Message-Id: <20260723-imx93w_frdm-v2-0-b108a76b2e40@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABC/YWoC/1XMSw7CIBSF4a00dywGLhbUkfswjUEe9g6gDZha0
 3TvYhMHDv+TnG+B4jP5AudmgewnKjSkGrhrwPYmPTwjVxuQo+JaKEZxPsnXLWQXGbZ4NM5olAc
 J9TFmH2jetGtXu6fyHPJ7wyfxXX+O/nMmwTjj1hpl+d1gaC9pHvd2iNCt6/oB3lesVKQAAAA=
X-Change-ID: 20260716-imx93w_frdm-2528ada72343
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 justin.jiang@nxp.com, xinyu.chen@nxp.com, qijian.guo@oss.nxp.com, 
 Joseph Guo <qijian.guo@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784790808; l=1408;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=iPcXDcyUPOIKX85MlPV5vcloIKHXNagDNwWRTDwubp8=;
 b=LoMAh0FzPwJKyZonHTr1PaHt7z0IIVO8VQm75psKOSKh0wBZyMMO3OOEPPlmxT8otmmEyYlFT
 6LhPWAR9wgaD1NG18+mDuPblSfBynCQH8X/KYn6BwrhZWBezjDTJfSQ
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_001335_009285_842FFBF3 
X-CRM114-Status: UNSURE (   7.88  )
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
Changes in v2:
- Move board specific lpuart5 pin assignment to i.MX93 FRDM dts.
- Move pcal6408 node from common dtsi to i.MX93 FRDM dts
- Link to v1: https://lore.kernel.org/r/20260717-imx93w_frdm-v1-0-0cca6c0ba2f5@nxp.com

---
Joseph Guo (3):
      arm64: dts: imx93-11x11-frdm: factor out common parts into dtsi
      dt-bindings: arm: fsl: Add i.MX93 Wireless FRDM board
      arm64: dts: imx93: Add i.MX93 Wireless FRDM board support

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 ...11x11-frdm.dts => imx93-11x11-frdm-common.dtsi} | 129 +---
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 679 +--------------------
 arch/arm64/boot/dts/freescale/imx93w-frdm.dts      |  23 +
 5 files changed, 32 insertions(+), 801 deletions(-)
---
base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
change-id: 20260716-imx93w_frdm-2528ada72343

Best regards,
-- 
Joseph Guo <qijian.guo@nxp.com>


