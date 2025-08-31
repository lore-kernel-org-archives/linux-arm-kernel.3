Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1E4CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 15:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZfUhY1EZQv1OuZe5tH097MUEDvYB4HeowDcrbjOqWg=; b=sd0d3pL3DRmPsvPp1giD9zpc4n
	eO6BfIdE+k5gfcbYpANnM/dug2GmCXqY0Lgy97LB4qDSJ8kul7bfzzBHx4k9qHg/Psf84bM3gn/WH
	Myi3rdm6oASAHFP+9/pRkcF7W5cpKUQaWmE8Ef6w4wVC71Vd3aepJ80xw0NIseJPxUp3Ypmh5Jr8/
	JpxMLLGs9UeP+Amo9L8CwPbaJIKaF6teGHYf/BcHFmbwrlyTj+vHW0QC/5hByKDJ81peH1W9r/VyG
	ISmV3Eu6D64+AMuWx29kkEZQPTog0kWyL4XVau68u/hJ/n+3aHN7GqwrgSv0Nvqf8bwIqDgVVLEeG
	N1epPn6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usjhK-0000000AKpz-3A3I;
	Sun, 31 Aug 2025 15:10:26 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usjdV-0000000AKNu-1ay0;
	Sun, 31 Aug 2025 15:06:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=NZfUhY1EZQv1OuZe5tH097MUEDvYB4HeowDcrbjOqWg=; b=zr7VUttrCYLdhVOAGJ/Lr9oKmN
	G17tELZOSR5+6G4+83RfqgDQD/koYmtt9ulOu5Kclyt9jtnUg9Joo7kLYQ7y26JP3s70oJS1k8V1q
	VBlejvPkHAhDchJt1rPJPxDpVCHRVAqd+6aLiQ91iKqw8BprlR4WkqqgkRLxnyDZCJd9MG+ioCEtF
	D/R9aJP05KKdNhuapyq/iqDdbKSFoCxNqaLk7T0iI8tjtlohdhLRWMkHhsYgAKiR6wO0rWTMXEppn
	8BzRFiAA0xvrcP6jVybEF+pSEvWrkFGNwF29EOGMMAbhnyCfKJ6zlA/KPxEuWm6pUldy8GrqB9luh
	NU/pUbRg==;
Received: from i53875b56.versanet.de ([83.135.91.86] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1usjdR-0001Dx-BJ; Sun, 31 Aug 2025 17:06:25 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: robh@kernel.org, WeiHao Li <cn.liweihao@gmail.com>
Cc: hjc@rock-chips.com, andy.yan@rock-chips.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-clk@vger.kernel.org, WeiHao Li <cn.liweihao@gmail.com>
Subject: Re: [PATCH v1 6/7] ARM: dts: rockchip: Add D-PHY for RK3368
Date: Sun, 31 Aug 2025 17:06:24 +0200
Message-ID: <8571992.T7Z3S40VBb@diego>
In-Reply-To: <20250831104855.45883-7-cn.liweihao@gmail.com>
References: <20250831104855.45883-1-cn.liweihao@gmail.com>
 <20250831104855.45883-7-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_080629_417527_828120FA 
X-CRM114-Status: GOOD (  13.83  )
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

Am Sonntag, 31. August 2025, 12:48:54 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb WeiHao Li:
> RK3368 has a InnoSilicon D-PHY which supports DSI/LVDS/TTL with maximum
> trasnfer rate of 1 Gbps per lane.
>=20
> Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3368.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3368.dtsi
> index 0e47bf59a..674a3676d 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> @@ -884,6 +884,20 @@ display_subsystem: display-subsystem {
>  		status =3D "disabled";
>  	};
> =20
> +	video_phy: video-phy@ff968000 {

I think the node should be something like
dsi_dphy: phy@ff968000


> +		compatible =3D "rockchip,rk3368-dsi-dphy";
> +		reg =3D <0x0 0xff968000 0x0 0x4000>,
> +		      <0x0 0xff960000 0x0 0x4000>;
> +		clocks =3D <&cru SCLK_MIPIDSI_24M>, <&cru PCLK_DPHYTX0>,
> +			 <&cru PCLK_MIPI_DSI0>;
> +		clock-names =3D "ref", "pclk", "pclk_host";
> +		#clock-cells =3D <0>;
> +		resets =3D <&cru SRST_MIPIDPHYTX>;
> +		reset-names =3D "apb";
> +		#phy-cells =3D <0>;
> +		status =3D "disabled";
> +	};
> +
>  	hevc_mmu: iommu@ff9a0440 {
>  		compatible =3D "rockchip,iommu";
>  		reg =3D <0x0 0xff9a0440 0x0 0x40>,
>=20





