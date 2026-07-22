Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECE3C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 06:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t69esuoTm8ZiigYmH0W9OwN5SLE48ProuPEFU1h70Fw=; b=0n9H9xqCpUjEHRkygiTj3eXDta
	S46xRmZTq7TuvHd7JXut+k7RryloePLFtR8D3Osvas6Tp5QFCnZO8ShHXvJaZe2hDRndF3Ypmnmox
	MBlYGhQXQbKRta04bNI8ko99HRB/5mQDbysbKfm5qxL4xp/DKSRw/bSz3zvV9ZXskBV7dnxwITJ4W
	DzFwVOjEBZR9tf0BgXcixY+ri8IBxmZdvrsF4RRLQu3G70KO5jpDFbe9CeZ44ktG4zpqtN5s3NfL/
	rcxniSeIy0U33uPQKsfYExEVYdRoS812JPXq4mP7zJjBm2hS1idAzwlALSLnHwlKPQIX99rzQnxun
	10htHjaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQtl-0000000B18P-1IGO;
	Wed, 22 Jul 2026 06:57:45 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQti-0000000B183-3XSI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 06:57:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784703456;
	bh=t69esuoTm8ZiigYmH0W9OwN5SLE48ProuPEFU1h70Fw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VlKnkFNSMzNwJ1NEw/5K6SZv0DJGDfuqo7QkE34qxjY0zwrVWXulDcxJtCpI5sl+b
	 cHFKeuj0U+6Kii8obQ4JOGcuD35NyZq/n9zQfXG9j/MWp0rYbKxYKmGhVefTvFWt+n
	 G2wfBzzA8/t7bcWy8EFSft/8sUCdqK+M9Vk1YbAjQa++Z+MWBpYqEZrOVxSGl1Q0mB
	 Mn/lFxx8OBUVOllYjouKzifXBXoDoUvYUYKJftQjY2m95rhH4n2nSEWy3lXCK9p2sN
	 9PBeh7Ggxcf0xaoj1K/KmFK8eX7P8n6ExypX6nZR2y+RkfkgBWuDJ1N8rUZU2H5y7B
	 ZIp2MIUo30cyw==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 70C4465B37;
	Wed, 22 Jul 2026 14:57:35 +0800 (AWST)
Message-ID: <793ccb3b7af22f6f38ff6544ed633b7800ea68b6.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed-g6: add pcie-lpc and pcie-kcs4
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?ISO-8859-1?Q?Gr=E9goire?= Layet <gregoire.layet@9elements.com>, Tan
 Siewert <tan.siewert@9elements.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, 	linux-kernel@vger.kernel.org
Date: Wed, 22 Jul 2026 16:27:34 +0930
In-Reply-To: <CAFi2wKZrya6aHAN9Wtwk43gqQTMPp1BamM9VKKQ+iH1UPzr4HA@mail.gmail.com>
References: <de49f2032f5b1f170161dcd6191c0daa48f0b0c2.1784117715.git.gregoire.layet@9elements.com>
	 <178412588365.243141.16731478852761544781.b4-review@b4>
	 <CAFi2wKZrya6aHAN9Wtwk43gqQTMPp1BamM9VKKQ+iH1UPzr4HA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_235743_086481_B5AEDE01 
X-CRM114-Status: GOOD (  21.51  )
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

On Mon, 2026-07-20 at 18:31 +0200, Gr=C3=A9goire Layet wrote:
> > > diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/=
dts/aspeed/aspeed-g6.dtsi
> > > index 56bb3b0444f7..ac351f01048f 100644
> > > --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> > > +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> > > @@ -658,6 +658,21 @@ ibt: ibt@140 {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > >=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pcie_lpc: pcie-lpc@1=
e789800 {
> >=20
> > lpc@1e789000 already maps 0x1e789000-0x1e78a000 and 0x1e789914 falls in=
side it,
>=20
> I agree that there is an overlap in address space in my patch.
> I will fix this in a new revision.
>=20
> > so you're describing a second `ast2600-lpc-v2` node which is unnecessar=
y.
> >=20
> > Suggestion: Merge pcie_kcs4 into lpc@1e789000 and use 914 as offset. Th=
at way
> > you don't accidentally cause an overlap for the devices if you describe=
 more in
> > the future.
>=20
> The 'kcs_bmc_aspeed' driver has the kcs channels address hard-coded.
> If the 'reg' property does not contain the three addresses used by one
> of the four channels, the driver returns -EINVAL.
> So having a pcie-kcs4 with regs 0x914, 0x918 and 0x91c doesn't work.

It does work if you fix the driver to allow it.

>=20
> This is why a second LPC node was added, for the pcie-kcs4 to have
> regs 0x114, 0x118 and 0x11c;
>=20
> I know we should write device tree sources based on hardware rather
> than around driver limitations.
> Changing how the driver behaves seems excessive for supporting KCS over P=
CIe.

I don't think this is true.

> I think a point can be made that the LPC over PCIe is a different LPC bus=
.

In my opinion it's most helpful if Table 8 in the datasheet is used as
the reference for address ranges in the devicetree. With that in mind,
I don't intend to apply a patch adding a new node as you've proposed. I
suggest adjusting the driver to identify the X{{I,O}D,ST}R4 addresses
as channel 4, under the existing LPC node as Tan suggested.

Andrew

