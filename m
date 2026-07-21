Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BEFC44532
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 14:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lqOes41LH2R5Gf0PK0AJH1iaQEMKUucvCK1kHGbVyJk=; b=YO14g5ujxB2jHl8VHZfE4OwUbC
	jUbvx2S6RUSj3g62Z157v6YoIcsj7XC/UgldyjePVOy3gFjt2jFaersizgq5R7ZMSF9g0m7UoMWAd
	4xB+2+upz6dijNcGQaOTrZEWW3yAxoEeoIyiuGBm4NxpaAbGzDSrHgRQs2Nyx8Lo++wUHyZ8PS1kE
	IjI8xxX67Kp1a8g9GCeDiaDZUoASB++I9IvhyVVtvDa/ypvUkvYdeNT4nsoeFRniEycEqnNV/1syb
	iOyOzOSmhyDfPnoXSwomwS/AZ04etvARwNDU7eE3ovwzdcByYPDTrB8Ibnz9k2fypTG+UA6XGsdNp
	7RGMub0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBKD-00000009dip-1Sy0;
	Tue, 21 Jul 2026 14:20:01 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBK9-00000009dgE-3atJ;
	Tue, 21 Jul 2026 14:19:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=lqOes41LH2R5Gf0PK0AJH1iaQEMKUucvCK1kHGbVyJk=; b=OVpTMXCriwGe3iTno5qEzPtJiz
	BwnAKcp1blHGzxRomYNZbj4wiM8wGslAXG5VKLG58zJYWbXbuyHhjuf8Q13exCxzKGQBNnrnPQ8mG
	0Cd8Q+WaGQrDAmmdv9SVW4lB5NEvHzqrdmAVo9MlTvSe+E/comWlnOz2lQZLH1Fq4SvOom6SPUpYm
	xnIXPJD8eGd48hzgOrOdR35dtjCoMJ53cwXWtQjUYgH38VAuerJcGNXQbos/4YvyrCVkhIp/fR5rX
	j99ydA/2WVJqpIx3KPgwXRNRsOrgCuypPYcjVQezr3SzbhXtzXROZKjh72At4SkjpatbmCjMLsKj4
	C7fjjqBQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Ulf Hansson <ulfh@kernel.org>, MidG971 <midgy971@gmail.com>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Finley Xiao <finley.xiao@rock-chips.com>, ulf.hansson@oss.qualcomm.com,
 linux-pm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Midgy BALON <midgy971@gmail.com>
Subject: Re: [PATCH] pmdomain: rockchip: Add a regulator to the RK3568 NPU power
 domain
Date: Tue, 21 Jul 2026 16:19:40 +0200
Message-ID: <8838591.5OynTdThKG@diego>
In-Reply-To: <20260708234614.499613-1-midgy971@gmail.com>
References: <20260708234614.499613-1-midgy971@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_071957_915617_057895EF 
X-CRM114-Status: GOOD (  19.95  )
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

