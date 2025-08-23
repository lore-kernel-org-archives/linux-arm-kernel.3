Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFAFCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 14:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ig8EgamvUXoGB2xEmezjPzvQonDmRzOaevcEF/TDdjA=; b=sBoDG23fxBlxldjtKoXzmEblaP
	K8c3T9DlNTkpUAl8k8kSEjP7TlwhNJgR6X3/ncbdtZOt4BpJlWOg8aOOfikBteGlnvp7vGX+VUlYf
	fRVnrKI35Y1FTIiAjPzPITzbq8+2EXTNyXER45mnYu91y95uxpGYDcE7fQ5dMYI10ymxZrk5urYdK
	PSOs/vguETHzrUOzmEu+pvYxwE8i7/ErzD0cyWLkrDKRYuU75tFJpNz3lr3u2NNn2AB7wHWEsqmkm
	5Tv9Pflf8VUJmddlgotruPdWT70bwCectg5rAZFBunCP8dA2JJf+8vX10s+W2vj2WJW7haK1EBdMM
	bBzOy5rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uppCY-00000004qZy-2km3;
	Sat, 23 Aug 2025 14:26:38 +0000
Received: from vps.xff.cz ([195.181.215.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upp9u-00000004qLg-2rcv;
	Sat, 23 Aug 2025 14:23:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1755959033; bh=R34OGeCiu/IPda8je9GL6U6dsszdH++pAXr6iT4gB6Y=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=pb4FEzOeilNegfspE7/aewKwoiawHbo+Rf4DUXKz6hPTbgJ5iP5IvIsBtQlva0cP4
	 BEklA73ynyazlNcuhkeeoh/HA0zAP+HAOkkqtDHDygeE/68qm/xSQI/4qKXJaM0g97
	 MIjPIl1kOMgfbtfndoKDGtlxVpcHR3FtHBmlN8ro=
Date: Sat, 23 Aug 2025 16:23:52 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: maud_spierings@hotmail.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: Enable HDMI receiver on
 orangepi 5 plus
Message-ID: <wc4mcm5nywfrzafexagun4kaw3hzb3avtunh4idg22ctuz6r2h@xjgqo6ihiyey>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	maud_spierings@hotmail.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20250823-orangepi5-v1-0-ae77dd0e06d7@hotmail.com>
 <20250823-orangepi5-v1-2-ae77dd0e06d7@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250823-orangepi5-v1-2-ae77dd0e06d7@hotmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_072354_871154_D4AF9A6A 
X-CRM114-Status: GOOD (  14.30  )
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

On Sat, Aug 23, 2025 at 02:43:51PM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> Enable support for the HDMI input port found on the orangepi 5 plus.
> 
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>

Reviewed-by: Ondřej Jirman <megi@xff.cz>

Thank you,
	o.

> ---
>  arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> index 8222f1fae8fadc5cbb4ef16b3db5ed975ed43915..9950d1147e129dc866cfde62ddd636b082ae1926 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> @@ -160,6 +160,17 @@ &hdmi1_sound {
>  	status = "okay";
>  };
>  
> +&hdmi_receiver_cma {
> +	status = "okay";
> +};
> +
> +&hdmi_receiver {
> +	hpd-gpios = <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;
> +	pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_hpd>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
>  &hdptxphy0 {
>  	status = "okay";
>  };
> @@ -279,6 +290,12 @@ blue_led_pin: blue-led {
>  		};
>  	};
>  
> +	hdmirx {
> +		hdmirx_hpd: hdmirx-5v-detection {
> +			rockchip,pins = <1 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
>  	ir-receiver {
>  		ir_receiver_pin: ir-receiver-pin {
>  			rockchip,pins = <4 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
> 
> -- 
> 2.50.1
> 
> 

