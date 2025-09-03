Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A27CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 13:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=McfUlmNWXahZ5b3iibcvLakQVppuaRB/2ZGlhVmpKJ4=; b=w/y0OSI9sR+iAiJPUHAX7VhZiY
	Rr/IeCBISC1U//aHpN1wCAQSVNqw9UnedB78joyYSR8qKkTPsouwjEthiG4r2is3WXNatx5OZXmEV
	E9EguBzcm0jSUdDdu059DFnXFUGe2LqbWm8VElJ318o2hV4MAHerHKO8gi2xmXDk+y6YQHNE1RbGM
	sjVwh45OgWurqy6braGk/Gv17CbzfNpnr0yoM8MSvh/3disEyWdKelD/v0qYD4WHjffTqd8vo58MI
	SS5ZJQjBMX9SedD/8PxblTPwKIQzEvwJyxWYhPLPnE+fO1VWNaj68/9KB8WAoBMPIGhokzblooZTr
	jfl3Yxag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnIj-00000006XWA-34jP;
	Wed, 03 Sep 2025 13:13:25 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmPK-00000006MFp-1CQm;
	Wed, 03 Sep 2025 12:16:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=McfUlmNWXahZ5b3iibcvLakQVppuaRB/2ZGlhVmpKJ4=; b=EO5NQoNp/9z6s3T7xfSArrxHMa
	Laq3wXi7iyKd5j7gcXB6sMqM5d/aH811t+FRIe6qDqmrs99BqS33rEzbVla2D+/vexsSUjgNqJVgt
	djD1KZs0aMPJ4mQ2Rs0E5J7HzGwa86F54XL9015GfLeXeLcyX+WVJBeZS63phtQB/CNDeUxlug+Kj
	Ot3z1aE+5vUVbkK+T5YcCBB1b8vXJRvUMrdNR0DlSE3WQ4PDYRuUql2fUgB1CXqQwR9SijPT/APD3
	i9EnIVjbbxwOn8Lq0hOY6vQcIQcLslzqxGf+eBK2/TcL5aSxycPBxWQ32yHgEIuze0rschz62Z8L4
	SwkIBR8A==;
Received: from [213.70.33.227] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1utmPF-000551-5Q; Wed, 03 Sep 2025 14:16:05 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: robh@kernel.org, WeiHao Li <cn.liweihao@gmail.com>,
 andy.yan@rock-chips.com
Cc: hjc@rock-chips.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-clk@vger.kernel.org, WeiHao Li <cn.liweihao@gmail.com>
Subject: Re: [PATCH v1 2/7] drm/rockchip: vop: add lut_size for RK3368 vop_data
Date: Wed, 03 Sep 2025 14:16:04 +0200
Message-ID: <5726817.Isy0gbHreE@phil>
In-Reply-To: <20250831104855.45883-3-cn.liweihao@gmail.com>
References: <20250831104855.45883-1-cn.liweihao@gmail.com>
 <20250831104855.45883-3-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_051610_321546_6B455371 
X-CRM114-Status: GOOD (  13.78  )
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

Am Sonntag, 31. August 2025, 12:48:50 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb WeiHao Li:
> VOP driver need a correct lut_size to work normally.

please add a comment where that value is coming from.
Because the vop in the vendor kernel is so vastly different.


Thanks
Heiko

>=20
> Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/dr=
m/rockchip/rockchip_vop_reg.c
> index d1f788763..219f8c2fa 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
> @@ -880,6 +880,7 @@ static const struct vop_data rk3368_vop =3D {
>  	.win =3D rk3368_vop_win_data,
>  	.win_size =3D ARRAY_SIZE(rk3368_vop_win_data),
>  	.max_output =3D { 4096, 2160 },
> +	.lut_size =3D 1024,
>  };
> =20
>  static const struct vop_intr rk3366_vop_intr =3D {
>=20





