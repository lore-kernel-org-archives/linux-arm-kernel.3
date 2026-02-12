Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DA7EB4908
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 11:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3u71o9+gjx4gDREbmK/ejCD1GTu6ug1adMAuyh55ag0=; b=faX9uR6xHr7GqDD7Acy/gVOj/Z
	iElW3jlceDmFaTcL9K0PeN8NczezWdKVp7zzuyGQGbrH66yhmCXxRavK9p7TfQg4AE43X4tmw5hsL
	OJ2XIdudbesXrvUSVCBSGLAJ7hCF88NSEuXjSdRQmuslYjhSxDGJZEoA9uE4ja9+wJqU8OE21vKpF
	pVJHsNgS1GayE1EZgANhPyqT8MWKxgsdrvg10CTqmqBTjojQbuthmx0rbAps26yr+06laTFiLUjvu
	gos4/sBApWfRfwS3Tq479mPEHc5daFUZovr6RhVRzkth+8ItSLDpqmVcdTQbUj6UE35yESvTYJFm9
	ETjqLUag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqUzz-000000020Q5-3DvV;
	Thu, 12 Feb 2026 11:36:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqUzx-000000020Pw-3mwt;
	Thu, 12 Feb 2026 11:36:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E2EE260010;
	Thu, 12 Feb 2026 11:36:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DD4CC4CEF7;
	Thu, 12 Feb 2026 11:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770896200;
	bh=B7E4+IAOzH/2D5RDt46LA2shT8s88ZGClPoLwMfqKVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=onv/610iuyirRHWcjNQxEpoFtb2tG/OldRjeF13iWIlAN+LmioJSYrBHP0ix/6jzZ
	 7MsAaN+D7mkmzbdewJkWvtuwzN5Cn6Rk8QjTLWmKmrNCbxlt64qOtF33f8POph72/I
	 J5S54oE8ik9nDF5hG/AaXMEVVEgwZZ5tjOwPE6r2KanPdWqhU1LZiEJHYDB+FqFZxs
	 bh+wpJaeBKGbthATACyYD0PlGJBV0IhLBl2QIG2WM1QW0p0Uv/v3OtiJM61grFw4Ym
	 N2Lw/vaJx3CzTmv8COC6FdYeMteKwIHayOqH3GgKDKypD+d2Cp9Rje2wt+azAJQUCK
	 L9Hgax3pfVwWw==
Date: Thu, 12 Feb 2026 12:36:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/7] dt-bindings: mediatek: Add reset controller
 constants for mt8167
Message-ID: <20260212-offbeat-strong-gopher-5faeda@quoll>
References: <cover.1770836189.git.l.scorcia@gmail.com>
 <4786b688175eed89b899bdfd7e72505cafd7c3b0.1770836190.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4786b688175eed89b899bdfd7e72505cafd7c3b0.1770836190.git.l.scorcia@gmail.com>
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

On Wed, Feb 11, 2026 at 07:03:23PM +0000, Luca Leonardo Scorcia wrote:
> This file comes from the Lenovo Smart Clock kernel sources.
> 

Where is the actual binding? Why is this separate file?

> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  include/dt-bindings/reset/mt8167-resets.h | 38 +++++++++++++++++++++++

Filename matching compatible,

>  1 file changed, 38 insertions(+)
>  create mode 100644 include/dt-bindings/reset/mt8167-resets.h
> 
> diff --git a/include/dt-bindings/reset/mt8167-resets.h b/include/dt-bindings/reset/mt8167-resets.h
> new file mode 100644
> index 000000000000..f77c2ca897cf
> --- /dev/null
> +++ b/include/dt-bindings/reset/mt8167-resets.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.

Drop boiler plate. It is not even correct - conflicts SPDX which leads
to another point - you need copyright owners agreement to relicense the
code.

Just write new one, instead of sending us 2015 old code.



> + */
> +
> +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8167
> +#define _DT_BINDINGS_RESET_CONTROLLER_MT8167
> +
> +/* TOPRGU resets */
> +#define MT8167_TOPRGU_DDRPHY_FLASH_RST		0 /* reset ddrphy and flash pad macro */
> +#define MT8167_TOPRGU_AUD_PAD_RST		1 /* Write 1 to reset audio_tdm_in_pad,audio_tdm_pad,audio_fifo */
> +#define MT8167_TOPRGU_MM_RST			2 /* Write 1 to reset MMSYS */
> +#define MT8167_TOPRGU_MFG_RST			3 /* Write 1 to reset MFG */
> +#define MT8167_TOPRGU_MDSYS_RST			4 /* Write 1 to reset INFRA_AO */
> +#define MT8167_TOPRGU_CONN_RST			5 /* Write 1 to reset CONNSYS WDT reset */
> +#define MT8167_TOPRGU_PAD2CAM_DIG_MIPI_RX_RST	6 /* Write 1 to reset MM and its related pad macro(DPI,MIPI_CFG,MIPI_TX) */
> +#define MT8167_TOPRGU_DIG_MIPI_TX_RST		7 /* Write 1 to reset digi_mipi_tx */
> +#define MT8167_TOPRGU_SPI_PAD_MACRO_RST		8 /* Write 1 to reset SPI_PAD_MACRO */
> +#define MT8167_TOPRGU_APMIXED_RST		10 /* Write 1 to reset APMIXEDSYS */
> +#define MT8167_TOPRGU_VDEC_RST			11 /* Write 1 to reset VDEC module */
> +#define MT8167_TOPRGU_CONN_MCU_RST		12 /* Write 1 to reset CONNSYS */
> +#define MT8167_TOPRGU_EFUSE_RST			13 /* Write 1 to reset efuse */
> +#define MT8167_TOPRGU_PWRAP_SPICTL_RST		14 /* Write 1 to reset pwrap_spictl module */
> +#define MT8167_TOPRGU_SW_RST_NUM		15
> +
> +/* MMSYS resets */
> +#define MT8167_MMSYS_SW0_RST_B_DISP_DSI0	22

Nope, It's 16. IDs increment by 1.

Best regards,
Krzysztof


