Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498E2CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZrD5DPrJMl+NkuGONjHfbUNbeXKegNAv2ruNrJM13ZE=; b=ArFAjUOcMa2qflIjF6O4uMsc6N
	SOZY+NyTZKIgJ/ddQf0TQZHv346K7s977EfdzkMs9tDU++Ju9m9ywx1kMXka4xhf8X2oaok+UpSBp
	MBkZTkF6V0MyeB1FQDkY53wivOt2zttE0t6j7cX5D68wWSBUNhpr3UTjh3itL6P56JG2oqJsoPfU3
	vWO/Uz9yVWNY8USr/xWPH+R2z7MyXwf73yn9c3k04za1dKPzqtTX1u59MP5WeoGtZYQgbGvt2eNha
	ScW3nCelh8aLLCq0WhWkLF6S7OWtJUqduXVvWk95KAPqvHwJekt3IxMZmfAA4LEOHrOIlqVIPBC7c
	ZFqgW1rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfNQ-000000013MX-1Y8c;
	Mon, 08 Sep 2025 17:10:00 +0000
Received: from mail.grinn-global.com ([77.55.128.204])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbaO-0000000HG2t-2uOZ;
	Mon, 08 Sep 2025 13:07:10 +0000
X-Virus-Scanned: by amavisd-new using ClamAV (9)
Received: from mateusz.int.grinn-global.com (f90-187.icpnet.pl [46.228.90.187])
	by server220076.nazwa.pl (Postfix) with ESMTP id 1E47B1BE06E;
	Mon, 08 Sep 2025 15:06:58 +0200 (CEST)
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
Subject: [PATCH v4 0/4] Add support for Grinn GenioSBC-510/700 boards
Date: Mon,  8 Sep 2025 15:05:33 +0200
Message-ID: <20250908130620.2309399-1-mateusz.koza@grinn-global.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-NA-AI-Spam-Probability: 0.52
X-NA-AI-Is-Spam: no
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_060708_912101_3350E93F 
X-CRM114-Status: GOOD (  11.01  )
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
 .../mediatek/mt8370-grinn-genio-510-sbc.dts   |  19 +
 .../mediatek/mt8390-grinn-genio-700-sbc.dts   |  19 +
 .../dts/mediatek/mt8390-grinn-genio-sbc.dtsi  | 538 ++++++++++++++++++
 .../dts/mediatek/mt8390-grinn-genio-som.dtsi  | 209 +++++++
 6 files changed, 789 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-som.dtsi

-- 
2.43.0


