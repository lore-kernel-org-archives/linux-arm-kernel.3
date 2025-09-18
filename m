Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2ED1CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 16:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tkeGma96gdssMGmQ/bwCDw+4IJuG2DJOLS8GBEx04Y=; b=wCunV2Ood7ma0CD5OOOYae8tEs
	1cbN2U9W+sOCE62rS9S2uwnwFCnSGtiSjU+NXPwwSPu0ufxzMWKbmsd0xIsca1PaWFxEMtexx2pxt
	54rRsHEZCVHZPG2kMZOi2kh7VtGld304nGw+rzE3xQhMt1+2BFzYZRZI14Ov3h+zQyxftn0Hx3IZw
	gRE7Aed6zN2QXJexgm0Qof1Pc3e3oPGj1UC57/epVuT9muFm5pXBGqBaGjBkPzwDrtpDWhpBmoZ7L
	Zc7N58gCe6ukYjQ3vQGq0Kixn6xngPT4x3dufLJgUMWOU9zztxSpOffNylpAPjn6dlLdH2kObSluG
	Hax/1rhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHOl-00000000bar-2gh2;
	Thu, 18 Sep 2025 16:22:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHOk-00000000bae-2nHX;
	Thu, 18 Sep 2025 16:22:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=6tkeGma96gdssMGmQ/bwCDw+4IJuG2DJOLS8GBEx04Y=; b=fktl7AGd7hcsQy3ydyb+S3qj+w
	z2mkksiK1ygCEJhw0h64/u3JvgWwXBxtLG4L30D9O5RwpOiiNL+dFRDEMhdmrz1qW9nF8HzGFOoCB
	k0kmfvpMDwHEKyIA3tabA8B/H+nmcHFs4Mwvi3j8L3gfv+iBYkoJcjlYgqQiw/Z2XfWdAjSe8eU8k
	tp9LsLH9ftsP/riEnwfiMPcd4t3iYXW4qPR6DHSRmN7mSONBg1Im0CI+BHxKylSCPjaEFELw+ceHJ
	EBkamirLL6EIMdcfjB3duphkeRF05sm1nQ5VPiaeZ+guuTK8J0FH41nNFCTBB7W1PslNXtf4qSz76
	mzJfw0bw==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHOh-00000007eoo-3oro;
	Thu, 18 Sep 2025 16:22:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:Cc;
	bh=6tkeGma96gdssMGmQ/bwCDw+4IJuG2DJOLS8GBEx04Y=; b=UU28H28T+IdwxcIHhq6+rQWoDs
	IXX+mglDASqKZjCoFLpOY2a/8JmSWvc1dslZiwKZUDPkXpE4p4J5bZpgJNNe2SxAak00fpBKzgq6r
	ym5g09YcoUdpoB9aDbFHKILO3eTm62DeZWAiKyh2EJqGoLoMM+rabCh1d/4GcyVgVGATw3PsGgam4
	bXwy4vLPJ3LmnkmDiEQYbiubibtaKvyfJ31thciTeNr5wnYCYltUXNwMl6X+vh/yMKf34hSolXW8F
	yPY+pCGtFXzEa8B7aOUG35Ntfw1hh8l1Ny4WStmmxg++V0chMIYn2y1VSUoVAUwNxk5QfDogLjK2W
	wXIBePTQ==;
Received: from i53875b0a.versanet.de ([83.135.91.10] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uzHOf-0001zZ-MR; Thu, 18 Sep 2025 18:22:13 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ed Wildgoose <lists@wildgooses.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ed Wildgoose <lists@wildgooses.com>
Subject: Re: [PATCH 2/2] rockchip: dts: Enable UART DMA by adding default dma-names
 property
Date: Thu, 18 Sep 2025 18:22:12 +0200
Message-ID: <3477683.usfYGdeWWP@diego>
In-Reply-To: <20250918093246.15623-3-lists@wildgooses.com>
References: <20250917114932.25994-1-lists@wildgooses.com>
 <20250918093246.15623-1-lists@wildgooses.com>
 <20250918093246.15623-3-lists@wildgooses.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_172216_046204_64C7FB3A 
X-CRM114-Status: GOOD (  16.77  )
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

Am Donnerstag, 18. September 2025, 11:32:46 Mitteleurop=C3=A4ische Sommerze=
it schrieb Ed Wildgoose:
> Kernel appears to need a dma-names set for DMA to actually enable. Set a
> default dma-names property for all UARTs defined in the board
> definition: rk3566-radxa-zero-3.dtsi
>=20
> This is tested on a Radxa Zero 3W (which has 5x UARTs) and removes the
> warnings and enables DMA on this platform

the kernel does not _need_ the dmas and the uart will work just fine
without.

And as was pointed out in the previous version, the uarts have possible
stability issues, when connected to specific peripherals

So I'd prefer to not enable uart dmas "just for fun".

Heiko


> Signed-off-by: Ed Wildgoose <lists@wildgooses.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi b/arch=
/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi
> index e644bfc9c..fc26a4a52 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi
> @@ -488,21 +488,29 @@ &tsadc {
>  	status =3D "okay";
>  };
> =20
> +&uart1 {
> +	dma-names =3D "tx", "rx";
> +};
> +
>  &uart2 {
> +	dma-names =3D "tx", "rx";
>  	status =3D "okay";
>  };
> =20
>  &uart4{
> +	dma-names =3D "tx", "rx";
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&uart4m1_xfer>;
>  };
> =20
>  &uart5 {
> +	dma-names =3D "tx", "rx";
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&uart5m1_xfer>;
>  };
> =20
>  &uart9 {
> +	dma-names =3D "tx", "rx";
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&uart9m1_xfer>;
>  };
>=20





