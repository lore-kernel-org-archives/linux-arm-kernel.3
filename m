Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CB1C636A1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Feb 2026 13:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ff2I/wJE6bSHHw7NlocrsNF4riW7XkTVuaNjiBsfECI=; b=PZEmI4YAblrGvs3Z70nJSsnESY
	wigApEE6BLcl0wkdU2HxNpYtvExnTCRYymYUgNSo73e54jnLy1FOBlKtcy8eCVAF778J2xA+KuiSO
	f0hrheCUttHQhV3sP51HZswKjUhSjUmAXHcaJClh1PyjJObWJeRfjdjBGomKBp8eOiovsMH1vYtaJ
	z60JyrnShtd/4JY+VkX8HQfFgd7QCAF8ntycqHaqRimGU6OsCuounwlpEVYANYIVhAmLSy0aE7/W8
	wsXBW0YbA+sLGJZE3vH+sVlfp4mT1LhmJaN1xQ4RCg1NF9sPH4PlomCoGdg6AB5+Cn7mGhLs+8OXj
	WTxH4Tmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vu9zy-0000000GjZB-27a4;
	Sun, 22 Feb 2026 13:59:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vu9zv-0000000GjYK-1GoU;
	Sun, 22 Feb 2026 13:59:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Ff2I/wJE6bSHHw7NlocrsNF4riW7XkTVuaNjiBsfECI=; b=KbH4rzM+X2YN6NkUJdUuchwaz4
	g9/eHRabRTZwpqe/MKKTjn3qzv6zt7TKYwa9jdp3ZQmnuxBLejw39jKMnFrSVPjz5v0Ibef14sFAg
	Eo7HljYMaiY2FEGHSkG7kM79LOIR5u8YgFcKRDUg9P9aTR6C9EnPl1HxBXPy1UAdYWaLEu3/Hzil6
	+rRNBz5pEkYKn6r2nD3GfwWOU/Up41YFNjeaOA3gnG/O8wRAdXHaTc8Kxt5zg2fBFFwKXx/9A59o4
	1lbAypuUbq/YMhRvuZ8vD2LMlGJK79tVXmbkNru6aI80VHfF3iVLXAh91lwkdB5TD1EExfzRcVKFu
	30aaJ2kg==;
From: Heiko Stuebner <heiko@sntech.de>
To: neil.armstrong@linaro.org, dianders@chromium.org,
 thierry.reding@gmail.com, sam@ravnborg.org,
 Robin Murphy <robin.murphy@arm.com>
Cc: jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/4] arm64: dts: rockchip: Add overlay for FriendlyElec HD702E
Date: Sun, 22 Feb 2026 14:59:40 +0100
Message-ID: <24273079.6Emhk5qWAg@phil>
In-Reply-To: <2bbc2e62ae9b54ac7594355001ce2b15885d3493.1769191673.git.robin.murphy@arm.com>
References: <cover.1769191673.git.robin.murphy@arm.com>
 <2bbc2e62ae9b54ac7594355001ce2b15885d3493.1769191673.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_055947_344616_33503A62 
X-CRM114-Status: GOOD (  11.74  )
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

Am Freitag, 23. Januar 2026, 20:22:23 Mitteleurop=C3=A4ische Normalzeit sch=
rieb Robin Murphy:
> Add an overlay to support FriendlyElec's HD702E 7" eDP LCD touchscreen
> module for the NanoPC-T4 board:
>=20
> https://www.friendlyelec.com/index.php?route=3Dproduct/product&path=3D81&=
product_id=3D230
>=20
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

[...]

> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4-hd702e.dtso b/=
arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4-hd702e.dtso
> new file mode 100644
> index 000000000000..66ac530392b7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4-hd702e.dtso
> @@ -0,0 +1,96 @@
> +&edp {
> +	force-hpd;
> +	status =3D "okay";
> +
> +	aux-bus {
> +		edp-panel {

The dtbs-check was unhappy, because the auxbus binding wishes for this
node to be named "panel". I'll just change this when applying.


Heiko

> +			compatible =3D "friendlyarm,hd702e";
> +			backlight =3D <&backlight>;
> +			no-hpd;
> +			power-supply =3D <&vdd_3_3v>;
> +
> +			port {
> +				panel_in_edp: endpoint {
> +					remote-endpoint =3D <&edp_out_panel>;
> +				};
> +			};
> +		};
> +	};
> +};




