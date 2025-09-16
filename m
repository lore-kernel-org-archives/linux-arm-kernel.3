Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C419ECAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 15:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oj/mQH6BSa8mD3VuZUyr+S2kA84ZpZ7y/bEhzZqw6dI=; b=amdStiGIHpn0QFIRd5aXy30kD6
	P2WKCXGtraTKxOfPN7D92wdfHek0eCMOOFN+sx6b42KBHHRK74YB0D0/sVk7y652IerCwQhw9Dbz5
	zm5jzimwcgnFXlcMHYFK/GSxLIPZ1m3GRsZixsYijOGjzdNre6v3TMFLR5aB8Qw+WZl3lxFMHA/Tm
	DmHZLttwaYAZo2Ah7ptO8TxnVX3d+QQcjr9zON4W9R/9gzTYFnEEyBse3fmrz8pCl9DhrCPn2aRvx
	Adw5LB9H4A1wQXZnIL1vUaIxS7eUAvjLpwlqXr6dJCHLJXyluTvcO1qq8WWUQaWSpHI2U7c3nCLiu
	d/+vNpUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyXfV-00000008IWu-334p;
	Tue, 16 Sep 2025 15:32:33 +0000
Received: from finn.gateworks.com ([108.161.129.64] helo=finn.localdomain)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyXfT-00000008IV4-0Lia
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 15:32:32 +0000
Received: from syn-068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
	by finn.localdomain with esmtp (Exim 4.95)
	(envelope-from <tharvey@gateworks.com>)
	id 1uyXfG-00Aysu-PP;
	Tue, 16 Sep 2025 15:32:18 +0000
From: Tim Harvey <tharvey@gateworks.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH 0/7] various imx8m*-venice dt fixupes
Date: Tue, 16 Sep 2025 08:32:09 -0700
Message-Id: <20250916153216.1042625-1-tharvey@gateworks.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_083231_119971_9B5DEC35 
X-CRM114-Status: UNSURE (   6.95  )
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

This series contains various imx8m*-venice board dt fixups.

Tim Harvey (7):
  arm64: dts: freescale: imx8mp-venice-gw7905-2x: remove duplicate
    usdhc1 props
  arm64: dts: imx8m{m,n,p}-venice: disable unused clk output for TI PHY
  arm64: dts: imx8mp-venice-gw702x: reduce RGMII CLK drive strength
  arm64: dts: imx8mm-venice-gw700x: reduce RGMII CLK drive strength
  arm64: dts: imx8mm-venice-gw72xx: remove unused sdhc1 pinctrl
  arm64: dts: imx8mp-venice-gw702x: remove off-board uart
  arm64: dts: imx8mp-venice-gw702x: remove off-board sdhc1

 .../dts/freescale/imx8mm-venice-gw700x.dtsi   |  3 +-
 .../dts/freescale/imx8mm-venice-gw72xx.dtsi   | 11 ----
 .../dts/freescale/imx8mm-venice-gw7902.dts    |  1 +
 .../dts/freescale/imx8mn-venice-gw7902.dts    |  1 +
 .../dts/freescale/imx8mp-venice-gw702x.dtsi   | 54 +------------------
 .../dts/freescale/imx8mp-venice-gw72xx.dtsi   | 11 ----
 .../dts/freescale/imx8mp-venice-gw74xx.dts    |  1 +
 7 files changed, 7 insertions(+), 75 deletions(-)

-- 
2.25.1


