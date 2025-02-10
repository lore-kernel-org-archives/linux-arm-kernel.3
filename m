Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AB1C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 08:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EbyDrglM88cnERsnPEsC1uH+yICet62b/Os+Sq28aDU=; b=mQ0eUn+Bzs1QsVymswHXQFPPj5
	ZSUu6OB8C31dDwQA8j0ebx5p00Mwx4Aa0/0cqpBgCzcNc0UYpHCRfbRWDPs0FrVRiZiCra5WGbRnK
	IoFDfYBoa8zGxIqma9zzIUgYW4goujedEQQiPOa51MXl6enViUEfM8LVabZXuwXKggmlZd0TJiYY1
	tTgV/a9Ple0geoSHqU3vf6aTUfYhYaKNN8oBkovYByYiznKq2TeZOUozeveo3CJtI/PmMPbtudYsB
	F+ysROAoDgpHTqk5Ft0VnfYVjliDyiXibKQi0ei1vOWgClRurrJRPlxZSRNPsrgwfjkftIBq2eypT
	Xpelv3vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thPTK-0000000GhxG-2ARP;
	Mon, 10 Feb 2025 08:48:54 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thPRI-0000000GhVU-3Yn9;
	Mon, 10 Feb 2025 08:46:50 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1739177206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EbyDrglM88cnERsnPEsC1uH+yICet62b/Os+Sq28aDU=;
	b=FT191uYwP/KCBqbxtSSCbsvFflWDIl/xKGmFRAFMLP6eu/VzM1JmnOQ12dNaONnmdu1i6C
	Nqeqz6ASOXJzGJM+UHPA7GbsC7PUZwC5glC+28iIV1fdmpYH5rAqklBDM9l7dbPya125oD
	Te+G1MfM7Fpsuv7AJco/Ow/jSwnsCMyHFOWeXeUVLh7JUa0dQqqfwBXqmsFhDiRXDSeI4M
	LnRtQGV+R876whudS0qA37NElNcG3QeMgnhqr719kysGvj85XGRKc2Vvnot0cjhMTTjtuf
	dG4ahi7DroA2teM7OGL/4275B4d390K0fJwls/6BmtY+VzeufXJ9aH97c8SvOQ==
Date: Mon, 10 Feb 2025 09:46:46 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jagan
 Teki <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>, Michael Riesch
 <michael.riesch@wolfvision.net>, Jonas Karlman <jonas@kwiboo.se>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Quentin
 Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v5 1/4] arm64: dts: rockchip: add overlay test for
 WolfVision PF5
In-Reply-To: <20250207-pre-ict-jaguar-v5-1-a70819ea0692@cherry.de>
References: <20250207-pre-ict-jaguar-v5-0-a70819ea0692@cherry.de>
 <20250207-pre-ict-jaguar-v5-1-a70819ea0692@cherry.de>
Message-ID: <ef9133d217bc35f611ef390da8042510@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_004649_179335_C9ACA795 
X-CRM114-Status: GOOD (  17.83  )
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

Hello Quentin,

Please see a few comments below.

On 2025-02-07 16:19, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> The WolfVision PF5 can have a PF5 Visualizer display and PF5 IO 
> Expander
> board connected to it. Therefore, let's generate an overlay test so the
> application of the two overlays are validated against the base DTB.
> 
> Suggested-by: Michael Riesch <michael.riesch@wolfvision.net>
> Reviewed-by: Michael Riesch <michael.riesch@wolfvision.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> 
> ---
>  arch/arm64/boot/dts/rockchip/Makefile | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile
> b/arch/arm64/boot/dts/rockchip/Makefile
> index
> def1222c1907eb16b23cff6d540174a4e897abc9..534e70a649eeada7f9b6f12596b83f5c47b184b4
> 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -170,3 +170,25 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += 
> rk3588s-orangepi-5.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-5b.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-rock-5a.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-rock-5c.dtb
> +
> +# Overlay application tests
> +#
> +# A .dtbo must have its own
> +#
> +#  dtb-$(CONFIG_ARCH_ROCKCHIP) += <overlay>.dtbo
> +#
> +# entry, and at least one overlay application test - ideally 
> reflecting how it
> +# will be used in real life -:

Hmm, what's "-:" actually doing in the line right above?  I mean,
it's a minor nitpick, so might be worth addressing only if there
will be the v6...  Also, "test - ideally" might be replaced by
"test, ideally", because splicing sentences together using em/en
dashes is generally frowned upon. :)

> +#
> +#  dtb-$(CONFIG_ARCH_ROCKCHIP) += <name of overlay application 
> test>.dtb
> +#  <name of overlay application test>-dtbs := <base>.dtb
> <overlay-1>.dtbo [<overlay-2>.dtbo ...]

As another minor nitpick, I'd suggest that

     "<name of overlay application test>.dtb"

is replaced with

     "<name-of-overlay-application-test>.dtb"

for the sake of consistency and, obviously, for clear indication of
the space characters not being applicable.  Regarding using "-" or "_"
characters there, perhaps we should follow what Git uses in its man
pages, which is the "-" character (see e.g. git-switch(1)).

> +#
> +# This will make the <base>.dtb have symbols (like when DTC_FLAGS has
> -@ passed)
> +# and generate a new DTB (<name of overlay application test>.dtb) 
> which is the
> +# result of the application of <overlay-1>.dtbo and other listed
> overlays on top
> +# of <base>.dtb.
> +
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-vz-2-uhd.dtb
> +rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb \
> +	rk3568-wolfvision-pf5-display-vz.dtbo \
> +	rk3568-wolfvision-pf5-io-expander.dtbo

Otherwise, it's looking good to me, thanks for the patch!  It was
already discussed and commented in detail in the v4 of this series, [*]
so please feel free to include:

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

[*] 
https://lore.kernel.org/linux-rockchip/a3b98e3d3a2571ee75e59418bb3b6960@manjaro.org/T/#u

