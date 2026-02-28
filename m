Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C0BFEE4C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 11:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OiQ3Yebcw45RCZupvgaV4twZnj9RwShWRtrLmqKJBP8=; b=ZoiT++aCk9RNTJ0U2dzraguwOn
	1wItPP7N54SDt82jcSGJZpNKhl9gSe0Z/rYaVvReit0WZRrUbWk1Xtv/QT2OJrhgcZnypj1N1vwU+
	0iifTb95oE3uOrs4jYFrz0qPY9kZ0dvELTDY4Thv8iwS9hP+ww7QK/vQMmb6RbSMoSXdL3c25sjb1
	PhZBb7rxiWr0jGWNQb3AdOcDQK4Plrw9r8HFW8eM2OBv/Kyo29vdCoSCSZHnKZoNYAaNw7huwPdZT
	BlRfSS9erI6rBRLxOqeDYJYi7f3AMiReQZ2YUm1JKk13fa2h0CwlAngexVALII3+asYE7HeC3c3SL
	VQSrwzaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwIkG-00000009noz-0Ima;
	Sat, 28 Feb 2026 11:44:28 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwIkD-00000009noD-1Ajz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 11:44:26 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 4B744240101
	for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 12:44:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1772279062; bh=OiQ3Yebcw45RCZupvgaV4twZnj9RwShWRtrLmqKJBP8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=T7N308PTqwX1PvG3dIHPY5yGZ1tgPXLv3zoLfDYjsaBxNwFbPeOun/put/WqkO3Mb
	 YSSumaZoE8JWbzoVZ+Vf+WWXFiZ4dIBfKbyiUVfDLNmcgkArpcJSH6Ji+vKBD4O1DJ
	 /DItfrIN6uLMRJbjndvCIUHikqNUTPo//VEpAOAXM/DRhGKEIoD6A1qjjq3elIXMd/
	 nKhjLr6g4rtShLCTVRhMIgEzo6z1jNeRaogazRq27mI9M5A46AvlWxL19Jd9hRImHI
	 gc0pU6mlwXbPXpii7me+smOIc0RkG40Ot3w5eED71ll45pw6rq2esEVuvpW9V1cgv1
	 Q+SuOxEGR67bw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fNNdc20Wwz6tw4;
	Sat, 28 Feb 2026 12:44:20 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: heiko@sntech.de,  robh@kernel.org,  krzk+dt@kernel.org,
  conor+dt@kernel.org,  devicetree@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,
  linux-rockchip@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: rockchip: rk3036: Move PHY reset to
 ethernet-phy node
In-Reply-To: <20260228013257.256973-1-festevam@gmail.com>
References: <20260228013257.256973-1-festevam@gmail.com>
Date: Sat, 28 Feb 2026 11:44:21 +0000
Message-ID: <87ldgdjdnx.fsf@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_034425_457739_04850F40 
X-CRM114-Status: GOOD (  14.69  )
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

Fabio Estevam <festevam@gmail.com> writes:

> According to rockchip,emac.yaml, 'phy-reset-duration' and 'phy-reset-gpios'
> are not valid properties.
>
> Use the valid 'reset-gpios' and 'reset-assert-us' properties under
> the etherne-phy node.
>
> This fixes the following dt-schema warning:
>
> Unevaluated properties are not allowed ('phy-reset-duration',
> 'phy-reset-gpios' were unexpected)
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  arch/arm/boot/dts/rockchip/rk3036-evb.dts   | 4 ++--
>  arch/arm/boot/dts/rockchip/rk3036-kylin.dts | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Does this need a "Fixes:" tag (haven't checked)? And could stable benefit
from this?


Cheers,
C. Mitrodimas

>
> diff --git a/arch/arm/boot/dts/rockchip/rk3036-evb.dts b/arch/arm/boot/dts/rockchip/rk3036-evb.dts
> index becdc0b664bf..c8100dc4c7ce 100644
> --- a/arch/arm/boot/dts/rockchip/rk3036-evb.dts
> +++ b/arch/arm/boot/dts/rockchip/rk3036-evb.dts
> @@ -16,8 +16,6 @@ memory@60000000 {
>  
>  &emac {
>  	phy = <&phy0>;
> -	phy-reset-duration = <10>; /* millisecond */
> -	phy-reset-gpios = <&gpio2 RK_PC6 GPIO_ACTIVE_LOW>; /* PHY_RST */
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&emac_xfer>, <&emac_mdio>;
>  	status = "okay";
> @@ -28,6 +26,8 @@ mdio {
>  
>  		phy0: ethernet-phy@0 {
>  			reg = <0>;
> +			reset-gpios = <&gpio2 RK_PC6 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <10000>;
>  		};
>  	};
>  };
> diff --git a/arch/arm/boot/dts/rockchip/rk3036-kylin.dts b/arch/arm/boot/dts/rockchip/rk3036-kylin.dts
> index ae2f84a4e922..bc6e6468fcc4 100644
> --- a/arch/arm/boot/dts/rockchip/rk3036-kylin.dts
> +++ b/arch/arm/boot/dts/rockchip/rk3036-kylin.dts
> @@ -102,8 +102,6 @@ &acodec {
>  
>  &emac {
>  	phy = <&phy0>;
> -	phy-reset-duration = <10>; /* millisecond */
> -	phy-reset-gpios = <&gpio2 RK_PC6 GPIO_ACTIVE_LOW>; /* PHY_RST */
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&emac_xfer>, <&emac_mdio>;
>  	status = "okay";
> @@ -114,6 +112,8 @@ mdio {
>  
>  		phy0: ethernet-phy@0 {
>  			reg = <0>;
> +			reset-gpios = <&gpio2 RK_PC6 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <10000>;
>  		};
>  	};
>  };

