Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E149C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 22:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cq/JbKkLGX7k80X/FP/6XKLsNuVnZIsiMzYhoqbnyTQ=; b=S6N9KJWz78UJV9dQHfvDJBrk/1
	Op5zY/jVxjgjRZD6RdePv2VTmb/ptkPrNlbPdATxvGK2RV0SpeF0Zf1rZ1TzBWcVrGaLZx4Xq3IyV
	cWcZBdYaRFDQwGrsv+banOt6j65iJ5gMlCyf1FYhw/LsSahyyMEeC+AoiLmWeQUIVv7l+zw51Y0CL
	+0EHHojsgVeSSjITZiULUlUipJ9zuwOhyDJush/LS2+ag5d9lwNEkqAHboWW7GgIyP26mU1OsMYWt
	mf/TUWeQBF3UtjAhb4F1Lf/uqiZcBW31yCA8DcWeCqacfbeBcU8lXJe829EM+P2B2GY7IlgbFgkTF
	Gneqlq7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsV1X-00000009fWv-0est;
	Wed, 12 Mar 2025 22:58:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsUzs-00000009fRg-3IUw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 22:56:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 880B55C5653;
	Wed, 12 Mar 2025 22:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 297B1C4CEDD;
	Wed, 12 Mar 2025 22:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741820179;
	bh=C2dVQHeQfpncIDsa2OOeet8ETBUJqNFX8r3zQxrGOsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EdW41dJK5Ki4IRn7PulnBUlIvvFljDLIwvK+k1bdRF4zK2qTCqH2qou05o1nweoP/
	 9pmtgVbhPwhNBd5IJjyq1jabLoKsLNvoachJBoGKVrwFYf0z59apOTzCgFjQDxpYG2
	 HrHeAeVOzEX6aTYNCVcLxG0rVle9gOWEUFcJkT2FoZakc5iCAulKq26K1J/oO1xDuU
	 /wwRrLXIOTYhLUW2kLjzb2da1drOzrRBaR+e1c9YpusGxSU1veGqs7qFbT7kwB/G4j
	 2R2/kiojjpeY74sGWe+6bZtaukzASvexI+4xdoRoz3WtYZbkLgWU3Jme42Ljo7WaK7
	 gvF8DRqjd5sLQ==
Date: Wed, 12 Mar 2025 23:56:14 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Purva Yeshi <purvayeshi550@gmail.com>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, piotr.wojtaszczyk@timesys.com, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: pwm: Convert lpc32xx-pwm.txt to YAML
Message-ID: <yvljnqnlka3ecw2n3hw2zgfszlldvbww3k7gq72dczmf6jwzfo@4vqnygxuzvk5>
References: <20250312122750.6391-1-purvayeshi550@gmail.com>
 <57ae63a2-544b-4241-a54d-8fa9917c1e44@mleia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iy7a5myo3gppi3xw"
Content-Disposition: inline
In-Reply-To: <57ae63a2-544b-4241-a54d-8fa9917c1e44@mleia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_155620_879405_B078FAB5 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
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


--iy7a5myo3gppi3xw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] dt-bindings: pwm: Convert lpc32xx-pwm.txt to YAML
MIME-Version: 1.0

Hello,

On Wed, Mar 12, 2025 at 07:59:21PM +0200, Vladimir Zapolskiy wrote:
> > +  "#pwm-cells":
> > +    const: 3
>=20
> It shall be 1.

No, 3 is the right choice.

Best regards
Uwe

--iy7a5myo3gppi3xw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfSEQsACgkQj4D7WH0S
/k5lVQgArXoPIgUnIlPyk8q9Bcn7jLJRpgGwO+O5sTvf38V4qPY9FLas1+z8dtZ1
DD9UQk18kX7sxyYTLpttv0dZIzSmDyp6SRLtX5Od+EglVN1Qot7XBGfVJpDXcUS0
LPsaEkW+fFGfo6akWOIhD59gmZ5tw6otczN9MhA5ADsqtlGQHDJr60gv0MKFiQwk
Oe+6CRMt74IXOTXvvmGLaP5dmTDY2ili1/jd8SApSUuOycSr2RKRgUmXyUmnuGlp
4c8ZS4Cc5FwhkvLb5bDSKfq2+V6LV1U+0GHpXjZeLxt0HMhac7OJfMrR3k/tDfv+
mMyHg2ZcC58v/HLLzlKGt+w/Wka6CA==
=Nzf2
-----END PGP SIGNATURE-----

--iy7a5myo3gppi3xw--

