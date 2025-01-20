Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4EAC02182
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 20:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5LWDDl4PPvpx+DyyaGnR82rDJrKyrO2HYvJ/Dnc9Vg=; b=s9o4iCIhugq1D9ZBS14hH/0/MG
	w1NVZ7ryV2yoz7dpueYX12UFJpKYdbECHGAF+Sl0H/Gaip/gcJC0Il1mYxvn7+QENjCA6/lvkfsoY
	OLgsCWVvEVEK3nU+V9+9FSVYe9H+wEND37dVLXlPsBns2330njvwdUZJdNhLtt89BAuJFlolEwop0
	dqDUbODXP6ZjW3JwQCxqePFTc7AQXBHiyv1VBbdAK61EwZKEVDybeKfKIexuYcYRlZhDNI0nzjXXd
	6SMdR+iHvZyotm7khfxh+9taJL29mjAMnwkzQlwYPz9k32/ezBp7DehbFBfaxpIpnW0eKmnUMtSIx
	vDmHYXKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZy6e-00000006NQg-21Ep;
	Mon, 20 Jan 2025 20:10:44 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZy4s-00000006NCJ-01Tv;
	Mon, 20 Jan 2025 20:08:55 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1737403729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B5LWDDl4PPvpx+DyyaGnR82rDJrKyrO2HYvJ/Dnc9Vg=;
	b=BEEbpAmBNhrMLzjqxTQacisW+dgpo9N4pv0eow9Q5VAAlkfnChxlYyvcCnhktLK+S6PFHJ
	MoaZx2s8G3Hj9Hh/A91BTi/XwxnYR4NmhnCB2/bnYSp4am8IOn+B+PUbseK2SLHCiNgQzP
	dnkyQxGz1qscyExWgImDMEWUui2rpx/VDWJ4JlUJlKh1zUsaQH3EitrJp5dgoXHdKQciCo
	e/8PO2alpHNuwpt7WEXpfRG5cR1Mx/C4Zj75nGZQ/p/Wtv/X/7VGhmF60+uteBfTTbVjzl
	/EzofxCcemaJWy0hWKqSjeAyCo4Ezo5Tbc1wERume3U5P0bxioPKz4n9PJN3DA==
Date: Mon, 20 Jan 2025 21:08:49 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: Add finer-grained PWM states
 for the fan on Rock 5C
In-Reply-To: <20250120-rock-5c-fan-v1-1-5fb8446c981b@gmail.com>
References: <20250120-rock-5c-fan-v1-0-5fb8446c981b@gmail.com>
 <20250120-rock-5c-fan-v1-1-5fb8446c981b@gmail.com>
Message-ID: <f9c97005f74f906bc724ae8cda5f7ead@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_120854_203462_CCE4EA40 
X-CRM114-Status: GOOD (  15.93  )
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

Hello Alexey,

On 2025-01-20 20:22, Alexey Charkov wrote:
> Radxa Heatsink 6540B, which is the official cooling accessory for the
> Rock 5C board, includes a small 5V fan, which in my testing spins up
> reliably at a PWM setting of 24 (out of 255). It is also quite loud
> at the current minimum setting of 64, and noticeably less so at 24.
> 
> Introduce two intermediate PWM states at the lower end of the fan's
> operating range to enable better balance between noise and cooling.
> 
> Note further that, in my testing, having the fan run at 44 is enough
> to keep the system from thermal throttling with sustained 100% load
> on its 8 CPU cores (in 22C ambient temperature and no case)
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>

Thanks for the patch, it's looking good to me and the explanations
are fine.  Please, feel free to include

Acked-by: Dragan Simic <dsimic@manjaro.org>

> ---
>  arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
> b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
> index
> 9b14d5383cdc16947c955b1c6e2a32a50c5df3e6..1b66a69cf0f8795d7305852fa7fef3d0672ada7f
> 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
> @@ -71,7 +71,7 @@ led-1 {
>  	fan {
>  		compatible = "pwm-fan";
>  		#cooling-cells = <2>;
> -		cooling-levels = <0 64 128 192 255>;
> +		cooling-levels = <0 24 44 64 128 192 255>;
>  		fan-supply = <&vcc_5v0>;
>  		pwms = <&pwm3 0 10000 0>;
>  	};