Am Donnerstag, 9. Juli 2026, 01:46:14 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb MidG971:
> From: Midgy BALON <midgy971@gmail.com>
>=20
> The RK3568 NPU rail (vdd_npu) needs to be enabled before the domain is
> powered on and disabled after it is powered off. Give DOMAIN_RK3568 a
> regulator parameter (like DOMAIN_RK3588 already has) so the NPU domain
> can set need_regulator, letting genpd manage the rail wired up as the
> domain's domain-supply instead of marking it always-on in DT.
>=20
> Suggested-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> Signed-off-by: Midgy BALON <midgy971@gmail.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
> This patch was part of the RFC NPU series [1]; Ulf Hansson and Heiko
> St=C3=BCbner reviewed it there and confirmed it can be applied independen=
tly of
> the rest of the (still-RFC) rocket driver and DT patches, so it is repost=
ed
> standalone. The NPU domain's domain-supply DT wiring follows in a separate
> patch, so this change alone is a no-op at runtime.
>=20
> Changes since the RFC posting:
> - Move DOMAIN_M_R below the other DOMAIN_M_* macros so they stay
>   alphabetically sorted (Heiko St=C3=BCbner).
>=20
> [1] https://lore.kernel.org/linux-rockchip/20260613070116.438906-1-midgy9=
71@gmail.com/
>=20
>  drivers/pmdomain/rockchip/pm-domains.c | 36 ++++++++++++++++++--------
>  1 file changed, 25 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/ro=
ckchip/pm-domains.c
> index 490bbb1d1d8e8..ba66ae7194289 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c
> @@ -204,6 +204,20 @@ struct rockchip_pmu {
>  	.active_wakeup =3D wakeup,			\
>  }
> =20
> +#define DOMAIN_M_R(_name, pwr, status, req, idle, ack, wakeup, regulator=
)	\
> +{							\
> +	.name =3D _name,				\
> +	.pwr_w_mask =3D (pwr) << 16,			\
> +	.pwr_mask =3D (pwr),				\
> +	.status_mask =3D (status),			\
> +	.req_w_mask =3D (req) << 16,			\
> +	.req_mask =3D (req),				\
> +	.idle_mask =3D (idle),				\
> +	.ack_mask =3D (ack),				\
> +	.active_wakeup =3D wakeup,			\
> +	.need_regulator =3D regulator,			\
> +}
> +
>  #define DOMAIN_RK3036(_name, req, ack, idle, wakeup)		\
>  {							\
>  	.name =3D _name,				\
> @@ -241,8 +255,8 @@ struct rockchip_pmu {
>  #define DOMAIN_RK3562(name, pwr, req, g_mask, mem, wakeup)		\
>  	DOMAIN_M_G_SD(name, pwr, pwr, req, req, req, g_mask, mem, wakeup, false)
> =20
> -#define DOMAIN_RK3568(name, pwr, req, wakeup)		\
> -	DOMAIN_M(name, pwr, pwr, req, req, req, wakeup)
> +#define DOMAIN_RK3568(name, pwr, req, wakeup, regulator)		\
> +	DOMAIN_M_R(name, pwr, pwr, req, req, req, wakeup, regulator)
> =20
>  #define DOMAIN_RK3576(name, p_offset, pwr, status, r_status, r_offset, r=
eq, idle, g_mask, wakeup)	\
>  	DOMAIN_M_O_R_G(name, p_offset, pwr, status, 0, r_status, r_status, r_of=
fset, req, idle, idle, g_mask, wakeup)
> @@ -1274,15 +1288,15 @@ static const struct rockchip_domain_info rk3562_p=
m_domains[] =3D {
>  };
> =20
>  static const struct rockchip_domain_info rk3568_pm_domains[] =3D {
> -	[RK3568_PD_NPU]		=3D DOMAIN_RK3568("npu",  BIT(1), BIT(2),  false),
> -	[RK3568_PD_GPU]		=3D DOMAIN_RK3568("gpu",  BIT(0), BIT(1),  false),
> -	[RK3568_PD_VI]		=3D DOMAIN_RK3568("vi",   BIT(6), BIT(3),  false),
> -	[RK3568_PD_VO]		=3D DOMAIN_RK3568("vo",   BIT(7), BIT(4),  false),
> -	[RK3568_PD_RGA]		=3D DOMAIN_RK3568("rga",  BIT(5), BIT(5),  false),
> -	[RK3568_PD_VPU]		=3D DOMAIN_RK3568("vpu",  BIT(2), BIT(6),  false),
> -	[RK3568_PD_RKVDEC]	=3D DOMAIN_RK3568("vdec", BIT(4), BIT(8),  false),
> -	[RK3568_PD_RKVENC]	=3D DOMAIN_RK3568("venc", BIT(3), BIT(7),  false),
> -	[RK3568_PD_PIPE]	=3D DOMAIN_RK3568("pipe", BIT(8), BIT(11), false),
> +	[RK3568_PD_NPU]		=3D DOMAIN_RK3568("npu",  BIT(1), BIT(2),  false, true=
),
> +	[RK3568_PD_GPU]		=3D DOMAIN_RK3568("gpu",  BIT(0), BIT(1),  false, fals=
e),
> +	[RK3568_PD_VI]		=3D DOMAIN_RK3568("vi",   BIT(6), BIT(3),  false, false=
),
> +	[RK3568_PD_VO]		=3D DOMAIN_RK3568("vo",   BIT(7), BIT(4),  false, false=
),
> +	[RK3568_PD_RGA]		=3D DOMAIN_RK3568("rga",  BIT(5), BIT(5),  false, fals=
e),
> +	[RK3568_PD_VPU]		=3D DOMAIN_RK3568("vpu",  BIT(2), BIT(6),  false, fals=
e),
> +	[RK3568_PD_RKVDEC]	=3D DOMAIN_RK3568("vdec", BIT(4), BIT(8),  false, fa=
lse),
> +	[RK3568_PD_RKVENC]	=3D DOMAIN_RK3568("venc", BIT(3), BIT(7),  false, fa=
lse),
> +	[RK3568_PD_PIPE]	=3D DOMAIN_RK3568("pipe", BIT(8), BIT(11), false, fals=
e),
>  };
> =20
>  static const struct rockchip_domain_info rk3576_pm_domains[] =3D {
>=20





