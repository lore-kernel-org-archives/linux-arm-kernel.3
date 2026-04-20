Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE99AF588E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 15:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RXTlata/cDCaSGkwzCEWmovi5WJsV4Y9htt8/UPRgxM=; b=K4OsCkOQOjfjetUI0leWPjYbQH
	XIm2ddwa0YyqgcFqhv8BONDuXD3sekyS6fmvpmhbDCUTBTMr/T3qXNrOKSPfrXl83BWQVa6rg5QS7
	qxVh5DBYIzLCtvr92Skk2GGCxevv22KJTc7ofMVr5VQXLryiuT+RhlcI7Is4w+UBzelCDhyo26Ul3
	B1OTkYRyjj1AOUFhc6Xy5gK6xAW6Mbaq0uNe0rhvC5MeLHjfxT85XmWgzIWtLuwKUaFVkt1dBnLqC
	02vl6Memh0QusOXUUGbN/Nfu0UoiOoGJwajd/q8JvXsuD6lIjnkCtMijgjc54oHnIBVAkczso9VoV
	YBy2fvnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqg1-00000007K57-01XX;
	Mon, 20 Apr 2026 15:36:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqfw-00000007K3E-2cH4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 15:36:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C6CD760018;
	Mon, 20 Apr 2026 15:36:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C507C19425;
	Mon, 20 Apr 2026 15:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776699399;
	bh=AzFmS5Tnu8sMhg8eDHy3LPsdHF0AOqqG0otqcA9EY1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aRrAXzKAS0bBFun9CQKrTyofiR5UlWY17F+ckg075QcTe2r9+vjrfK++RzMggttkV
	 q1NTwF7XAvZjmFfZLPpUmtgMYHiDG2drOziCXgfLcWd0Y6nEvjujmTwVZmr5hMl1wU
	 CpaQ6uFIbL/EpyQ6i/wUmfEaRC4/BNEMMkieXlqICQmUyLAF5aakdEG77cGbUkLmqz
	 xjBh+OUX0oJ5Fa5DT38dIq0PLIc5seAMFXqe/ETiWMO5q9VvdUgynajX2MEWNsqgBM
	 AuMqXg2f+PdpqyrfovuxaJ/zCNSe3WpEcIJstH9jBILV0URQE+p5fot3kNejTRHC7U
	 FmdZfQNqOrUaQ==
Date: Mon, 20 Apr 2026 16:36:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	colin.huang2@amd.com
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: aspeed: add Anacapa EVT1 EVT2
 board
Message-ID: <20260420-garnet-goal-4a284a8818fc@spud>
References: <20260409-anacapa-devlop-phase-devicetree-v2-0-68f328671653@gmail.com>
 <20260409-anacapa-devlop-phase-devicetree-v2-1-68f328671653@gmail.com>
 <20260409-foster-stability-f77b38c6f7a0@spud>
 <CAPBH0A_K39218+=QHJuEY+SbFk-nCnM=Z8RQMdHBK7SkCj2QtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rT7U0ER3rzaPGzgy"
Content-Disposition: inline
In-Reply-To: <CAPBH0A_K39218+=QHJuEY+SbFk-nCnM=Z8RQMdHBK7SkCj2QtQ@mail.gmail.com>
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


--rT7U0ER3rzaPGzgy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 01:41:30PM +0800, Colin Huang wrote:
> Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B44=E6=9C=889=E6=97=
=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8811:36=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > On Thu, Apr 09, 2026 at 07:40:26PM +0800, Colin Huang wrote:
> > > Document Anacapa BMC EVT1 and EVT2 compatibles.
> > >
> > > Signed-off-by: Colin Huang <u8813345@gmail.com>
> >
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > pw-bot: not-applicable
>=20
> Hi
>   Could anyone let me know, what is my next step which I need to do?
>   I can't find the changed in for-next branch of
> https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git .
>   Thanks.

You wait for the merge window to end and the maintainer to apply your
patches.

--rT7U0ER3rzaPGzgy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeZIAgAKCRB4tDGHoIJi
0gyRAPih4zXoYopFmAszf/ozsfmpEp1cZspkWl07OnahV3yqAQCD9Sal/PjSSKtW
PGb84+0XAkYu+zzoDJlWPigE0ykYBw==
=g4DA
-----END PGP SIGNATURE-----

--rT7U0ER3rzaPGzgy--

