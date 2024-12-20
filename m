Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A565E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 11:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o5+0LRU9BHm/vYrKwnjKnUl9lt1xT7pJYC4J0EE0Fuw=; b=qRerj9W4aKCxj46QFC7bb6dcRt
	HuR78fXfV9fLREVkz6hfbOvpiDE7tVmNf5oScNYNpQgHFi05o+6cutwXIjABjrhEsZ3vmyOt5Q/q9
	vyzLTLiVxdpLVoOvdJOSkKBavTUPfY5rLArWvSXEGGDJdth1o/0GbUUV0tJau2YFE+n4APw/mQkHx
	XP3HHX7+aq0xNl2RB0ZohIMHsKMCaJ5fWirkrOzcYAbVWwbEuruff9FuVNUuqsq572gRRtdqsWP2P
	B8GxOY1bdQ6tyXh93UC9rZPANFmQ8xHqjZODRJZxU1JprPIxjFqRhHYIWz3LY79gF3ySo8yAl9Gbb
	SjJrkfCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOave-00000004g8i-3SHl;
	Fri, 20 Dec 2024 11:12:22 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOaGd-00000004b7O-2ia0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 10:30:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 871EB101D2932;
	Fri, 20 Dec 2024 11:29:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1734690595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o5+0LRU9BHm/vYrKwnjKnUl9lt1xT7pJYC4J0EE0Fuw=;
	b=MnkTvBEJfAbFhOWuvBdHfY9e/XL0Ba5PIgq9kv4oC3ifRpy1gh75vMph7U0ZxjeG+oiFPn
	8ELR4NPjLfHcykTxc7+kYyJZsZkof3+5YCvIc8yP2Dh8qVBJyS6/7JC8VUD+zW4PK/vHUH
	gYIju1yOoRT4fPDAs7TFFuVKKuS4ArQfKyTMu3h+zvAG4SUUVZFCAFRodW3Xj19YWMdrs+
	v/RvZNMXjTylOpXu/KsyuyLKVEIYu6370MbA5+sC0P07VOGuDkSLvZBMpTd0Tv5iC4GLvK
	KsounjmGrL3KlldB4PrmAklEa9Qac24hY6ouosNLQ0oA2gVrD1vKfEhRVRN6sg==
Date: Fri, 20 Dec 2024 11:29:50 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan
 Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH v11 1/3] dt-bindings: display: Add
 powertip,{st7272|hx8238a} as DT Schema description
Message-ID: <20241220112950.4673bb3f@wsk>
In-Reply-To: <20241209105240.72d8d84a@wsk>
References: <20241107085705.490940-1-lukma@denx.de>
	<20241209105240.72d8d84a@wsk>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/25mHm/ToeN+o9iYIV0K=TSU";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_022959_988861_9B228547 
X-CRM114-Status: GOOD (  27.86  )
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

--Sig_/25mHm/ToeN+o9iYIV0K=TSU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Dear Community,

> Dear Community,
>=20
> > This patch provides the DT Schema description of:
> > - powertip,st7272  320 x 240 LCD display
> > - powertip,hx8238a 320 x 240 LCD display
> >=20
> > Used with the different HW revisions of btt3 devices.
> >=20
> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > Reviewed-by: Rob Herring <robh@kernel.org> =20
>=20
> Are there any more comments for this particular patch?
>=20
> If not - can it be applied as it prevents dts patchs to be pull by
> Shawn.

Gentle ping on this patch ...

>=20
> > ---
> >=20
> > Changes for v9:
> > - New patch
> >=20
> > Changes for v10:
> > - None
> >=20
> > Changes for v11:
> > - Combine both separate dt-bindings patches for powertip,st7272 and
> >   powertip,hx8238a into one
> > - Drop the quotes for in "title" entry of powertip*.yaml files
> > ---
> >  .../display/panel/powertip,hx8238a.yaml       | 29
> > +++++++++++++++++++ .../display/panel/powertip,st7272.yaml        |
> > 29 +++++++++++++++++++ 2 files changed, 58 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
> > create mode 100644
> > Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
> >=20
> > diff --git
> > a/Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
> > b/Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
> > new file mode 100644 index 000000000000..b7d74faeb5d5 --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
> > @@ -0,0 +1,29 @@ +# SPDX-License-Identifier: GPL-2.0-only OR
> > BSD-2-Clause +%YAML 1.2
> > +---
> > +$id:
> > http://devicetree.org/schemas/display/panel/powertip,hx8238a.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml# +
> > +title: Powertip Electronic Technology Co. 320 x 240 LCD panel
> > +
> > +maintainers:
> > +  - Lukasz Majewski <lukma@denx.de>
> > +
> > +allOf:
> > +  - $ref: panel-dpi.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: powertip,hx8238a
> > +      - {} # panel-dpi, but not listed here to avoid false select
> > +
> > +  height-mm: true
> > +  panel-timing: true
> > +  port: true
> > +  power-supply: true
> > +  width-mm: true
> > +
> > +additionalProperties: false
> > +
> > +...
> > diff --git
> > a/Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
> > b/Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
> > new file mode 100644 index 000000000000..f3622800f13f --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
> > @@ -0,0 +1,29 @@ +# SPDX-License-Identifier: GPL-2.0-only OR
> > BSD-2-Clause +%YAML 1.2
> > +---
> > +$id:
> > http://devicetree.org/schemas/display/panel/powertip,st7272.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml# +
> > +title: Powertip Electronic Technology Co. 320 x 240 LCD panel
> > +
> > +maintainers:
> > +  - Lukasz Majewski <lukma@denx.de>
> > +
> > +allOf:
> > +  - $ref: panel-dpi.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: powertip,st7272
> > +      - {} # panel-dpi, but not listed here to avoid false select
> > +
> > +  height-mm: true
> > +  panel-timing: true
> > +  port: true
> > +  power-supply: true
> > +  width-mm: true
> > +
> > +additionalProperties: false
> > +
> > +... =20
>=20
>=20
>=20
>=20
> Best regards,
>=20
> Lukasz Majewski
>=20
> --
>=20
> DENX Software Engineering GmbH,      Managing Director: Erika Unter
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email:
> lukma@denx.de




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/25mHm/ToeN+o9iYIV0K=TSU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmdlRx4ACgkQAR8vZIA0
zr0XbAgA5iqj9b+C/98WlKQ+nnjBCEN9MDzEPcZlN+cQQMOfmPTl4Lq1pfZo5GBk
jvgj62dVsNxoP1NH9xy4Rg3EK/ziP9kiDt5MqNDsrqiKHHM9vXY8uwf61y1M2z3c
slHpUbCwmyhntSUThpKU9llWz29tBLyV7iTYPwaTk8Ca78wBRMCmsHy3TCxOisdW
311WkZNGPbtnPnNjyVPSa8CYOYOOsiExN/oKfiO5bo4k4jQhYSAClEeAAjrt5xBZ
Fh/nXmnkuB1+8/buKAfRaigA7erR4x63jns/Qml3mM+3/cM4gqhL+zcYYQrqNjix
1op08Bn9NIUeeeV6GlycDFZWBsVZug==
=w6Dt
-----END PGP SIGNATURE-----

--Sig_/25mHm/ToeN+o9iYIV0K=TSU--

