Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCD8CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 17:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/EyzyqOPwaL+oAE1VodwcQtEAGsW/sK8DNFtfnwB6k=; b=hjCb1UVdkc+uPlUo+VV6DoYfj7
	1fQHilcyArim7fnmNit5Rpk3jx63JzbgG7k1KWOHYhGxYX/itbVHljtMWtxZf29r3mRKZy0ay2WxN
	BWW/0BtfqDIJTkkwPKxlRh4bbToQMQNiEHm2Uvl1jHh80oigUSW418aRn5TM0Y87P8u/iYdW004py
	wgpY0Hr/Nk09GC2gd3R1TdqRGZ9zf3T31baPOrRBrNXfP/PEbv2KEUDaIp2a0Yqs31/DimJeFLpF8
	Au1uZF1aZpnIvu3NNykLgWNv+hCGDN3X/ooW+JwmhT5cJYu7kEQPhx64WZZ8l3M2qgGl8Ff+qeIkq
	f/V4NuoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHQgh-00000000MpP-0AhS;
	Fri, 07 Nov 2025 17:55:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHQgf-00000000Moj-1bpR;
	Fri, 07 Nov 2025 17:55:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B3486404FF;
	Fri,  7 Nov 2025 17:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E611FC4CEF5;
	Fri,  7 Nov 2025 17:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762538148;
	bh=KsHAutSO0+jRZTRW6v0AyBfmPVJSe4rt3XRnCMKT/PQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OmEyV2ZpjUej5W8g8xgZb7EpuJAvm5kbe8+m/iO75O2GYsgf3q56wN8hZd5HqOFXT
	 2r1BiaPOIA69I+l5TawWwV67Wm1/OWoGKVqA7IEob8yOCNfFJvnP9YbhbrgztrlolW
	 7Cx7CO1U+GQCpGrFygy5symEcjVZ96lURErnhNpKx+8kdfvwO7HF+AMQmF62O+SfaX
	 blOrfKF2KeibeVtSFz2UU01tjvjs8nC/HmVRolLEWuibu3UIe1aEbKjEfEnCoq2gyQ
	 +qcajAB8GBQhOGf6JvoMYWLGYAQNnBHOujyG53AlRjWq4QmexQ8dHEO03xpWvh0azT
	 MQSYK06zFzieA==
Date: Fri, 7 Nov 2025 17:55:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/5] dt-bindings: pinctrl: airoha: Document AN7583 Pin
 Controller
Message-ID: <20251107-jasmine-unarmored-e3f5d544a1b7@spud>
References: <20251106235713.1794668-1-ansuelsmth@gmail.com>
 <20251106235713.1794668-5-ansuelsmth@gmail.com>
 <20251107-washstand-motivator-c5e5e5d30dae@spud>
 <690e311d.5d0a0220.2f18f8.2b28@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ziqGf3BxzFRC7IT8"
Content-Disposition: inline
In-Reply-To: <690e311d.5d0a0220.2f18f8.2b28@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_095549_440479_8BEF6C72 
X-CRM114-Status: GOOD (  17.90  )
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


--ziqGf3BxzFRC7IT8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2025 at 06:49:13PM +0100, Christian Marangi wrote:
> On Fri, Nov 07, 2025 at 05:24:21PM +0000, Conor Dooley wrote:
> > On Fri, Nov 07, 2025 at 12:57:07AM +0100, Christian Marangi wrote:
> > > Document Airoha AN7583 Pin Controller based on Airoha EN7581 with some
> > > minor difference on some function group (PCM and LED gpio).
> > >=20
> > > To not bloat the EN7581 schema with massive if condition, use a
> > > dedicated YAML schema for Airoha AN7583.
> >=20
> > You went to more effort than I would have here with that conditional!
> >
>=20
> Well it was suggested by Rob and it's honestly a copy paste of en7581
> with the relevant thing changed.
>=20
> > > +patternProperties:
> > > +  '-pins$':
> > > +    type: object
> > > +
> > > +    patternProperties:
> > > +      '^mux(-|$)':
> > > +        type: object
> >=20
> > What's up with this regex? Why does it allow either - or $?
>=20
> It's to permit either mux-* or unique node name with mux. Pattern is
> also used by mt7622 or other schema. Other use mux- to require a name
> after the mux.

Ah right, because you can have the config properties like drive
strength in the mux node, so sometimes a -pins has one mux node (mux:) if
all pins share settings and sometimes there could be multiple, which
requires a suffix.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--ziqGf3BxzFRC7IT8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQ4ynwAKCRB4tDGHoIJi
0t0WAQCYi/sTEZGfOCnMpmD62rU4qQH2id+MTaCGOfbnq0m68QD4igxSe0PtzF/7
nBp3YwNExDkimenQ+/2opbkn97j/Cw==
=losc
-----END PGP SIGNATURE-----

--ziqGf3BxzFRC7IT8--

