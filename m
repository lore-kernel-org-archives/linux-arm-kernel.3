Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE37E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 08:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IjhTyIk85EtpNPozN27xxdVmdA+yXi+gjfkzcQ6a74c=; b=0ZuIe/hhWrXB6rfhUmUZEsnx3Z
	37daCo80aC767gCMFa4YpaV9oM92sXFnzF+MwkPRSL8AMhh4rTYyASTaFI3AodvTYL4abeEy9x23g
	AW8pQ7sWLAbA8HGFFHoW+ch8HXw2jon9PFZiOwZkCMb80ebyHScsqMOK5AQOy+ux+t5SGRSH4PeWg
	yruSR/yfa5wbaGnfRPTQdrI7Kr3+xayrG+jqTvTxpWwaYDzxkyRjwSulIThSdwmVtPAg/v2Y8/pvP
	gYF4dASdZaWHBPAHIUhAv2meGRt09ozmcF73cvrsrWUnQJ3t4e4ZTIPAChBzIwPJuFbDxiLu8zqPk
	UP3hQePA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSBa2-00000004qaS-2mBH;
	Mon, 30 Dec 2024 08:56:54 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSBYo-00000004qVs-34uf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 08:55:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=IjhTyIk85EtpNPozN27xxdVmdA+yXi+gjfkzcQ6a74c=;
	b=iFBnYqMJqaikGPTd2JOQK6c5ctUwkZKCAj9vBwTj7blaP+TXHq1si3Lt8oSX62
	u1dAG78ZNumNWkhOBONf17DX1t2B4h7YYo79Wgi4HUaFhHJlaixvaXWV2GFZ1bOs
	39CqSucAA9NAh3KYuKSabIsbGQhma5fmHn3r5uG+6XiQc=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgC3WW33X3JnAhn5BQ--.60155S3;
	Mon, 30 Dec 2024 16:55:21 +0800 (CST)
Date: Mon, 30 Dec 2024 16:55:19 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.13
Message-ID: <Z3Jf9zbv/xH3YzuB@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CM-TRANSID: M88vCgC3WW33X3JnAhn5BQ--.60155S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFy8AF1ktrWDtw18uF1xKrg_yoW8XFWDpF
	sxCwsrGr48WFy5JrZrAr1vv3y5JwsrJFn8XrW5GrW8tr98Zw1UJF13Gr1ru3yUXry2gw4F
	yF1rXrnFyr1DXw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jazuAUUUUU=
X-Originating-IP: [114.216.146.204]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAfFZWdyVU0nLgAAsn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_005539_148600_A4A37B56 
X-CRM114-Status: UNSURE (   8.39  )
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

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.13

for you to fetch changes up to 5f122030061db3e5d2bddd9cf5c583deaa6c54ff:

  ARM: dts: imxrt1050: Fix clocks for mmc (2024-12-09 20:40:23 +0800)

----------------------------------------------------------------
i.MX fixes for 6.13:

- Add fallback for i.MX8QM ESAI compatible to fix a dt-schema warning
  caused by bindings update
- Fix uSDHC1 clock for i.MX RT1050
- Enable SND_SOC_SPDIF in imx_v6_v7_defconfig to fix a regression caused
  by an i.MX6 SPDIF sound card change in DT
- Fix address length of i.MX95 netcmix_blk_ctrl

----------------------------------------------------------------
Frank Li (1):
      arm64: dts: imx8-ss-audio: add fallback compatible string fsl,imx6ull-esai for esai

Jesse Taube (1):
      ARM: dts: imxrt1050: Fix clocks for mmc

Stefan Eichenberger (1):
      ARM: imx_v6_v7_defconfig: enable SND_SOC_SPDIF

Wei Fang (1):
      arm64: dts: imx95: correct the address length of netcmix_blk_ctrl

 arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi           | 2 +-
 arch/arm/configs/imx_v6_v7_defconfig               | 1 +
 arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi   | 2 +-
 arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/imx95.dtsi           | 2 +-
 5 files changed, 5 insertions(+), 4 deletions(-)


