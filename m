Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE43C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 14:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=14apFWlhTvQWEip5MNwPcJWLuMTuD4gZOFiejLL2siY=; b=jkuzn8SsMFKAqDDMP7+k1b+ZNN
	Nt/B+EtStCGvMLE+RBz1zG2D8X2tbYZXNaOEPlRIymXlgeVztB00uozarJePsx+jyA5sc7S5bPvP4
	pHLDtDvAO9DRH5Ib4e98Vx2cyXJFVx6jB/PHOHRVr+r8x9GYibn6Lz/9bldhcarrtgcaZ2NdwTH6K
	+IlqmtN3j5qHo02CMmCN/YIDDiCqAEkqHUwJBU7ezpPn5QgjU2gLDNTCdzqUAb91C19iPArHj6pIB
	tLXmg3QezGRj8/C+iywX7ASoiJpHWXkXT8W36FCMvqaC70WjkjqV41h97Y2dtyjirx0cfRvYJ32Dr
	4/W6xD1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viZ9K-00000005b2T-2XxF;
	Wed, 21 Jan 2026 14:25:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viZ9H-00000005b1J-0vGB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 14:25:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A54C840A2E;
	Wed, 21 Jan 2026 14:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD83C4CEF1;
	Wed, 21 Jan 2026 14:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769005530;
	bh=g+4h2F0GqeJM+ILBcEzEWRvalmeCX7blFWNfkF0KDHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uazv6lAWX5j9HF1yfT3oYBr4JyvwLdoX/BYVlxM0k4Ng1VVODKKG61g19NKt259yl
	 JMAFPADXGN3YMXHQgum34PyUric6g0KAjQrs71+emhwN0gYkz290hqF+VLvAkPu/pF
	 Mv1SJnmzycPljh0yQd67++YWsz5J4RBVGVYRa7nvRCuJGKaZ0pqGe1KKyHF7tgik3P
	 fG1uAK4JGC0ShpaNCO5Ck00lzuQjymCmkgrSBNDzNhjzXUmV4Z4UkeIoJM0pn2JfFp
	 yc/bjp8C0zyZl3BuX4RZ2skfaKIry6scz5U+WSn8QSucDwkonmZDX4sKLhYCFKznnz
	 ZFtr3HwApVXAQ==
Date: Wed, 21 Jan 2026 22:25:26 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Linus Walleij <linusw@kernel.org>, kernel@pengutronix.de,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH] MAINTAINERS: Replace Shawn with Frank as i.MX platform
 maintainer
Message-ID: <aXDh1tc3x4aCZG0z@dragon>
References: <20260121142047.10887-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121142047.10887-1-shawnguo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_062531_295379_F34FDA8E 
X-CRM114-Status: GOOD (  19.56  )
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

Cc Frank

On Wed, Jan 21, 2026 at 10:20:47PM +0800, Shawn Guo wrote:
> Shawn is no longer interested in maintaining i.MX platform, and would like
> to step down.  On the other hand, Frank seems to be the best successor
> for this role.
> 
>  - He has been one of the most outstanding contributors to i.MX platform
>    in the recent years.
> 
>  - He has been actively working as a co-maintainer reviewing i.MX
>    patches and keep the platform support in good shape.
> 
>  - He works for NXP and could be the bridge and coordinator between
>    NXP internal developers and community contributors.
> 
> Signed-off-by: Shawn Guo <shawnguo@kernel.org>
> ---
>  MAINTAINERS | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b11839cba9d..a294b4e952a9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2745,14 +2745,14 @@ F:	arch/arm/include/asm/hardware/dec21285.h
>  F:	arch/arm/mach-footbridge/
>  
>  ARM/FREESCALE IMX / MXC ARM ARCHITECTURE
> -M:	Shawn Guo <shawnguo@kernel.org>
> +M:	Frank Li <Frank.Li@nxp.com>
>  M:	Sascha Hauer <s.hauer@pengutronix.de>
>  R:	Pengutronix Kernel Team <kernel@pengutronix.de>
>  R:	Fabio Estevam <festevam@gmail.com>
>  L:	imx@lists.linux.dev
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git
>  F:	Documentation/devicetree/bindings/firmware/fsl*
>  F:	Documentation/devicetree/bindings/firmware/nxp*
>  F:	arch/arm/boot/dts/nxp/imx/
> @@ -2767,22 +2767,22 @@ N:	mxs
>  N:	\bmxc[^\d]
>  
>  ARM/FREESCALE LAYERSCAPE ARM ARCHITECTURE
> -M:	Shawn Guo <shawnguo@kernel.org>
> +M:	Frank Li <Frank.Li@nxp.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git
>  F:	arch/arm/boot/dts/nxp/ls/
>  F:	arch/arm64/boot/dts/freescale/fsl-*
>  F:	arch/arm64/boot/dts/freescale/qoriq-*
>  
>  ARM/FREESCALE VYBRID ARM ARCHITECTURE
> -M:	Shawn Guo <shawnguo@kernel.org>
> +M:	Frank Li <Frank.Li@nxp.com>
>  M:	Sascha Hauer <s.hauer@pengutronix.de>
>  R:	Pengutronix Kernel Team <kernel@pengutronix.de>
>  R:	Stefan Agner <stefan@agner.ch>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git
>  F:	arch/arm/boot/dts/nxp/vf/
>  F:	arch/arm/mach-imx/*vf610*
>  
> @@ -20562,7 +20562,7 @@ F:	drivers/pinctrl/pinctrl-amd.c
>  PIN CONTROLLER - FREESCALE
>  M:	Dong Aisheng <aisheng.dong@nxp.com>
>  M:	Fabio Estevam <festevam@gmail.com>
> -M:	Shawn Guo <shawnguo@kernel.org>
> +M:	Frank Li <Frank.Li@nxp.com>
>  M:	Jacky Bai <ping.bai@nxp.com>
>  R:	Pengutronix Kernel Team <kernel@pengutronix.de>
>  R:	NXP S32 Linux Team <s32@nxp.com>
> -- 
> 2.43.0
> 

