Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1BCD12D50
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 20:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+zZU04tEj4EEZbENw6dSSfYen4JgG0xgFFzxeJ1MLUw=; b=Pkf7/UkGA/D6eyrfHM5IP+GgjL
	UMhUARqWcIhCtwEktmaOb2jN9OxsBKv7fnNZ1CROqggxzwwWt3X4IdDdrquPs+exTzrxYG5lES9SA
	bu233Mo5ggXiv2Rra9NBPY4chbdYNAu3zRS8rMh1Fqe7qxOwFtx7VSXggjbrcyosntMrAQV76DpOE
	Dw62/UrBnepeaLQaJfcUoXoIPX7kN4ih6NiUTeFS88uUU3oBOdoQllx+a7i1yH1sH/KSCazug6/ho
	b8dMyHw9Bhr04B/zH+W+DZP0Vqb0MqFCi/h8sEzOpbwJMy4/AUSVIIDHNojxj+FfHARuiWLrSFqg9
	yl2mEkUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAEGe-0000000FWO2-3CJN;
	Sun, 10 Nov 2024 20:10:40 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAEEt-0000000FWDS-1wsK;
	Sun, 10 Nov 2024 20:08:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+zZU04tEj4EEZbENw6dSSfYen4JgG0xgFFzxeJ1MLUw=; b=vCEufDANWeR1ag4PqdkTc97zxn
	OBMNW+Ra3cWADI+YjxE50WeJ/hpCXFOAU1cdZJGI6rPpmc4skY6zBTn4mcRYVvJzOwQ4aji7RW/xs
	0sDXTUPG99pGFNxWGsrbCxDQ+Ksv3L3uQaH7zWXRC8fgWkYPPHqfVMmT+Bt4boxmTblHYA3jU9ndY
	VkbtNUQAVnklm53In+hz5Ikmfrrb0Fd9ePgNVkTebPboHrYA+mqUl3uSbYjZqPaSNaqSevGG5pN5D
	msyoMVwMXMET9vYXNNNYuBkP4CGP8MAp5txbqkH/z7Mqln9cW3U3saHIyrM7LHjyt+eydjVoQLcC5
	EDlLADGw==;
Received: from i53875b28.versanet.de ([83.135.91.40] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tAEEp-0006cE-Rt; Sun, 10 Nov 2024 21:08:47 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org, Dragan Simic <dsimic@manjaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix vdd_gpu voltage constraints on
 PinePhone Pro
Date: Sun, 10 Nov 2024 21:08:47 +0100
Message-ID: <4386271.ejJDZkT8p0@diego>
In-Reply-To: <0718feb8e95344a0b615f61e6d909f6e105e3bf9.1731264205.git.dsimic@manjaro.org>
References: <0718feb8e95344a0b615f61e6d909f6e105e3bf9.1731264205.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_120851_563409_AB779A04 
X-CRM114-Status: GOOD (  25.49  )
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

Am Sonntag, 10. November 2024, 19:44:31 CET schrieb Dragan Simic:
> The regulator-{min,max}-microvolt values for the vdd_gpu regulator in the
> PinePhone Pro device dts file are too restrictive, which prevents the highest
> GPU OPP from being used, slowing the GPU down unnecessarily.  Let's fix that
> by making the regulator-{min,max}-microvolt values less strict, using the
> voltage range that the Silergy SYR838 chip used for the vdd_gpu regulator is
> actually capable of producing. [1][2]
> 
> This also eliminates the following error messages from the kernel log:
> 
>   core: _opp_supported_by_regulators: OPP minuV: 1100000 maxuV: 1150000, not supported by regulator
>   panfrost ff9a0000.gpu: _opp_add: OPP not supported by regulators (800000000)
> 
> These changes to the regulator-{min,max}-microvolt values make the PinePhone
> Pro device dts consistent with the dts files for other Rockchip RK3399-based
> boards and devices.  It's possible to be more strict here, by specifying the
> regulator-{min,max}-microvolt values that don't go outside of what the GPU
> actually may use, as the consumer of the vdd_gpu regulator, but those changes
> are left for a later directory-wide regulator cleanup.

With the Pinephone Pro using some sort of special-rk3399, how much of
"the soc variant cannot use the highest gpu opp" is in there, and just the
original implementation is wrong?

Did you run this on actual hardware?


Heiko


> Fixes: 78a21c7d5952 ("arm64: dts: rockchip: Add initial support for Pine64 PinePhone Pro")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> index 1a44582a49fb..956d64f5b271 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> @@ -410,8 +410,8 @@ vdd_gpu: regulator@41 {
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&vsel2_pin>;
>  		regulator-name = "vdd_gpu";
> -		regulator-min-microvolt = <875000>;
> -		regulator-max-microvolt = <975000>;
> +		regulator-min-microvolt = <712500>;
> +		regulator-max-microvolt = <1500000>;
>  		regulator-ramp-delay = <1000>;
>  		regulator-always-on;
>  		regulator-boot-on;
> 





