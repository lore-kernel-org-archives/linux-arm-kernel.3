Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4797CC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 03:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8yOpNQy324idmvNFHGFEoA3SmHzvUV0L338XL2UrisM=; b=mTpEeCpiUR49IoN21xGYs4V6Wm
	O86/65kGMX5BE5P7PvStLeU6HpdFsIxJ6f1KL33g8GqZzjfNw437LKeNT+kGs5HpMQiWv6ZAvSXaD
	12xmxud0tmY8wQUN+q6jLU+JeqKeoqDMApQ4xCqglszXmRugDvAmYtSXtya32uUq4BTjbtrvSxIKZ
	6u0ir0G8JYoOFJoFERlGPyQ2ovwEEs6fB/LtBECpIJxC4FPpzEtkJu1f7nzaSqyee6UkkIlJFrY6j
	5LjzMJ0tbzjs5XR4NlCa3LFp5+4kb5pt8FKYlT9zGliKVosQ+sx4H8NPw8EtgN8s916p8tM4b1jgb
	2TL3tviw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVkM-0000000E7vW-3iUE;
	Wed, 07 May 2025 03:47:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCTtv-0000000Ds59-3qpM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 01:48:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 23B9D5C5970;
	Wed,  7 May 2025 01:46:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BCAAC4CEE4;
	Wed,  7 May 2025 01:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746582527;
	bh=QRq1fdMLNW+ONielrnM7EpTo4fXJekJZQBCi8NNd94U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V7B6ciyJCLTN6wISn+daeVQNMVqB9x1APOhYB8e4sDV8KrHiS/ZAmQkRSVmgwltws
	 dvpGsczJOQkn8sFI0W1xjA1fP8JrRA0N8qIAltkNK2UlKLUwiQJwAWybpAUNp4T1Tq
	 mOop0l9SXd2F6UI2KZz2j0VDXeqAZfuYzOeoxGkb/FCIda+dnClI4PO/ll2SKUStmE
	 2HQC5B9RnaIeME5QyzrJy2ONfo5SDcEkjIDBzQiNuDleYw3HE+hKpFs6twMrr81RTB
	 hiR6ng9nSo734y9pbiHu6CruKW7WEVabF7wpL18hzXwxfh7rogB1to7WjjlQuI+COe
	 MYMzAMbIzB7pQ==
Date: Wed, 7 May 2025 10:48:43 +0900
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	daniel.kiss@arm.com, david.spickett@arm.com, luis.machado@arm.com,
	maz@kernel.org, richard.sandiford@arm.com, sander.desmalen@arm.com,
	tabba@google.com, tamas.petz@arm.com, tkjos@google.com,
	will@kernel.org, yury.khrustalev@arm.com
Subject: Re: [PATCH 00/20] arm64: FPSIMD/SVE/SME fixes + re-eanble SME
Message-ID: <aBq7-_VhS8DXFgYL@finisterre.sirena.org.uk>
References: <20250506152523.1107431-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/mM7UNCTaZFG4Wu1"
Content-Disposition: inline
In-Reply-To: <20250506152523.1107431-1-mark.rutland@arm.com>
X-Cookie: Well begun is half done.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_184848_151599_2101218C 
X-CRM114-Status: GOOD (  13.04  )
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


--/mM7UNCTaZFG4Wu1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 06, 2025 at 04:25:03PM +0100, Mark Rutland wrote:
> Hi all,
>=20
> These patches fix a number of problems in the FPSIMD/SVE/SME code, and
> finally re-enable SME support.

I've given everything a first pass and aside from previously noted
changelog nit on patch 17 which don't affect the resulting change this
all looks good.  I'm on holiday for a week and a bit more so probably
won't have time to review properly, other than a couple of the smaller
patches.

--/mM7UNCTaZFG4Wu1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgau/gACgkQJNaLcl1U
h9AhuQf7BKiupfz1fl6gyd0cGgwjqZi9DeQvRK80GeBFFasG31itq74bqz8Wx1B1
xZH3Kt4ovD/DA6ZgB6RX8pZVr0z26ml4bUqMp1JEVQKeKLQZrNyzUu7o1GNRG8/d
2V4yM2u1xzqGF5AmDa6ks3Ty2R2j1zNuBhteo/J3GaWmBXv794cxbaAbPHsqJ5/M
eTKWHiAfxjPZdIGl3h5bEgDKDzJUd0g4Emxos6h9gWQ0DSnzeDnvRnz2yaihSkII
QtYXsrSs9IkMltZ9Qhqi9qVzC9DgoMxaT73Idk8vGtNI0Ss7T/6n96Dbv9KCPYk2
VAqlXgJJ29pc4ujpvVFKt/cOZoCY2g==
=EdTy
-----END PGP SIGNATURE-----

--/mM7UNCTaZFG4Wu1--

