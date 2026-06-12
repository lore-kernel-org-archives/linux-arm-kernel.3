Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C19DCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 10:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSZngkeG6OG3hgQgiI1PMAc9onKC7al9v7n+pkogS+Y=; b=HJSCMJmZyjaXsgrtrKD9YRIbzE
	fQbr9mdvgwS+iVpSIUPFTDhOsQOBe+DTtz8Nw9sTgEC++Xcm/UgrvbEVezS0JhwyZzeyVClg1xDYm
	DBZET8I/tepmjcTMB8GsftBQv4r0uRFRqiDU6Vx4Cf0o8gQ6d2t2J9wbWJ0JRWOaUP86xPkI/SJMz
	bWScvj7PkuA+M6MVqSu+YPmA+EcifqbNWUV3lezlKzERy4m1WJSp9ZOGDJS7V/+TN/p/Wg5hFGQD+
	9tSOVCmCm6h/BlqLQCE43829OK7Z3YBvIZxiZO4kicuJl3Xu4R3PQlcfNK0cKbTM/S4KkqsNipkqP
	zyQdoMjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXyiu-0000000Aixb-1B3m;
	Fri, 12 Jun 2026 10:02:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXyit-0000000AixQ-0fdB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 10:02:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 394C86001D;
	Fri, 12 Jun 2026 10:02:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D7191F000E9;
	Fri, 12 Jun 2026 10:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781258565;
	bh=wSZngkeG6OG3hgQgiI1PMAc9onKC7al9v7n+pkogS+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=id6Oi05F9/1RZG3og/x/x8bjQgknLAd8WcYCy4bveNCkBqJ6iDV4v/hLVmtCQVjUl
	 9BLmcS0ebe6BXA2oOrZl/4Eg8Jmzu7Dy9gh29MHKXMmni3VXZ+IVoSHkPAAlNPe24p
	 fnhB2mDQTaELLk8Rv3XSW2kFUErBmyT933HWelFxKaoHypVsP6PhpZsE7v+7Jh6qEH
	 gqYWi7HUxndVy73ER9Bil2mjFE5ejOsboqPDJcYBPtptmLuUBROk2bKyRFyZzXTL6M
	 +RcclFviQfTnyHmuVFxr0ZNQs08l67c4PM5CS7yJHTvk873lzIr5q2cntwe4t6kLQK
	 pdB6aQ3ppRfeQ==
Date: Fri, 12 Jun 2026 12:02:43 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	Andrew Davis <afd@ti.com>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable dma-buf heaps
Message-ID: <20260612-tacky-authentic-cicada-bfb5fa@houat>
References: <20260527084135.842736-1-mripard@kernel.org>
 <422d7885-67bf-485b-b2fc-f0604a2213db@app.fastmail.com>
 <20260612-indigo-sparrow-of-action-d2bcbe@houat>
 <6a93097b-fc06-414d-a5f4-cf2dc98474d5@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ppz4kjgq3qecylwe"
Content-Disposition: inline
In-Reply-To: <6a93097b-fc06-414d-a5f4-cf2dc98474d5@app.fastmail.com>
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


--ppz4kjgq3qecylwe
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable dma-buf heaps
MIME-Version: 1.0

On Fri, Jun 12, 2026 at 11:41:18AM +0200, Arnd Bergmann wrote:
> On Fri, Jun 12, 2026, at 10:33, Maxime Ripard wrote:
> > On Wed, May 27, 2026 at 10:50:02AM +0200, Arnd Bergmann wrote:
> >> On Wed, May 27, 2026, at 10:41, Maxime Ripard wrote:
> >>
> >> I'd like to wait until we have resolved the build regression
> >> from the earlier patch[1][2]. I don't have a strong opinion on how
> >> to resolve it, but at least for now Christoph is asking to have
> >> your change reverted.
> >
> > I believe it's now fixed, even though not through a revert, and is on
> > its way to Linus:
> > https://lore.kernel.org/dri-devel/c7a9dbb0-a5c8-4e67-904e-1a52b3de9bb4@=
linux.intel.com/
> >
> > arch/arm doesn't select ARCH_HAS_MEM_ENCRYPT afaik, so this patch can be
> > applied as is I think?
>=20
> Yes, I've added it to the soc/defconfig branch already, though
> the automatic notification apparently did not trigger.

Oh, perfect then, thanks :)

Maxime

--ppz4kjgq3qecylwe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaivZPAAKCRAnX84Zoj2+
dqLUAYCQ1qWHtCUNOruXhLmXQIItqvrZsM4X1LrB9TE35LLbCQETF/Ia1YkE1uDR
XYpXJekBgKxsT2qu6dFYeqmUkfqv32ZEWjR7zDddxoPfYkbMkT1z9wadyYy0QBnL
maYl8lYniw==
=f1eq
-----END PGP SIGNATURE-----

--ppz4kjgq3qecylwe--

