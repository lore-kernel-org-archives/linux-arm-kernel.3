Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177BFC28B22
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 22:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qEs3ztyCWWzyaSBH3G2eEY8s/2PqEYJQAVfjpXV648=; b=lpHzuqEKINF3fj0uNom+3A78pj
	b+5/OrIFbma0sdBzt0fxAUqWmEBuyr5xWolDguuMWOKSqQCGMZDqieb21SFBIXKH9WIinOSKJFA1E
	rPgwHxIATsKUu2JlzjcYBGeilcHTx/HbJ03Gx1SNWXWxFUc5gkHuJLSZUrokFX5/ap7Pqcf0vI0Om
	IqkgGAAOwoKxViX9UEpSu5/t4Yem+rvNY7uIfS2aL4DDUTmRNfOPb2mfmW1xv6vTrUg37RacaHiH+
	gwLLeAmHCRx93wxQdIlweK4p2UWBlaR2i5GtpF+jKpjeT6uIs6cglQ8jwQB+IGwWa+6Fjd7URVEPZ
	fvJWuXOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpx6I-00000009Sus-3aNL;
	Wed, 05 Mar 2025 22:20:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwxJ-00000009Rtr-1q7Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 22:11:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8DB165C66B0;
	Wed,  5 Mar 2025 22:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F10BDC4CED1;
	Wed,  5 Mar 2025 22:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741212668;
	bh=y6Ws4y70AqcP1/f67iogQtv83NKMfTTp5b+XJn86ADU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=uLIGTT6ix0ytcNmFy0dOGwGhLC1am2boVh5F9hgPpTDAAK9HuP3BXUAVe7vPTVPYy
	 aegKx0eanzBcLdr07sOfMAD61JvuBTvlDSm0cedec7kQn9JOA8BvC9CpZsYU8eeJNP
	 9gVjPHoDjkIfAs08a+8jw9T54iUbEqV1h519k+Xur07Qc0YENUop7qT1Zi0JREWGau
	 LPrFDelNuAutQPb7A/Ah8ig73GVnpjxAdAX1SQOQWJUdRUea9ZV51Npoet1jzBf1gT
	 DOFJCFvVKMMv+Zd6lnh3c1/DjSpkXRo2fjJJynV8LTuUjTa0LN8nHAMYWfcoyUZxe8
	 VT1c99Zb4ouPQ==
Message-ID: <f17372963b92074144b07d34f3e91ba7.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250305-spmi-v1-2-c98f561fa99f@gmail.com>
References: <20250305-spmi-v1-0-c98f561fa99f@gmail.com> <20250305-spmi-v1-2-c98f561fa99f@gmail.com>
Subject: Re: [PATCH 2/3] spmi: add a spmi driver for Apple SoC
From: Stephen Boyd <sboyd@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>, Jean-Francois Bortolotti <jeff@borto.fr>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>, Sven Peter <sven@svenpeter.dev>, fnkl.kernel@gmail.com
Date: Wed, 05 Mar 2025 14:11:05 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_141109_595649_C13769C4 
X-CRM114-Status: GOOD (  30.17  )
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

Quoting Sasha Finkelstein via B4 Relay (2025-03-05 12:26:40)
> From: Jean-Francois Bortolotti <jeff@borto.fr>
>=20

Please write some commit text explaining why this driver is important to
review. Maybe it's necessary for something to work?

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..194fa5dd7c2c6fc4ecfbee0db=
7930b0c73b02550
> --- /dev/null
> +++ b/drivers/spmi/spmi-apple-controller.c
> @@ -0,0 +1,176 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Apple SoC SPMI device driver
> + *
> + * Copyright The Asahi Linux Contributors
> + *
> + * Inspired by:
> + *             OpenBSD support Copyright (c) 2021 Mark Kettenis <ketteni=
s@openbsd.org>
> + *             Correllium support Copyright (C) 2021 Corellium LLC
> + *             hisi-spmi-controller.c
> + *             spmi-pmic-ard.c Copyright (c) 2021, The Linux Foundation.

spmi-pmic-arb?

> + */
> +
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>

Are these includes used? I think you need mod_devicetable.h

> +#include <linux/platform_device.h>
> +#include <linux/spmi.h>
> +
> +/* SPMI Controller Registers */
> +#define SPMI_STATUS_REG 0
> +#define SPMI_CMD_REG 0x4
> +#define SPMI_RSP_REG 0x8
> +
> +#define SPMI_RX_FIFO_EMPTY BIT(24)
> +
> +#define REG_POLL_INTERVAL 10000
> +#define REG_POLL_TIMEOUT (REG_POLL_INTERVAL * 5)
> +
> +struct apple_spmi {
> +       void __iomem *regs;
> +};
> +
> +#define poll_reg(spmi, reg, val, cond) \
> +       readl_relaxed_poll_timeout((spmi)->regs + (reg), (val), (cond), \
> +                                  REG_POLL_INTERVAL, REG_POLL_TIMEOUT)
> +
> +static inline u32 read_reg(struct apple_spmi *spmi, int offset)
> +{
> +       return readl_relaxed(spmi->regs + offset);
> +}
> +
> +static inline void write_reg(u32 value, struct apple_spmi *spmi, int off=
set)
> +{
> +       writel_relaxed(value, spmi->regs + offset);
> +}

I'm not a huge fan of these wrappers but OK. Why relaxed accessors?

> +
> +static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
> +                        u16 saddr, u8 *__buf, size_t bc)

Drop the underscore because the variable 'buf' is never used.

