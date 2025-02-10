Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FE1C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 08:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B79H1R61oCw4NxuugBEJsuBD9DKQfMNqY967OoXnNoM=; b=YPkuLexYnRtljnwZN0dC8PKtRj
	fEgKdivALDrCjHj3LSeyZct/ryNQCrHjbDq4G3yoSpd4Cirb8RHPjzo/fi+IlXtj6oLMx1ygdI7Ge
	oD2bGphOx6QzYmIbf0XuHlKeOYLj3n7mXaf/0gqTbW6MrfwpQ2Y/AzIS5pvbLXkL+MbnHTTYzYPNH
	cHZqn86uIJeVU/Wpq6FCbp5uii8uj8na6TaM7NvTQwEI0MZAf9KSBs35R9o1bQBCfb9oLyWrOfAc2
	1QR9Xbn5g4PLE6rvuSK+U5EmBmvADet3lyCq+a0ThRzp4x+lplGB6tYdxlNpyUGWCu9hGuEI6VZts
	lp8rQ5mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thPbX-0000000Gjv9-2x19;
	Mon, 10 Feb 2025 08:57:23 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thPUM-0000000GiAR-1njH;
	Mon, 10 Feb 2025 08:49:59 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1739177396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B79H1R61oCw4NxuugBEJsuBD9DKQfMNqY967OoXnNoM=;
	b=apK48Z2KD7nszxtxErgLqwgEi+u7UGYAoEYij+0rfYm+e3gpvfskVtACBWuzwTEYgckVeP
	Hn6m11CA+hcvNMHyvvlc2MeTDy0jzR/5/iIFarkW+eykEh2dsU8TgfMRyv076BXg53AgD1
	44A1biG4oOdkXtjXs1XfhGXmM4UYxGh50LW7KlPXZBj/tWGPspbo8kWRCstNx5PGBOleiU
	9jycWpdbzzHVa+mRGPMJgYBMk6r7HGMr9Gue8KJtnL80/kFLjy4yfA1DmUk4pxzR0b46O1
	oMN1Ox0PSoj99ylwOVQsPWo4APzCXbnztldvtOLMoKxsyL8C4aDEBQ8XnAJSYA==
Date: Mon, 10 Feb 2025 09:49:56 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jagan
 Teki <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>, Michael Riesch
 <michael.riesch@wolfvision.net>, Jonas Karlman <jonas@kwiboo.se>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Quentin
 Schulz <quentin.schulz@cherry.de>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 3/4] arm64: dts: rockchip: add overlay tests for Rock
 5B PCIe overlays
In-Reply-To: <20250207-pre-ict-jaguar-v5-3-a70819ea0692@cherry.de>
References: <20250207-pre-ict-jaguar-v5-0-a70819ea0692@cherry.de>
 <20250207-pre-ict-jaguar-v5-3-a70819ea0692@cherry.de>
Message-ID: <adbb6ac05bd21ab7be9bec664587469b@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_004958_756522_CCFCE51A 
X-CRM114-Status: GOOD (  15.61  )
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

On 2025-02-07 16:20, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> According to commit 40658534756f ("arm64: dts: rockchip: Add rock5b
> overlays for PCIe endpoint mode"), Rock 5B can operate in PCIe endpoint
> mode. For that to work, the rk3588-rock-5b-pcie-ep.dtbo overlay needs 
> to
> be applied on Rock 5B base Device Tree. If that Rock 5B is connected to
> another Rock 5B, the latter needs to apply the
> rk3588-rock-5b-pcie-srns.dtbo overlay.
> 
> In order to make sure the overlays are still valid in the future, let's
> add a validation test by applying the overlays on top of the main base
> at build time.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile
> b/arch/arm64/boot/dts/rockchip/Makefile
> index
> 02f98abe1df10f44f2ac27ea5f6c6e6c6334724e..8f93e0c4d6032d0ca2d93f44384c027e53aa5efb
> 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -196,3 +196,11 @@ rk3568-wolfvision-pf5-vz-2-uhd-dtbs :=
> rk3568-wolfvision-pf5.dtb \
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
>  rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb \
>  	rk3588-edgeble-neu6a-wifi.dtbo
> +
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtb
> +rk3588-rock-5b-pcie-ep-dtbs := rk3588-rock-5b.dtb \
> +	rk3588-rock-5b-pcie-ep.dtbo
> +
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-srns.dtb
> +rk3588-rock-5b-pcie-srns-dtbs := rk3588-rock-5b.dtb \
> +	rk3588-rock-5b-pcie-srns.dtbo

Looking good to me, thanks for the patch!  The employed approach was
already discussed and commented in detail in the v4 of this series, [*]
so please feel free to include:

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

[*] 
https://lore.kernel.org/linux-rockchip/a3b98e3d3a2571ee75e59418bb3b6960@manjaro.org/T/#u

