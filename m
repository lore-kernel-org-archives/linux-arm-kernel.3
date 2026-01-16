Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E889FD4A613
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 08:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o4yyoQg7TPU6EMRTsLcHwaWRZt1QuggHvZk/7M5U4Ao=; b=AbtUVDjoxg4jl7
	yqfepX6YetVOLmG0KUx/psnVsP/CCkP8pvBK/11Lc4FvNGXMoqPCR2Ob3TCu6n8WSsOl2lJ14iLOS
	rjGy4JiATGU5DcH6A3Zscfwq6Gzjg8xFrSei9lGRG3pc7muwg/5N72X8WS7FzLcEy40NYpJjzufm3
	p3TJF+IdUrq8kY+a559KpfAst+ZosO591YsgSTLnRXHs9oDCQtdSOFfEiioJ21qtDP411y/a/DSjp
	bX5xtJYE07uESQnOQuL64rQfka6yDJoOfVJcfFPFU1NbUejbjKGMtGxhuqy5O9qOSYSstT2IzOX1v
	e6BAx+WWWB9XaW4Cqvjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfdI-0000000DnZJ-0knm;
	Fri, 16 Jan 2026 08:56:40 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfdA-0000000DnVr-1gdf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 08:56:33 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C71901A0BE4;
	Fri, 16 Jan 2026 09:56:26 +0100 (CET)
Received: from usswic1srsp001v.us-swic1.nxp.com (unknown [10.114.8.222])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 949561A0884;
	Fri, 16 Jan 2026 09:56:26 +0100 (CET)
Received: from lsvm07u0000156.swis.us-west-2.aws.nxp.com (lsvm07u0000156.swis.us-west-2.aws.nxp.com [10.45.140.59])
	by usswic1srsp001v.us-swic1.nxp.com (Postfix) with ESMTP id 6A0ED1800309;
	Fri, 16 Jan 2026 00:56:25 -0800 (PST)
From: Lei Xu <lei.xu@nxp.com>
Subject: [PATCH v3 0/2] Add device tree support for NXP i.MX95 15x15 FRDM
 board
Date: Fri, 16 Jan 2026 00:56:12 -0800
Message-Id: <20260116-127-v3-0-3dc49545a745@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACz9aWkC/1XMQQ6CMBCF4auQWVvTGWlBVt7DuIAySBcW0poGQ
 3p3CzFRl/9kvrdCYG85QFOs4DnaYCeX43QowIytu7OwfW4gSQpJVgKpEiXXSiHXXd8OkD9nz4N
 d9pXrLfdow3Pyr3004nb99xGFFKol5k6fB1Ty4pb5aKYHbDrSj8CPoCx0ZTokVppK+oqU0ht+g
 lH4xgAAAA==
X-Change-ID: 20251207-127-4e8551e8bdaf
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 justin.jiang@nxp.com, qijian.guo@nxp.com, lei.xu@nxp.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768553785; l=1381;
 i=lei.xu@nxp.com; s=20251205; h=from:subject:message-id;
 bh=L41wFS2FXO+gmq1auWSbWfGL0NY1XhArgZGklZ9nx3o=;
 b=lMjXEfNbB/R8BTFmceqt+HWx0U93K1cwx5QXC4cak7Gn7K072bwFkN5n3aqbfccAidV2cynIK
 S73pxG7VKNCANYuBky69qB21MtG56DAP0NWzDaFkmM7RukkZaGJ+pI9
X-Developer-Key: i=lei.xu@nxp.com; a=ed25519;
 pk=faUN/3jfazJOPNYhE9pN+nzvk+lrEm64ZRf42Yeum6U=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_005632_576353_7D0DDDC5 
X-CRM114-Status: UNSURE (   9.71  )
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
Changes in v3:
- Add a blank line between the cpu and codec node definitions.
- Link to v2: https://lore.kernel.org/r/20251217-127-v2-0-67cb12e56242@nxp.com

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
 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts | 964 +++++++++++++++++++++
 3 files changed, 966 insertions(+)
---
base-commit: 6987d58a9cbc5bd57c983baa514474a86c945d56
change-id: 20251207-127-4e8551e8bdaf

Best regards,
-- 
Lei Xu <lei.xu@nxp.com>


