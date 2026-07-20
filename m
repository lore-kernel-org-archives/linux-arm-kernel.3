Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED391C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 06:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBtofq2dwkDOIwnJJ36YEL5yOid3HxsrtC6tPY9ePh0=; b=H1YhjBKHdwrSRDrYkbLbYdCVlt
	6gQifKNfNwq7kgpUsDLZ9f7SKnhCv28ejQE0tY5DxbHg/+oMX7Fckj+alLh6dqSj2+56RmCUuN3b5
	Xx7WUYir6AWjY6zpQO7neMmnpcvGawHdnPA1sB7Rvo1vCxC0Lx3FAvCYB+e6tMwDGdKZTICBT422t
	DGNrPqjPpQ4exolDue9LclZbWeTY6Zw73AnCwHcw7A6/F+Xel1WvCpbUh5HMUt3Wr1oIO2sBMyFgL
	E+n8bsjzzHDaA0J01VAPdimGnpRB5NnzI/MP2vEsZR0nRLzVDp75F706d99uL8hz7Nqq6rUbXddSI
	iG+TXdGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhUB-00000005xFg-18Dm;
	Mon, 20 Jul 2026 06:28:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhU9-00000005xFI-2yqx;
	Mon, 20 Jul 2026 06:28:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5FE5840A9B;
	Mon, 20 Jul 2026 06:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 123151F000E9;
	Mon, 20 Jul 2026 06:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784528897;
	bh=sBtofq2dwkDOIwnJJ36YEL5yOid3HxsrtC6tPY9ePh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GGjqX56gFt9uwd2dt4cVR/k7XySW2WBd9udKR8W3xIL1ky6nSbWz0V8GHIpN91XgV
	 OzcGvlX9xOigMAQwBHsaF1A7WPpsfNZNko9bbpnKh2C1U/GYoxlHHGz+m99SRzrxGs
	 sfsJfTTWO+kfE/7sBhXzKZYW2zMQie10IDIZxHdFrI7Nk4JEpvcaITvoBhAwTFAnTA
	 IwyAnfiZ5UE5v2+LI/38FHatY5xBg/ftbOnBbzumCUpT7ubz1Q06F/akkxKJ4v5df2
	 Dd8cp9LaXPHiYHR3gf0GOEugQKadtuV7NAA/Z8rC3EHrIArJ+hJWguhOWXWp2ebioK
	 WDyQlHxwYCAVg==
Date: Mon, 20 Jul 2026 08:28:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/7] dt-bindings: reset: Add reset controller
 constants for mt8167
Message-ID: <20260720-authentic-gleeful-asp-20bebd@quoll>
References: <20260717163959.714561-1-l.scorcia@gmail.com>
 <20260717163959.714561-5-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717163959.714561-5-l.scorcia@gmail.com>
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

On Fri, Jul 17, 2026 at 06:39:15PM +0200, Luca Leonardo Scorcia wrote:
> Add the various bits that identify watchdog and mmsys resets. IDs for
> mmsys resets restart from zero as they are used in a different device.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  .../reset/mediatek,mt8167-resets.h            | 53 +++++++++++++++++++

I do not see any user of this ABI nor explanation why you are doing it.

>  1 file changed, 53 insertions(+)
>  create mode 100644 include/dt-bindings/reset/mediatek,mt8167-resets.h
> 
> diff --git a/include/dt-bindings/reset/mediatek,mt8167-resets.h b/include/dt-bindings/reset/mediatek,mt8167-resets.h
> new file mode 100644
> index 000000000000..85d2d0e99c68
> --- /dev/null
> +++ b/include/dt-bindings/reset/mediatek,mt8167-resets.h
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
> +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8167
> +#define _DT_BINDINGS_RESET_CONTROLLER_MT8167
> +
> +/* TOPRGU resets, these are actual bits in the register */
> +#define MT8167_TOPRGU_DDRPHY_FLASH_RST		0
> +#define MT8167_TOPRGU_AUD_PAD_RST		1
> +#define MT8167_TOPRGU_MM_RST			2
> +#define MT8167_TOPRGU_MFG_RST			3
> +#define MT8167_TOPRGU_MDSYS_RST			4
> +#define MT8167_TOPRGU_CONN_RST			5
> +#define MT8167_TOPRGU_PAD2CAM_DIG_MIPI_RX_RST	6
> +#define MT8167_TOPRGU_DIG_MIPI_TX_RST		7
> +#define MT8167_TOPRGU_SPI_PAD_MACRO_RST		8
> +/* bit 9 is reserved, unused according to data sheet */

NAK, how driver can reserve something? Fix your driver.

This is ABI for Linux driver.

Best regards,
Krzysztof


