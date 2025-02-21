Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2AAC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 10:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W+26npf18RRwsCWtDsEbmc9w9HSuCv1j/NyTX3JxquE=; b=zqLrfMrhaYfwkyC4EOkENn1v6M
	2G0yitQaDfkwzJcFsaveeYfrC1eu5E8e+LjNWioaTfxfhjkFRAS2G5ZZijoz8rH1xOmi58k+WAFky
	XiYp+UASdKM96q9NVXBl1iQjqfb0IrXXZ/WXooZE9c8bVv97DBZi51XHynNbcH0OMt8IBwvY6CzSC
	dHJsRin6npcbuRWNY9040Z5Sa36/bT+ZKzpebOu5+l9BLJwooYUiEH8geT1P4sWzk85mDm7GUsgeK
	iSrDDZfS1h5LTRMDpKw4Vhq8/3eyXzKHtQ/rXv68bRU33CIgbx64TOz9Km7/M6xZx/cj+1mwsZkbr
	HU5tGOMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQ4c-000000058bP-3E4H;
	Fri, 21 Feb 2025 10:15:58 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPwb-000000054fY-1txm;
	Fri, 21 Feb 2025 10:07:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=W+26npf18RRwsCWtDsEbmc9w9HSuCv1j/NyTX3JxquE=; b=pmmMCG9jXqbiNJJ6GmtbO6FRsX
	ARRLZAhlhtPCOl5SKYYH4jzI1WMpRYPi6B1VK779IhlgPgm+3uGz6H4K2RPVVjx1umDTQT7ILSz6Q
	XmtkEsJfEImhk5hZqrVA6r7EYi35xg+iF2SyPsl/HufSuWsG94G+LPV6Fg3438zjO7i/67O7waij3
	s7Y5zZiwO3U4cbLFzbwFr9ot77cTfKdduSXt+hMQ4A5j2c0TJ8YNNPxy/PLCBHadHN2Ix21ZQL+ic
	J53yrW+4bSLBNJ9jlGXesT0oS65Idbf8QOmu3v6R5BKtVhbD9u4p25ThBL1hN30pHrUM0MIjzaugN
	KgsC6gYw==;
Received: from i53875a87.versanet.de ([83.135.90.135] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tlPwY-0002cL-4E; Fri, 21 Feb 2025 11:07:38 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Quentin Schulz <foss+kernel@0leil.net>,
 Quentin Schulz <quentin.schulz@cherry.de>
Cc: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 stable@vger.kernel.org
Subject: Re: [PATCH 0/5] arm64: dts: rockchip: pinmux fixes and support for 2 adapters
 for Theobroma boards
Date: Fri, 21 Feb 2025 11:07:37 +0100
Message-ID: <3771836.RUnXabflUD@diego>
In-Reply-To: <f9b40055-bcb0-4245-b899-4c7890e81b20@cherry.de>
References: <20250220-ringneck-dtbos-v1-0-25c97f2385e6@cherry.de>
 <174008661935.4046882.3221866764998287397.robh@kernel.org>
 <f9b40055-bcb0-4245-b899-4c7890e81b20@cherry.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_020741_523265_625AF26E 
X-CRM114-Status: GOOD (  20.38  )
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

Hi Quentin,

Am Freitag, 21. Februar 2025, 11:01:44 MEZ schrieb Quentin Schulz:
> On 2/20/25 10:29 PM, Rob Herring (Arm) wrote:
> > On Thu, 20 Feb 2025 13:20:09 +0100, Quentin Schulz wrote:
> I believe this is a false positive due to the node suffix being -gpio? 
> If I change -gpio suffix to -pin, it doesn't complain anymore.
> 
> """
> diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dts 
> b/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dts
> index 08a11e4758413..249e50d64791e 100644
> --- a/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dts
> +++ b/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dts
> @@ -196,7 +196,7 @@ sd_card_led_pin: sd-card-led-pin {
>   	};
> 
>   	uart {
> -		uart5_rts_gpio: uart5-rts-gpio {
> +		uart5_rts_pin: uart5-rts-pin {
>   			rockchip,pins =
>   			  <0 RK_PB5 RK_FUNC_GPIO &pcfg_pull_up>;
>   		};
> @@ -234,7 +234,7 @@ &uart0 {
>   };
> 
>   &uart5 {
> -	pinctrl-0 = <&uart5_xfer &uart5_rts_gpio>;
> +	pinctrl-0 = <&uart5_xfer &uart5_rts_pin>;
>   	rts-gpios = <&gpio0 RK_PB5 GPIO_ACTIVE_HIGH>;
>   	status = "okay";
>   };
> """
> 
> @Heiko, I guess you would like a warning-less DT :) I can send a v2 with 
> that change then if that works for you? I can wait a few days for other 
> reviews :)

that would be great - the v2.

We already had patches addressing the -gpio thing for other boards in the
past, so going to "-pin" is the preferred solution here.

Also, your patches are totally specific to Theobroma-boards, so just send
your v2 at your convenience - I don't really expect that much additional
outside review comments ;-) .


Heiko



