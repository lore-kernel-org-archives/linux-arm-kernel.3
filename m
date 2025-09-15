Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84383CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 13:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MDubKcjXFcDZmhFsHhoftPWfhxVchnljhnPCB4Gn9VQ=; b=XLe9Ah7ABIRZBVb7jbYoajWDTS
	18CvJzLuq/Bm5fGujS0Mzc32hX4P/kwwceNi5YagBuxXjuG8EWs7ChSDJinmvXImpPorXyStLvsO5
	9Jy3xQtY2pGP0wjMijRH25yS4uejEzZedJMaEWtEkfDwZ5W0CLzXWxcfl0xPNGTVWntV9dWWViEaV
	kVmQAGduaJ1HqkiKFTnilmkf9qGm3VISfjcphIDhkoeFI8ngKcmAjF2xDKdFlyH4MUO6hK9Owqhct
	nCR8uXCMdA4BILf4ExNpscSrid8nrIyvPB7KQAXpFPYk5IsXwYe962Bm0JsNcrVrYe04SO9tQUBj8
	3D1eHVeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9Di-00000004JC9-1cAe;
	Mon, 15 Sep 2025 13:26:14 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9Db-00000004J7n-11y1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 13:26:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=MDubKcjXFcDZmhFsHhoftPWfhxVchnljhnPCB4Gn9VQ=;
	b=PtxAcziaU5LbwAPcmAxPQ191Ku0eU5VcghYyJr8yh569dX5ahSKf1cu7LO6MZ0
	tX5yQGCwwekl8zJpbnEPN6OicqCeh9PqfzG1yYMKVZT82PkfHXXl+MxoLqAroXgm
	P15WJQd8qCctKiAXrsXQZH2UisxEEm0SKfzKC67iLL9PE=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDnjyTaE8ho5MiXBA--.47709S2;
	Mon, 15 Sep 2025 21:25:47 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/4] i.MX DT bindings changes for 6.18
Date: Mon, 15 Sep 2025 21:25:28 +0800
Message-ID: <20250915132535.253859-1-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: Ms8vCgDnjyTaE8ho5MiXBA--.47709S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw1UZr1UtFWDWr1UtF13Jwb_yoW8uFyxpF
	sxKF93GrykJF17Jr43tr1kCr1rXw18AF13GF45Xw18Aa90vF1jqF1rKwn5Zry7Gry2qr13
	ZF1jkr4DK34UAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jfGYdUUUUU=
X-Originating-IP: [114.216.210.127]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNhxIrWjIE9wDHwAA38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_062607_593548_F0B630F9 
X-CRM114-Status: UNSURE (   7.33  )
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

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.18

for you to fetch changes up to f001225088b8736f55dd28a4616cdf1b1bdcdd2e:

  dt-bindings: arm: fsl: add TQMa91xx SOM series (2025-09-11 15:37:58 +0800)

----------------------------------------------------------------
i.MX DT bindings changes for 6.18:

- New board compatibles: TQMa91xx SOM, Ultratronik Ultra-MACH SBC,
  SolidRun i.MX8MP SoM, i.MX8ULP EVK9, TQMLS1012AL, i.MX91 11x11 EVK,
  EDM-G-IMX8M-PLUS SOM
- Update imx95-scmi firmware bindings to allow linux,code for protocol@81
- Add i.MX53 compatible for fsl,imx-iomuxc-gpr bindings
- Update fsl,imx7ulp-smc1 bindings to allow clocks and clock-names

----------------------------------------------------------------
Alexander Stein (2):
      dt-bindings: firmware: imx95-scmi: Allow linux,code for protocol@81
      dt-bindings: arm: fsl: add TQMa91xx SOM series

Fabio Estevam (1):
      dt-bindings: soc: fsl,imx-iomuxc-gpr: Document i.MX53

Frank Li (1):
      dt-bindings: fsl: fsl,imx7ulp-smc1: Allow clocks and clock-names

Goran Rađenović (1):
      dt-bindings: arm: imx8mp: Add Ultratronik Ultra-MACH SBC

Josua Mayer (1):
      dt-bindings: arm: fsl: Add bindings for SolidRun i.MX8MP SoM and boards

Laurentiu Mihalcea (1):
      dt-bindings: arm: fsl: add i.MX8ULP EVK9 board

Matthias Schiffer (1):
      dt-bindings: arm: fsl: add TQMLS1012AL

Pengfei Li (1):
      dt-bindings: arm: fsl: add i.MX91 11x11 evk board

Ray Chang (1):
      dt-bindings: arm: fsl: Add EDM-G-IMX8M-PLUS SOM and WB-EDM-G carrier board

 .../bindings/arm/freescale/fsl,imx7ulp-pm.yaml     |  8 ++++
 Documentation/devicetree/bindings/arm/fsl.yaml     | 50 ++++++++++++++++++++++
 .../bindings/firmware/nxp,imx95-scmi.yaml          | 10 ++++-
 .../bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml       |  1 +
 4 files changed, 67 insertions(+), 2 deletions(-)


