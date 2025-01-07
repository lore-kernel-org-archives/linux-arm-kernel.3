Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A3CE77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 05:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzRoupXZ4+IZGUpiLX6vdlDEZbnyuwWKW3dVF+1lsIQ=; b=QF9oUjjky5GsACidtM2Z1O9AB5
	VffI4iWQccvcCORUvQyZPw30d1dtM2p9YiO61lsCJ8IiqF2qU+RWl9//R22P3YKvj9pagkOfbqHAD
	E0ai10wKQ+ABj53fprAZmrO3cJNE5nmGtsbkRDdMlnmXo+Uj96VuagBF8zZawY8mNDvOjeSYa2nb8
	3UQqvsEDCJ8ZZ2sLLRMg2hs/jG62E3gQTRZ5KORnyUva2a/eowIwyRsmWpjZZqFsjJFZznLzh3bp5
	0D9urEr5avZfVHLKtyrBvvOc3w1ASpWSbW88xgEFEz8V7BE0Y44Ex2X1hO3zUT8sptQDgUmbmdk+i
	T8e28GsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV1wI-00000003WfY-1d56;
	Tue, 07 Jan 2025 05:15:38 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV1v1-00000003WYr-3vsg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 05:14:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1736226850;
	bh=hzRoupXZ4+IZGUpiLX6vdlDEZbnyuwWKW3dVF+1lsIQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=g0uRxe3oZ9kVG6R97JEPeWJAD6EBQtw4XMiPFxloHNjHix8mmHyCEN+hG/1Oztt/r
	 g24R8bAD2QNK83Xg/SMS4Ziu7xAbihbQSyYemEtBc8y2qBhPIwr5nwXp2lUtNVUsu5
	 2rMrinfdDzJJs9pzk2x0vhKV0eqAuCm+A/PWt4xdCfQWVCWc1exK37goYEB8BikR+h
	 C/DttU+dg3ytvAVWw18oG65pvhvc9dvXTlgx2HVyRwZReiBNpZLeZCdUQeJaqFObf/
	 s38E5/mSVm2DZr+6vCGgWjF58o9pw4tdlsuAp+eeH+0pdNOyzHmeE6fuppva3timWW
	 j0Il4p+5/mneg==
Received: from [10.200.97.88] (203-173-1-122.dyn.iinet.net.au [203.173.1.122])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1ACBC706BE;
	Tue,  7 Jan 2025 13:14:06 +0800 (AWST)
Message-ID: <e3279e0c41259f165a0cde0195b196f416ac566a.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: yosemite4: adjust secondary flash name
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Tue, 07 Jan 2025 15:44:04 +1030
In-Reply-To: <20241218212458.3050775-1-patrick@stwcx.xyz>
References: <20241218212458.3050775-1-patrick@stwcx.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_211420_182868_39AC9419 
X-CRM114-Status: GOOD (  14.89  )
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

Hi Patrick,

On Wed, 2024-12-18 at 16:24 -0500, Patrick Williams wrote:
> Meta (Facebook) has a preference for all of our secondary flash
> chips to be labelled "alt-bmc" for consistency of userspace tools
> deal with updates.=C2=A0 Bletchley, Harma, Minerva, and Catalina all
> follow this convention but for some reason Yosemite4 is different.
>=20
> Adjust the label in the dts to match the other platforms.
>=20
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-
> yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-
> yosemite4.dts
> index 98477792aa00..e20816d9e077 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -112,7 +112,7 @@ flash@0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0flash@1 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0status =3D "okay";
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0m25p,fast-read;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0label =3D "bmc2";
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0label =3D "alt-bmc";
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0spi-rx-bus-width =3D <4>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0spi-max-frequency =3D <50000000>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};

I'm hitting conflicts (?) when I apply this on top of[1]. Do you mind
rebasing it?

[1]: https://github.com/amboar/linux/tree/for/bmc/aspeed/dt

Andrew

