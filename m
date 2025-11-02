Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27681CCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 01:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f8iBdMTYM8add2wHtraFxMsoOR1Rfz8Ac9Ii3lBw+1g=; b=yQUxvaEFTLEQYsWvwhUd1NF1LB
	3N28yOT6vpJ8uA+NkuDS3vdLmNmJwytiveK3NPsQoLR9nlz3lElvG/5odc9mG7apUfJly3KV0kE4T
	/coL1IWXQq6dcpCug1ksxWGZ/ERP8LQLixY9HBgGEN4DZV6+PfW52++LGfEY3/PFb+f5KqqMIkAUX
	BOEoZ9Pj1kiTukgxX/nuM/r8Y93Tr87wXCKxmXzs4mLS34L5gfHIkEBvCHy42PxViiRXk/6dYWivX
	Wlq0lRkM9JLaF1IM3oyGJe4UFDnvwGymVnMY7J98ShMJx7YVmiHi0dmdFHQS5FBf3yVe5FAkm6TwQ
	DI04W3tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFMhi-00000008D2t-1HPV;
	Sun, 02 Nov 2025 01:16:22 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFMhe-00000008D2a-3DxL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Nov 2025 01:16:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=f8iBdMTYM8add2wHtraFxMsoOR1Rfz8Ac9Ii3lBw+1g=;
	b=G/iJR6a31RtVvkPkhUHo2zBInVOCT0kg8KmhXCSQDThUtD02BIm/R8do2JmOGE
	RkonRU9THFcD19yJ8vxsUdLa9YJ4AQ/7cjkmtIcraiNJNeajNOtT0hy2yVhtcnZD
	1gb6IgSktZGgaqwezvVyazzYhFod3ILORO/XS++SCBAyo=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDnr6_IsAZp2dEiAQ--.53065S3;
	Sun, 02 Nov 2025 09:15:54 +0800 (CST)
Date: Sun, 2 Nov 2025 09:15:52 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.18
Message-ID: <aQawyJZbMn52EKk_@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: M88vCgDnr6_IsAZp2dEiAQ--.53065S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFykCw47Kw4rCryDtFWDJwb_yoW8ZFW3pF
	4fCrsxGr4kGryrGrnrXrs2y3yFyFn7Jr43Jr1UX348Xry3Z3W8Xrs8Krsa9ryUAFyxZw4F
	vr18GryDKw129F7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j2PfQUUUUU=
X-Originating-IP: [117.80.155.87]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIQw7oGkGsMykygAA3L
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_181619_179984_9CB1AC75 
X-CRM114-Status: UNSURE (   7.26  )
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

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.18

for you to fetch changes up to 6504297872c7a5d0d06247970d32940eba26b8b3:

  arm64: dts: imx8mp-kontron: Fix USB OTG role switching (2025-10-28 17:01:42 +0800)

----------------------------------------------------------------
i.MX fixes for 6.18:

- Enable ext4 support explicitly in imx_v6_v7_defconfig to fix a regression
  caused by commit d6ace46c82fd ("ext4: remove obsolete EXT3 config options")
- Correct report-rate-hz setting for imx6ull-engicam-microgea-rmm board
- Fix MSI mapping for i.MX95 PCIe endpoint device nodes
- Fix USB OTG role switching for imx8mp-kontron board
- Fix a dt-schema warning caused by audmux node for imx51-zii-rdu1 board
- Avoid gpio0_mipi_csi GPIOs being deferred for i.MX8 img subsystem

----------------------------------------------------------------
Andreas Kemnade (1):
      arm: imx_v6_v7_defconfig: enable ext4 directly

Dario Binacchi (1):
      ARM: dts: imx6ull-engicam-microgea-rmm: fix report-rate-hz value

Frank Li (1):
      arm64: dts: imx95: Fix MSI mapping for PCIe endpoint nodes

Frieder Schrempf (1):
      arm64: dts: imx8mp-kontron: Fix USB OTG role switching

Jihed Chaibi (1):
      ARM: dts: imx51-zii-rdu1: Fix audmux node names

João Paulo Gonçalves (1):
      arm64: dts: imx8-ss-img: Avoid gpio0_mipi_csi GPIOs being deferred

 arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts       |  4 ++--
 .../dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts   |  2 +-
 arch/arm/configs/imx_v6_v7_defconfig               |  6 +++---
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     |  2 --
 .../boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts | 24 +++++++++++++++++-----
 arch/arm64/boot/dts/freescale/imx95.dtsi           |  3 ++-
 6 files changed, 27 insertions(+), 14 deletions(-)


