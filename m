Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31E1CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 16:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AHfKA9U4Qc/kfoVyXIAwIin/0PHtcEBFmI2qkbJlwas=; b=LhHU8+DsT8S8U5rRiWMEi9+T5f
	ryXwbBRSXWSZ63dlxB8nNFfEMohAbvKukR6SZoNs3C1wK6IFM6M35ajhKP2WYUxCdVnvZIVl8wito
	mAJNCg7YIOrEI87yJCSc4TQa7Rh6bxXNj0BjBEeLrz/bgKOwOuJgRkfOlzWSqCac4gHKcbDwqXcfT
	EzWRbIrdCVwPQgGqB7Rno6YLQ7nMPMVOuWaeinMEmejk96WTJCoopVbBBo99V4zBzaJmabPISI9me
	H7RFsxzgF84CIqD4vzL/nHYPrvkATESNDSmELAoXXycyWSrJdBTX9RlDRJsxSBgos0vnz26+zia5r
	mxiMwrfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAVvI-0000000BBJe-4Bap;
	Sun, 19 Oct 2025 16:06:21 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAVvG-0000000BBJ8-3fJ3;
	Sun, 19 Oct 2025 16:06:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=AHfKA9U4Qc/kfoVyXIAwIin/0PHtcEBFmI2qkbJlwas=; b=YSQqmBdBp6Cnqio5Q494KslAOs
	4IwGfKAEq3Yx1gDBSm40vA7TITFzwpl7tzPQiEk9pf91Qljfll83vZg7bFt7U76ye5LcZPZcQihYm
	rMD+Tm67OaIlxTr+A/J08+ujbQhWSUCniipMMiuOza4Uk5++DBGDynN1uY8xCwi9U84b8/6uex+U2
	j1wvM7P2YQ7FdQ2dRqlRQoRuMiBSYlHJdZeaT9guLiLTmGrhTfKaKQg3CDVXMApOXZdpL2H7g9MrW
	EJZfKmepspjCiTWqBBKcPOA0c8/SBZ5P2LDmeCerFlB05cvK3DpuzBCfgIg5pJvMP4BB0Z6X46ldl
	sRFA5eAA==;
Received: from i53875a28.versanet.de ([83.135.90.40] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vAVv4-0001nY-Qi; Sun, 19 Oct 2025 18:06:06 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 David Petry <petry103@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Petry <petry103@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Enable second HDMI output on CM3588
Date: Sun, 19 Oct 2025 18:06:05 +0200
Message-ID: <6801712.G0QQBjFxQf@diego>
In-Reply-To: <20251019142053.11047-1-petry103@gmail.com>
References: <20251019142053.11047-1-petry103@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_090618_962478_3689E087 
X-CRM114-Status: GOOD (  17.65  )
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

Hi David,

Am Sonntag, 19. Oktober 2025, 16:20:53 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb David Petry:
> Enable the second HDMI output port found on FriendlyElec CM3588 and CM3588

the decription sounds like you're referencing two boards, but the change
itself only touches one. Is there a 2nd patch missing or does the wording
above need improvement?

Thanks
Heiko

>=20
> Signed-off-by: David Petry <petry103@gmail.com>
> ---
>  .../rk3588-friendlyelec-cm3588-nas.dts        | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.=
dts b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
> index 5fbbeb6f5a935..10a7d3691a26f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
> @@ -101,6 +101,17 @@ hdmi0_con_in: endpoint {
>  		};
>  	};
> =20
> +	hdmi1-con {
> +		compatible =3D "hdmi-connector";
> +		type =3D "a";
> +
> +		port {
> +			hdmi1_con_in: endpoint {
> +				remote-endpoint =3D <&hdmi1_out_con>;
> +			};
> +		};
> +	};
> +
>  	ir-receiver {
>  		compatible =3D "gpio-ir-receiver";
>  		gpios =3D <&gpio0 RK_PD4 GPIO_ACTIVE_LOW>;
> @@ -335,6 +346,22 @@ hdmi0_out_con: endpoint {
>  	};
>  };
> =20
> +&hdmi1 {
> +	status =3D "okay";
> +};
> +
> +&hdmi1_in {
> +	hdmi1_in_vp1: endpoint {
> +		remote-endpoint =3D <&vp1_out_hdmi1>;
> +	};
> +};
> +
> +&hdmi1_out {
> +	hdmi1_out_con: endpoint {
> +		remote-endpoint =3D <&hdmi1_con_in>;
> +	};
> +};
> +
>  &hdmi_receiver_cma {
>  	status =3D "okay";
>  };
> @@ -350,6 +377,10 @@ &hdptxphy0 {
>  	status =3D "okay";
>  };
> =20
> +&hdptxphy1 {
> +	status =3D "okay";
> +};
> +
>  /* Connected to MIPI-DSI0 */
>  &i2c5 {
>  	pinctrl-names =3D "default";
> @@ -840,3 +871,10 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
>  		remote-endpoint =3D <&hdmi0_in_vp0>;
>  	};
>  };
> +
> +&vp1 {
> +	vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
> +		reg =3D <ROCKCHIP_VOP2_EP_HDMI1>;
> +		remote-endpoint =3D <&hdmi1_in_vp1>;
> +	};
> +};
>=20





