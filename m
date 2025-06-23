Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CFAC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 02:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DJqJRg+tAKS6sIw7hMcy1XA5cMlaU/ezlZrN9DgYPQA=; b=iAZ7qzaQMJ6AXtLk3vtlZlqxwS
	zSEOXyDU7gxCic76JUHFNevWUh+mDY6shaFq81DjHctMhXYxa5N3dLFVteWximSM7YoxFScp8Q/61
	2zCG5z+n4BSftxdrZ8NnkhHuxF8ufnoUtpQpLTGtY8k/kSy1J55YfpVQ5iTnw3F9FoPjp/UjYrPU+
	WN/jLdyur/O4sjBQXj9gB4Eq/EqLritu5AKnvC1rJflPh5Fi9IV0o/lNmHzeiMoFAt+Lisk1sCmu9
	AMRdjgtor5VjdIutRD2D5Ru22LxduAkiKVCKhBNs929CeTD2Uyl0HrJK6bQ/dHcA236Uz4RoiTcXe
	3n5vnS1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTX7l-00000001Ryg-0pbq;
	Mon, 23 Jun 2025 02:41:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTX5S-00000001RhM-00fW;
	Mon, 23 Jun 2025 02:39:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6456444288;
	Mon, 23 Jun 2025 02:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D2AC4CEE3;
	Mon, 23 Jun 2025 02:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750646348;
	bh=z+teoxeTAmCgQVzu+Jz6aydCP8vcrbY6GqWslL+3y8Y=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Yp/WX/XhrPBaXidYPuxT4pjPsfKN5DM2FB5pXmH5ptyaOSlk9l6RCDD4fXpV1vOLu
	 GkjqHgqjKgd9nA5DXGlmqvQ7itU4vwkCOxCmCHxPaWzGXgz5RSC5z3fX/EbJyD5M7t
	 7gA4nXAzScqT9zoaPVxTe4de7a9KhnlCMf3oTGgdwLraz2LWUDXu15rWLZ0AtYzFdu
	 qhlSd9x0iKJishocD+37JnAOFXFQR6FvMxd9JVjwLHo053zUc5/a4FZzuN/GXoH3F4
	 N0ZIIj7Wp8kwEz/Ns8MTKgVOtdVNAjVFRST3N85dqzO9nhv/FK1ep+1NjaWv6gdMjb
	 +hxHD83wIbArg==
Date: Sun, 22 Jun 2025 21:39:07 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Diederik de Haas <didi.debian@cknow.org>, Johan Jonker <jbx6244@gmail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>, 
 stable@vger.kernel.org, Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, 
 Dragan Simic <dsimic@manjaro.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Heiko Stuebner <heiko.stuebner@cherry.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Jakob Unterwurzacher <jakobunt@gmail.com>
In-Reply-To: <20250620113549.2900285-1-jakob.unterwurzacher@cherry.de>
References: <20250620113549.2900285-1-jakob.unterwurzacher@cherry.de>
Message-Id: <175064594664.881054.5188113186564000482.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: rockchip: use cs-gpios for spi1 on
 ringneck
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_193910_085522_D3676A69 
X-CRM114-Status: GOOD (  22.93  )
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


On Fri, 20 Jun 2025 13:35:46 +0200, Jakob Unterwurzacher wrote:
> From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
> 
> Hardware CS has a very slow rise time of about 6us,
> causing transmission errors when CS does not reach
> high between transaction.
> 
> It looks like it's not driven actively when transitioning
> from low to high but switched to input, so only the CPU
> pull-up pulls it high, slowly. Transitions from high to low
> are fast. On the oscilloscope, CS looks like an irregular sawtooth
> pattern like this:
>                          _____
>               ^         /     |
>       ^      /|        /      |
>      /|     / |       /       |
>     / |    /  |      /        |
> ___/  |___/   |_____/         |___
> 
> With cs-gpios we have a CS rise time of about 20ns, as it should be,
> and CS looks rectangular.
> 
> This fixes the data errors when running a flashcp loop against a
> m25p40 spi flash.
> 
> With the Rockchip 6.1 kernel we see the same slow rise time, but
> for some reason CS is always high for long enough to reach a solid
> high.
> 
> The RK3399 and RK3588 SoCs use the same SPI driver, so we also
> checked our "Puma" (RK3399) and "Tiger" (RK3588) boards.
> They do not have this problem. Hardware CS rise time is good.
> 
> Fixes: c484cf93f61b ("arm64: dts: rockchip: add PX30-µQ7 (Ringneck) SoM with Haikou baseboard")
> Cc: stable@vger.kernel.org
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> Signed-off-by: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
> ---
>  .../boot/dts/rockchip/px30-ringneck.dtsi      | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250619 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250620113549.2900285-1-jakob.unterwurzacher@cherry.de:

arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dtb: spi1: spi1-csn0-gpio: {'rockchip,pins': [[3, 9, 0, 150]], 'phandle': 87} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dtb: spi1: spi1-csn1-gpio: {'rockchip,pins': [[3, 10, 0, 150]], 'phandle': 88} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#






