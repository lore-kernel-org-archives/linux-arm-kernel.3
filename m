Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06D3C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WyyxfZ8er5WqZOvIZ6mxo74JK7+5Nk5jVOc6g/QyEzY=; b=kZOgsgICd20x2QwtO+SlvFCv2Q
	4mceJ/0I+HlQUwBrmBW8BNHl4xUmOl1qHlYu6iOBqhsVpT7VdpxwEvboznYidVnIayhi4JT7TkIZO
	U8Jeb93gHYkZpHDjONtzG6l2lFEuXkMp7le4bIgmMfkShsYfc60evbUKAvn1SZJD1QMcSWOOYVEPT
	q3tqUYbKEe0b2g1ENV7e5ijRp69bhgCd+9ORJ65+zfPYMXRcfWhPco1SWw8uC5ToUVK3dy9IdPns1
	u7RqPVwbdnMUP5eUsQ8p6zTIcP0gvwUwSF3lJWdBl5Ms38lGYZDB3aLW7V4AbWZWdW/UvtVBhZMQ4
	eEPXv5IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxyh-00000000IOj-2oQz;
	Tue, 25 Feb 2025 16:40:15 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmvsj-0000000HWVp-3qVx;
	Tue, 25 Feb 2025 14:25:59 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1740493553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WyyxfZ8er5WqZOvIZ6mxo74JK7+5Nk5jVOc6g/QyEzY=;
	b=Z1X26bi7ygLBS3+YP89D2JR7/QWR7eXXN3q1RGtCQ3+EEEyHxoYQpXbp52wPDrgNXaWacW
	Ounh1eXsGBBwxBLd/7Di5n93VbT9HhQvf9jl6Vim2qNKGD88nD/ML295fQfTRkhorE6Uh1
	y9/DreYBRT9Ekl/916EWFharGXpsOWZAg8lKC7+bIk95ZpLm9A2QquEqUmFbsIvtuqNN1C
	4ZcGeWx8hn/TuKWiLzmG9cjzglaqrwc+FI0Mp947mgR3+gwUWye4wIzhBT3xLoaC/9pm3l
	jLiZSSPJRpbr5cs+7oCYYjNE6rHgNRvYE+JeSFarEusZ3TABB7gKfJhq1GWuSg==
Date: Tue, 25 Feb 2025 15:25:52 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Justin Klaassen <justin@tidylabs.net>
Cc: Tianling Shen <cnsztl@gmail.com>, Kever Yang
 <kever.yang@rock-chips.com>, Johan Jonker <jbx6244@gmail.com>, Heiko
 Stuebner <heiko@sntech.de>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: fix u2phy1_host status for NanoPi
 R4S
In-Reply-To: <20250224170925.39126-1-justin@tidylabs.net>
References: <20250224170925.39126-1-justin@tidylabs.net>
Message-ID: <48c705e65cc8e8d4716b41a4a87170e3@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_062558_109142_A48429DA 
X-CRM114-Status: GOOD (  17.42  )
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

Hello Justin,

Thanks for the patch!  Please, see a few comments below.

On 2025-02-24 18:09, Justin Klaassen wrote:
> The u2phy1_host should always have the same status as usb_host1_ehci,
> otherwise the ehci driver may be initialized for a disabled usb port.
> 
> Signed-off-by: Justin Klaassen <justin@tidylabs.net>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi
> index b1c9bd0e63ef..8d94d9f91a5c 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi
> @@ -115,7 +115,7 @@ &u2phy0_host {
>  };
> 
>  &u2phy1_host {
> -	status = "disabled";
> +	phy-supply = <&vdd_5v>;
>  };
> 
>  &uart0 {

Indeed, the rk3399-nanopi4.dtsi file, which rk3399-nanopi-r4s.dtsi
extends, enables u2phy1_host, usb_host1_ehci and usb_host1_ohci,
so disabling u2phy1_host in rk3399-nanopi-r4s.dtsi makes no sense.

After checking the NanoPi R4S schematic, I can confirm that the
phy-supply references the right regulator.  There are some strange
things in the schematic, but they're unrelated to this patch.

However, there should be a v2 of this patch with the proper Fixes
and CC: stable tags, so this bugfix also gets propagated into the
long-term kernels.  Please, feel free to also include

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

