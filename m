Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30839CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 13:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgebzlHOgKww8KoR7JfCk9TSHj2ZL15PIyYaaUgaZKo=; b=R/ONcjQAlZALpaWh56D/wnssgu
	CTNJGjD7rmoJughFjBKc52PUxohi75Xjg/XZdBqRcwTL8DQKkhYpRhFLGu7sayPWjUJKeld//ibBs
	AtkHwy17gh9UYSsRignPOZxIc3sI/ChNPO7n8HnmAXM8dkDUWvAIGKJlOQ3AQclUs3iVqRjdih0JK
	xNIAC/8iTtXlGGkB4AdbgQ+qcqyieuhQO016wwT/mOu+mn3JbdLNLOglanwaPkmEw808K3vQDjXPg
	a+HZkXU9yAexEHnpwA/9w2vMb+W5hyIHYeHmqNdr4rpjG0kBQDXMAEFdMFkpHdL5qIQ/LFuSsFWxO
	qHmNjjjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upoOI-00000004o3t-1dpI;
	Sat, 23 Aug 2025 13:34:42 +0000
Received: from vps.xff.cz ([195.181.215.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upoLB-00000004nve-2VBs;
	Sat, 23 Aug 2025 13:31:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1755955885; bh=xD2qXS1OqnfB4ixy8P2YWslAr2PFZXWLVpd7ffyzsoE=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=oj1ZnTEfJLanuyfTM903xQPlU1Q1ZxAOk61DCfYlJ81rLe+UCgVorD+rNBM0WSbY3
	 iCFG1hYq5ahEN1wheZwwBpTatA1fO5PoMtm6H5MiTM7rYTIZ3hUd2KxN27T02sSdz0
	 4KrouToU9aj5/NKGP7IQl9VzsD7SrnuR08gHdHA8=
Date: Sat, 23 Aug 2025 15:31:24 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: maud_spierings@hotmail.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Fix the headphone detection on
 the orangepi 5 plus
Message-ID: <q47mi7iyx4nu3tkrtsjrghlultm3kj4zz73uekffalm2vwjck7@btiiymy6fohy>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	maud_spierings@hotmail.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20250823-orangepi5-v1-0-ae77dd0e06d7@hotmail.com>
 <20250823-orangepi5-v1-1-ae77dd0e06d7@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250823-orangepi5-v1-1-ae77dd0e06d7@hotmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_063130_076413_BECF00DB 
X-CRM114-Status: GOOD (  18.32  )
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

Hello Maud,

On Sat, Aug 23, 2025 at 02:43:50PM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> The logic of the headphone detect pin seems to be inverted, with this
> change headphones actually output sound when plugged in.
> 
> Verified by checking /sys/kernel/debug/gpio and by listening.

This can also be tested by:

  evtest /dev/input/by-path/platform-sound-event

Which shows inverted output without this patch.

Reviewed-by: Ondřej Jirman <megi@xff.cz>


> Fixes: 236d225e1ee7 ("arm64: dts: rockchip: Add board device tree for rk3588-orangepi-5-plus")
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---
> There was a big change at some point so it will take some effor to port
> it back that far.
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> index 121e4d1c3fa5dab0d08edf7cba692a765b48f7b4..8222f1fae8fadc5cbb4ef16b3db5ed975ed43915 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> @@ -77,7 +77,7 @@ &analog_sound {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&hp_detect>;
>  	simple-audio-card,aux-devs = <&speaker_amp>, <&headphone_amp>;
> -	simple-audio-card,hp-det-gpios = <&gpio1 RK_PD3 GPIO_ACTIVE_LOW>;
> +	simple-audio-card,hp-det-gpios = <&gpio1 RK_PD3 GPIO_ACTIVE_HIGH>;
>  	simple-audio-card,widgets =
>  		"Microphone", "Onboard Microphone",
>  		"Microphone", "Microphone Jack",
> 
> -- 
> 2.50.1
> 
> 

