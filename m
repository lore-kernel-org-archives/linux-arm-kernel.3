Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4CEC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 08:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z0j1PVoZB6Ql7hiQyhj5xEKSpBifXanaUb/D+ARkh3U=; b=Myr1a9DJfwuPlRJ4Ip9LY2t6lE
	yMCBgrUgmkMSYWLeKlf62DKDM8Bfc8S28PfxPeOvrMWyqTqq20EtYkRZOhHywHUDcRmU/4SAkW7le
	wySonBmepFeqW5l+vbmPUT0loxRPPYqSiW0AemPP5r5PD4jmDmlogOQbIOiqbi+tbxPXe/GVZROpF
	Q19z0MnV0zUGvvlzlPy6XxKZ7/f0jFyKOgMt7Lg4/P0o39JMlfEUd3sMZ5WLN6iZHBdnCuRyMp5jQ
	TRPTJzA/Lakd1hhKy5TreFJYzB/Fg+quaIefLTZhfuDRu5Fe9WlAxXISIAop9r3WO0E4zfcK0w9Cg
	IQfJjcQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thPYp-0000000GjSB-02AG;
	Mon, 10 Feb 2025 08:54:35 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thPTK-0000000Ghx2-1l46;
	Mon, 10 Feb 2025 08:48:55 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1739177332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z0j1PVoZB6Ql7hiQyhj5xEKSpBifXanaUb/D+ARkh3U=;
	b=gTcXMdx4Inr6Zx9/s7Ch/swcker0C0Rw3/DnT3sassIr++zWUyzWXDsr+m1druPPQkrRk+
	JVzPWZwBUQ/0lLAZVr3O/IVTiqQV9X+3eTQbIMpDfh64aKCWdaBgRualv6ymr8lbcpuuun
	igqKiKXlu4Lwp0Rq/DICyDb3V3B/l2kWvGWPuelNRi8IcWzx0FRbFQajSaMS6PYaSVK09U
	505ZSPdwynIk9mtZt2WiF+PEC+rEVr5nQFF/uKLUuJ1KSpUsrR9RqJsE0CQN5mwARjY/8S
	H5vpydG+KF3npUo2t3+r8eVJReK5X0Kc2QU+0dVRaeqYU1qR0f2llJ1YHfwuKg==
Date: Mon, 10 Feb 2025 09:48:52 +0100
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
Subject: Re: [PATCH v5 2/4] arm64: dts: rockchip: add overlay test for Edgeble
 NCM6A
In-Reply-To: <20250207-pre-ict-jaguar-v5-2-a70819ea0692@cherry.de>
References: <20250207-pre-ict-jaguar-v5-0-a70819ea0692@cherry.de>
 <20250207-pre-ict-jaguar-v5-2-a70819ea0692@cherry.de>
Message-ID: <1b10875ed325a42b4cb0a66b3cf1c39b@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_004854_615917_C0A5C7BC 
X-CRM114-Status: GOOD (  13.88  )
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

On 2025-02-07 16:19, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> The Edgeble NCM6A can have WiFi modules connected and this is handled
> via an overlay (commit 951d6aaa37fe ("arm64: dts: rockchip: Add Edgeble
> NCM6A WiFi6 Overlay")).
> 
> In order to make sure the overlay is still valid in the future, let's
> add a validation test by applying the overlay on top of the main base
> at build time.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile
> b/arch/arm64/boot/dts/rockchip/Makefile
> index
> 534e70a649eeada7f9b6f12596b83f5c47b184b4..02f98abe1df10f44f2ac27ea5f6c6e6c6334724e
> 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -192,3 +192,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=
> rk3568-wolfvision-pf5-vz-2-uhd.dtb
>  rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb \
>  	rk3568-wolfvision-pf5-display-vz.dtbo \
>  	rk3568-wolfvision-pf5-io-expander.dtbo
> +
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
> +rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb \
> +	rk3588-edgeble-neu6a-wifi.dtbo

Looking good to me, thanks for the patch!  It was already discussed
and commented in detail in the v4 of this series, [*] so please feel
free to include:

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

[*] 
https://lore.kernel.org/linux-rockchip/a3b98e3d3a2571ee75e59418bb3b6960@manjaro.org/T/#u

