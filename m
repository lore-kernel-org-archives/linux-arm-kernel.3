Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CC6C531D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 14:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rkN9v1olYtMRO3JTNGLpnJZzNmXLLPiGUKW6PqRvkEQ=; b=kMKSyYXkEOf/YD9W8d2Sa2cTTp
	68Ibo2Szp6a4hqn3Hu/nTdHe0H509cpzuEOMx2EtL/Jg389tBwwAQGE7l6F1h4aHDimhvE/bcLKIR
	OddEUedUopKjSnMU/YoyIdZoLWhAoh2LJdhSK/yaWP9o0XFVVHkXCotZDP0OupmQglE2eGRpIVjIH
	R6+xMYv5XolnLXVERItmIBIr7nyMKz3y0nleHFn0f55PwHMOo7fzv1OEtQ5wMtJb/NKpnxKAPBh/Q
	BMtjs/9IJWY4JlQzApWmTy9NceAS4HnTfrA3XahOuRulKOgzCIdHs1P4pKv/PcD3KqCUJ4T7UB+Zv
	NiXzd52Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmu2V-0000000ES4U-1o4S;
	Thu, 23 Jul 2026 14:04:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmu2T-0000000ES4H-3r4J;
	Thu, 23 Jul 2026 14:04:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9325A433BD;
	Thu, 23 Jul 2026 14:04:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8028B1F000E9;
	Thu, 23 Jul 2026 14:04:40 +0000 (UTC)
Date: Thu, 23 Jul 2026 07:04:38 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell King
 <linux@armlinux.org.uk>, Heiner Kallweit <hkallweit1@gmail.com>, Alexis
 =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>, Jan Petrous
 <jan.petrous@oss.nxp.com>, Heiko Stuebner <heiko@sntech.de>, Nobuhiro
 Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Keguang Zhang
 <keguang.zhang@gmail.com>, Yao Zi <me@ziyao.cc>, Mohd Ayaan Anwar
 <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Drew Fustini
 <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Inochi Amaoto <inochiama@gmail.com>, Emil Renner
 Berthing <kernel@esmil.dk>, Minda Chen <minda.chen@starfivetech.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 s32@nxp.com
Subject: Re: [PATCH net] MAINTAINERS: Add myself for stmmac ethernet driver
 maintainance
Message-ID: <20260723070438.69c158ba@kernel.org>
In-Reply-To: <20260722142125.1767689-1-maxime.chevallier@bootlin.com>
References: <20260722142125.1767689-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 22 Jul 2026 16:21:24 +0200 Maxime Chevallier wrote:
> The stmmac driver based on Synopsys' dwmac IP is used in a very wide
> variety of SoCs and is currently very actively used and contributed to.
> 
> It has been orphaned in January 2025 after the previous maintainers
> became inactive, but Russell King was providing very valuable reviews
> and fixes for the driver at that point.
> 
> Now we're seeing more and more activity on the driver, but are lacking
> people to test and review contributions to both glue drivers as well as
> core stmmac code.
> 
> I have access to some variety of stmmac-based platforms such as socfpga
> CycloneV, imx8mp, some Allwinner SoCs and stm32mp1xx boards that I can
> run regression tests on, and I'm offering to step-up as a maintainer for
> driver, for the time being at least.
> 
> Let's hope other people will eventually join this effort.

Thanks a lot for taking this on :)

