Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836AE606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 12:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JLe3KWoN;
	dkim=pass (2048-bit key, unprotected) header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=IoA9DM3u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TalOl96alln21uvpuXQrkyMghf/Vuyhv5RoGgLmGEUY=; b=JLe3KWoNIfYx/PhWZJ3ZESZIMz
	ETR/sMhMbq0dDPVNF109uKtwjhEKDBeWMjXCE3ZvN5WwR78ulqL4ML0WVoqtydqv/PeyR5sy/TA6I
	DqD4xvYSTat0hiYEme56Qmej2Q+F0AlXFU0uhrGU43jPkHG0AHHACcVSExR28j8kL8IWZqogQh2UQ
	mILlPAMPghC+BS87cgw9wf+yU37GEU+IcvoHr8mdDbDxyky9yrF9rcXAxNuYmktm4K/Ei6j+Q0SYG
	2QHhetzeLZR+qJvWNTeTzjOy/tSavOfj6P/kircEtdBMBjXqqzF4c1aMg6kIaxRhr6ut1LnwxKoo1
	J4Z8kG3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8Wj-00000009cnK-07nE;
	Tue, 20 Oct 2026 12:01:09 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8We-00000009cmL-47gR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 12:01:08 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 1A7F3D1E92;
	Tue, 20 Oct 2026 15:01:00 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 1A7F3D1E92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1792497662;
	bh=TalOl96alln21uvpuXQrkyMghf/Vuyhv5RoGgLmGEUY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=IoA9DM3uQ4UY3J4z1Rpp24cbuQNN2UnOqLaUqj0hwLdCujZ1j2I3dvMfXrymdnV5J
	 dqo20YP+goVaiJIn3CCmsa/WzeVP/XFr9Q1ol5djxpIvuU13oMXXsOhyPehxgR8e6G
	 r2vuPCLgR7SAcDypK1g2agVgoIRzqdDr2avJqXdVhHHkBMUOVWebPI8XqAX5uxraEU
	 7gg4UX6chUbvk2yibIb2R5DXaEzWYUK+pwpwewdTTgjZpWN8u9nSSTCANy+KBHiG7v
	 Oo6eCJUOGOW8QqfS//trrd9vjdmAHV0/Pw+yeH72nmy4yeJhj3fsNcwn7KGL7KIEdr
	 1U3bawos4Pwbg==
Message-ID: <f642a27d36844b8cc4d164f518f7177252624975.camel@rendec.net>
Subject: Re: [PATCH v6 7/9] irqchip/imx-irqsteer: Allow building as module
From: Radu Rendec <radu@rendec.net>
To: Zhipeng.wang_1@oss.nxp.com, Thomas Gleixner <tglx@kernel.org>, Marc
 Zyngier	 <maz@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jindong Yue
	 <jindong.yue@nxp.com>, xuegang.liu@nxp.com, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Date: Tue, 20 Oct 2026 08:00:59 -0400
In-Reply-To: <20261008090231.796511-8-Zhipeng.wang_1@oss.nxp.com>
References: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
	 <20261008090231.796511-8-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_050107_405128_F1803E3B 
X-CRM114-Status: GOOD (  17.21  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 2026-10-08 at 18:02 +0900, Zhipeng.wang_1@oss.nxp.com wrote:
> From: Jindong Yue <jindong.yue@nxp.com>
>=20
> Make the driver buildable as a module by turning the Kconfig symbol into
> a tristate and using module_platform_driver() instead of
> builtin_platform_driver(), and add the MODULE_DEVICE_TABLE() and module
> metadata needed for autoloading.

I believe both high-severity issues flagged by sashiko [1] are valid.
Looking at what other drivers do (e.g. drivers/irqchip/irq-ts4800.c,
drivers/irqchip/irq-pruss-intc.c), you should do something similar:
iterate over the hwirqs and call irq_dispose_mapping(). That would
solve both problems because synchronize_irq() gets called indirectly
via irq_domain_disassociate().

There is nothing wrong with the patch itself (the conversion to
loadable module), so my r-b tag can stay as long as the above issue is
addressed in a separate patch. Thanks!

[1] https://lore.kernel.org/all/sashiko-outbox-163920@kernel.org/

> The clock, runtime PM and IRQ domain are already owned by devres, so no
> further teardown is needed to support unbind and reload.
>=20
> Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> Reviewed-by: Radu Rendec <radu@rendec.net>
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
> index 15ee50f65d54..85edd5e33ca9 100644
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
> @@ -359,6 +360,7 @@ static const struct of_device_id imx_irqsteer_dt_ids[=
] =3D {
> =C2=A0	{ .compatible =3D "nxp,s32n79-irqsteer",	.data =3D &s32n79_data },
> =C2=A0	{},
> =C2=A0};
> +MODULE_DEVICE_TABLE(of, imx_irqsteer_dt_ids);
> =C2=A0
> =C2=A0static struct platform_driver imx_irqsteer_driver =3D {
> =C2=A0	.driver =3D {
> @@ -369,4 +371,7 @@ static struct platform_driver imx_irqsteer_driver =3D=
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

