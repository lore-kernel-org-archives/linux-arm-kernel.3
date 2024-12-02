Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F10D78333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 17:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOAOvw778ddifzLBAVTAVA7ViPhpzAN8s/3Zy+v6TwY=; b=fRBGZGJu0LTKqI+zEB+mwdCOCt
	xxhqmZpyeciaBZD2FdAkZSTOU4dbcpRk+PxssTjlcdJWq90RHEJFIxDlcKUaQTsoDCUComlOAWnMS
	UfR91ebQwvgI2ngdEMMzYrnLwD2JQ3eVPvZ4LYi9P81Y7/4wd0orkUI3n+o8Jz93l7WMcmuDyqxxl
	xL72tg6YJ/MYC2xsJ+SpxKqmWTqI2ReThD1GYV4W7RTWKl0jM+9jZA0/4/Og+r7XxJp4iwisJiXX6
	zwcjuzvTkTQEcbR8C0GkHbT57TfElywB9cbTAAtexoEKaLwmrgl4RNJ6qWlPuwf19A+8V+z8Whw5W
	6S/e0+Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9sN-00000006xjO-2iG5;
	Mon, 02 Dec 2024 17:06:23 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9rM-00000006xQC-3l3K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 17:05:22 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1733159115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gOAOvw778ddifzLBAVTAVA7ViPhpzAN8s/3Zy+v6TwY=;
	b=VJZ4NDMGPhmVUUl1yFPrEKK3II45/5cEG2KXmEIfKitVGXhwnFNbVoGxcw2RA2nGUo9wBD
	fv4uKeEhwV74RapauaXWTUbqb33nust/6u4NsclfxW9Bs2kKz3+XoSnJq2I04iI/JbZkII
	RfnXhA530DawCl08cSo2nGgTJdfxn3RAGqK26ITNMxYy3QqAjtIfTIrqLRGO55MuXb1zQ4
	cOY2Hs9H+0qN/b2nnO6ELaMVgL0IrjPsZ+2W2OpwQv0+HyYt/x7BJv/TbUrVq1BK0KCiBx
	t17qD8DWYubEJviYSZYrX/sKuksIoEhA15bjiuRjnI1AWh3BUW5qGLBjBW0hiw==
Content-Type: multipart/signed;
 boundary=7e48cb5c561c9c94c8ce91377d76abea74c76a1a74e817be5c3f74398612;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Mon, 02 Dec 2024 18:05:03 +0100
Message-Id: <D61DMK8O9JCR.1C62A5UGI51BT@cknow.org>
Cc: <heiko@sntech.de>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <marcin.juszkiewicz@linaro.org>
Subject: Re: [PATCH] arm64: dts: rockchip: Describe why is HWRNG disabled in
 RK356x base dtsi
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Dragan Simic" <dsimic@manjaro.org>,
 <linux-rockchip@lists.infradead.org>
References: <6b272e2f8f916c04b05db50df621659a5a7f29ab.1733149874.git.dsimic@manjaro.org>
In-Reply-To: <6b272e2f8f916c04b05db50df621659a5a7f29ab.1733149874.git.dsimic@manjaro.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_090521_218760_6DC57478 
X-CRM114-Status: GOOD (  16.55  )
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

--7e48cb5c561c9c94c8ce91377d76abea74c76a1a74e817be5c3f74398612
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

I'd have swapped 'is' and 'HWRNG' in the subject, but otherwise ...

On Mon Dec 2, 2024 at 3:44 PM CET, Dragan Simic wrote:
> Despite the presence of the hardware random number generator (HWRNG) in t=
he
> different Rockchip RK356x SoC variants, it remains disabled for the RK356=
6
> SoC because testing showed [1] that it produces unacceptably low quality =
of
> random data, for some yet unknown reason.  The HWRNG is enabled for the R=
K3568
> SoC, on which the testing showed good quality of the generated random dat=
a.
>
> To avoid possible confusion in the future, [2] let's have this described
> briefly in the RK356x base SoC dtsi.
>
> [1] https://lore.kernel.org/linux-rockchip/cover.1720969799.git.daniel@ma=
krotopia.org/T/#u
> [2] https://lore.kernel.org/linux-rockchip/20241201234613.52322-1-pbrobin=
son@gmail.com/T/#u
>
> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
> ---
>  arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk356x-base.dtsi
> index 62be06f3b863..ab8f42c0a843 100644
> --- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> @@ -1032,6 +1032,11 @@ sdhci: mmc@fe310000 {
>  		status =3D "disabled";
>  	};
> =20
> +	/*
> +	 * Testing showed that the HWRNG found in RK3566 produces unacceptably
> +	 * low quality of random data, so the HWRNG isn't enabled for all RK356=
x
> +	 * SoC variants despite its presence.
> +	 */
>  	rng: rng@fe388000 {
>  		compatible =3D "rockchip,rk3568-rng";
>  		reg =3D <0x0 0xfe388000 0x0 0x4000>;

Reviewed-by: Diederik de Haas <didi.debian@cknow.org>

Thanks for this :-)

--7e48cb5c561c9c94c8ce91377d76abea74c76a1a74e817be5c3f74398612
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ03oxAAKCRDXblvOeH7b
bnskAQCQUuFH8eysdScwXJpiPkXXRdU7mTDzJMtkUptCsFOzoQD/XP1IvlnN/atD
YZ36wXEYt7ZtYgV2N+r28ZD2HWPOIgY=
=+WZI
-----END PGP SIGNATURE-----

--7e48cb5c561c9c94c8ce91377d76abea74c76a1a74e817be5c3f74398612--

