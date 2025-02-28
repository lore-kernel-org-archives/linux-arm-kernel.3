Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D597C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 16:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CK2+2eTKEOuhyBSMGk3107aiSfJh4IB6MZYp2fX2orA=; b=BnizLmor+wwofkx/HWI0scs47b
	uLG9CzgNUsGwZOfgJ0dxsYGVIpQKIRJ8lYiDN+WH4+RPXr6xgNhuiDqUloTbrsoafBBA6lnEkm0UM
	spy0UBb6ZGoVShI8sdPWv96I5RIRVo98h66hSQKPSHPOAYpiGOXvgnRWyqhy/q05SU6QjtBBmAUwV
	O1gyWQninbxs5q8EA+xD1tsbWw1NpP4qEblp2Z9tKd5S2EyRsjZqRsWxzWhgkHqZH1qgGj/5Wzom9
	GZL6ie4T8BOz06f1DFrpyPymQe2f00cj2UO2s1cX2a/yieIIEZ+ZyF5ntxf/3SyyeBryEPpeUSxw/
	Ga8BWjdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to3gL-0000000Bnwq-33T2;
	Fri, 28 Feb 2025 16:57:49 +0000
Received: from out-174.mta0.migadu.com ([2001:41d0:1004:224b::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to3el-0000000BnNo-3OO8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 16:56:13 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1740761759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CK2+2eTKEOuhyBSMGk3107aiSfJh4IB6MZYp2fX2orA=;
	b=YnP5ml4lSpqZvZxXgRMBOB/tXJezBC6B6VFzwlj9SWokVPcyO2HSn0JrITrq3scrHkWXu8
	P2NlPxV4wh2Snwo8S/3TIX7B3S2tlkZ08AymOj//GP3SX1QbQtvC5ZDvEyRAooPgUoeE64
	j9eoZQB1dqHlTMSUJR458UWPER81onHKg512NWLcZyq3TV78EYMKPnnZn/z/TtccALiS/4
	FgMyo5ZC4U2AtDv3xw/k0ZMOmSg7xa2IFYFVk+Wk4Zij2dFBBQmzZrsFy9PWe1nl4NWeYK
	QE+jt2V+SrPhMP4k1JT3W3EAYP09vjRoBDLFCADQPhfmDZhD0jJuawYHjtvfqg==
Content-Type: multipart/signed;
 boundary=9db44123ad8e24452ea89acc1d1803313fb749feac7e1c6887c874175b10;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Fri, 28 Feb 2025 17:55:47 +0100
Message-Id: <D848JET5TDL6.2L4ZQR0YHYQU6@cknow.org>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: rockchip: Remove undocumented sdmmc
 property from lubancat-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Yao Zi" <ziyao@disroot.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>, "Dragan Simic"
 <dsimic@manjaro.org>, "Johan Jonker" <jbx6244@gmail.com>, "Wenhao Cui"
 <lasstp5011@gmail.com>, "Yuteng Zhong" <zonyitoo@gmail.com>
References: <20250228163117.47318-2-ziyao@disroot.org>
In-Reply-To: <20250228163117.47318-2-ziyao@disroot.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_085611_982824_BAA09FF0 
X-CRM114-Status: GOOD (  16.01  )
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

--9db44123ad8e24452ea89acc1d1803313fb749feac7e1c6887c874175b10
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Feb 28, 2025 at 5:31 PM CET, Yao Zi wrote:
> Property "supports-cd" isn't documented anywhere and is unnecessary for

s/supports-cd/supports-sd/ ?

Cheers,
  Diederik

> mainline driver to function. It seems a property used by downstream
> kernel was brought into mainline.
>
> This should be reported by dtbs_check, but mmc-controller-common.yaml
> defaults additionalProperties to true thus allows it. Remove the
> property to clean the devicetree up and avoid possible confusion.
>
> Fixes: 8d94da58de53 ("arm64: dts: rockchip: Add EmbedFire LubanCat 1")
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dts | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dts b/arch/ar=
m64/boot/dts/rockchip/rk3566-lubancat-1.dts
> index 61dd71c259aa..ddf84c2a19cf 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dts
> @@ -512,7 +512,6 @@ &sdhci {
> =20
>  &sdmmc0 {
>  	max-frequency =3D <150000000>;
> -	supports-sd;
>  	bus-width =3D <4>;
>  	cap-mmc-highspeed;
>  	cap-sd-highspeed;


--9db44123ad8e24452ea89acc1d1803313fb749feac7e1c6887c874175b10
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ8HqmAAKCRDXblvOeH7b
brBnAQDYQlWpCi07tRhXA4WUv7ubZmIyzqkjeaOSH8mLwC7m9wEAhEKazw8l4USI
CuStlAfbvqiFxfbuBJrPLhrrU8ag6A0=
=EyJp
-----END PGP SIGNATURE-----

--9db44123ad8e24452ea89acc1d1803313fb749feac7e1c6887c874175b10--

