Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3C2CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 14:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/H/hJa1FEjQPpe/KYbX90f7yxfTWFQPS0ifgrelJ5fE=; b=TAL4kx78RyOB1LJSI686MbSCYA
	0wJRGTW66NVmHd8eFhOFQK9Kc1QyOfioxXxj10xEDtVOOtdZN/4rAWlJaFyzh4/yFrYUSEXlPGt0X
	HLPKexNG/k0fvhZNNYuuOFdAhWNngCrmjU4ZM2vopqx9psi+WvnACq8LgXfZBG36kqNPx6tFDNBSS
	pQC6jk/pMLs+GjqHPjzdz0f2fRKlxtNN5cjrtIhPMEFSgDEaQmGwg0YJy1qVNiPmJwRvcBr4Sj38L
	FKP5TrMrA3Z0i+GvpCtxvbgvZDrUKHSwH/REUQXq1NzYljHbE1s6dHukMTVzVhpfMn57aTifVHLby
	85ywx9nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRsc6-000000029O6-2x8y;
	Tue, 26 May 2026 14:18:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRsc3-000000029NH-36yd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 14:18:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ADB56418D6;
	Tue, 26 May 2026 14:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79E31F000E9;
	Tue, 26 May 2026 14:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779805110;
	bh=/H/hJa1FEjQPpe/KYbX90f7yxfTWFQPS0ifgrelJ5fE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q+J2Nkskz8fJbNcXHe8+HfSCiBX5wlDKZ3VHBcGJch0eEWdqVZQKbSomDNCFR1/L9
	 6+vc/55b6RRtqqLtzfBX2vwtbL90jyptSiUOFpAiTdpLjM09adfNbwNC9HKp2ZsJpZ
	 vKUUeTKTbLa4e/Vaz5aQhBcaDYzsH8/+z72mH9mofBkhVpNhihMNJl/5o3UGIl/y5V
	 rUWD9O0Z4BXvXFypcxg6dESELUWGtizrBqaZ91G7e20VfPdXyeFRQfSk3JZ2awsOZQ
	 BJ/5T29v8bzjPzu/XVcHf2ZLcIAYwDr8SXE7nuOLekRM7ocw1eFlot9hP1sOqZ5/ck
	 iF8895v+j4EGQ==
Date: Tue, 26 May 2026 15:18:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, james.morse@arm.com, maz@kernel.org,
	oupton@kernel.org, tabba@google.com, will@kernel.org
Subject: Re: [PATCH 01/18] KVM: arm64: Don't include <asm/fpsimdmacros.h>
Message-ID: <a9bc03f5-e7f1-4927-9156-8dc17ffdb5f9@sirena.org.uk>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-2-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PoA56a1ZTiAd6PNU"
Content-Disposition: inline
In-Reply-To: <20260521132556.584676-2-mark.rutland@arm.com>
X-Cookie: You are fairminded, just and loving.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_071831_800528_4D132ED7 
X-CRM114-Status: UNSURE (   9.63  )
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


--PoA56a1ZTiAd6PNU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 02:25:39PM +0100, Mark Rutland wrote:
> There's no need for hyp/entry.S to include <asm/fpsimdmacros.h>.
>=20
> The fpsimd macros have never been used by code in hyp/entry.S, and were
> instead used by code in hyp/fpsimd.S.
>=20
> Remove the unnecessary include.

Reviewed-by: Mark Brown <broonie@kernel.org>

--PoA56a1ZTiAd6PNU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoVq7EACgkQJNaLcl1U
h9A8Gwf8CEp6Hc6OgwT3SM+2uiPQUQevRblOiY6/WkUv407QoqYP4JDWJlHYqnDj
r/REeCBEJ7vcqX6hhZdkUz7p/MekCKN/0+pzOPUjZWHA1dTU082CFDAyFmxaq66c
VG31Dk0d4cbGrlMwhb3QflhiIp5bhAHLz2Kj5vrHuKZzESywAfZXDXtpXKFm4EQ1
1Hi0k/lnZEg+udle9++dDyzwC7GuHOAyhqUHnvXfssAmBdd8BVl/1A1YYjaPyimR
h0lYsHvEfYL2IfPI2pOZCIwGWIuVlvVHYkFmeBloCd6La/WXEsyy5I9r9JmGymTq
bucSQ4qKF+CHB42caIp8KgHDaDuaqw==
=LUWf
-----END PGP SIGNATURE-----

--PoA56a1ZTiAd6PNU--

