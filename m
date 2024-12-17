Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9E8E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 07:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TkdJQGrSE3oTUAQoeRuUHb1VHmnrtQkcv8oSAvhApqA=; b=kJqruKfBz0S2979MWBIZMbOueb
	TxPb9lA1JbGvZ0nNdbofjIvKpaotcFk+4Ksrvk/+dj7NaiVO8SByXua1aEW9WNi7/aBhKbNZI6OMc
	ccBWAgy/LJiqkJHc4jU0ZAJ7lFkGDzp3j/4vYePDGnUA01FqIpYrvk//pFplm1Vmg+EFUl7y0Lvs/
	inMQWcRB+zgQpRxXtakdmyTXFxKQrJiwptsPqGMlM0sWlPKKrlfCFMwkNZSFcW/GebuGVIlBozGcc
	XaJn5LrCIcr0f05Kkcaf8oN01ROTqwv0C6WkUphXQ1movB14wfGBapdCHZNDrF8GQIu0nayq4aTqj
	XkLPXsQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNSCZ-0000000CbYq-21Z3;
	Tue, 17 Dec 2024 07:41:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNSBO-0000000CbHB-2pQu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 07:39:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0D8775C6208;
	Tue, 17 Dec 2024 07:39:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D862C4CED3;
	Tue, 17 Dec 2024 07:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734421193;
	bh=f7Df3D2mYSw4EuQDLRDjYSEZXbF66N6eFGfuaboyFb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dzSxKRGumOzngVx8WU5ajJQJw3ytC8wVC5afCVitEYN1FSmnlzVvAp4Zy+67Kc/63
	 nPYBgpKCpHytRPZbb4naVy4pGsyTBAUGhoUQ6Q1XwAOrbBNtXYSrTpLvYWyTAhOyaT
	 gEA1mPKGnHzFpGcVlLpFvozjDhd8jRqNVXjN9n1q4s59+gBtO8tFqY/mEVjDs3m0h6
	 K6Oxyg3oPABTAUKfktuJug8D+GfWa7Ps0Jh2y0IIB6niDEPPPCEoNRqF/3H56Cn3je
	 Kr2bTYvyd3RS6rdUrlahRFTZHBjcX8qeSqJLaWI6nEVRKboRUl4V8EMz/fBQp5HA0D
	 lW2/QDGYI91cg==
Date: Tue, 17 Dec 2024 08:39:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: exynos: gs101-raven: add new board file
Message-ID: <2wyjctwn443oxl633qwxsxmyzqhinssrkoafgqhcc34tqgwnh5@ymrr57jxdnl6>
References: <20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org>
 <20241216-gs101-simplefb-v1-4-8ccad1830281@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241216-gs101-simplefb-v1-4-8ccad1830281@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_233954_753640_4E2E1655 
X-CRM114-Status: GOOD (  17.69  )
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

On Mon, Dec 16, 2024 at 01:06:29PM +0000, Andr=C3=A9 Draszik wrote:
> Raven is Google's code name for Pixel 6 Pro. Similar to Pixel 6
> (Oriole), this is also based around its Tensor gs101 SoC.
>=20
> For now, the relevant difference here is the display resolution:
> 1440 x 3120 instead of 1080 x 2400.
>=20
> Create a new board file to reflect this difference.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>=20
> ---
> Note: MAINTAINERS doesn't need updating, it covers this whole directory
> ---
>  arch/arm64/boot/dts/exynos/google/Makefile        |  1 +
>  arch/arm64/boot/dts/exynos/google/gs101-raven.dts | 27 +++++++++++++++++=
++++++
>  2 files changed, 28 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/exynos/google/Makefile b/arch/arm64/boot=
/dts/exynos/google/Makefile
> index 0a6d5e1fe4ee..7385f82b03c9 100644
> --- a/arch/arm64/boot/dts/exynos/google/Makefile
> +++ b/arch/arm64/boot/dts/exynos/google/Makefile
> @@ -2,3 +2,4 @@
> =20
>  dtb-$(CONFIG_ARCH_EXYNOS) +=3D \
>  	gs101-oriole.dtb \
> +	gs101-raven.dtb
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-raven.dts b/arch/arm=
64/boot/dts/exynos/google/gs101-raven.dts
> new file mode 100644
> index 000000000000..75fd34797fa9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Raven Device Tree
> + *
> + * Copyright 2021-2023 Google LLC
> + * Copyright 2023-2024 Linaro Ltd
> + */
> +
> +/dts-v1/;
> +
> +#include "gs101-raviole.dtsi"
> +
> +/ {
> +	model =3D "Raven";
> +	compatible =3D "google,gs101-raven", "google,gs101";
> +};
> +
> +&framebuffer0 {
> +	reg =3D <0x0 0xfac00000 (1440 * 3120 * 4)>;
> +	width =3D <1440>;
> +	height =3D <3120>;
> +	stride =3D <(1440 * 4)>;
> +};
> +
> +&cont_splash_mem {

Keep overriding/extending nodes ordered by label name.

Best regards,
Krzysztof


