Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2D8C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 19:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1b+657Zy6PTf1iwkHzICo1nJnrv/f9c/guiKQyCC5gI=; b=qAGQZpv2e5mynhRnCz29DODcEC
	B9ALZWtaoTc5Ci/Wbp5RH5WUQnzCBS47tnef9Uh/5ZFrcSk1Rv/XCGtRgB4lusJtQ9fO/N7/uoWd1
	vc2LsxsMS8h4OVXVAguSUpwLtUQ8Gq/SLfo3EVCSIqpNTfX8R3oeaug05LvnCU4XQ1lrA67W98e2A
	j/3G0zd46OKY/qEkvZr7bYleJ7fYzH6ygl+bqghnw/gyjAT74edaH+lKUp07IPXJWbDbMw23MMi8O
	z00+qbVsYGbpXTINJdeJ4C8FFvEf3PaDjYBh05ElS7EyQYgNFajkCbNqrnynvFreBYlaq/ZYfwpMY
	e3vp58xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpY4Y-0000000632k-2Y9n;
	Tue, 04 Mar 2025 19:36:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWoJ-00000005nzf-2066
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 18:16:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 99632A45BD0;
	Tue,  4 Mar 2025 18:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 097A8C4CEE5;
	Tue,  4 Mar 2025 18:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741112166;
	bh=TjiK3dy6VtxMzpyEGZ59HRvoPz9f2mzhsPZT7T2eWnU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=arLobDPTfb+VaUBCkCpX2TEeRqAqSHAELYPc8ObZkWzMQKhT+yCu1KFwupzYjGm0G
	 vgDiwRkW4dC2pApZZ05eKIvfD91/SWFaQ9R0hID/hhbhAAL1zywLO0aKBRixIwgQuz
	 kfBLhQRB47lGrthuWQjAq7/4pcqbtUygmCUAlabgm1Xi3ypDps51vvR3KiLB6N8aJt
	 CP3/v1hen2/7T4KgAuO+EYJaIFprcJWJOwI5j/GXKl2Teg01wRKx4Jm/92TkcoCviT
	 RmXeI3jgKyRl/y0hvoeWBvPAdZ5nNL0Tj7tj+msGJqFJA5bQfjL1CzthgEHt5WAUpq
	 Ddgj0rzvqukqw==
Message-ID: <b4fb36bc3970293ebdf1ac793bb3d752.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250301-exynos7870-pmu-clocks-v5-2-715b646d5206@disroot.org>
References: <20250301-exynos7870-pmu-clocks-v5-0-715b646d5206@disroot.org> <20250301-exynos7870-pmu-clocks-v5-2-715b646d5206@disroot.org>
Subject: Re: [PATCH v5 2/2] clk: samsung: add initial exynos7870 clock driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Conor Dooley <conor+dt@kernel.org>, Kaustabh Chakraborty <kauschluss@disroot.org>, Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Tue, 04 Mar 2025 10:16:03 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_101607_652841_0F71EC3F 
X-CRM114-Status: GOOD (  18.74  )
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

Quoting Kaustabh Chakraborty (2025-02-28 19:57:13)
> diff --git a/drivers/clk/samsung/clk-exynos7870.c b/drivers/clk/samsung/c=
lk-exynos7870.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..2ec4a4e489be30bd1cd2e6dea=
c006bb8ac5bdc57
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-exynos7870.c
> @@ -0,0 +1,1830 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2015 Samsung Electronics Co., Ltd.
> + * Author: Kaustabh Chakraborty <kauschluss@disroot.org>
> + *
> + * Common Clock Framework support for Exynos7870.
> + */
> +
> +#include <linux/clk.h>

Please remove this include as this is a clk provider and not a clk
consumer.

> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +
> +#include <dt-bindings/clock/samsung,exynos7870-cmu.h>
> +
> +#include "clk.h"
> +#include "clk-exynos-arm64.h"
> +
> +/*
> + * Register offsets for CMU_MIF (0x10460000)
> + */
[...]
> +
> +static const struct samsung_cmu_info peri_cmu_info __initconst =3D {
> +       .gate_clks              =3D peri_gate_clks,
> +       .nr_gate_clks           =3D ARRAY_SIZE(peri_gate_clks),
> +       .clk_regs               =3D peri_clk_regs,
> +       .nr_clk_regs            =3D ARRAY_SIZE(peri_clk_regs),
> +       .nr_clk_ids             =3D PERI_NR_CLK,
> +};
> +
> +static int __init exynos7870_cmu_probe(struct platform_device *pdev)
> +{
> +       const struct samsung_cmu_info *info;
> +       struct device *dev =3D &pdev->dev;
> +
> +       info =3D of_device_get_match_data(dev);

Use device APIs please: device_get_match_data()

> +       exynos_arm64_register_cmu(dev, dev->of_node, info);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id exynos7870_cmu_of_match[] =3D {
> +       {
> +               .compatible =3D "samsung,exynos7870-cmu-mif",
> +               .data =3D &mif_cmu_info,
> +       }, {
> +               .compatible =3D "samsung,exynos7870-cmu-dispaud",
> +               .data =3D &dispaud_cmu_info,
> +       }, {
> +               .compatible =3D "samsung,exynos7870-cmu-fsys",
> +               .data =3D &fsys_cmu_info,
> +       }, {
> +               .compatible =3D "samsung,exynos7870-cmu-g3d",
> +               .data =3D &g3d_cmu_info,
> +       }, {
> +               .compatible =3D "samsung,exynos7870-cmu-isp",
> +               .data =3D &isp_cmu_info,
> +       }, {
> +               .compatible =3D "samsung,exynos7870-cmu-mfcmscl",
> +               .data =3D &mfcmscl_cmu_info,
> +       }, {
> +               .compatible =3D "samsung,exynos7870-cmu-peri",
> +               .data =3D &peri_cmu_info,
> +       }, {
> +       },
> +};
> +
> +static struct platform_driver exynos7870_cmu_driver __refdata =3D {

Having __refdata here looks wrong.

> +       .driver =3D {
> +               .name =3D "exynos7870-cmu",
> +               .of_match_table =3D exynos7870_cmu_of_match,
> +               .suppress_bind_attrs =3D true,
> +       },
> +       .probe =3D exynos7870_cmu_probe,
> +};
> +
> +static int __init exynos7870_cmu_init(void)
> +{
> +       return platform_driver_register(&exynos7870_cmu_driver);

Is this supposed to be platform_driver_probe()? All the __init markings
in the samsung clk driver look like potential problems if anything
defers or is made into a module.

