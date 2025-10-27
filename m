Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2BCCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 12:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9l+O8Cn033vdhfQtmVOcje9Sy5o5CsCO4goYYK7Gts=; b=QcwpVEdGcgIXD+mg3xgVOoxGPt
	1sUi63Izlu7WNZmS9AX8DJY1SxDQUuOl1DgVh9gsQAiMnSxg/wT8ysc6Ywsl6F1vPlCI9OGfEvvIl
	KXNf7QZsrSQU+k85Ea3b1qbRrpGKrE9F1aoIP8jtQ2k9UvH2DRIfFNsa3GZVSvr+9zn/eAOxDk2zK
	4rbCd8siwFg5onWY0iIWTvfHOZMefGW4rK/1dOX9LAkZre684VpyirnwbM4Lom38usmNi8gyPZBZ/
	b2Df8OMby1elx9d1lVD/Iyz5TjrmsiGeFqMFLQvnRheHizITiakkKd3ETgJMDQGXM8Lo2ljFREBN9
	wMvvMMig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMVC-0000000DupZ-2LM0;
	Mon, 27 Oct 2025 12:39:10 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMVA-0000000Dunp-0BPf;
	Mon, 27 Oct 2025 12:39:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761568743;
	bh=ic23nmo9lgfOG3Z3HGilbKWoY/RcEgbzf3VPutvzob4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N6vRJVhaiEkHsez1pDm7qCVveefUoUXgEwiGf0Hxl/Jf0HRoQKn9Iz+MbCPsaNHi+
	 T5w/5RNIA0FQL4WRZ+dafcRIwodzJtXuHu1V1EWkoea7alkWmyfDnPF/00R6D4AuFo
	 qkZlGaWVPQOQVfrq85FPJtr4ARCt5g7hMvVo8vJ5aG+vokYy47F4V+SVwWQiwGBQOX
	 8LyTUKxSk9RxiOXVfCjlJaHDVz8cU/2Yx5PO0dQmI0xcKalAaieCzpcfdSWJcKIOgo
	 2l8VGGa6BttkTBLzoa4bOgekD2KXUpRrSikDo5xQrJ6MEDinPsIgiVu5DJ0KNlrP8v
	 ggOd7pxr9D1hg==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6B23017E0927;
	Mon, 27 Oct 2025 13:39:03 +0100 (CET)
Message-ID: <1499f50e-aa4f-454a-b8b5-c9a21bef7f72@collabora.com>
Date: Mon, 27 Oct 2025 13:39:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: orangepi-5: fix PCIe 3.3V regulator
 voltage
To: Mykola Kvach <xakep.amatop@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Cenk Uluisik <cenk.uluisik@googlemail.com>, Johan Jonker <jbx6244@gmail.com>
Cc: Jimmy Hon <honyuenkwun@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Muhammed Efe Cetin <efectn@6tel.net>
References: <20251024173830.49211-1-xakep.amatop@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20251024173830.49211-1-xakep.amatop@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_053908_266876_8525C604 
X-CRM114-Status: GOOD (  15.88  )
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

Hi Mykola,

Thanks for your patch.

Cc: Muhammed who is the author of commit b6bc755d806e

On 10/24/25 19:38, Mykola Kvach wrote:
> The vcc3v3_pcie20 fixed regulator powers the PCIe device-side 3.3V
> rail for pcie2x1l2 via vpcie3v3-supply. The DTS mistakenly set its
> regulator-min/max-microvolt to 1800000. Correct both to 3300000
> to match the rail name, the PCIe/M.2 power requirement, and the
> actual hardware wiring on Orange Pi 5.
> 

I guess a "Fixes" tag is in order here:

Fixes: b6bc755d806e ("arm64: dts: rockchip: Add Orange Pi 5")

And make sure to Cc: <stable@vger.kernel.org>

> Signed-off-by: Mykola Kvach <xakep.amatop@gmail.com>

The change itself makes sense to me.

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
> index ad6d04793b0a..83b9b6645a1e 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
> @@ -14,8 +14,8 @@ vcc3v3_pcie20: regulator-vcc3v3-pcie20 {
>  		gpios = <&gpio0 RK_PC5 GPIO_ACTIVE_HIGH>;
>  		regulator-name = "vcc3v3_pcie20";
>  		regulator-boot-on;
> -		regulator-min-microvolt = <1800000>;
> -		regulator-max-microvolt = <1800000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
>  		startup-delay-us = <50000>;
>  		vin-supply = <&vcc5v0_sys>;
>  	};


