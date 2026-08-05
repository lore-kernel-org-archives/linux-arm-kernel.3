Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D826C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 17:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ig4HxOQjnpmoynEQayIeEsifMuFOLWzyqUkLO0olbbc=; b=J2YTtNKJjMESeo058hCbHmNv7S
	cqAeA2+Vf78hzvtDMTIYEbMkYK2nrUW+G3AbkMvmZIk861fSqLuGmY4svkXVWlvu9um5q85orjHE0
	MxNXrJsAsk2ogRsC75x9NlMKAzSWTRAQXW1AoCThR11Tsxri253UmAEMwXf9CFK4FpN97sJcuWF5H
	ooGRvo2OOtZB5ontwuEWW46VqI5q0I59BGbwYbdpcmpCXNt7BU5BKBlTsrvLdGcM5UK1ebQZ0jE4P
	isCyjkYCN+VLwx8FN1CLF2xdaqX0Y89JtHg3TwzJjlxTZ8WQaDOBdmZSgOqRO0aVPcAd42AesOgXg
	neiHdE3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrfeO-00000004LiN-2uW7;
	Wed, 05 Aug 2026 17:43:32 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrfeL-00000004Lhu-39LB;
	Wed, 05 Aug 2026 17:43:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=ig4HxOQjnpmoynEQayIeEsifMuFOLWzyqUkLO0olbbc=; b=O1doOVf/XA7nC1K1o+6KDQQwQC
	VAHI5m6Sb6Av7G3Q4Ah0sLDemgPfsD+CVZAeFwOGN2sVazwKU03TUHHqe8adWZztVlT/70F1RDnSo
	nMvkrdT2s4sNye184r1qc/GeM/OcwU/XJ+yu28FG9LHFG4Y6RguDUilQ9gGscEa/fSI4afhzh8Amy
	wrwCBL6Ph2nREed/kgfmnWGHXK9uzAE7e7/OaKk1mJF37wu3FVXPrIVp7cXCwckRCZJ0w60DRBOYX
	624mSnt3ikmWSsVf+ni/zQtmWRGeboTbd1BBQUYOATa1GHF4i/rksPuhikMrH7GjtTnUIbsQYznR9
	rXD5WuQA==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 7.3 #2
Date: Wed, 05 Aug 2026 19:43:26 +0200
Message-ID: <6604532.5fSG56mABF@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_104329_818764_BEF18783 
X-CRM114-Status: UNSURE (   8.34  )
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

Hi soc maintainers,

One lonely patch with whitespace fixes below, and there is nothing
more for the arm32 side pending for 7.3. So that should be end for
this part.


Please pull.
Thanks
Heiko


The following changes since commit 44045aa7a9a9e6484617f44f77a3efb2d8e78565:

  ARM: dts: rockchip: Add Alientek DLRV1126 (2026-07-12 22:03:41 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.3-rockchip-dts32-2

for you to fetch changes up to 1a17f391c139567e2fac6894c6b43f5978e915c8:

  ARM: dts: rockchip: Correct white-space style (2026-08-02 20:26:21 +0200)

----------------------------------------------------------------
Whitespace fixes

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: rockchip: Correct white-space style

 arch/arm/boot/dts/rockchip/rk3188-radxarock.dts            | 2 +-
 arch/arm/boot/dts/rockchip/rk3288-evb-act8846.dts          | 2 +-
 arch/arm/boot/dts/rockchip/rk3288-evb.dtsi                 | 2 +-
 arch/arm/boot/dts/rockchip/rk3288-firefly-reload-core.dtsi | 2 +-
 arch/arm/boot/dts/rockchip/rk3288-firefly.dtsi             | 2 +-
 arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts          | 2 +-
 arch/arm/boot/dts/rockchip/rv1126.dtsi                     | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)




