Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA310D30CC5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 21:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+L7X3cUCfbKyHNGNuBzIG5ImCN8IruiY2ibV0AQBwRI=; b=gEDERWYPmQgltjCyxZug/eNWyX
	hyyBOYWyz95pniYfUtXJN6zFnl8QJaGVXDTSpvyBfhdfxHLiTDoLa7S1+06sYsxEnnWUN6FLhT9QN
	I9s7X8LKBUSQAoZyr8A6b20BYR1/tUFxeM5TS8/+zOwExI+5bOanIqlMkg6whldG30tdX/mOB8YO6
	huDSuxWxXQpQrhjWsa6N7AUswLxTUyo1i5+OtT3OOTE5d4bhRszZurcmDErealdCo10XeRcYOIQP/
	cdolvIHrl2wHKHvgUirbVhKMLBi66RZJeLpzPI2UG3UDpVMh9gOH3bo1559zf68Klnmp8LmUMqbOD
	39Li3R6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vflqq-00000007kCI-1O4u;
	Tue, 13 Jan 2026 21:22:56 +0000
Received: from vps.xff.cz ([195.181.215.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vflqm-00000007kBl-28kr;
	Tue, 13 Jan 2026 21:22:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1768339369; bh=Op0uamfeLyB3wX8fzuuz2awjdvaakOqefNAePnLsAu4=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=rBZ+dHU4g7jRvLFCk29jMddcSvXG3zd26NaCZBxXwg20pVqVlcD+fJDyT8QIHyRKm
	 IMboeluLxeeWx5EaL+IaZ8yvjoUEF/5J3TCC8aZCT1/NTiPjtfgUCAZnxll8V2g3aP
	 SQLjiRjcGvkRJKE5KNz7IeJQvqpMWTh7kWp+8Ulo=
Date: Tue, 13 Jan 2026 22:22:48 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: guptarud@gmail.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Martijn Braam <martijn@brixit.nl>, Kamil =?utf-8?Q?Trzci=C5=84ski?= <ayufan@ayufan.eu>
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Remove interrupt GPIO for WiFi
 for the Pinephone Pro
Message-ID: <4upnfpxyn4mfxqsg6cl2a3tjpqwrwfdg3a3233ozwoaqrmjjpp@hh4zvr625lrp>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	guptarud@gmail.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Martijn Braam <martijn@brixit.nl>, Kamil =?utf-8?Q?Trzci=C5=84ski?= <ayufan@ayufan.eu>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20260112-ppp_connectivity-v1-0-284d6e83b212@gmail.com>
 <20260112-ppp_connectivity-v1-3-284d6e83b212@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260112-ppp_connectivity-v1-3-284d6e83b212@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_132253_003945_9097292E 
X-CRM114-Status: GOOD (  17.90  )
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

Hi Rudraksha,

On Mon, Jan 12, 2026 at 10:42:26PM -0800, Rudraksha Gupta via B4 Relay wrote:
> From: Ondrej Jirman <megi@xff.cz>
> 
> Wifi is currently unusable if interrupts are defined. Let's remove them
> so that Wifi networks are actually discoverable.
> 
> Co-developed-by: Martijn Braam <martijn@brixit.nl>
> Signed-off-by: Martijn Braam <martijn@brixit.nl>
> Co-developed-by: Kamil Trzciński <ayufan@ayufan.eu>
> Signed-off-by: Kamil Trzciński <ayufan@ayufan.eu>

^^ these lines are incorrect and the patch is not meant for upstreaming, really.

I think whether OOB interrupts work or not on PPP may be a function of
what FW and firmware config file is used. 

So eg. in brcmfmac43455-sdio.pine64,pinephone-pro.txt you can have settings
like:

# OOB IRQ settings -- next 3 "sd" parameters uncommented for OOB IRQ. Edge sensitive interrupt via WL_HOST_WAKE line.
#muxenab=0x10
#sd_gpout=0
#sd_oobonly=1
#sd_gpval=1

That affect OOB interrupt behavior. So FW config needs to match kernel DT
and vice versa.

My FW config does not set any of these options, so I disabled the OOB interrupt
in DT, too. Better option may be to upstream NVRAM config file to
linux-firmware. But I don't think anyone has any idea which file is correct,
and satisfies regulatory requirements.

I guess adding muxenab=0x10 would fix this, since that's what Pinebook Pro uses
and it has the same WiFi chip and similar design, and OOB interrupts work there.

Best regards,
	o.

> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> index 97d0bf455258..69bb9de4ce55 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> @@ -834,9 +834,6 @@ &sdio0 {
>  	brcmf: wifi@1 {
>  		compatible = "brcm,bcm4329-fmac";
>  		reg = <1>;
> -		interrupt-parent = <&gpio4>;
> -		interrupts = <RK_PD0 IRQ_TYPE_LEVEL_HIGH>;
> -		interrupt-names = "host-wake";
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&wifi_host_wake_l>;
>  	};
> 
> -- 
> 2.52.0
> 
> 

