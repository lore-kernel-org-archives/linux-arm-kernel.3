Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72366C282D9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 19:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DnwlQPZc9YG4276dGNcfWwtiEc6GQlpgX7+AenO/Ak=; b=xPwk7y9CruyiBu7z5anp91D5UC
	LP7SSCnP+BwpeQn5f4fKxLR2kTLYuTGa5irufTVHBoII3kbXNfn/71LLbtC5HZcTPBInv89NNUbkh
	iNl3AtjWUS9KKgEvAD5Q4Y39Izj5jaobUMTwpOKe0WhM7Dogmo/iqTkBdIn1Gt+6lbh8EMFfAlob8
	V7RLwk0HjULrtDwGR/H+9NRRYChYVCS0JDLtW2OhaAV6ihck3aTQuRUfKRQ6VMI/zJL9h8LtjeNIK
	ONOKVsNMFXjqjk2bGS+LOjGj1g9dluRuOjj5TXIO6qcKWu9CZ9bYp+ut+0no/ARHQB8Ihspe9Y+5I
	Qh6ekhTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpY66-000000063Jv-17Yr;
	Tue, 04 Mar 2025 19:38:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWr9-00000005obz-3IM2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 18:19:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A0665C621D;
	Tue,  4 Mar 2025 18:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B625BC4CEE5;
	Tue,  4 Mar 2025 18:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741112342;
	bh=7bw48i0H6/MBvyCOgup5IexafXe/jlFudSz/GS/f0jE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WqMAvySZGaDBm0Jxa8T9HSI/EwuV+hxw9GHoBqXTHCROXsqHZejECMhM+x5Y5Ggrg
	 14BWwQDJ4LEq17AAtgjK/N+furYAIzI212zZrUeVssXvQoKD4su+rP1YERhsiZ0JhE
	 Y1h2awhCY2iVZajCPjRq/c0N355Xo5iBVK/QZ2/8egIBMATG3mbe+jbW4wCD3MyoKc
	 0G/i0e3C1LRrUxELu+x01yqP/QeHlS6crW7w4pFe2ZCwT/+gqX7fKQ5kS98z4e8ZIu
	 lEJ1omW9CKM04dgieEM9LRj0bdWSFSRBC/SnazC6o7WqAD1notKcHPPQTHGgOlaFQx
	 F6VxzEwDJuRmA==
Message-ID: <7b182615f1439dd39a17b8e74cf740bf.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250223115601.723886-4-ivo.ivanov.ivanov1@gmail.com>
References: <20250223115601.723886-1-ivo.ivanov.ivanov1@gmail.com> <20250223115601.723886-4-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH v2 3/3] clk: samsung: introduce Exynos2200 clock driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Conor Dooley <conor+dt@kernel.org>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Tue, 04 Mar 2025 10:19:00 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_101903_910653_740266A5 
X-CRM114-Status: GOOD (  18.97  )
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

Quoting Ivaylo Ivanov (2025-02-23 03:56:00)
> diff --git a/drivers/clk/samsung/clk-exynos2200.c b/drivers/clk/samsung/c=
lk-exynos2200.c
> new file mode 100644
> index 000000000..151bdb35a
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-exynos2200.c
> @@ -0,0 +1,3928 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2025 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> + * Author: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> + *
> + * Common Clock Framework support for Exynos2200 SoC.
> + */
> +
> +#include <linux/clk.h>

Remove this include because this is a clk provider and not a clk
consumer.

> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#include <dt-bindings/clock/samsung,exynos2200-cmu.h>
> +
> +#include "clk.h"
> +#include "clk-exynos-arm64.h"
> +
> +/* NOTE: Must be equal to the last clock ID increased by one */
> +#define CLKS_NR_TOP                    (CLK_DOUT_TCXO_DIV4 + 1)
> +#define CLKS_NR_ALIVE                  (CLK_DOUT_ALIVE_DSP_NOC + 1)
> +#define CLKS_NR_PERIS                  (CLK_DOUT_PERIS_DDD_CTRL + 1)
> +#define CLKS_NR_CMGP                   (CLK_DOUT_CMGP_USI6 + 1)
> +#define CLKS_NR_HSI0                   (CLK_DOUT_DIV_CLK_HSI0_EUSB + 1)
[...]
> +
> +static int __init exynos2200_cmu_probe(struct platform_device *pdev)
> +{
> +       const struct samsung_cmu_info *info;
> +       struct device *dev =3D &pdev->dev;
> +
> +       info =3D of_device_get_match_data(dev);

Use device APIs to be firmware agnostic: device_get_match_data()=20

> +       exynos_arm64_register_cmu(dev, dev->of_node, info);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id exynos2200_cmu_of_match[] =3D {
> +       {
> +               .compatible =3D "samsung,exynos2200-cmu-cmgp",
> +               .data =3D &cmgp_cmu_info,
> +       }, {
> +               .compatible =3D "samsung,exynos2200-cmu-hsi0",
> +               .data =3D &hsi0_cmu_info,
> +       }, {
> +               .compatible =3D "samsung,exynos2200-cmu-peric0",
> +               .data =3D &peric0_cmu_info,
> +       }, {
> +               .compatible =3D "samsung,exynos2200-cmu-peric1",
> +               .data =3D &peric1_cmu_info,
> +       }, {
> +               .compatible =3D "samsung,exynos2200-cmu-peric2",
> +               .data =3D &peric2_cmu_info,
> +       }, {
> +               .compatible =3D "samsung,exynos2200-cmu-ufs",
> +               .data =3D &ufs_cmu_info,
> +       }, {
> +               .compatible =3D "samsung,exynos2200-cmu-vts",
> +               .data =3D &vts_cmu_info,
> +       }, { }
> +};
> +
> +static struct platform_driver exynos2200_cmu_driver __refdata =3D {
> +       .driver =3D {
> +               .name =3D "exynos2200-cmu",
> +               .of_match_table =3D exynos2200_cmu_of_match,
> +               .suppress_bind_attrs =3D true,
> +       },
> +       .probe =3D exynos2200_cmu_probe,
> +};
> +
> +static int __init exynos2200_cmu_init(void)
> +{
> +       return platform_driver_register(&exynos2200_cmu_driver);

Was this supposed to be platform_driver_probe()? The __refdata usage
suggests that but all of the __init markings and stuff in the samsung
clk driver worry me.

