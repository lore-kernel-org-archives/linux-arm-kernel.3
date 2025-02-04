Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B432C02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 11:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0rFwU8+gCEjDdXJtEJfGflM5ucC0PAuf7opUByCC9nM=; b=I44E+0MK5Tr7f6pwwbDqxKc/uw
	pzv+swxpRmpKUx+PYBRmBS56lf8tH83cdPRh6FtyDQWXJeQ6DpEMeYkvW39wdoKYCX0lqc+O/csAE
	gtitbdQdVFzWsGVTi7+acL35Bbkyy71+gN2DyFuU5VJetwVZ0qbzwpKEoRxD2Bbw9QmD5ScRM/VoZ
	BipFJRmQP/AWsHOJzhqxJOkGb5XwS74pfIb/Pz88RwFrgWbLE8955GG2VR4ma79RMXLZ8CnYgcZLC
	Wq+MTklupaQ6eEFPWTWAQEygvOpd3MvWuMeG2vmlReQl30cPWLH3yNlHfofECB0qaefq8ssWWOmNm
	D+x1BXWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHD3-00000000HRn-0PSS;
	Tue, 04 Feb 2025 11:35:17 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfH9b-00000000H9p-3PTI;
	Tue, 04 Feb 2025 11:31:45 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1738668702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0rFwU8+gCEjDdXJtEJfGflM5ucC0PAuf7opUByCC9nM=;
	b=V8PQztR5xcJdnhXb4kJEvkq8L/EIFTdhE5YQjOhV1UqtTYumzFEtWd6AezT8UZMulpnXjk
	vax9g1O9TR3hOF2aR86zTeBi+AyTtf3MtF7FGzjR6Z9HQQZZkprdi5yxSrcNDbweuIf2b/
	fq1tve4eEhOA4mkUdh7qMaaLD+i7/o5LmGVtbVCE9KpH5I0todAJaozzCKbIHqEInYWxjd
	B3qjTUyQXiG3enkpoMZ7QvG7StKum8kePuYDWS9EafIi6PlaDVWIcgWdmMXjBNKC+qlycc
	uAefijPS4eZ9Fr96/Oy1st1ZIzLag2VXPazfEOwtipFru4V4U9iwXgs0WPH9rA==
Date: Tue, 04 Feb 2025 12:31:42 +0100
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
Subject: Re: [PATCH v4 4/4] arm64: dts: rockchip: minimal support for Pre-ICT
 tester adapter for RK3588 Jaguar
In-Reply-To: <20250131-pre-ict-jaguar-v4-4-c971e2852e8d@cherry.de>
References: <20250131-pre-ict-jaguar-v4-0-c971e2852e8d@cherry.de>
 <20250131-pre-ict-jaguar-v4-4-c971e2852e8d@cherry.de>
Message-ID: <4306ab9764cc5ae5f89e1b71e18aa037@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_033143_995277_0B7878DB 
X-CRM114-Status: GOOD (  13.81  )
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

On 2025-01-31 11:40, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> The Pre-ICT tester adapter connects to RK3588 Jaguar SBC through its
> proprietary Mezzanine connector.
> 
> It exposes a PCIe Gen2 1x M.2 connector and two proprietary camera
> connectors. Support for the latter will come once the rest of the 
> camera
> stack is supported.
> 
> Additionally, the adapter loops some GPIOs together as well as route
> some GPIOs to power rails.
> 
> This adapter is used for manufacturing RK3588 Jaguar to be able to test
> the Mezzanine connector is properly soldered.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile              |   4 +
>  .../dts/rockchip/rk3588-jaguar-pre-ict-tester.dtso | 171 
> +++++++++++++++++++++
>  2 files changed, 175 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile
> b/arch/arm64/boot/dts/rockchip/Makefile
> index
> ebcd16ce976ebe56a98d9685228980cd1f2f180a..a09b9c0060f8ecde582ad39f0f3e27047a31ec9c
> 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -185,6 +185,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=
> rk3588-edgeble-neu6a-wifi.dtb
>  rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb \
>  	rk3588-edgeble-neu6a-wifi.dtbo
> 
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-pre-ict-tester.dtb
> +rk3588-jaguar-pre-ict-tester-dtbs := rk3588-jaguar.dtb \
> +	rk3588-jaguar-pre-ict-tester.dtbo
> +
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtb
>  rk3588-rock-5b-pcie-ep-dtbs := rk3588-rock-5b.dtb \
>  	rk3588-rock-5b-pcie-ep.dtbo

Obviously, virtually the same comments [*] I made on the patch 3/4
from this series apply here as well.

[*] 
https://lore.kernel.org/linux-rockchip/77b5d0efa6e56bb391575aeeb4d1be80@manjaro.org/

