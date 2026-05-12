Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45CDCD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 13:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xnLTfDp68NkF+X3GgenzOQCUIlMmDDGlvtjzrPvr1ns=; b=aDpu+tVVsUvSwnfPDm/1urXJhp
	o6w296hptv2YV2g+SQAO0inFTvst34bUNTHDi9UHH8szHeYTHCGwpaUS+7InV26uTsQGEq4g1tG1O
	UkdtnE7+6w0rapQlb1bRXR8U2ECBR3itMCMZMoteegFuWffad08zn2idRqq0/d4scWGhe5+2NYgIq
	HVR3oRYcoTbFdIrcaHfc5+G0/4OguiXEwwc5aUjE61WvIE+XKe+6krDblwi9EatPLk/orm8yTmeeW
	aeSHdgGqBb4FzokZ1GFYVC30xr2LZNmdngPPWlVfVR0+ERdNHXULeSixj79NOPW0YaUvOJRT3e2vj
	jLJ/urFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnID-0000000GsH3-3u5G;
	Tue, 12 May 2026 13:37:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnIC-0000000GsGW-2lTG;
	Tue, 12 May 2026 13:37:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 06B8561338;
	Tue, 12 May 2026 13:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73AFC2BCB0;
	Tue, 12 May 2026 13:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778593019;
	bh=x32bCq5aJ+bGmDmdT/N1et7DubPIFjtOHl9ouElgZW4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=W5by0G01+CuK8d7NBzJ7Am772HxNBgv0MQ45OjkYM2HyR9uLFfPo5YZnaTf4XO95k
	 ljIJvsMUfBmWw4l2OUDAjzteHlDwoLKOUFmxQkajXJV7apqBn1rSDhbozuOjdX0Lw4
	 cOJ3xCgX495b0TvSaELMpDH0LSxT15WLzd5UFN96n2bQds6hSWbEU5cT5xOoSShfxM
	 QcHAdDivIYMJI26fwH4cBBu5uHu16pUmiAqAQt8rT02zkM3sXGGaWlHrrXinNBbpTM
	 ZepIwf1yL6aIsSGxxMH09Z/NWpistREYLPi0qUUCCsaJQoFDaQ1Pj84pWLtT/XH+XK
	 5391L+ROVUElw==
Date: Tue, 12 May 2026 14:36:46 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Cc: rva333@protonmail.com, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, "Rafael
 J. Wysocki" <rafael@kernel.org>, Daniel Lezcano
 <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
 <lukasz.luba@arm.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH v2 14/16] MAINTAINERS: add MediaTek mt6323 PMIC AUXADC
 driver maintainer
Message-ID: <20260512143646.15d0aa0e@jic23-huawei>
In-Reply-To: <20260512-mt6323-v2-14-3efcba579e88@protonmail.com>
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com>
	<20260512-mt6323-v2-14-3efcba579e88@protonmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 12 May 2026 08:18:28 +0300
Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org> wrote:

> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add myself as MediaTek mt6323 AUXADC driver maintainer.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>  MAINTAINERS | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d1cc0e12fe1f..52249c301633 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16337,6 +16337,11 @@ S:	Orphan
>  F:	Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
>  F:	drivers/mtd/nand/raw/mtk_*
>  
> +MEDIATEK PMIC AUXADC DRIVER

Given this is one of quite a few Mediatek PMIC drivers, you either
need to be more specific in that title or offer to handle them all.

> +M:	Roman Vivchar <rva333@protonmail.com>
> +S:	Odd Fixes
> +F:	drivers/iio/adc/mt6323-auxadc.c
> +
>  MEDIATEK PMIC LED DRIVER
>  M:	Sen Chu <sen.chu@mediatek.com>
>  M:	Sean Wang <sean.wang@mediatek.com>
> 


