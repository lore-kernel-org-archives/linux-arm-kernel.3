Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1D6CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qGB+nU4m9lqFfopPttuM4IAbnJ+brTGbjifmpLmp4iA=; b=1mFQg+JpOYZ1V1/bGSBO48AEfj
	HKGmoSgz20MQBXDPWVxLvoVgA8Epzs5f3VgZP5oZQuaGNdOGJb5tk01a0hXJv+zZbbKQxgSTjOn00
	C3gNxZuJQoOKZUNyp/UFlVpGCi2ukVVebOLAdKa3FbcFcG9MyzwOzz9ePasoVfTfzXzqnpBhOgb6v
	p8EglsNURkYX5cg+kE3m+cJbcRKYpgN6sbqde5iAejLIc7aAjoXQ1XJ7s43wPd5ajHwakWU6ws2+r
	+N4R1Ae+HAiQA1C4I20ME50BDsqp1q/x6C/9nokZokqPTFl/49OrP5jS2DQjEqoIb65BdQOok9qiX
	CcYtExMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw26O-000000094fQ-2p1q;
	Tue, 09 Sep 2025 17:25:56 +0000
Received: from mail.grinn-global.com ([77.55.128.204])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1FW-00000008X9D-2pjp;
	Tue, 09 Sep 2025 16:31:20 +0000
X-Virus-Scanned: by amavisd-new using ClamAV (10)
Received: from mateusz.int.grinn-global.com (f90-187.icpnet.pl [46.228.90.187])
	by server220076.nazwa.pl (Postfix) with ESMTP id BDE451BC2C3;
	Tue, 09 Sep 2025 18:31:10 +0200 (CEST)
From: Mateusz Koza <mateusz.koza@grinn-global.com>
To: angelogioacchino.delregno@collabora.com,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	marcin.czarnecki@grinn-global.com,
	b.bilas@grinn-global.com,
	mateusz.koza@grinn-global.com,
	andrew@lunn.ch
Subject: [PATCH v5 0/4] Add support for Grinn GenioSBC-510/700 boards
Date: Tue,  9 Sep 2025 18:30:46 +0200
Message-ID: <20250909163052.446723-1-mateusz.koza@grinn-global.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-NA-AI-Spam-Probability: 0.47
X-NA-AI-Is-Spam: no
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_093118_884708_BEBA8ABA 
X-CRM114-Status: GOOD (  11.31  )
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

This patch series adds support for Grinn GenioSBC-510 and GenioSBC-700
boards based on MediaTek MT8370 and MT8390 SoCs, respectively. It
includes device tree files for both boards, updates to the device tree
bindings, and necessary modifications to the Makefile.

As far as I know, <angelogioacchino.delregno@collabora.com> has access
to the schematics for these boards, as we've shared them under NDA with
Collabora.

Signed-off-by: Mateusz Koza <mateusz.koza@grinn-global.com>
---
v2:	Fixed the subject prefixes,
	Fixed alignment in dts files,
	Added missing SPDX-License-Identifier,
	Fixed the ordering in dt-bindings,
	Dropped redundant info from commit messages,
	Run checkpatch.pl on the patchset and fixed the issues,
	as suggested by Krzysztof Kozlowski <krzk@kernel.org>.

v3:	Changed eth phy-mode to 'rgmii-id',
	Changed eth mediatek,tx-delay-ps to 30,
	as suggested by Andrew Lunn <andrew@lunn.ch>.

v4:	Removed the nodes that are not present in upstream,
	as suggested by Louis-Alexis <angelogioacchino.delregno@collabora.com>.

	Added default pinctrl to ssusb0,
	Enabled the scp_cluster node,
	as suggested by Bartosz Biłas <b.bilas@grinn-global.com>.

v5:	Did NOT move the chasis-type - Error: Properties must precede subnodes,
	Swapped underscores to commas in regulator names,
	Reordered properties (generic -> vendor -> status),
	Dropped the firmware property from the scp_c0 node,
	Added interrupts-extended to the pmic node,
	Dropped the mt6359key handle,
	Added blank spaces before the memory nodes,
	as suggested by AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> 
---

Bartosz Bilas (1):
  arm64: dts: mediatek: mt8370-grinn-genio-510-sbc: Add Grinn
    GenioSBC-510

Mateusz Koza (3):
  arm64: dts: mediatek: mt8390-genio-700-evk: Add Grinn GenioSBC-700
  dt-bindings: arm: mediatek: Add grinn,genio-700-sbc
  dt-bindings: arm: mediatek: Add grinn,genio-510-sbc

 .../devicetree/bindings/arm/mediatek.yaml     |   2 +
 arch/arm64/boot/dts/mediatek/Makefile         |   2 +
 .../mediatek/mt8370-grinn-genio-510-sbc.dts   |  20 +
 .../mediatek/mt8390-grinn-genio-700-sbc.dts   |  20 +
 .../dts/mediatek/mt8390-grinn-genio-sbc.dtsi  | 538 ++++++++++++++++++
 .../dts/mediatek/mt8390-grinn-genio-som.dtsi  | 210 +++++++
 6 files changed, 792 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-som.dtsi

-- 
2.43.0


