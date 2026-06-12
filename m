Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91D3CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 12:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLaoj618ugGUnLY1sDpNI/JIio/w6trq+CPhGyjXJsQ=; b=hwHN3d7833liP4ErVAEgvfFzsG
	+IXMJvHzysdaUSLUvg1KByWMmWk+BboeSQPu/Pf0YDMM3hv8A6pTFvws/hKNBPsWOdnQUCrri7B6W
	F8abyCFpzPmWgPrF1W80imdOzpXw48QLHhYpvFVyeP+M/HHYXMaSyg/vHDqhBT2Pk0aPW7mArERaR
	YaTsxnVccze3sqgdGYyxMflSut9rOIh6HYyQninvusd55ZOy9+4i9FQYrZVdDvlV2qMJBSzj4PQnV
	vg+i0Phg1XtPHaTO3cHHOjuD6LPpL7ozotIS07zGBI/pQNEva5PElm/pDvjza3wjLR0ypkvedasan
	XdyyceUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY18r-0000000AsGK-3CGz;
	Fri, 12 Jun 2026 12:37:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY18p-0000000AsFh-12qt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 12:37:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 439AB42E3C;
	Fri, 12 Jun 2026 12:37:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6CEA1F00A3D;
	Fri, 12 Jun 2026 12:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781267862;
	bh=MLaoj618ugGUnLY1sDpNI/JIio/w6trq+CPhGyjXJsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OhPFpNLCMu6p3UVIv+GrZxDel5NM2zrkmRC32ICYU5eowxNFB8RcZVGwyCSZRyLZM
	 /uqWj9kwoBQEiVxC8Ip0zG/nN/arIoRZEw/bEpjw89sgxT8xBoKPhlr/jnYTKxsuq/
	 lKeNMQbw56u7gyR+vkDEA00yjnEBCgpYTc5A+abyyiw64m8i596EIWBI2u2dVQyaV2
	 cbWziNSzRsgaXBTOFTxv5HXBpT7DBAy7NCjsV3EiDlBmX/Q/04E5sjZvvZs5kasdBa
	 bSk/H2PMIT26qFCFyW6ySdgODFgJRVVFjRBO5M81vhnJKz8KLVQilFGSUH7gO7NIeM
	 +Lv0MC4rja6lQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id D74E81AC58C5; Fri, 12 Jun 2026 13:37:35 +0100 (BST)
Date: Fri, 12 Jun 2026 13:37:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sangyun Kim <sangyun.kim@snu.ac.kr>,
	Kyungwook Boo <bookyungwook@gmail.com>, stable@vger.kernel.org,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH] spi: uniphier: Fix completion initialization order
 before devm_request_irq()
Message-ID: <aiv9j5CInFE3twZX@sirena.co.uk>
References: <20260611113137.139673-1-hayashi.kunihiko@socionext.com>
 <airBmzYhnxuK_xdh@sirena.co.uk>
 <cd454dac-868d-43b9-9b50-9ba9f3f370a9@socionext.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y/POWcu9qVi0j0d+"
Content-Disposition: inline
In-Reply-To: <cd454dac-868d-43b9-9b50-9ba9f3f370a9@socionext.com>
X-Cookie: Nice guys get sick.
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


--y/POWcu9qVi0j0d+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 12, 2026 at 05:17:49PM +0900, Kunihiko Hayashi wrote:
> On 2026/06/11 23:09, Mark Brown wrote:

> > This doesn't apply against current code, please check and resend.

> That seems a bit strange. I applied this patch to v7.0 and linux-next successfully.
> Which tree did you apply to and fail?

It applies to none of spi/for-7.1, spi/for-7.2 nor spi/for-next.

--y/POWcu9qVi0j0d+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmor/YoACgkQJNaLcl1U
h9CSZAf+KZm3kSUqca9u97nHbQlwVjEXYEInZhJlUX0dECsMhLw97D1TU+Cj42+o
z6NIQNWrzvpywu3pRAlOgVSoxaqiusjIx6gD0jAvdM/OaCAdEKJTEJD2qSfqn9h6
++pfqfBtoM0Q+0yfEk/eVnaGFqBmk3977DpPNZkp+L8FkeLhQlKCajr+P5IFu1Bl
ly1uWFl8LSQUw1WJ6TXd/kiC5PMZYAAiewnm3PucfTRIl/21oz80u6KgIF8FO4w/
U9ryt6a1AMS+G1NiHPyI3QAipxLoolDVSq3Y4Gj01SBD9f7UMdWDeEq1XNT+1UPs
i0M07bDkqvtIFZyEI4kraBfL5ynkwg==
=P7CQ
-----END PGP SIGNATURE-----

--y/POWcu9qVi0j0d+--

