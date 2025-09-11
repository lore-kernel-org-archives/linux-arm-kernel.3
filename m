Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B0DCAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 08:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tl6Jwlc9AxjchgDlRh4CRf/NRIAGYGgRWiI8ZY2gw9o=; b=I9qg1pP23nt4SXA81s7srlOdWC
	4cTeVAy032mxPQZA//d8ZIlH4BRyLWkF1TgsQ3J6Qh2hxLjUPalsLgwRAW/X6kvGOQ3oKDsEJuMKW
	l2DPcfc18gwcj8mrtO+/0xMfkIVgM5VqJWQuoFhHX9zraeCeqKzDp9aP+I3SaCrrzmedxNo2MQxT6
	Krzap9mS1QTckX+7ZBOZM03CLoJp3OdRtLUUqtdGX1432gOpca/yrs2lzzRQzFL6sMEQlkb6zZD/b
	pAP/n6HsVtkH00QWFEF1XeQ1St4JCf80urj+nMbGC6G8znH5UTPiMHQSvhY6dQ+3/0mwOUzU0KrYI
	nzZ9M90w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwd41-00000001wIj-1h1b;
	Thu, 11 Sep 2025 08:53:57 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwd3y-00000001wHs-40fM;
	Thu, 11 Sep 2025 08:53:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Tl6Jwlc9AxjchgDlRh4CRf/NRIAGYGgRWiI8ZY2gw9o=; b=pv/seA9eRbpdxC7p23L9VRWhdL
	u5DtZgQmzomEuRO/J9hUg/UKrH8+q/wl+qJi7rSu4KnvylqXhb/oNpgg3lfmgT7D5z0GP4RHn0wih
	+Kmbqsem1WNCMVS1dokFZzxMmMCA+svar841ctLhZdqPO7+sgtH3Cu+emU+p4/zffXYHK6Zq3eEbb
	nrG7ehQJWEXCHkg49uSfPq0mKXWIRjKNgoIUnhqldMZICMb7OwyI7tQQ86jdQyiVHF999UWXFBYM6
	r329uLhJkv7JoNB4yGqTPQ0k1ORsTPS8avMCoKB9ElFdz0xuJ2bku1jyhycN+w4dI0szw416Hw/Uc
	3Vf3VL3g==;
