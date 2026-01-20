Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE48D2ECEF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 01:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KDicVZ7+7t9v0RuKAuweKQSHOQ5r+Rlc3JjduC17lDo=; b=Da5qK3vJiWG9td49n2W+a2VEFY
	yt3sUQxuaXcqxgjEVIxJ6k//MtVy2b5/rDhECXfSZBrvx+fSMWEtJdZn197OVat4uio4LzA3hGu4Z
	oNH5N5q47Wj2sx1A1l12ijz0jJyn28AzQu0EhNBo6rGmRHa6SxzcGxElxRWGxxQ9ES8p3/ePhy4aI
	NraNHBIdYlvxaisaFTVOr5nOcOJP6pEsF4bc4F4ec9f6aFTeRaxEcriBZLf9Qy/agfdnnqfybUHc+
	0+6R/MDZQzPLwSF+7BWyOkE7UspBK5ASqjDDjxVPvriSX7IFYQtRKZc+exzSQYRJ3W66LnniwJ6T7
	mD1wDfdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0JF-000000031Hm-197u;
	Tue, 20 Jan 2026 01:13:29 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0Ic-000000031DG-3qO3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 01:13:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=KD
	icVZ7+7t9v0RuKAuweKQSHOQ5r+Rlc3JjduC17lDo=; b=SXL722zHwRlSZiWMH5
	oxfgAyFZfsLtXiBL1w8K5b3D3nSZs8DMipqBQJNsajN+qjBUho1SZy4iJ6CPTNeM
	PDVq+oc5F4mH5ZDSu2eeZq+wH8qCsqqY2+g90qwrDLFFd7OLbjh5uTWzmKn72Ugu
	eEZrlTcKGB3DH8lXrOoV9flKw=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3_+V71m5pGbEbAg--.16504S6;
	Tue, 20 Jan 2026 09:12:32 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/5] i.MX defconfig changes for 6.20
Date: Tue, 20 Jan 2026 09:12:18 +0800
Message-ID: <20260120011221.4387-5-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120011221.4387-1-shawnguo2@yeah.net>
References: <20260120011221.4387-1-shawnguo2@yeah.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: M88vCgD3_+V71m5pGbEbAg--.16504S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFykCw4rZr48KryfXr47Jwb_yoW8Wr1UpF
	4akrnxtr48WFyrtrWUJFWv9r4xtFnrAr1fXrWUtw1rArsrua4UA3WDKryfXFWUJr9rKr4U
	Ary8KF1DtF1DJw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j5YFAUUUUU=
X-Originating-IP: [121.224.201.168]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNwDLMWlu1oBbjgAA3J
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_171251_442202_C8E38B49 
X-CRM114-Status: UNSURE (   6.49  )
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

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-6.20

for you to fetch changes up to 42832d01c6114cf503a01983ff4e2512dad926fe:

  ARM: imx_v4_v5_defconfig: update for v6.19-rc1 (2026-01-17 13:59:36 +0800)

----------------------------------------------------------------
i.MX defconfig changes for 6.20:

- A couple of changes from Alexander Stein and Andreas Kemnade to enable
  SND_SOC_FSL_ASOC_CARD and REGULATOR_FP9931 in imx_v6_v7_defconfig
- A change from Dmitry Baryshkov to enable DA9052 and MC13XXX in
  multi_v7_defconfig
- A change from Josua Mayer to refresh imx_v4_v5_defconfig by removing
  stale options and adding missing ones

----------------------------------------------------------------
Alexander Stein (1):
      ARM: imx_v6_v7_defconfig: Configure CONFIG_SND_SOC_FSL_ASOC_CARD as module

Andreas Kemnade (1):
      ARM: imx_v6_v7_defconfig: enable EPD regulator needed for Kobo Clara 2e

Dmitry Baryshkov (1):
      ARM: multi_v7_defconfig: enable DA9052 and MC13XXX

Josua Mayer (1):
      ARM: imx_v4_v5_defconfig: update for v6.19-rc1

 arch/arm/configs/imx_v4_v5_defconfig | 12 ++----------
 arch/arm/configs/imx_v6_v7_defconfig |  3 ++-
 arch/arm/configs/multi_v7_defconfig  |  4 ++++
 3 files changed, 8 insertions(+), 11 deletions(-)