> +{
> +       struct apple_spmi *spmi =3D spmi_controller_get_drvdata(ctrl);
> +       u32 spmi_cmd =3D opc | sid << 8 | saddr << 16 | (bc - 1) | (1 << =
15);

Can this be some function like apple_spmi_pack_cmd()? I suspect 'bc' is
byte_count? Usually we just call that 'len'.

> +       u32 rsp;
> +       u32 status;
> +       size_t len_to_read =3D 0;

len_to_read would imply that it is non-zero to start. Maybe 'len_read'
past tense, or decrement 'bc'.

> +       u8 i;
> +       int ret;
> +
> +       write_reg(spmi_cmd, spmi, SPMI_CMD_REG);
> +
> +       /* Wait for Rx FIFO to have something */
> +       ret =3D poll_reg(spmi, SPMI_STATUS_REG, status, !(status & SPMI_R=
X_FIFO_EMPTY));
> +       if (ret) {
> +               dev_err(&ctrl->dev,
> +                       "%s:Failed to wait for RX FIFO not empty\n", __fu=
nc__);
> +               return ret;
> +       }

This chunk is the same. Maybe have apple_spmi_wait_for_rx_fifo() that
does everything including the error message?

> +
> +       /* Discard SPMI reply status */
> +       read_reg(spmi, SPMI_RSP_REG);
> +
> +       /* Read SPMI data reply */
> +       while (len_to_read < bc) {
> +               rsp =3D read_reg(spmi, SPMI_RSP_REG);
> +               i =3D 0;
> +               while ((len_to_read < bc) && (i < 4)) {
> +                       __buf[len_to_read++] =3D ((0xff << (8 * i)) & rsp=
) >>
> +                                              (8 * i);
> +                       i +=3D 1;
> +               }

Is this ioread32_rep()?

> +       }
> +
> +       return 0;
> +}
> +
> +static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
> +                         u16 saddr, const u8 *__buf, size_t bc)
> +{
> +       struct apple_spmi *spmi =3D spmi_controller_get_drvdata(ctrl);
> +       u32 spmi_cmd =3D opc | sid << 8 | saddr << 16 | (bc - 1) | (1 << =
15);
> +       u32 status;
> +       size_t i =3D 0, j;
> +       int ret;
> +
> +       write_reg(spmi_cmd, spmi, SPMI_CMD_REG);
> +
> +       while (i < bc) {
> +               j =3D 0;
> +               spmi_cmd =3D 0;
> +               while ((j < 4) & (i < bc))
> +                       spmi_cmd |=3D __buf[i++] << (j++ * 8);

Is this iowrite32_rep()? Perhaps unaligned sizes have to be dealt with,
but otherwise I suspect it would be more efficient to use
iowrite32_rep() until the number of bytes is less than 4 and then do the
one extra pack.

> +
> +               write_reg(spmi_cmd, spmi, SPMI_CMD_REG);
> +       }
> +
> +       /* Wait for Rx FIFO to have something */
> +       ret =3D poll_reg(spmi, SPMI_STATUS_REG, status, !(status & SPMI_R=
X_FIFO_EMPTY));
> +       if (ret) {
> +               dev_err(&ctrl->dev,
> +                       "%s:Failed to wait for RX FIFO not empty\n", __fu=
nc__);
                             ^
Please put a space after  ---|

> +               return ret;
> +       }
> +
> +       /* Discard */
> +       read_reg(spmi, SPMI_RSP_REG);
> +
> +       return 0;
> +}
> +
> +static int spmi_controller_probe(struct platform_device *pdev)
> +{
> +       struct apple_spmi *spmi;
> +       struct spmi_controller *ctrl;
> +       int ret;
> +
> +       ctrl =3D devm_spmi_controller_alloc(&pdev->dev, sizeof(*spmi));
> +       if (IS_ERR(ctrl)) {
> +               dev_err_probe(&pdev->dev, PTR_ERR(ctrl),
> +                             "Can't allocate spmi_controller data\n");

This is likely redundant given that the spmi core API prints errors. I
could see a patch that moves to dev_err_probe() there.

> +               return -ENOMEM;
> +       }
> +
> +       spmi =3D spmi_controller_get_drvdata(ctrl);
> +
> +       spmi->regs =3D devm_platform_ioremap_resource(pdev, 0);

This already prints an error message so the dev_err_probe() later is
redundant. Please remove.

> +       if (IS_ERR(spmi->regs)) {
> +               dev_err_probe(&pdev->dev, PTR_ERR(spmi->regs),
> +                             "Can't get ioremap regs\n");
> +               return PTR_ERR(spmi->regs);
> +       }
> +
> +       ctrl->dev.of_node =3D of_node_get(pdev->dev.of_node);

Drop the of_node_get(), especially because it never gets put.

> +
> +       ctrl->read_cmd =3D spmi_read_cmd;
> +       ctrl->write_cmd =3D spmi_write_cmd;
> +
> +       ret =3D devm_spmi_controller_add(&pdev->dev, ctrl);
> +       if (ret) {
> +               dev_err(&pdev->dev,
> +                       "spmi_controller_add failed with error %d!\n", re=
t);

Use 'return dev_err_probe()'?

> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id spmi_controller_match_table[] =3D {
> +       { .compatible =3D "apple,spmi", },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, spmi_controller_match_table);
> +
> +static struct platform_driver spmi_controller_driver =3D {

How about apple_spmi_driver?

> +       .probe          =3D spmi_controller_probe,

And apple_spmi_probe?

> +       .driver         =3D {
> +               .name   =3D "apple-spmi",
> +               .of_match_table =3D spmi_controller_match_table,

And apple_spmi_match_table?

> +       },
> +};
> +module_platform_driver(spmi_controller_driver);

