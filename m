Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28AFCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 18:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VPEfK2HV00u+RBsQ4iqA3+lJzL6g2LPeHpWVJp41g/Q=; b=NSL9Yl3ah25uIrZTmVvwlgknz8
	daPZFyMTTE/rBFjDatnclBz8f9He084Gd7kCSedI6ZJ/+LEwGo/g//aqNs32eM35Slcfkg/0tepp/
	8XA23OxmahzXw7lh/AJaFLGcxeMtjc78+SPhH/zmtxn2ypqufioO5iKzocJBbcbSUCSBAQJSFW/Yw
	drLi3NGHKAFgQ3yhFS5yoIoXxyCtug0NDgwzaqWvRrkFUG2bk07ZgfhzvWmeoZFs1UpB0jaUt7anB
	IaeX1HIC3j7eGeI9ul7Q8XvleJXzX23PugquFSbfBrNc2uQc866+GsE15t2V6h8JPdFH89Ml0FJEo
	rFdbe6AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCMSW-0000000AG23-3y0L;
	Fri, 24 Oct 2025 18:24:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCMSW-0000000AG1r-1ZUn;
	Fri, 24 Oct 2025 18:24:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C41FB60409;
	Fri, 24 Oct 2025 18:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D359EC4CEF1;
	Fri, 24 Oct 2025 18:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761330255;
	bh=LLx1LVGvdg/wvApXo8RtVwU0hoW7NYqi+oZmkFIZ39k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RR4orNYW7AprZEQyowFwqSLx1h0W6e1b7RiGBXsQQ9v/H7tVIS30aIBWb3m3zdJaE
	 aoYkPIjApdAfTe7+hUhTXABVdSUNzlJs965OvqMcXaF9lobYnmQfTpFc2fEQT9vsf/
	 +1/vr5/rT90UjC2/65DoRc4WNVje4+hfys20G3o/X8FH1dYHcBU6l0VH3/SeQ7tFkt
	 TJRlL/JkX3sMVvHK3NriiCGqb12PcY7ooP4wh//9ukX6u6yFTbowh3Dkgnde1S2oQB
	 kzW456X/g2/If31EsjjE25Ex3zR+DSkYh4xf/v98Phlpyc2GfdvLx/OZZaRjmkTPd4
	 NZXK60Fsg2HEQ==
Date: Fri, 24 Oct 2025 19:24:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	lgirdwood@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, wenst@chromium.org,
	igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v10 1/9] dt-bindings: regulator: Document MediaTek MT6316
 PMIC Regulators
Message-ID: <aPvETBr5aebElQUS@finisterre.sirena.org.uk>
References: <20251024083221.25758-1-angelogioacchino.delregno@collabora.com>
 <20251024083221.25758-2-angelogioacchino.delregno@collabora.com>
 <20251024-think-handwoven-504634ca620d@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JmMTACgssj5QFShR"
Content-Disposition: inline
In-Reply-To: <20251024-think-handwoven-504634ca620d@spud>
X-Cookie: If in doubt, mumble.
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


--JmMTACgssj5QFShR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 24, 2025 at 05:29:31PM +0100, Conor Dooley wrote:
> On Fri, Oct 24, 2025 at 10:32:13AM +0200, AngeloGioacchino Del Regno wrote:

> > +      regulator-allowed-modes:
> > +        description: |
> > +          Allowed Buck regulator operating modes allowed. Valid values below.

> > +        minItems: 1
> > +        maxItems: 3
> > +        items:
> > +          enum: [ 0, 1, 2 ]

> This property has no default, and the property is not required. Is one
> of these modes the default, or is there another mode beyond what's here
> that is used if the property is absent? Or are all modes allowed with no
> property?

The general approach the regulator API takes with everything is that if
there is no explict configuration then it will simply not touch the
hardware.  If nothing is configured then the hardware will be left in
whatever state we found it in which could be anything as far as we know,
it might vary depending on what was running before and what it was doing.

--JmMTACgssj5QFShR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj7xEYACgkQJNaLcl1U
h9C1HAf+KdL5D9OqnVx5rWOG0pLbQ5ra9sSXVXvx8aWFAW6Ba+V62qfedjY3AHnH
O++SR1ZapWXCWQDrH+bjeld94sYUImJ326N3uPtVvatNAYYbJPHU8s3kMuF9A+sf
y02rLo1vq+geNnKKwK5lyCGYskIT1rFlyXCn5ePGVtfH0zu87HGs8az0UGmdbhOA
en8RJs0eFPgqgXM7MYIvObJeoPcy7HypsI3oJXB7jdnpBzj3iLPDZOiCbFHvqd3m
GlZJzucyyKNGBWcgvrwb4afHilnDj+xEiCi77r4J5nEGHoAt4tgwdF4eGwnRlueE
8aAINtB/zLdXFGft3PIUrRVkH9kkmA==
=OCOj
-----END PGP SIGNATURE-----

--JmMTACgssj5QFShR--

