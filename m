Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C17C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 01:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7xwk8bkofSoOCbb/Y0lzrdZi6QnX81MLwC2X54AVCo=; b=HQl8GIivckVpHIm9aolNCaPxJR
	bSqz3frXd5+i08OVOmRjUICpsRWKJCH597FS7wiKakNzGNkXL1kaCs/B3eU1vnFYU7+bKyL575Wa/
	q2Wi0dYtRzgwUXwSc1dUcWWVRM2vV3ZiEss/4Y/wKlCTfPK7z1iKtyPS5Z/Dtl9lNfT6uCuEMi2g4
	/6i7F4ItcO6xiOS9wBktgwNa5+7dTJv/wjNF5s4Q7df0b9P8UlKQah7AwHIjISkzTYI7sFpX1yOsi
	zdEtLo/zooQakk7+99EIwWj8Rt6NzX2Ca6bvoETvWvIIVW9EfpgEmekioQ4ilKdPStTKWC+ctBV3c
	1Ey38q+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo9ke-00000001ksm-2HID;
	Mon, 27 Jul 2026 01:03:28 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo9kb-00000001ksR-33JA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 01:03:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1785114203;
	bh=B7xwk8bkofSoOCbb/Y0lzrdZi6QnX81MLwC2X54AVCo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Gpcv1fUx1dQpgaLv2/ylGmzL11KKwB8+aZj1UVHoHzsW12u7dyBTA0zwniMV3chHs
	 wx+79Fo2H2ZEmvsxikEiZgOMbzNVhVnr0SapZI1oR1ntxsNvM7LtMxLk2kfdxanrtQ
	 Nm0DUJI2vMxQoy2B2ex0ATbPiIrSGWP1GiqD+/aubMAfBOKoSLs29VF06l536xKq/l
	 J/A9/16HKUrq105km+eyBNTHX4kxY6HZ2d7PVGHBVBQ2bO1uKcORTn8Wc+xhJpHrNE
	 g4stI0JzeaNimAQX5CfZUrNXF53LIVc/lE91MP+2m3HEM3A6oSyVZrVMZc5WHqfQ19
	 rstIY9+NTO5Mw==
Received: from [192.168.68.117] (unknown [180.150.113.112])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1C18A608E3;
	Mon, 27 Jul 2026 09:03:22 +0800 (AWST)
Message-ID: <ad836298ba3d0cf78d8b2a89692d81ad1caaba33.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed-g6: add pcie-kcs4
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?ISO-8859-1?Q?Gr=E9goire?= Layet <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	corey@minyard.net, devicetree@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 27 Jul 2026 10:33:22 +0930
In-Reply-To: <CAFi2wKbNCVqZzApbG_xcDzyrN6yt_Wc01PVVqtPROcjVnp8hRg@mail.gmail.com>
References: <cover.1784732161.git.gregoire.layet@9elements.com>
	 <0b97a66762efc05c9073c14112cc489624871947.1784732161.git.gregoire.layet@9elements.com>
	 <afa321db51d5e6cc8e0c15badc7204faa0925251.camel@codeconstruct.com.au>
	 <CAFi2wKbNCVqZzApbG_xcDzyrN6yt_Wc01PVVqtPROcjVnp8hRg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_180325_965335_63D3C947 
X-CRM114-Status: GOOD (  14.38  )
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

Hi Gr=C3=A9goire,

On Thu, 2026-07-23 at 09:56 +0200, Gr=C3=A9goire Layet wrote:
> Hi Andrew,
>=20
> > > =C2=A0arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 7 +++++++
> > > =C2=A01 file changed, 7 insertions(+)
> > >=20
> > > diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/=
dts/aspeed/aspeed-g6.dtsi
> > > index 56bb3b0444f7..a93fa4cf5d8f 100644
> > > --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> > > +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> > > @@ -617,6 +617,13 @@ kcs4: kcs@114 {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 status =3D "disabled";
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > >=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 pcie_kcs4: kcs@914 {
> >=20
> > Nodes need to be ordered by ascending address:
>=20
> The existing kcs4 node is already not in ascending order of address.
>=20
> 'kcs4: kcs@114' is before 'lpc_ctrl: lpc-ctrl@80'
>=20
> pcie_kcs4 has been placed here to have ascending addresses locally on
> the kcs nodes and still
> having all the kcs nodes next to each other. This matches the kcs4
> node ordering.

Understood, however:

>=20
> If ascending address is still preferred, I'll change pcie_kcs4 order of c=
ourse.

My preference is that we don't add further style problems on top of
those we already have :)

Thanks,

Andrew

