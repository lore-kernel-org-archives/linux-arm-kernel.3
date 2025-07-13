Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3EAFC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 06:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OdCN9ExQsnK4BnSMX1n+hFsAT2ihgoOQkhW+Yq1ot8A=; b=o00hId27on87QhmOSdDUqqRW+R
	1m87IXFv/B5JOxjoO56Xq/59Qz8agvnyevkM8K7Ancl6PCVkTmpnNMYNR0D55mn56WR07gruza1ak
	QL2xI4SyUAy9DLEEYmWxoYTmnc4XoNyVOByiujGJ3IM+BxlgM0oHl/Oal7HAQs5TprKqw9Vds0KSX
	gJd1jdJVaMyVqxxTgB+yfOSH2amUSlFEEzlwKQg4BgkVbNMkN5vcOCd9Te2lEJGaw5D0U7LoKNnsb
	iv/sRsM68mePPRS/KnjV0azTjiPKkPu94f/8ULJxA/I2HcYKIGKaCuhWO+f+0B0aDdcQHVYBR1Br+
	JLT5rkkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uapsJ-0000000HNth-3FOR;
	Sun, 13 Jul 2025 06:07:47 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uapg9-0000000HNBz-37ph
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 05:55:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Od
	CN9ExQsnK4BnSMX1n+hFsAT2ihgoOQkhW+Yq1ot8A=; b=Aw4XVyOxMwu3Fu+ODm
	/N9eO+WH1OPdZEzcj6wsDKKkcTBbCd6NG333DmdIV9WgU5wcY/+4OH2FakXsB/fJ
	otlsmYGFCEvIpJMM2o9N+nMZcMHyhuL7dF7PsaaJ2xHrPWnZDviZIAcPdBe035YE
	824x+Z+RK/bCTcYt2EkH4lV+8=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDXb50mSnNoHrt9AA--.3344S2;
	Sun, 13 Jul 2025 13:54:47 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/5] i.MX drivers change for 6.17
Date: Sun, 13 Jul 2025 13:54:30 +0800
Message-ID: <20250713055441.221235-1-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: M88vCgDXb50mSnNoHrt9AA--.3344S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrZryxXw17ur4fGw48Ar1UKFg_yoW8JF13pF
	4Svr1fGr1UJr47Jrn3Kr4jyFyrJr18Jr1ayr17Zw1Fvr1DA3Z8Jr1DGr1rGrWDGryUGFW3
	tF1UAF1UKr1UXFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnZ2-UUUUU=
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhSJZWhzRQkNTwAAs-
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_225514_107523_76234392 
X-CRM114-Status: UNSURE (   6.68  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-6.17

for you to fetch changes up to 5080cf6339d387720cb8def1001c61c779d9edcb:

  bus: imx-aipstz: allow creating pdevs for child buses (2025-07-11 16:32:08 +0800)

----------------------------------------------------------------
i.MX drivers changes for 6.17:

- A couple of MAINTAINERS updates
- A new bus driver for i.MX AIPSTZ bridge and a follow-up fix from
  Laurentiu Mihalcea

----------------------------------------------------------------
Ciprian Marian Costea (1):
      MAINTAINERS: add NXP S32G RTC driver

Laurentiu Mihalcea (2):
      bus: add driver for IMX AIPSTZ bridge
      bus: imx-aipstz: allow creating pdevs for child buses

Peng Fan (1):
      MAINTAINERS: Update i.MX entry

 MAINTAINERS              |   4 ++
 drivers/bus/Kconfig      |   6 +++
 drivers/bus/Makefile     |   1 +
 drivers/bus/imx-aipstz.c | 108 +++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 119 insertions(+)
 create mode 100644 drivers/bus/imx-aipstz.c


