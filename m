Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0206BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 10:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dga9moRskPuVr+dNfJcJdGUmiUtKdHsJ3mDfYxNaM4=; b=oNcXPhFwz9BwdAjVREmtalSneL
	hn3Pw/oJ48ZEQIev4gmmn5b32gb7kO5BDf4rucQn342MlqRZvz1Wek0AEE9TiocI1hllHbezriyue
	C6YiNaJt02qi6G2821uZJ5bRHTZtoj3FRXgLT4TfK/EYDhigmxfIRuXioEcy0UGoTey82cFtWgFBZ
	OkJdCqq19AkjnAZXPHoTdmXvY3C1Y+1JkYHBP98nUMBg7QiSNhtG2WG3xEYnxXgmQg3ZrDn18DQ1Y
	9HN5sxvs6PstmvMVAYeefZASkL+8ZAj4jwYC3fMDuVgVxIuzm25TcuPk6uLN5tgevl5mA5s4+7jkt
	UtEDbTJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN89b-00000009g53-3vYG;
	Mon, 16 Dec 2024 10:16:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN88L-00000009flU-3Esb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 10:15:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CB299A40E22;
	Mon, 16 Dec 2024 10:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5F2AC4CED0;
	Mon, 16 Dec 2024 10:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734344124;
	bh=xBL/Ai+09SBq1LqnT0gwmOi4aMFDp3mfzJuqznKFiEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i+OiWbJ7It/yYoXyptEOyUyAUxSofMveQJjItgtbGR+izni0//d+xHQpCWN6PApS6
	 H/Qrdzm9k49R77Y8b3KHfCSVrA2ojc0Fjp6esBDsBQMb+1CZGlcEIzU9La7HkqoOIm
	 8vf0wVoehQQRkh0sTzXDFwr84bp5atvo63+5txAgoMfFQ/sg5CvRjcEXaRRUxsjQdc
	 7s5XqKlzAtRoQcth5y5/AOlHQwBUXtL9+QTEFpeOcqkD1ep3ESrzuG3MPYa9U9JXGS
	 kA/GZaCPCYPuLoP2ntPbpa8OsYkXgO/BmOt0kQdpOo6iUA3QbERR9O/lT+pdtY231H
	 ER57yclsr52SQ==
Date: Mon, 16 Dec 2024 11:15:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jacky Bai <ping.bai@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, aisheng.dong@nxp.com, peng.fan@nxp.com, frank.li@nxp.com
Subject: Re: [PATCH] arm64: dts: freescale: Add basic dtsi for imx943
Message-ID: <z6udhrqfmbelspe3eiz2q6twqvn4nkgxnfsdyxdv7ow6llxiz6@qhbaobn63icb>
References: <20241212093555.1376568-1-ping.bai@nxp.com>
 <20241212093555.1376568-2-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241212093555.1376568-2-ping.bai@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_021525_878725_87A789C9 
X-CRM114-Status: GOOD (  16.78  )
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

On Thu, Dec 12, 2024 at 05:35:55PM +0800, Jacky Bai wrote:
> The i.MX 943 applications processors integrate up to four
> Arm Cortex A55 cores and supports functional safety with
> built-in 2x Arm Cortex M33 and M7 cores which can be
> configured asa safety island. Optimizing performance and
> power efficiency for Industrial, IoT and automotive devices,
> i.MX 943 processors are built with NXP=E2=80=99s innovative Energy
> Flex architecture.
>=20
> This patch adds the minimal dtsi support for i.MX943 with
> peripherals like uart, edma, i2c, spi, mu, sai etc.
>=20
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx943-clock.h  |  196 +++
>  .../arm64/boot/dts/freescale/imx943-pinfunc.h | 1542 +++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx943-power.h  |   41 +
>  arch/arm64/boot/dts/freescale/imx943.dtsi     | 1284 ++++++++++++++
>  4 files changed, 3063 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx943-clock.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx943-pinfunc.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx943-power.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx943.dtsi
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx943-clock.h b/arch/arm64/bo=
ot/dts/freescale/imx943-clock.h
> new file mode 100644
> index 000000000000..64b9d5d4051e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx943-clock.h
> @@ -0,0 +1,196 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
> +/*
> + * Copyright 2024 NXP
> + */
> +
> +#ifndef __CLOCK_IMX943_H
> +#define __CLOCK_IMX943_H
> +
> +#define IMX943_CLK_EXT				0
> +#define IMX943_CLK_OSC32K			1
> +#define IMX943_CLK_OSC24M			2


Why exactly are you adding clock indices to header files? Nothing in
commit msg explains that.

Best regards,
Krzysztof


