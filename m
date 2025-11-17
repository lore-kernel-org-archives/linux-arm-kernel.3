Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633E6CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 12:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=naTwKwkQnYFzqZyCikeGygRj63Lux4gIlwTJQV8nJm0=; b=XFzm8SQtK0g3rFNqFsn84nTjl2
	w4Zr+TJsSm+e9fO71Uq/ZsVOOxVxnvvuydCwLpoVeIQPpaT1mRe2oOQz8F92fGqPdsmt2l6lVq0Yi
	00LLEZn2Gsq1dQryBiyO7nifkXg6yD/j1ifnFnhWZ4vLjp4CQwV+OL+sUybfyB/QLftHCvt2LWf+T
	Yw9KuAYowKuWZhZ+v1JG6GRZWFIoJnNOn111vm8xvvBDbsF4hUgTEIYDcfb/V2oku2MNipNwUrZeC
	0h8mxSxz1vtEP4FvNkpcEYbEqjL4RrczeC3RQnKKpdiEZB13huls2WJ8DMjYJkTG4iomv88xPHlCe
	Dfcx4Clw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyRT-0000000G47o-2Yfg;
	Mon, 17 Nov 2025 12:34:47 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyRO-0000000G44X-2tAL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 12:34:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=naTwKwkQnYFzqZyCikeGygRj63Lux4gIlwTJQV8nJm0=;
	b=WjnNfwFndIKdqVehx3z8CY9GQ9ej3LwotXmcwWcZmFnt5xRMBAdlPip9AouiKI
	/y7wkJPBx0eRIvxwKIvDoP7K5AYUCe6WkHwYwBtBYw9HzV6IT9dicgrSvWmRBhut
	0dTMai0zJ4JJR8BO+Yo1nOdAaI95DE7Xj7wNtSaAm+Ijs=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAnXIhOFhtpoZUoAg--.8347S3;
	Mon, 17 Nov 2025 20:34:25 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/5] i.MX dt-bindings update for 6.19
Date: Mon, 17 Nov 2025 20:33:48 +0800
Message-ID: <20251117123358.2009662-2-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117123358.2009662-1-shawnguo2@yeah.net>
References: <20251117123358.2009662-1-shawnguo2@yeah.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: M88vCgAnXIhOFhtpoZUoAg--.8347S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFykCw43AFy5uF1DAF43KFg_yoW8KFyfpF
	sxuFn3GF1ktF17tr43Kw1kCw1rXr18Ar47Jrs3Jw18Ja98C3WqqFyYywn5Zr9xAFyIqF17
	ZF1UWr42g347Aw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j-R6rUUUUU=
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNxG6IGkbFlFk4wAA3O
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_043443_082818_9925C471 
X-CRM114-Status: UNSURE (   7.12  )
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

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.19

for you to fetch changes up to 5ffac985b5f4272c8fccb0ef58369724bd10cd8d:

  dt-bindings: arm: fsl: add Toradex SMARC iMX95 (2025-11-17 16:37:55 +0800)

----------------------------------------------------------------
i.MX dt-bindings update for 6.19:

- New board support: Protonic PRT8ML, Toradex SMARC iMX95, Skov Rev.C
  HDMI, i.MX 95 Verdin Evaluation KitPHYTEC phyBOARD-Segin-i.MX91 board,
  Skov i.MX8MP variant
- One imx-iomuxc-gpr update from Fabio Estevam to document CSI mux
- A couple of fpga-qixis bindings updates from Ioana Ciornei
- One embedded-controller update from Mathew McBride to add Traverse
  Ten64 board controller

----------------------------------------------------------------
Fabio Estevam (1):
      dt-bindings: soc: imx-iomuxc-gpr: Document the CSI mux

Ioana Ciornei (2):
      dt-bindings: fsl,fpga-qixis-i2c: add support for LX2160ARDB FPGA
      dt-bindings: fsl,fpga-qixis: describe the gpio child node found on LS1046AQDS

Jonas Rebmann (1):
      dt-bindings: arm: fsl: Add Protonic PRT8ML

João Paulo Gonçalves (1):
      dt-bindings: arm: fsl: add Toradex SMARC iMX95

Marco Felsch (1):
      dt-bindings: arm: fsl: add Skov Rev.C HDMI support

Marek Vasut (1):
      dt-bindings: arm: imx: document i.MX 95 Verdin Evaluation Kit (EVK)

Mathew McBride (1):
      dt-bindings: embedded-controller: add Traverse Ten64 board controller

Primoz Fiser (1):
      dt-bindings: arm: fsl: Add PHYTEC phyBOARD-Segin-i.MX91 board

Steffen Trumtrar (1):
      dt-bindings: arm: fsl: add compatible for Skov i.MX8MP variant

 Documentation/devicetree/bindings/arm/fsl.yaml     | 17 +++++++
 .../bindings/board/fsl,fpga-qixis-i2c.yaml         | 58 ++++++++++++++++++++++
 .../devicetree/bindings/board/fsl,fpga-qixis.yaml  | 10 ++++
 .../traverse,ten64-controller.yaml                 | 40 +++++++++++++++
 .../bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml       | 16 ++++++
 5 files changed, 141 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/traverse,ten64-controller.yaml


