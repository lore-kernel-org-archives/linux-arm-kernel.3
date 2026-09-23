Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C340C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 11:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyK+IcTUChHsumA8eULVKP9qXuCRnB6OIFLdt3Xkw50=; b=bfINeD4FtQP9bbd8xh1gAKanh6
	zW761ptnI7xq+l7v9HWODUfYBS7miSrFj913MYEEc8/UTxj/D0IfGCo7k2uRllJ+PgC3ww0x+6F2r
	9NBT5uoTPfOsK7LwwDaqExw+vMq5/3gyVVbnKTVobHDY1RHTiMwIrXgAmwT0GZCYKLja/IU17+N2c
	tFvtTmyQu7eM/xqLrr0K3X1W/M09KAjJFjJaBgHdoPTsr2U/YbSgywTsFYd5tAUVfx2k66l3XoCVK
	WiriB6jSRmd10Q2yECyjK3zKUz4ECer1ipGoA3RWs5BVz6pAWBzX3HhvGQ1xMiA4MUPEfg4OTOOpO
	U8yvgQ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Lae-000000089jk-2BNX;
	Wed, 23 Sep 2026 11:56:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Lab-000000089iV-2RHS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 11:56:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D76E1570;
	Wed, 23 Sep 2026 04:56:36 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A689B3F86F;
	Wed, 23 Sep 2026 04:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790164599; bh=rfBvROneOxvFiFGA1DJHYz02QbgdSPyyiUbedPA58/4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=slGCOZi+UwC2ItMYCDjPlR0zxyhv95lkVs3mdKzmmuKYrXFxSqxMWGh9Nvul2kL+H
	 8DSvwROJ46G8k67OFvAD8ZwCbkC71YumjZiPPB2wavzbHNaoMug4Obhq1AMK9nIVcQ
	 X1J0fnGwzTXVTnu6mknf0huFgXz1U20XbPpDuiXc=
Message-ID: <d527ed43-1632-4460-b431-9711e8587004@arm.com>
Date: Wed, 23 Sep 2026 13:56:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: allwinner: h616: orangepi-zero2w: add
 24-pin expansion overlay
To: Vladimir <anykey196@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20260923112009.1062-1-anykey196@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260923112009.1062-1-anykey196@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_045641_715689_2BC8779C 
X-CRM114-Status: GOOD (  19.42  )
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

Hi Vladimir,

thanks for your patches, but please do not send new revisions that 
quickly! The kernel doc says to leave *at least* 24 hours between 
respins, but I would wait even longer: we are all humans, mostly 
hobbyists, so please give all the reviewers some time to have a look!

Thanks,
Andre

On 9/23/26 13:20, Vladimir wrote:
> The optional 24-pin expansion board carries two buttons on LRADC channel 0
> and an IR receiver.  Keep them out of the base board .dts: with the board
> detached the LRADC input and the IR receiver pin are not driven and float,
> which can produce phantom key presses and interrupt storms.
> 
> Provide them as a devicetree overlay instead, following the existing
> sun8i-orangepi-zero-interface-board.dtso approach.
> 
> Tested on: OrangePi Zero 2W (Allwinner H618) with the 24-pin expansion board.
> 
> Signed-off-by: Vladimir <anykey196@gmail.com>
> ---
>   arch/arm64/boot/dts/allwinner/Makefile        |  2 +
>   .../sun50i-h618-orangepi-zero2w-24pin.dtso    | 42 +++++++++++++++++++
>   2 files changed, 44 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w-24pin.dtso
> 
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> index d1f768dd646..e4576030276 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -57,6 +57,8 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-orangepi-zero2.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-x96-mate.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-longanpi-3h.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero2w.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero2w-24pin.dtb
> +sun50i-h618-orangepi-zero2w-24pin-dtbs := sun50i-h618-orangepi-zero2w.dtb sun50i-h618-orangepi-zero2w-24pin.dtbo
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero3.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-transpeed-8k618-t.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-yuzukihd-chameleon.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w-24pin.dtso b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w-24pin.dtso
> new file mode 100644
> index 00000000000..2d7e98e4b66
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w-24pin.dtso
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR X11)
> +/*
> + * Device tree overlay for the Orange Pi Zero 2W 24-pin expansion board.
> + *
> + * The expansion board provides two buttons wired to LRADC channel 0 and an
> + * IR receiver.  These are only present when the board is attached, so they
> + * are deliberately kept out of the base .dts: on a bare board the LRADC
> + * input and the IR receiver pin are not driven and float, which can cause
> + * phantom key presses and interrupt storms.
> + *
> + * Apply on top of:
> + *   arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/input/input.h>
> +
> +&lradc {
> +	vref-supply = <&reg_vcc3v3>;
> +	status = "okay";
> +	wakeup-source;
> +
> +	button-1000 {
> +		label = "KEY_1";
> +		linux,code = <KEY_1>;
> +		channel = <0>;
> +		voltage = <1000000>;
> +	};
> +
> +	button-1600 {
> +		label = "KEY_ENTER";
> +		linux,code = <KEY_ENTER>;
> +		channel = <0>;
> +		voltage = <1600000>;
> +	};
> +};
> +
> +&ir {
> +	status = "okay";
> +};