Received: from i53875b0e.versanet.de ([83.135.91.14] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uwd3w-0008RY-R8; Thu, 11 Sep 2025 10:53:52 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: robh@kernel.org, WeiHao Li <cn.liweihao@gmail.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 WeiHao Li <cn.liweihao@gmail.com>
Subject: Re: [PATCH v2 1/4] phy: rockchip: inno-usb2: Add usb2 phy support for RK3368
Date: Thu, 11 Sep 2025 10:53:52 +0200
Message-ID: <4407919.mogB4TqSGs@diego>
In-Reply-To: <20250909132958.26423-2-cn.liweihao@gmail.com>
References: <20250909132958.26423-1-cn.liweihao@gmail.com>
 <20250909132958.26423-2-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_015354_994000_1A6D6176 
X-CRM114-Status: GOOD (  15.67  )
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

Am Dienstag, 9. September 2025, 15:29:55 Mitteleurop=C3=A4ische Sommerzeit =
schrieb WeiHao Li:
> RK3368 has one USB2.0 PHY with two ports. This adds device specific data
> for it. Device specific data get form rockchip downstream source [1].
>=20
> [1] https://github.com/rockchip-linux/kernel/blob/develop-4.4/drivers/phy=
/rockchip/phy-rockchip-inno-usb2.c#L2805
>=20
> Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>

compared the register values to the TRM

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>=20
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/=
rockchip/phy-rockchip-inno-usb2.c
> index b0f23690ec..df574337d4 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> @@ -1847,6 +1847,53 @@ static const struct rockchip_usb2phy_cfg rk3366_ph=
y_cfgs[] =3D {
>  	{ /* sentinel */ }
>  };
> =20
> +static const struct rockchip_usb2phy_cfg rk3368_phy_cfgs[] =3D {
> +	{
> +		.reg =3D 0x700,
> +		.num_ports	=3D 2,
> +		.clkout_ctl	=3D { 0x0724, 15, 15, 1, 0 },
> +		.port_cfgs	=3D {
> +			[USB2PHY_PORT_OTG] =3D {
> +				.phy_sus	=3D { 0x0700, 8, 0, 0, 0x1d1 },
> +				.bvalid_det_en	=3D { 0x0680, 3, 3, 0, 1 },
> +				.bvalid_det_st	=3D { 0x0690, 3, 3, 0, 1 },
> +				.bvalid_det_clr =3D { 0x06a0, 3, 3, 0, 1 },
> +				.idfall_det_en	=3D { 0x0680, 6, 6, 0, 1 },
> +				.idfall_det_st	=3D { 0x0690, 6, 6, 0, 1 },
> +				.idfall_det_clr	=3D { 0x06a0, 6, 6, 0, 1 },
> +				.idrise_det_en	=3D { 0x0680, 5, 5, 0, 1 },
> +				.idrise_det_st	=3D { 0x0690, 5, 5, 0, 1 },
> +				.idrise_det_clr	=3D { 0x06a0, 5, 5, 0, 1 },
> +				.ls_det_en	=3D { 0x0680, 2, 2, 0, 1 },
> +				.ls_det_st	=3D { 0x0690, 2, 2, 0, 1 },
> +				.ls_det_clr	=3D { 0x06a0, 2, 2, 0, 1 },
> +				.utmi_bvalid	=3D { 0x04bc, 23, 23, 0, 1 },
> +				.utmi_id	=3D { 0x04bc, 26, 26, 0, 1 },
> +				.utmi_ls	=3D { 0x04bc, 25, 24, 0, 1 },
> +			},
> +			[USB2PHY_PORT_HOST] =3D {
> +				.phy_sus	=3D { 0x0728, 8, 0, 0, 0x1d1 },
> +				.ls_det_en	=3D { 0x0680, 4, 4, 0, 1 },
> +				.ls_det_st	=3D { 0x0690, 4, 4, 0, 1 },
> +				.ls_det_clr	=3D { 0x06a0, 4, 4, 0, 1 }
> +			}
> +		},
> +		.chg_det =3D {
> +			.opmode		=3D { 0x0700, 8, 0, 0, 0x1d7 },
> +			.cp_det		=3D { 0x04b8, 30, 30, 0, 1 },
> +			.dcp_det	=3D { 0x04b8, 29, 29, 0, 1 },
> +			.dp_det		=3D { 0x04b8, 31, 31, 0, 1 },
> +			.idm_sink_en	=3D { 0x0718, 8, 8, 0, 1 },
> +			.idp_sink_en	=3D { 0x0718, 7, 7, 0, 1 },
> +			.idp_src_en	=3D { 0x0718, 9, 9, 0, 1 },
> +			.rdm_pdwn_en	=3D { 0x0718, 10, 10, 0, 1 },
> +			.vdm_src_en	=3D { 0x0718, 12, 12, 0, 1 },
> +			.vdp_src_en	=3D { 0x0718, 11, 11, 0, 1 },
> +		},
> +	},
> +	{ /* sentinel */ }
> +};
> +
>  static const struct rockchip_usb2phy_cfg rk3399_phy_cfgs[] =3D {
>  	{
>  		.reg		=3D 0xe450,
> @@ -2289,6 +2336,7 @@ static const struct of_device_id rockchip_usb2phy_d=
t_match[] =3D {
>  	{ .compatible =3D "rockchip,rk3308-usb2phy", .data =3D &rk3308_phy_cfgs=
 },
>  	{ .compatible =3D "rockchip,rk3328-usb2phy", .data =3D &rk3328_phy_cfgs=
 },
>  	{ .compatible =3D "rockchip,rk3366-usb2phy", .data =3D &rk3366_phy_cfgs=
 },
> +	{ .compatible =3D "rockchip,rk3368-usb2phy", .data =3D &rk3368_phy_cfgs=
 },
>  	{ .compatible =3D "rockchip,rk3399-usb2phy", .data =3D &rk3399_phy_cfgs=
 },
>  	{ .compatible =3D "rockchip,rk3562-usb2phy", .data =3D &rk3562_phy_cfgs=
 },
>  	{ .compatible =3D "rockchip,rk3568-usb2phy", .data =3D &rk3568_phy_cfgs=
 },
>=20





