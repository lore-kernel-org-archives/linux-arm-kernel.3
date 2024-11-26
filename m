Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711B4D6552F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 17:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMw0GqhJmqKjngWxjE0FuljdZJe51pzCpHc92olktsg=; b=40yRzDUPXjziGGR7V40iT9seO/
	9TWfHJPiiaplPQAZwExEp4RgONczF+5u772JMGdVEcqKAPzPn6guYdZSyxvWt0nunNTte6YNjUqP+
	1zqHww1Sy3cTgEvwogwEV6Abkxu/Vn4MPK87c9SXgn1T3N0q286U7mvtlVXjj1AjVEafmxDeE4eAP
	ogByw5RmICSeaQHiWar6PDdncGQQ8JDNp0J5XnWYhahgM1jze938XM8NWP63JFKgB2knMuJACFiWi
	31okL2WAsCKTwiTyFjLro+CGnTe2dc1QpYTQeauJ+z4hnFLvG0pAM5CKR3x291BvyasLmAKWy15Pu
	7XDBIEzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFzG4-0000000BHfL-2UwB;
	Tue, 26 Nov 2024 17:21:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFzF6-0000000BHYi-3HL4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 17:20:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 06DA5A4013B;
	Tue, 26 Nov 2024 17:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF94DC4CECF;
	Tue, 26 Nov 2024 17:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732641651;
	bh=QPHDqdp1Iz4ItmYtNXUdpbKzhzK+eAyksb7F5ypnQAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LtZ/Hp1HUPosGaMR3k9jLYmvZ+tsF3djhFRMpWOjjxVzLUEBCm2HofqJbhnLY7oX+
	 ljJFXv8ckRRy5pq6QQZtLe1/GFnSfZunwg9BSSHD8wl7zPcYROneYtI0PA4wLCcZMa
	 7kwXa8l9/affardl+94iBZviODljjtz013/XJB394E7kXExpIlARCbq2pqa6JpIbyG
	 B5vwvcOxWLfCQlWYDamNfwY7EHkexLXsq8BIUNR3rZJJNkn8+8pPQaazGmDisSH0iF
	 +GLXOLWMcCr6XeJ6M567x6Wd10VPc5tzTFLxIM+pQV0gTyVS7N3grBDoza4bGAprEB
	 x4Sv/GyL/IGig==
Date: Tue, 26 Nov 2024 17:20:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Subject: Re: [BOOT-WRAPPER PATCH 3/3] aarch64: Enable use of GCS for EL2 and
 below
Message-ID: <154929d3-c46b-42cd-9785-c48aa1b08d33@sirena.org.uk>
References: <20241126153955.477569-1-mark.rutland@arm.com>
 <20241126153955.477569-4-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iXqpe4prpS++dm8F"
Content-Disposition: inline
In-Reply-To: <20241126153955.477569-4-mark.rutland@arm.com>
X-Cookie: Have a taco.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_092052_885431_C669C2F2 
X-CRM114-Status: GOOD (  10.77  )
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


--iXqpe4prpS++dm8F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 03:39:55PM +0000, Mark Rutland wrote:

> +	if (mrs_field(ID_AA64PFR1_EL1, GCS)) {
> +		scr |=3D SCR_EL3_GCSEn;
> +		msr(GCSCR_EL2, 0);
> +		msr(GCSCR_EL1, 0);
> +		msr(GCSCRE0_EL1, 0);
> +	}
> +

We're not doing anything for GCSCR_EL3 where (as for the other ELs)
RVCHKEN resets to an architecturally UNKNOWN value: =20

   https://developer.arm.com/documentation/ddi0601/2024-09/AArch64-Register=
s/GCSCR-EL3--Guarded-Control-Stack-Control-Register--EL3-?lang=3Den

This is also an oversight in the TF-A GCS support.  One might question
the decisions of an implementation which doesn't reset it to 0 but it
should be safer to initialise.

--iXqpe4prpS++dm8F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdGA28ACgkQJNaLcl1U
h9AK+wf/aTOu86gvoqIf6Vs7upo8jCx/+8Pwe2C0ZkUCiO4cPRRHm1ShjC/YCsZg
p6w9LyKT+M2kUESPTaXjKXTwxQhqJ9fYmjeEiMo5C6GUCkmWtXwe7c+55jjWxAS4
jBXcKw+aI20J9El1+WmIoCTRmJNCNals6o7lHtdRgh4/gsxtMzrZlWpj7B1e91Xx
mwYN5Roa/9i7+q42lnaO5xHkNcoXVt0Tlqqp0NDwtI5sA7vtI4dB4bkDhGS1053w
SY5D9/r8HMpR+mtfJwUDNkPKhyv59mGBTQ1hlAindSsQlzzPcUUM5Adg2dXJX9Lj
qsLfE8GD9yAOPQnhFjr2WHTz1slArg==
=53Co
-----END PGP SIGNATURE-----

--iXqpe4prpS++dm8F--

