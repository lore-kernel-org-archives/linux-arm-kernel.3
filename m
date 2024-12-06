Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB782E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 17:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m0QFjLFPMZFiiWX4VHsAeE1u2jriXgVHOt446Y+NkQQ=; b=B8UcTQh9yWFd32LbWAYYdX/xq/
	4QTWN16vHnerhrYkr3k6fkMYAJcdtQcq/Qtj/zsTki/Lz3u1xv0e2iJufVPJsZvsl2NoMKTMWTvjX
	qgb0jUncYRmZ7dpBo6xcZKpV5SPwlZwR0YkxJ0JHRVfC0DrqOdjVFmgFRSeX3vq5xXd1qY98s+Adp
	K5iImcEwdLSVO7dRqwEeqTlLuOOrUMQfU1joBz5itIVCkV4c9vDTqqBilT3c++w8lofDUNkEQ3Azu
	1NV/OdrezBHRittH4biafVdR+f8myxsFURJ1WUq14OlB9RGArXVLdS0v26+I7VXhb/DvVPxvmBzpu
	psUi49rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbkE-00000002HI6-1FSs;
	Fri, 06 Dec 2024 17:03:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbjC-00000002H8c-2ZiB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 17:02:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4EB585C5ECF;
	Fri,  6 Dec 2024 17:02:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 583CFC4CED1;
	Fri,  6 Dec 2024 17:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733504573;
	bh=49stkS5Jr0gbDKUcViWSMu1jZ0Ttci8yCgTnQYqEciE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s95Pvg4hT1qOEsnoGUyCjcqlT8rFHJIecyBajPwtIJlikGvE804slOA25zRrwqQb0
	 tXt/X2XMt7XZ0YyBh96/pm95OBro70p9Cfee6m6LJivURqrimVPxtAvBgxdQXado9Z
	 6zZ42DBbu02ElICCwhfXUmmdipv/2TVTB2I79Nyr8Gzf7OKs+0INQywoi4jItZMw//
	 K/jov+IKTkQ7iPRQOOh7foyMJnRfOfR6H7J7kK9wP3zTjJm5RfY7LxrqCTK9/4Z50k
	 4G8I+vfuhjHp2Q3eHO8SGlv2eX0gNVubg9BY/hFCCzjVXpwiDPQDdFuR+p36VGdRR/
	 NSvZVwSc+0zCA==
Date: Fri, 6 Dec 2024 17:02:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Dharma.B@microchip.com
Subject: Re: [PATCH] dt-bindings: mmc: atmel,hsmci: Convert to json schema
Message-ID: <20241206-untoasted-ripening-83ecf98bc42f@spud>
References: <20241205-hsmci-v1-1-5a25e622dfed@microchip.com>
 <20241205-trickster-rebate-d5e64bc29992@spud>
 <4e3a4154-9e05-40b4-961f-6d7e95ec0890@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ScKT+5iAjDgPbCZa"
Content-Disposition: inline
In-Reply-To: <4e3a4154-9e05-40b4-961f-6d7e95ec0890@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_090254_739377_BAF91931 
X-CRM114-Status: GOOD (  23.14  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, Aubin.Constans@microchip.com, linux-mmc@vger.kernel.org, ulf.hansson@linaro.org, claudiu.beznea@tuxon.dev, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--ScKT+5iAjDgPbCZa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2024 at 05:16:39AM +0000, Dharma.B@microchip.com wrote:
> Hi Conor,
>=20
> On 05/12/24 11:15 pm, Conor Dooley wrote:
> > On Thu, Dec 05, 2024 at 03:27:02PM +0530, Dharma Balasubiramani wrote:
> >=20
> >> +patternProperties:
> >> +  "^slot@[0-9]+$":
> >> +    type: object
> >> +    description: A slot node representing an MMC, SD, or SDIO slot.
> >> +
> >> +    allOf:
> >> +      - $ref: mmc-controller.yaml
> >> +
> >> +    properties:
> >> +      reg:
> >> +        description: Slot ID.
> >> +        minimum: 0
> >> +
> >> +      bus-width:
> >> +        description: Number of data lines connected to the controller.
> >> +        enum: [1, 4, 8]
> >> +
> >> +      cd-gpios:
> >> +        description: GPIO used for card detection.
> >> +
> >> +      cd-inverted:
> >> +        type: boolean
> > This type conflicts with mmc-controller.yaml, it's a flag there.
>=20
> Yes, I overlooked it. I'll simply remove the type here.
>=20
> >=20
> >> +        description: Inverts the value of the card detection GPIO.
> >> +
> >> +      wp-gpios:
> >> +        description: GPIO used for write protection.
> >> +
> >> +    required:
> >> +      - reg
> >> +      - bus-width
> >> +
> >> +    unevaluatedProperties: false
> > Do you mean additionalProperties: false here? You listed properties
> > contained in mmc-controller.yaml which makes it seem like you're
> > restricting to this subset rather than allowing all properties - but you
> > need additionalProperties: false to do that.
>=20
> No, I'm not restricting the properties to this subset. There are=20
> additional properties, such as "non-removable," "broken-cd," and=20
> "disable-wp," that are used in our DTS files but are not defined in the=
=20
> old text bindings. For this reason, I used `unevaluatedProperties:=20
> false` instead of `additionalProperties: false`.

> Let me know if an=20
> `allOf` reference to `mmc-controller` alone would be sufficient in this=
=20
> context.

Yes, there's no point duplicating properties from there, unless you're
restricting to a subset. I think all you need to keep (other than the
reference) is the required properties list because there seems to be
none in mmc-controller.yaml.

--ScKT+5iAjDgPbCZa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ1MuOQAKCRB4tDGHoIJi
0puPAQDGnZ7QeA/JWBnu9hKRBgcjCLFYUU/RfTgFGpqBBbr0rwEAlDSML8gQFQC2
16Y1lIsu3uODoMdJwSPiOmNE7oFsdAY=
=XVJL
-----END PGP SIGNATURE-----

--ScKT+5iAjDgPbCZa--

