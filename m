Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0765FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 23:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E23L4smOmhVUA9kwogfRmg/QpuVNFYG8sAV7QMa8QHs=; b=OverlcGhwEnbtYGnf1ttJ9UgRK
	yp2iLP66oXttO9Hr1og7AlVZuoghYaXEk694I13svvQNlFuTfPMV/mFJPq9VQlUX2fn8H+e0tDy7C
	P+aI/poHhu37ifBow/AJT2MQskrb6IBupFhhltxFXXXg6XnpjG3Gq6SKE8FJX9xyh/wQQHmKXzsMB
	y8qKDpNsF3zGFtjmu1rcPrYVesfbrpZyayCEZWatzp9tVj2MUywjBL3h07aaCk9I/m6h5LPJNChEZ
	BFktCc19oaB/kEonI4LIt7Z+oRY47WsOnn5XfehDWH0w9mA0z0+X/KCi8EXKZxfKC3N7ZLvukSiFa
	fAqA8BkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUwlB-00000002xgX-25Mc;
	Mon, 06 Jan 2025 23:43:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUwjz-00000002xac-04Af
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 23:42:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4ADEDA41E80;
	Mon,  6 Jan 2025 23:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A973DC4CED2;
	Mon,  6 Jan 2025 23:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736206953;
	bh=DOqxILEWmmCF86kx1hJGPmjd25X8GCewIcvcilYqiEo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=X3zWZtQpFCvGayya/T/LlBjjNyonXpRqqAon9pWDnMvGmFwtcvlL+84VTlXBkiT+G
	 ggIIE+WwOTBE+dhAry50izm29XUS3jyXPX134y0MY57BNjq4tR0LcjG01KESS41cQ3
	 usd/tCiCPKEuWboRyiMPyTPhTpxkHKB8R8Rqd2sxRjMY0yJO/kIHy2OfOfGXtv0KHX
	 RenO1N6JV5Rn+YkPi7vJNotdqdmasqdvPJEjR/RpQaVy9NglpPauAnWWmFenkofJux
	 z95Dt7bgr40uXWUeP7ZdQcNKQXzGsCIsN2PLvcqOFgUEzQmHJZ2mT4ygviIpxbBxO3
	 HRNh8Muc7ouFA==
Message-ID: <104eed995f349b123e633862f68de966.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250106-imx8m-clk-v2-6-6aaeadac65fe@pengutronix.de>
References: <20250106-imx8m-clk-v2-0-6aaeadac65fe@pengutronix.de> <20250106-imx8m-clk-v2-6-6aaeadac65fe@pengutronix.de>
Subject: Re: [PATCH v2 6/6] clk: imx8mp: inform CCF of maximum frequency of clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
To: Abel Vesa <abel.vesa@linaro.org>, Abel Vesa <abelvesa@kernel.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Marek Vasut <marex@denx.de>, Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Date: Mon, 06 Jan 2025 15:42:31 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_154235_183549_25907456 
X-CRM114-Status: GOOD (  14.39  )
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

Quoting Ahmad Fatoum (2025-01-06 06:21:47)
> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> index 516dbd170c8a356f293621b371b9ef9b9bec90a4..3b06990b73adcb2e4807f91a8=
983ad35068572a7 100644
> --- a/drivers/clk/imx/clk-imx8mp.c
> +++ b/drivers/clk/imx/clk-imx8mp.c
> @@ -405,6 +406,145 @@ static const char * const imx8mp_clkout_sels[] =3D =
{"audio_pll1_out", "audio_pll2_
>  static struct clk_hw **hws;
>  static struct clk_hw_onecell_data *clk_hw_data;
> =20
> +struct imx8mp_clock_constraints {
> +       int clkid;

Is it signed instead of unsigned because the terminal element of the
array has -1 as a clkid? And because clkid 0 is a valid one?

> +       u32 maxrate;
> +};
> +
> +/*
> + * Below tables are taken from IMX8MPCEC Rev. 2.1, 07/2023
> + * Table 13. Maximum frequency of modules.
> + * Probable typos fixed are marked with a comment.
> + */
> +static const struct imx8mp_clock_constraints imx8mp_clock_common_constra=
ints[] =3D {
[...]
> +       { IMX8MP_CLK_MEDIA_LDB,            595 * HZ_PER_MHZ },
> +       { IMX8MP_CLK_MEDIA_MIPI_TEST_BYTE, 200 * HZ_PER_MHZ },
> +       { IMX8MP_CLK_ECSPI3,                80 * HZ_PER_MHZ },
> +       { IMX8MP_CLK_PDM,                  200 * HZ_PER_MHZ },
> +       { IMX8MP_CLK_SAI7,                  66666667 }, /* Datasheet clai=
ms 66MHz */
> +       { IMX8MP_CLK_MAIN_AXI,             400 * HZ_PER_MHZ },
> +       { /* sentinel */ },

See nitpick below.

> +};
> +
> +static const struct imx8mp_clock_constraints imx8mp_clock_nominal_constr=
aints[] =3D {
[...]
> +       { IMX8MP_CLK_MEDIA_CAM1_PIX,    400 * HZ_PER_MHZ },
> +       { IMX8MP_CLK_VPU_VC8000E,       400 * HZ_PER_MHZ }, /* Datasheet =
claims 500MHz */
> +       { IMX8MP_CLK_DRAM_CORE,         800 * HZ_PER_MHZ },
> +       { IMX8MP_CLK_GIC,               400 * HZ_PER_MHZ },
> +       { /* sentinel */ },

See nitpick below.

> +};
> +
> +static const struct imx8mp_clock_constraints imx8mp_clock_overdrive_cons=
traints[] =3D {
[...]
> +       { IMX8MP_CLK_VPU_VC8000E,        500 * HZ_PER_MHZ }, /* Datasheet=
 claims 400MHz */
> +       { IMX8MP_CLK_DRAM_CORE,         1000 * HZ_PER_MHZ },
> +       { IMX8MP_CLK_GIC,                500 * HZ_PER_MHZ },
> +       { /* sentinel */ },

Please remove the comma because nothing can come after this and if
someone were to add something after they would get a compilation error.

