Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B57C88E70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eUarJMGDCqEqgZdWHNd0rs5//gAl4YBmb9tU/Vt4LlY=; b=n4fEZoM4EQYuEc
	314x81JcVbeJ0NujV+2/4dy3esdCdMO638sWtSR+rCl54QSuO/9brme86I+1vuny4DorLxoEXJuIW
	73Bt5nW9QNzJsYhZJuAkgLLTiRIdBxCN+sw3FIfc8gka1WGh80ad3hSH0+bPPKoV0sYqy6m1QbN2J
	Dt2Kjgi5fWnKV2PmNBAwu62W20DgIhcUJUbFyYP1QU8Xs/K3q5M7HaMuP3dkH5yZ/ScVWZPqzJ1c7
	l/w3EbpB9bRks4zeZ9B99I1bMDvGQEX1gin4hk3PP8frIHYvXqdv/RSs0O7DuWDkuAtwDp9+ZOHZT
	1XO43Ai4tcCNuyBtKyQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x671Q-00000003q0S-3oM5;
	Mon, 14 Sep 2026 13:47:00 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x671N-00000003pxP-0PcX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 13:46:59 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1789393611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eUarJMGDCqEqgZdWHNd0rs5//gAl4YBmb9tU/Vt4LlY=;
	b=EClNtoXUYcXzDih0sdO1e952pojjjB1DfG78s/IGdSmmcoO8KyEl3EUX57/Uc+pp1A6i44
	P0jnaLqmrfh6/HLmufF5tWngrDl9t2lUflbiCxdVs+bvFsGdLBKa5E2o+BTMvqx2EiD92r
	7yBYkxY/kHF6DJZqOQP8FwV6VX2AqHaoGt2gZpcbKSBB23QAaVWP4Qzyz4vTHqDY+Zc2nb
	OGzr/770DQrY1SFkAGx/LGeC7OBzuaUNEW5zaYCNtcvUxnONolA+CBCo8Zb7/v1Rg1hGHJ
	UEHogQxBGKFOc1UqqE/xFAC27E1tX2VThFH+yZoSfQbomFeqWS5L88HtAjj7zw==
Subject: [PATCH v2 0/9] Misc Kontron i.MX DT improvements
Date: Mon, 14 Sep 2026 15:46:08 +0200
Message-Id: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-0-8e12bc5f1f10@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/52OQQ6CMBBFr0K6dkwt2oIr72FYAB1gNLSkLQ2Gc
 HcL3sDV5CUv/83KPDpCz+7ZyhxG8mRNAnHKWDvUpkcgnZgJLiQveQHz5IPDeiTTQ1QggMYFdEh
 ncjbiiCZ4SJ6QIFXeCV2qEmXO0uDksKPliD2rH/u5eWEb9sJuDOSDdZ/jm3jZvb/C8QIcrppjU
 aubblT5eFsTnDVnjazatu0Lja3ImfcAAAA=
X-Change-ID: 20260908-upstreaming-v7-2-imx-dt-improvements-08-26-673f2d979e63
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Eberhard Stoll <eberhard.stoll@kontron.de>, 
 Oualid Derouiche <oualid.derouiche@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1476;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=HhKaOp+p3KwfCAFbogop7pZiTI++nVe1i/l8LRcwlhI=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWv5r63ubrdvpivce9KoeCtILcgxvyF8xlVJKaugkJT3l
 QtWv+foKGVhEONikBVTZJHit3htaxbrI3+sOgpmDisTyBAGLk4BmIiDN8P/7O+FvDEHt5+TFFkv
 KugZf4p/RmT3ojglhUtXDsUked6Yw8jQ/O3xbbPVrN51px992HOS95GY8teaHSfiTRfIylquymr
 iBQA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_064657_558713_D77A0601 
X-CRM114-Status: UNSURE (   6.28  )
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

Changes in v2:
- Patch 1 and 8: Improve commit message (Frank)
- Link to v1: https://patch.msgid.link/20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de

---
Eberhard Stoll (1):
      ARM: dts: imx6ul-kontron-bl-common: Replace UART3 with DIP switch GPIOs

Frieder Schrempf (2):
      arm64: dts: imx93-kontron: Adjust GPIO4_IO29 usage
      arm64: dts: imx8mm-kontron: Describe the ethernet PHY LEDs

Oualid Derouiche (6):
      ARM: dts: imx6ul-kontron-bl-common: Add GPIO labels
      ARM: dts: imx6ul-kontron-bl-common: Fix USB OTG1 ID pin configuration
      arm64: dts: imx93-kontron: Make USB-C connector "device-only"
      arm64: dts: imx8mm-kontron: Add GPIO labels and comments
      arm64: dts: imx8mm-kontron: Add SPI EERAM on BL device
      arm64: dts: imx8mp-kontron: Fix LVDS clock frequency for DL device

 .../boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi |  38 +++++---
 .../arm64/boot/dts/freescale/imx8mm-kontron-bl.dts | 107 ++++++++++++++++-----
 .../boot/dts/freescale/imx8mp-kontron-dl.dtso      |  11 +++
 .../boot/dts/freescale/imx93-kontron-bl-osm-s.dts  |   6 +-
 .../boot/dts/freescale/imx93-kontron-osm-s.dtsi    |  32 +-----
 5 files changed, 117 insertions(+), 77 deletions(-)
---
base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558
change-id: 20260908-upstreaming-v7-2-imx-dt-improvements-08-26-673f2d979e63

Best regards,
--  
Frieder Schrempf <frieder.schrempf@kontron.de>


