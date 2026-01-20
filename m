Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5150AD2ECFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 01:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LRAfl4D2uTEsWA1KQu1nJ+mfn6CoZ0Qv29ZjkhbnglQ=; b=a0TZQvGqRbRbP3H9/E/2fMSAhB
	DJnNMD5l+R8PV3NFawnew3eySkpS6Hn2EBfeil+KNtVjYdC+4NT9eaeRlO+odaa70L60ZV4flSg6D
	qs2LuuqT/6H2MAM461ZY+M8CZdEHuE1NUmM12BL7Kx+T+pMVOEyfxTyExFZYRejx23aV1bzEzm6w5
	2CygEpMr9ABV6d12d+A5INaVZrHnqJbYMquki63JYNkOAGAz0VZi86CLheMV7OpoI5S0TzgKWO6Tc
	fmB0fLFtlHKEp3cxbUk6YS1FI5/G0Ivv0rXRfsI3Zq8xM6bo3cJ4mwOmeULaIrGfxBo/ubbPoESzN
	Xq/oYvMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0JE-000000031HM-3wOY;
	Tue, 20 Jan 2026 01:13:28 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0Id-000000031DF-2Mj9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 01:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=LR
	Afl4D2uTEsWA1KQu1nJ+mfn6CoZ0Qv29ZjkhbnglQ=; b=g7FVIaeXkjA0KdHYnR
	lmKR9QyvILMNuXymARoDJyXxtGufvEjEznnhEk29OWqLTUgkX7VwnoNGu+1G8SY5
	Iprhbw0jQUKQ1G75UiwYFxwWlvMnIvsnCkSCREsYYl/1zT9uHRaOOoz71cp3xA8c
	ggvNZBG4GLnaSDT4xwOSCCoao=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3_+V71m5pGbEbAg--.16504S4;
	Tue, 20 Jan 2026 09:12:31 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/5] i.MX ARM device tree changes for 6.20
Date: Tue, 20 Jan 2026 09:12:16 +0800
Message-ID: <20260120011221.4387-3-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120011221.4387-1-shawnguo2@yeah.net>
References: <20260120011221.4387-1-shawnguo2@yeah.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: M88vCgD3_+V71m5pGbEbAg--.16504S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxJFyDCr1kAr4fXw1xKr4Durg_yoW5ur17pr
	4S9rsxJrs7Gr1fJrWav3y8K3s0vw18AF1F9ry3Jay8KF43ZF1UAr9Iqwn3try5XFWFqw1f
	trn7Zry7GFyDWaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jThF7UUUUU=
X-Originating-IP: [121.224.201.168]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIh-KMGlu1n+QtQAA3M
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_171252_040685_91EAF716 
X-CRM114-Status: UNSURE (   9.00  )
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-6.20

for you to fetch changes up to f325a91895d8a9167a7f1268569c1877272f897c:

  ARM: dts: imx: e60k02: add tps65185 (2026-01-18 10:11:38 +0800)

----------------------------------------------------------------
i.MX ARM device tree changes for 6.20:

- A few changes from Andreas Kemnade to correct LCDIF compatible
  for i.MX6SL/i.MX6SLL, add EPD regulator for imx6sll-kobo-clara2e,
  support TPS65185 for tolino-shine2 and e60k02
- A series from Frank Li to clean up GPMI CHECK_DTB warnings
- A change from Alexander Stein to add default GIC address cells
  for imx6qdl
- A change from Josua Mayer to add EPD PMIC for imx50-kobo-aura

----------------------------------------------------------------
Alexander Stein (1):
      ARM: dts: imx6qdl: Add default GIC address cells

Andreas Kemnade (5):
      ARM: dts: imx: imx6sll: fix lcdif compatible
      ARM: dts: imx: imx6sll-kobo-clara2e: add regulator for EPD
      ARM: dts: imx: imx6sl: fix lcdif compatible
      ARM: dts: imx: tolino-shine2: add tps65185
      ARM: dts: imx: e60k02: add tps65185

Frank Li (3):
      ARM: dts: imx6qdl: add '#address-cells' and '#size-cells' for gpmi-nand
      ARM: dts: imx6sx: update gpmi #size-cells to 0
      ARM: dts: imx: move nand related property under nand@0

Josua Mayer (1):
      ARM: dts: imx50-kobo-aura: add epd pmic description

 arch/arm/boot/dts/nxp/imx/e60k02.dtsi              | 35 ++++++++++++-
 arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts      | 60 ++++++++++++++++++++-
 arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi    |  6 ++-
 arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi       |  6 ++-
 .../boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi    |  6 ++-
 .../dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi    |  6 ++-
 arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi    |  6 ++-
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi         |  6 ++-
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi             |  3 ++
 .../boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts    | 55 ++++++++++++++++++-
 arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine3.dts | 26 +++++++++
 arch/arm/boot/dts/nxp/imx/imx6sl.dtsi              |  2 +-
 .../boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dts    | 61 +++++++++++++++++++++-
 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts | 26 +++++++++
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi             |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi              |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts          |  6 ++-
 arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi        |  6 ++-
 .../dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi     |  6 ++-
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi        |  6 ++-
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi     | 12 +++--
 .../boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi | 12 +++--
 .../boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi    |  6 ++-
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts   |  6 ++-
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi        |  8 ++-
 25 files changed, 347 insertions(+), 29 deletions(-)


