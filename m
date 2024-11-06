Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB77BD59F74
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 20:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DHszNOt4o1L1USKCkuHP6mgHhgm3F/Dpy7EQxrwpJY=; b=fz3Br1t3IWOOBd93yF6pUoQcwD
	t1QeFgRHeHcNJLqo5ufxhqFnbKPXfyhgy2eR10JsZ+pPUX+a53HJfbk1hY98Jyz9Bz5zprvDngPPF
	O8Z8SFj++LErH7kWhNN9oQUVA+efPgwnhGjWHlMYIjTa181TsBmJBZTtz0Iqx3kQC/SYsPnUOMezf
	qKpVvIIsWYNADwICa4nynW/CT6r4xTeNesjpBOanl1caSgpp0If/VYRLIKXglYq7qgYRSRoy5ZRaD
	It2DYZ16HlMLutmsgYf2c6FDbPYFClUM66xU0TfYmQAjHlv4MCZcQDc/Xo/Ihjk3nG7bFnMCyviZp
	kuTOgw9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8mvw-00000004jHc-2Lq4;
	Wed, 06 Nov 2024 20:47:20 +0000
Received: from [2a01:e0a:828:c7c0:e2d5:5eff:fe2d:8e8] (helo=luna.linkmauve.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8mrI-00000004iUw-2c80;
	Wed, 06 Nov 2024 20:42:35 +0000
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 7CC2F15E5A9A; Wed, 06 Nov 2024 21:42:25 +0100 (CET)
Date: Wed, 6 Nov 2024 21:42:25 +0100
From: Link Mauve <linkmauve@linkmauve.fr>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Luis de Arquer <ldearquer@gmail.com>,
	Alexandre ARNOUD <aarnoud@me.com>, kernel@collabora.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	FUKAUMI Naoki <naoki@radxa.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: rockchip: Enable HDMI0 on rock-5b
Message-ID: <ZyvUsdc8ZhiD8-DY@desktop>
References: <20241019-rk3588-hdmi0-dt-v2-0-466cd80e8ff9@collabora.com>
 <20241019-rk3588-hdmi0-dt-v2-2-466cd80e8ff9@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241019-rk3588-hdmi0-dt-v2-2-466cd80e8ff9@collabora.com>
Jabber-ID: linkmauve@linkmauve.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_124232_832983_933FDF13 
X-CRM114-Status: GOOD (  20.56  )
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

Hi,

I’ve tested this series on a Radxa Rock 5B using Weston, and thus
patches 1 and 2 are:
Tested-by: Link Mauve <linkmauve@linkmauve.fr>

On a TV which erroneously reports 1360×768 as its preferred mode,
nothing gets displayed.  Only setting a 1920×1080 mode will display
things correctly, every other mode stays black.

Also, before starting Weston, drm_info reports Status: unknown, 0×0 mm,
no modes, and no EDID blob.  After starting Weston all of these property
get loaded properly, aside from the physical size which gets set to the
obviously invalid 1600×900 mm.

The first start of Weston after reboot takes a total of 7.4s, which
seems very long just to (I believe) probe the screen and parse the EDID,
if that’s what the driver is doing.  Subsequent launches complete in
about 400 ms, which is closer to my expectation.

Thanks a lot for this series!

On Sat, Oct 19, 2024 at 01:12:11PM +0300, Cristian Ciocaltea wrote:
> Add the necessary DT changes to enable HDMI0 on Radxa ROCK 5B.
> 
> Tested-by: FUKAUMI Naoki <naoki@radxa.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts | 47 +++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> index d6fff5b86b87020f115ce64795aee90c002a2255..0c3baf74981b714eb2a1edbc3fbbb69cd688cfc2 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> @@ -4,6 +4,7 @@
>  
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/soc/rockchip,vop2.h>
>  #include "rk3588.dtsi"
>  
>  / {
> @@ -37,6 +38,17 @@ analog-sound {
>  		pinctrl-0 = <&hp_detect>;
>  	};
>  
> +	hdmi0-con {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi0_con_in: endpoint {
> +				remote-endpoint = <&hdmi0_out_con>;
> +			};
> +		};
> +	};
> +
>  	leds {
>  		compatible = "gpio-leds";
>  		pinctrl-names = "default";
> @@ -192,6 +204,26 @@ &gpu {
>  	status = "okay";
>  };
>  
> +&hdmi0 {
> +	status = "okay";
> +};
> +
> +&hdmi0_in {
> +	hdmi0_in_vp0: endpoint {
> +		remote-endpoint = <&vp0_out_hdmi0>;
> +	};
> +};
> +
> +&hdmi0_out {
> +	hdmi0_out_con: endpoint {
> +		remote-endpoint = <&hdmi0_con_in>;
> +	};
> +};
> +
> +&hdptxphy_hdmi0 {
> +	status = "okay";
> +};
> +
>  &i2c0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&i2c0m2_xfer>;
> @@ -858,3 +890,18 @@ &usb_host1_xhci {
>  &usb_host2_xhci {
>  	status = "okay";
>  };
> +
> +&vop_mmu {
> +	status = "okay";
> +};
> +
> +&vop {
> +	status = "okay";
> +};
> +
> +&vp0 {
> +	vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
> +		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
> +		remote-endpoint = <&hdmi0_in_vp0>;
> +	};
> +};
> 
> -- 
> 2.47.0
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

-- 
Link Mauve

