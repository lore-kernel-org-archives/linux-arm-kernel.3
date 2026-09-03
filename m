Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C72C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 01:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K0e2bO9sZgwFiNy9Yf/ChdFp1jz620gjB++D5MNjCXE=; b=qtEnM6W4tneQ/WxgkMs1chq3El
	F2qG15Ti+k2Oc+E5kpowkpzrvEPYPyAnL7hiHsMUya/28tP2cg3wJIFzq167VW90cPeYE0Itw3Mob
	D0yHoM806YwBik2D6eNiydzNecmLsUnZNEOV/k+W9EDW7KM0RbFQQ2ZEV1gNQyHIMijBWWgAvdt2f
	U3TAAlADpbbCfCRA8AyxAQA9lDy1159Z5O/zuPKCkknQzDhKXEO1mln1psOudbNFCvh2vWsTs8DEq
	SKXc6hRym5fgTThDn18MDf+vtf0Dxgdyit0g+TSHh+jZ0FFwPGvoTcSMojKdFc/HI2SrB9b3LmZSq
	C2zheHDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1w4N-0000000GAGG-2CFO;
	Thu, 03 Sep 2026 01:16:47 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1w4L-0000000GAFt-2eSe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 01:16:47 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id B35CFCCE4D;
	Thu,  3 Sep 2026 04:16:36 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro B35CFCCE4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1788398198;
	bh=K0e2bO9sZgwFiNy9Yf/ChdFp1jz620gjB++D5MNjCXE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=YEOOrmM51NHwE9z1OyZ5tUl9Wg+KMhfeR3xhp21rd3UK7faHl/vTW2xUz9Hg3ne7A
	 KKKY/H7Df/rGVvFtex0Nb4GWwW1k1DF0YbYWkk7OkdubhnQlS09YlBQWG/sPQ4IiTs
	 9HGGJmapb/7iF+hlzUFMmpaCXLZiOcKWJurqENBaw/j3hoAKVrUWb7Egp6MaeUqzgR
	 jQKtXvRhY33DYPMveHSG1VfCenWFjjxEzDnqkC+mveuTjl/HT2N1C/V625BO6cSxEL
	 0l16w+5wqCL21ihAIxx/0jsqV49ikxN+KgeiRX6S71bUEolsexKV14wMtRH4c2vwCh
	 GStGKTrGxf/9g==
Message-ID: <860cba0d279223d6e5ac8cb86ba82fbe1f66b3d3.camel@rendec.net>
Subject: Re: [PATCH v5 7/9] irqchip/imx-irqsteer: Allow building as module
From: Radu Rendec <radu@rendec.net>
To: Zhipeng.wang_1@oss.nxp.com, Thomas Gleixner <tglx@kernel.org>, Marc
 Zyngier	 <maz@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jindong Yue
	 <jindong.yue@nxp.com>, xuegang.liu@nxp.com, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Date: Wed, 02 Sep 2026 21:16:34 -0400
In-Reply-To: <20260821101039.4037925-8-Zhipeng.wang_1@oss.nxp.com>
References: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
	 <20260821101039.4037925-8-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_181645_843956_235EF0B9 
X-CRM114-Status: GOOD (  16.61  )
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

On Fri, 2026-08-21 at 19:10 +0900, Zhipeng.wang_1@oss.nxp.com wrote:
> From: Jindong Yue <jindong.yue@nxp.com>
>=20
> Make the driver buildable as a module by turning the Kconfig symbol into
> a tristate and using module_platform_driver() instead of
> builtin_platform_driver(), and add the MODULE_DEVICE_TABLE() and module
> metadata needed for autoloading.
>=20
> The clock, runtime PM and IRQ domain are already owned by devres, so no
> further teardown is needed to support unbind and reload.
>=20
> Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> ---
> =C2=A0drivers/irqchip/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/irqchip/irq-imx-irqsteer.c | 7 ++++++-
> =C2=A02 files changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 20b77fbc51ee..105108d2e6ff 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -555,7 +555,7 @@ config CSKY_APB_INTC
> =C2=A0	=C2=A0 the controller's register.
> =C2=A0
> =C2=A0config IMX_IRQSTEER
> -	bool "i.MX IRQSTEER support"
> +	tristate "i.MX IRQSTEER support"
> =C2=A0	depends on ARCH_MXC || ARCH_S32 || COMPILE_TEST
> =C2=A0	default y if ARCH_MXC || ARCH_S32
> =C2=A0	select IRQ_DOMAIN
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index c2f58787f9a8..dad09e095ed1 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -10,6 +10,7 @@
> =C2=A0#include <linux/irqchip/chained_irq.h>
> =C2=A0#include <linux/irqdomain.h>
> =C2=A0#include <linux/kernel.h>
> +#include <linux/module.h>
> =C2=A0#include <linux/of.h>
> =C2=A0#include <linux/of_irq.h>
> =C2=A0#include <linux/platform_device.h>
> @@ -370,6 +371,7 @@ static const struct of_device_id imx_irqsteer_dt_ids[=
] =3D {
> =C2=A0	{ .compatible =3D "nxp,s32n79-irqsteer",	.data =3D &s32n79_data },
> =C2=A0	{},
> =C2=A0};
> +MODULE_DEVICE_TABLE(of, imx_irqsteer_dt_ids);
> =C2=A0
> =C2=A0static struct platform_driver imx_irqsteer_driver =3D {
> =C2=A0	.driver =3D {
> @@ -380,4 +382,7 @@ static struct platform_driver imx_irqsteer_driver =3D=
 {
> =C2=A0	.probe		=3D imx_irqsteer_probe,
> =C2=A0	.remove		=3D imx_irqsteer_remove,
> =C2=A0};
> -builtin_platform_driver(imx_irqsteer_driver);
> +module_platform_driver(imx_irqsteer_driver);
> +
> +MODULE_DESCRIPTION("i.MX IRQSTEER interrupt multiplexer/remapper driver"=
);
> +MODULE_LICENSE("GPL");

Reviewed-by: Radu Rendec <radu@rendec.net>

