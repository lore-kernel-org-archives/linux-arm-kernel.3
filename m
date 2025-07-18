Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC7AC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 13:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mq1MBSqrSWf8yG8YzC6c9XubOmGz+LEPdn+cUXh+nOY=; b=lDH7lciMVRbJeA4JBvXOYcQoEc
	256HUXsKq38J9h80Q444GhetvsP79JFSWj8cdFl+G/REp16FTKTg+kfz88AJsH2qs6hRQK5FAd3Of
	jCWd/YU2yNLZDWhpc1AUWHj9V6ABEMFJKI2kwMU6j7mg/2RXWBKpGebGvBameM0Igt1K1V9kStwbh
	zdVYMlYV1D9Gm2L1EmUQISsh0cIBX4TsIrDRqiSE760lg1sqlR6JpXHUr1T3MEAFAYKGYf8mpMyck
	qb9z+zFhbwVwPctoWIMnmxQw50iGOr3vlYhWCHOBGb9gK9TOYPWdDiHbAC5yQ1OQgsYl+tKjNxl9T
	TPBi6Cnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uclac-0000000Cjuu-04jx;
	Fri, 18 Jul 2025 13:57:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uclP4-0000000Cj3r-0DkW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 13:45:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 31A8A601DD;
	Fri, 18 Jul 2025 13:45:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DC37C4CEEB;
	Fri, 18 Jul 2025 13:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752846332;
	bh=n53OG7Ktt1g6FtX1MG3MOkDKBdetprJNhoqQRlyEq00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kiIpGf7eO8qSGKjqhnpQWH0KB+dmUKfuAtfZ1XRs8sugvil357dTvIwkUhm+bcZRM
	 CJgXKkv3TIi6txF0OftB23Tm3TjSSCW7n+a+68XUm/+9Drfj16P9D65Uz2Q3Cmo0fN
	 h7EpWeWbCbCga9ay9xPdhr8WThYVhFfEwK5gTlCLVp9W249W+96z6l7oCYzHgYOUXr
	 cn0cGFyGqfEm8al/eWjNvZPHqDte6tQmTVvT5FvErE/E/qRsdNVIj8p6f3iy9yh5+A
	 /0y4fr//iyvu7felQhd27m5IR8655iF5epjf/EERhnywHx+B0F1SkYojoAQhcuEZme
	 s5lkDUPCGC2Eg==
Date: Fri, 18 Jul 2025 14:45:25 +0100
From: Lee Jones <lee@kernel.org>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, chester62515@gmail.com,
	mbrugger@suse.com, Ghennadi.Procopciuc@nxp.com,
	larisa.grigore@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	festevam@gmail.com, aisheng.dong@nxp.com, ping.bai@nxp.com,
	gregkh@linuxfoundation.org, rafael@kernel.org, srini@kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	s32@nxp.com, clizzi@redhat.com, aruizrui@redhat.com,
	eballetb@redhat.com, echanude@redhat.com, kernel@pengutronix.de,
	imx@lists.linux.dev, vincent.guittot@linaro.org
Subject: Re: [PATCH v7 10/12] nvmem: s32g2_siul2: add NVMEM driver for SoC
 information
Message-ID: <20250718134525.GG11056@google.com>
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
 <20250710142038.1986052-11-andrei.stefanescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250710142038.1986052-11-andrei.stefanescu@oss.nxp.com>
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

On Thu, 10 Jul 2025, Andrei Stefanescu wrote:

> The SIUL2 hardware module has registers which expose information about
> the given SoC (version, SRAM size, presence of some hw modules).
> 
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> ---
>  drivers/mfd/nxp-siul2.c           |   6 +-

When you re-submit - this needs to be in its own commit.

>  drivers/nvmem/Kconfig             |  10 ++
>  drivers/nvmem/Makefile            |   2 +
>  drivers/nvmem/s32g2_siul2_nvmem.c | 232 ++++++++++++++++++++++++++++++
>  4 files changed, 249 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/nvmem/s32g2_siul2_nvmem.c

-- 
Lee Jones [李琼斯]

