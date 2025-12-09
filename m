Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF78D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 12:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPm9gAaFXAi+e7aAc0FyOo5De8ElmI7LLS0rEFiGjhw=; b=4OboZqoDkrrJg/xunB4eNLHFU5
	Ipqqbyxa5iPLP8luCmESJM0N1EkY2v+Wr8vRaf2HR/7jpfsOep8I98m1+xDC/U++b7BZcZHcAib3F
	Igm76IDMLdUb9GFHS0Z0gPVpYYCCADy7FLA1+AC8s3k/pcHp3v4YiYnlCfTYD7Li0xBMcKSOglk4X
	WLujKNMQn2B9j09ib3jZKs61KH+7lYVMsrFQDrU0yvoMp0TokfNdrUNtfg/1Wdz01Uq1JgukXF9r9
	F8iqZ5NNxd3hn53323TwZoVRseJ3lqdmxjv33/MplGH4hZaojfotl9WLsSSRTFQcoMkKume10njhD
	nLQMvy+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSx1s-0000000EGed-0E9f;
	Tue, 09 Dec 2025 12:41:20 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSx1p-0000000EGe2-14dR;
	Tue, 09 Dec 2025 12:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=CPm9gAaFXAi+e7aAc0FyOo5De8ElmI7LLS0rEFiGjhw=; b=0evnc+2cA/JEnnSMdm4qnHw217
	4svvawuDBRuwuswE/N/nvat4cSQVtqY908D6Op7DC884YX2jI5g3HdN0Nfdzz2iAtNJT3JMHFEQEA
	dD5lUMCJnpyoK/RvJWNxXjS50ZqcMfMTKvVFbYvUXUDIcyqfP+7BeOId5C+ikrIDdKFt020Yh2iVc
	+bZ1MAOKFeinIlPFfiWz+0JHDPdQJwnb7togGppY5We7FfDs2VnFf1kPKb7qSFkCfYsJj2L5K6/oR
	lRyCk/s8tTHXg3D2yLoGJHlDkgt5fAQqNl/U0DSX9tHqLlL1p1jiBtUAF1vwRgz+tjNrpf17h6PDe
	CDyePE9g==;
Received: from i53875a42.versanet.de ([83.135.90.66] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vSx1m-0007kS-UM; Tue, 09 Dec 2025 13:41:14 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Ye Zhang <ye.zhang@rock-chips.com>,
 Linus Walleij <linus.walleij@linaro.org>, Ye Zhang <ye.zhang@rock-chips.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, tao.huang@rock-chips.com
Subject: Re: [PATCH v2 6/8] dt-bindings: pinctrl: Add header for Rockchip RK3506 RMIO
Date: Tue, 09 Dec 2025 13:41:14 +0100
Message-ID: <2681672.Lt9SDvczpP@diego>
In-Reply-To: <20251206050844.402958-7-ye.zhang@rock-chips.com>
References: <20251206050844.402958-1-ye.zhang@rock-chips.com>
 <20251206050844.402958-7-ye.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_044118_257191_A52EBBC9 
X-CRM114-Status: GOOD (  18.07  )
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

Hi Ye Zhang,

Am Samstag, 6. Dezember 2025, 06:08:42 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Ye Zhang:
> Add header file with constants for RMIO pin and function IDs for the
> Rockchip RK3506 SoC.
>=20
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
> ---
>  .../pinctrl/rockchip,rk3506-rmio.h            | 143 ++++++++++++++++++
>  1 file changed, 143 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h
>=20
> diff --git a/include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h b/include=
/dt-bindings/pinctrl/rockchip,rk3506-rmio.h
> new file mode 100644
> index 000000000000..5d39690a0b28
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h
> @@ -0,0 +1,143 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/*
> + * Copyright (c) 2025 Rockchip Electronics Co., Ltd.
> + */
> +
> +#ifndef __DT_BINDINGS_PINCTRL_ROCKCHIP_RK3506_RMIO_H
> +#define __DT_BINDINGS_PINCTRL_ROCKCHIP_RK3506_RMIO_H
> +
> +/* RMIO pins definetion */
> +#define RMIO_PIN0				0
> +#define RMIO_PIN1				1
> +#define RMIO_PIN2				2
> +#define RMIO_PIN3				3
> +#define RMIO_PIN4				4

[...]

> +#define RMIO_PIN29				29
> +#define RMIO_PIN30				30
> +#define RMIO_PIN31				31

additionally to Krzysztof's comments, please also don't introduce
unhelpful mappings. Having constants mapping pin31 to 31 is not
helpful at all, as there is no value added.

We'll already know that it's pin31 by reading the 31 when used.


In contrast, the constants below add a lot of value, because you can't
infer the that the function "14" means the  CLK_32K function without
consulting the TRM, so _those_ are helpful.

> +/* RMIO function definetion */

typeo "definition"

> +#define RMIO_UART1_TX			1
> +#define RMIO_UART1_RX			2
> +#define RMIO_UART2_TX			3
> +#define RMIO_UART2_RX			4
> +#define RMIO_UART3_TX			5


Thanks a lot
Heiko



