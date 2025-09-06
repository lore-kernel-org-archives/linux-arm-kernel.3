Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253F7CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 11:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yfQBX96q75WukPmdamWvcC99q02KYHkltaQomzZiIA0=; b=r42wp3Ktrzdi5OFUyn8l+fZQxs
	39CK/MtJb4pJtmgQHITy4H6XbTjBJQprUrO77n/ln3uLHTBu5nIp7eWQJTbvxuwfKWu9XAx8XfmBB
	PszFIzoP+DGoLJYsFL2KX6kthiiD0A1Sw9fczP9HKw7vEAaEKBi8FHypXS34SoYLPVpugymq0vnmQ
	1Z6n+q5dzDSBeelH3IPqKuXJ3OpI1KEggmHd9zyaxWB7w/7kfCkD9svDnjk6OQr1lkiTfVr5K8z6d
	EU8J02r/MUUz0nQ8eOvqq0NsLLacvMJjTAJY6tY2/lFTNEZq3Lbfgj4BMWQoNfWjsMVOE6tMAFM2V
	KVC01AEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uurL0-00000007hmd-18z1;
	Sat, 06 Sep 2025 11:44:11 +0000
Received: from out-189.mta1.migadu.com ([95.215.58.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uurHt-00000007hUF-3WgR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 11:40:59 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1757158853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yfQBX96q75WukPmdamWvcC99q02KYHkltaQomzZiIA0=;
	b=mi5XoFBzicBGnLVlSDcOo95Ouwxq3hQXvFEG/N59/ZuVymYMt3CqV4k89TDrxD7B9u22Sz
	qhkzNWunTvNWqXkQjvdkE+TVv9mjX0pdXArzBVZjL1zuVE4RSthFUKOgmaGe3ILG96npde
	GV2mwYZBhCbzQ0tb90WY9z9Sbc4pBgrU4+Fv9SpcB2w4ujXPKdH0JnAzQxPVpZSm3vuBvO
	p8tTXQ9suDUkspEgJ9GSSv1ZTRc7reyBBWsjzc19+DXGtk2foDoWJ/A0kA0TuFIzsiUiKy
	yqlLwgWgziTPIDeb+5eVEmaWzZmj7VVAgcfc4zSKXLOBnyaBLy3e+PS1TRc80A==
Content-Type: multipart/signed;
 boundary=50bc71c862d7f174e8c42d86cf14d62df090490c913e2b0c228b0aaba3a8;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sat, 06 Sep 2025 13:40:48 +0200
Message-Id: <DCLOTR9Y380M.22GZYL11XXZM2@cknow.org>
Cc: <heiko@sntech.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: rockchip: Make RK3588 GPU OPP table naming
 uniform
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Dragan Simic" <dsimic@manjaro.org>,
 <linux-rockchip@lists.infradead.org>
References: <355c16ab070688fc6285e0d4419eb54a3f699eee.1757152740.git.dsimic@manjaro.org>
In-Reply-To: <355c16ab070688fc6285e0d4419eb54a3f699eee.1757152740.git.dsimic@manjaro.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_044058_040211_6C4D63C8 
X-CRM114-Status: GOOD (  16.30  )
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

--50bc71c862d7f174e8c42d86cf14d62df090490c913e2b0c228b0aaba3a8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Sat Sep 6, 2025 at 12:01 PM CEST, Dragan Simic wrote:
> Unify the naming of the existing GPU OPP table nodes found in the RK3588
> and RK3588J SoC dtsi files with the other SoC's GPU OPP nodes, following
> the more "modern" node naming scheme.

Like we discussed in private (without an agreement), I think it would be
beneficial if the (gpu) opp naming would be made consistent across SoC
series as right now there are several different naming schemes applied.
They're all valid, but inconsistent. And if consistency is improved,
which I like, then let's go 'all the way'?

Cheers,
  Diederik

> Fixes: a7b2070505a2 ("arm64: dts: rockchip: Split GPU OPPs of RK3588 and =
RK3588j")
> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi | 2 +-
>  arch/arm64/boot/dts/rockchip/rk3588j.dtsi    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi b/arch/arm64/bo=
ot/dts/rockchip/rk3588-opp.dtsi
> index 0f1a77697351..b5d630d2c879 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
> @@ -115,7 +115,7 @@ opp-2400000000 {
>  		};
>  	};
> =20
> -	gpu_opp_table: opp-table {
> +	gpu_opp_table: opp-table-gpu {
>  		compatible =3D "operating-points-v2";
> =20
>  		opp-300000000 {
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588j.dtsi b/arch/arm64/boot/=
dts/rockchip/rk3588j.dtsi
> index 9884a5df47df..e1e0e3fc0ca7 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
> @@ -66,7 +66,7 @@ opp-1608000000 {
>  		};
>  	};
> =20
> -	gpu_opp_table: opp-table {
> +	gpu_opp_table: opp-table-gpu {
>  		compatible =3D "operating-points-v2";
> =20
>  		opp-300000000 {
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


--50bc71c862d7f174e8c42d86cf14d62df090490c913e2b0c228b0aaba3a8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaLwdxQAKCRDXblvOeH7b
bl8uAQCv2yOKmsclZY8nGsdJiOVLqZigZRQbZaQzwRqAc/HnAgD/XLnZRoy4wD3U
MNxjXlh/Uf2Ygv/VZJ0ev9xXDbI2aQo=
=ThN1
-----END PGP SIGNATURE-----

--50bc71c862d7f174e8c42d86cf14d62df090490c913e2b0c228b0aaba3a8--

