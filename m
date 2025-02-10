Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D73C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 13:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gG953z7ueTT2isakPmNv5Oysa5f49gi+YI1anmP4//M=; b=2dYRaAzpu08Y4jICSrBSE7nsSq
	FJNhF41SLrDcQgZakyIWPNd+pBnJFXi5ByV6BCnBcY79ZVaAAdT0Z5HI+mXGa/lzXMkgwxGFsygiD
	nd67QvP09ClXirRfQ9betk74FJ3BGZUhl5s7V8ebRu5RJG59b8xhp3XUn8LO6ZnvFu3Oa+SsHWUwq
	YAoj71QwZuvVsR8LR91/7LxdeFfmy+5nOYwDGGkwU081WOE7pa3lF+j5MxaC97QGme59oMgdq+MGK
	+LQ+0KM5WC4xSuRsMFVeK+H633bowy0HuYbgj9YoOrB0i8Q0Va9pXLGdQIUE1oN2AwYPLDJzkluvY
	lWN1NpEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thU25-000000000B7-05sO;
	Mon, 10 Feb 2025 13:41:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thTlP-0000000HX4F-2W6r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 13:23:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 59FA65C569D;
	Mon, 10 Feb 2025 13:23:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CCA0C4CED1;
	Mon, 10 Feb 2025 13:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739193830;
	bh=Y3VnAjPcpvtraPLxFVav8kpsZk6gHNCgxWi8l3iTFmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=INz2PkzdF3dydAUsheI8aeft2xxJ+B7mQw9D0MLNqlf0zXGx26unNWV7PP+NQfzjG
	 2L2sRIfK2BKLo86SxJmXSi8yNkzko2BHHIuYYeLg9EGE/McmwSXKPsMqg9n+VYhf2k
	 Cg18HM8JVLu+SXg+7Umx7NTSLOx9TXuZ7UDzlV/TXQfVg9BclrzEWT9eve+FG4AG1p
	 jo5cHjxM30wtfrvjRQiTf1oquOI8VmHjDp3+U8QNpFBCxY850z8g001ehO7nW1eIO6
	 DX9FEsHVa5RFEoXF3/P+DCDvqJFM7THfv1lTEoAuj9v+LfNWff+kkc568hsbiHhemr
	 bWalo2X5W3TdQ==
Date: Mon, 10 Feb 2025 13:23:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Subject: Re: [PATCH for-6.14 v4 0/2] Add more devm_ functions to fix PM
 imbalance in spi/atmel-quadspi.c
Message-ID: <e0087d48-c8d2-45c5-ab28-78879a07eb22@sirena.org.uk>
References: <20250210111008.248929-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JSVsPF+JhA2IRy98"
Content-Disposition: inline
In-Reply-To: <20250210111008.248929-1-csokas.bence@prolan.hu>
X-Cookie: A beer delayed is a beer denied.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_052351_680958_F6B7FA70 
X-CRM114-Status: GOOD (  11.91  )
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
Cc: Len Brown <len.brown@intel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-pm@vger.kernel.org, Alexander Dahl <ada@thorsis.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, Pavel Machek <pavel@ucw.cz>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Varshini Rajendran <varshini.rajendran@microchip.com>, Danilo Krummrich <dakr@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--JSVsPF+JhA2IRy98
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 12:10:05PM +0100, Bence Cs=F3k=E1s wrote:

> Bence Cs=F3k=E1s (2):
>   pm: runtime: Add new devm functions
>   spi: atmel-quadspi: Fix unbalanced pm_runtime by using devm_ API

Since you've not copied me on the PM patch I'm not sure what the story
is with getting that merged.  I'd not expect new APIs to be merged as
part of a fix, but perhaps the APIs are small enough?

--JSVsPF+JhA2IRy98
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmep/eAACgkQJNaLcl1U
h9C+PAf7BUluKVL8LhJBrCwdsziAE82+ORU8+jWviBfZfMhtV4lOsA5LDeq9L3rZ
D4vzWJunEcCFBqVQRYRFUtQTN0BvpqG2ELaEgZzKkkaP9J7PY7aFuNu1YBMwVYhk
BhkjzKr8RDcpkwaPLY2telDFB0Zb7N1/bzln1Q4QGWFl/f+xBj6W8k/7nQeGXmWb
hxbsesr6VLxSI8DwKJXZCYQYh1vtd1N8b01WYXfwA8yEJTlQzT+6Qw74F9T3ZbbG
OE0W8Ukd3VQHi+Z4XYdWrJM+CHqeApw34hR/whxnw9lhWUyVGX6q6CZJKKC01kRu
1Xi51tdbGeQW10KUD13OJKo83xOTDA==
=85Yu
-----END PGP SIGNATURE-----

--JSVsPF+JhA2IRy98--

