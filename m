Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BACCA0EF1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 07:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JCjWLxeGh14tYNyqo6lDpE4x/0mQUZVTmte1urJQThE=; b=3Q9NU7mJqMZiNloluvVX7Na897
	V2VzQS2oOVIjXbAIvRkNlp8HI/HzBScRA1Iz993yu5lb+Ix7GPcsMGWvM/0MApXHaWna30mlfQwVL
	ytxWeG6oigVzfd5Sb63izaNx+KX0Oq+IefTDlZ+5gvrvSsZM/OIbvrgpWegGApmh4lAvxfQBnrPTK
	b7hVoCMXSl8i9jeJaMhIkcmLPlHTbTWBGil76fUcImb3nkKZMYhia7pMk/2BfmYqnoOhntZjepxdU
	KMFDv9Wvj0HDPZ8RcP/x82nc9scFVidXd+XJJRPKPz8Dyg+RqYDCmEv+hCIg73rktX4I7WXS2f0re
	nw1OxBVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unueA-00000006pBA-2jA8;
	Mon, 18 Aug 2025 07:51:14 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1untGI-00000006cx5-3f1J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 06:22:32 +0000
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 1E0CD6BE;
	Mon, 18 Aug 2025 08:22:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1755498140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
	 references:references; bh=JCjWLxeGh14tYNyqo6lDpE4x/0mQUZVTmte1urJQThE=;
	b=p+rKxhwGZJYlLmW4DZ7GiEN4L5JFE7h4OR3Tqrd17Jt3xKodm/U6YwzA/k56I68MrG6eMO
	llul/6DKQtE+nrFFMfgiqe1mIQnulPRYyMWqDrQSuM0ug6CEzMtHCTfEidO5LvI/5dWQTi
	HlLbCix3FcL67bQG1bJwjZi0JIUbG3+MA0XlGISt4tGUJ0ePOnoCRjgLtCo0+syP7wqpCV
	MIGgYswBCiVy0JnEFduUF+2+0wBF3z2STZdc56ym9Toc+lxV43jWOxs3bz8p81haW8rUaF
	FOjx/gYE3GNsgURe+Np6hAgir7g/gEXNmwLpvjGXM1OgkliOQPNftgTA+XliQg==
Content-Type: multipart/signed;
 boundary=5020df314e58c7e913c14c73516544fda37893398f5f3a17a4119856c99b;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 18 Aug 2025 08:22:18 +0200
Message-Id: <DC5C5JA237HD.1ACBQVG1LYQ7Z@walle.cc>
Subject: Re: [PATCH 3/3] arm64: dts: ti: k3-j784s4-j742s2: enable the
 bxs-4-64
Cc: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <d-gole@ti.com>, <afd@ti.com>,
 <bb@ti.com>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <detheridge@ti.com>, <matt.coster@imgtec.com>
From: "Michael Walle" <michael@walle.cc>
To: "Nishanth Menon" <nm@ti.com>, "Randolph Sapp" <rs@ti.com>
X-Mailer: aerc 0.16.0
References: <20250808232522.1296240-1-rs@ti.com>
 <20250808232522.1296240-3-rs@ti.com>
 <20250813151819.5rthljjrpryfwezz@skinning>
 <DC1HU458W3QA.YLONSMYKK0C4@ti.com>
 <20250813181300.xfpsu23arx7xy4fy@anointer>
In-Reply-To: <20250813181300.xfpsu23arx7xy4fy@anointer>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_232231_092353_91987EA8 
X-CRM114-Status: GOOD (  22.91  )
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

--5020df314e58c7e913c14c73516544fda37893398f5f3a17a4119856c99b
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Wed Aug 13, 2025 at 8:13 PM CEST, Nishanth Menon wrote:
> On 12:58-20250813, Randolph Sapp wrote:
> > On Wed Aug 13, 2025 at 10:18 AM CDT, Nishanth Menon wrote:
> > > On 18:25-20250808, rs@ti.com wrote:
> > >> From: Randolph Sapp <rs@ti.com>
> > >>=20
> > >> Add the relevant device tree node for Imagination's BXS-4-64 GPU.
> > >>=20
> > >> These devices uses a similar MSMC configuration to the J721S2. As su=
ch,
> > >> they also require the use of the dma-coherent attribute.
> > >>=20
> > >> Signed-off-by: Randolph Sapp <rs@ti.com>
> > >> ---
> > >>  .../boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi  | 14 +++++++++++=
+++
> > >>  1 file changed, 14 insertions(+)
> > >>=20
> > >> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dts=
i b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> > >> index 7c5b0c69897d..a44ca34dda62 100644
> > >> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> > >> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> > >> @@ -2691,4 +2691,18 @@ bist_main14: bist@33c0000 {
> > >>  		bootph-pre-ram;
> > >>  		ti,sci-dev-id =3D <234>;
> > >>  	};
> > >> +
> > >> +	gpu: gpu@4e20000000 {
> > >> +		compatible =3D "ti,j721s2-gpu", "img,img-bxs-4-64", "img,img-rogu=
e";
> > >
> > > Following  https://lore.kernel.org/linux-arm-kernel/DBE4UO2RGAYX.17V1=
DAF8MQYJM@kernel.org/
> > > Is it worth having ti,j784s4-gpu here? Are there any SoC specific qui=
rks
> > > that driver will need to handle?
> >=20
> > No SoC specific quirks, aside from those already being tracked through =
the
> > dma-coherent attribute. If we actually want to register SoC specific
> > compatibility entries as advised by the kernel docs, just let me know. =
I've seen
> > this opinion toggle a few times.
> >=20
>
> Please provide bootlogs on linux-next with just this series applied.
> IMHO, based on what I see at the moment on GPU, it might be a good idea
> to have SoC specific compatibility entries.

IMHO, that's *always* a good idea, even if the IP is the very same
as the integration might be different.

Apart from that, we now have two series which partly overlap.
Should I repost mine, as that's more than just the DT entry? (Which
doesn't work as is, I'd guess.)

-michael

--5020df314e58c7e913c14c73516544fda37893398f5f3a17a4119856c99b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaKLGmhEcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+CG0AYDttjNUvi7U4uugJWozE7wr/9v404fRPKae
MHBLFgHa9SuLDPG1DHz98nE+zofqZKMBf0rHJGLROCsCEODHOqtV1n+1QTQ4lnEK
bMC8pQbKbtPYITEh7sb88sgeL3ZvU0pG7A==
=D13I
-----END PGP SIGNATURE-----

--5020df314e58c7e913c14c73516544fda37893398f5f3a17a4119856c99b--

