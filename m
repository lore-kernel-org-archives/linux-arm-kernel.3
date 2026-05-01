Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B68CD3423
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 16:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2lycOerJ/sm2zydY2disN/3JhUOXzAUCe1IvGJdC00=; b=sqR0FxymUSFoSj3HeYQlJoynym
	YORlmXJLXJLtpnETnQAVOqd8E5Z7xM40IXNMoWIq8wgJelz/u6UUloX/UkGs2RmH0c4N5KLQ56y9S
	36ZS2XnZzj5OkJOkiiQpoDVPaVGa9bA+WZgEiP9CjkwxriZ3FG0SH4JqjojkaklyG9QQZK4GOsf7i
	5Jd1EIIy39KqX2bTRJW2XS4qlwOjmPyv6UE3A8tdwVzkDMPR5XkFuOlaTAx4SUt4+61cSm8kPcBUi
	wEuBimtCHNqJLA0axM13lOtLUTEnxrSxORpzcS9BW3NZzSK6qWQzXY+OcprHssD9LDpaJgkNnY3f+
	7qJlwLlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIqy5-00000007QEJ-2iOp;
	Fri, 01 May 2026 16:43:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIqy4-00000007QE6-0F8a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 16:43:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 243E2600CB;
	Fri,  1 May 2026 16:43:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E368C2BCB4;
	Fri,  1 May 2026 16:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777653834;
	bh=U2lycOerJ/sm2zydY2disN/3JhUOXzAUCe1IvGJdC00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WkfzXn3KrD3zRfFWHiwnGyiFmCnSMUasHmkgI7oV4m8pS9RSBxSd4I+gzB9JYSu8v
	 BiG2Zlcvey8LcGfbWWyIF7V6F6TeUcPZy3+DYiZSKWOqvnIEB+3AOLXk5zRwtnl1RR
	 Jcj7ECNt14fTqN7oFVAme52SWRU4ze/lCkV/bIzQhVsPFWCgcylIM9U45T697u2fWk
	 9hSABQkNtKofsGBsynDfm3cEhCJ/k7gEA3NwxpS4QPuT4R2rM7OYqqQd0ywpeONZdY
	 1kKs9gCTe1EeS1qIhK2OzXP4uXLm/nQooA8u8a+MgGZ4/IaDuTgMWxI+oCzPay9Q3m
	 a3ScL+Np72P/A==
Date: Fri, 1 May 2026 17:43:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
	ben.levinsky@amd.com, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: xlnx: add firmware-name
 property
Message-ID: <20260501-june-uncross-91d166e644d5@spud>
References: <20260501143707.1591110-1-tanmay.shah@amd.com>
 <20260501143707.1591110-2-tanmay.shah@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oCmpv8hoY+L52ogM"
Content-Disposition: inline
In-Reply-To: <20260501143707.1591110-2-tanmay.shah@amd.com>
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


--oCmpv8hoY+L52ogM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 01, 2026 at 07:37:06AM -0700, Tanmay Shah wrote:
> The firmware-name property indicates which firmware to load on RPU
> during the Linux boot time. It is possible to stop the RPU after boot
> and load different firmware and start RPU.
>=20
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--oCmpv8hoY+L52ogM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafTYRgAKCRB4tDGHoIJi
0s5kAP9p5IgY0q5+juGj+kyjqTZeSkLP2IBaBL6ptoV5UK6P9gD+P2Pn3a3BF0mL
GKNr1ytcz0hNvwVWxR+fF7knLUBGxwA=
=OYDX
-----END PGP SIGNATURE-----

--oCmpv8hoY+L52ogM--

