Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD98C7113E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 19:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iE0MsktbDEMe3NLkiMxHJ519do5Gp8up7Y9Iq9kO5V0=; b=TQZakfAdMGq2SXNDEgAu/Ph2lk
	t1UHs5dcHvNHHeFsmZ5eSb4buimnl6PZZ9Bzj6mHeXqLxPqCzhPyxsLR7wzN0Qoy5OOuz6/FVQsck
	11QBre8xbAP34i0rXt0eF1vyKex2oieJKWAAfvuKr64jrTbHGGQZ0/lHLr1YSpn1ygrZLUDReE2VM
	PvDCLzbuxvTeadWjegV0VuH93K7QNFBZg4w+7P0fFeq0hQki9tPCGkY6i3HIJ7SsFzg/ggO7aSHYT
	8dl7vm5qQSWXFgji2sJB/+ksA+naA1XswYLYqmu3N+9fNtcn0PMo4F32Vc6ALGHmCq20gOHSJxI2f
	qqSZgDpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRXz-0000000B3cT-3F6T;
	Wed, 11 Jun 2025 19:55:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNVO-0000000AQRI-3Jtj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 15:36:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8025B5C075E;
	Wed, 11 Jun 2025 15:34:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8156CC4CEEA;
	Wed, 11 Jun 2025 15:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749656205;
	bh=iE0MsktbDEMe3NLkiMxHJ519do5Gp8up7Y9Iq9kO5V0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UXQjSNxCJTeqeegmbFdkSEgGydMfw1q2EzY7nfu6TP79lu6Y1w/QZ4alluV9H/1rB
	 LY4OpXs/tAy3LXTiRgQyzMByUxajWO62YlX7Y6dyPcUSxII/za5Ll5j144M3v5VCXj
	 6ymDsMBUlNvy+c2o7QvA760lkfYcETuIjYFKi3NrKyq4+L1Ln94PWSh6g68h46LOYD
	 wnLWBq6GKD/rv060wPTqVnGpL6ZwlIxcAhsNX0+WarpP1TePGzqd7S9DPF7IwX4XbX
	 JndHjGb/UCOO7/v5wU8YxtJ9dm+8kXTbbiboKj3e4yv1qqGfGSvF+69NU5oU6FOOQE
	 St1Fji7ZadEUg==
Date: Wed, 11 Jun 2025 16:36:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org,
	hardevsinh.palaniya@siliconsignals.io, samuel.holland@sifive.com,
	palmer@rivosinc.com, charlie@rivosinc.com,
	thiago.bauermann@linaro.org, bgray@linux.ibm.com,
	tglx@linutronix.de, puranjay@kernel.org, david@redhat.com,
	yang@os.amperecomputing.com, mbenes@suse.cz,
	joel.granados@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/7] prctl: introduce PR_MTE_STORE_ONLY
Message-ID: <ec2c5126-86da-45a2-b9fb-06433583f13c@sirena.org.uk>
References: <20250611150417.44850-1-yeoreum.yun@arm.com>
 <20250611150417.44850-3-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z1q5nUGgyyOUCQhx"
Content-Disposition: inline
In-Reply-To: <20250611150417.44850-3-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_083646_872827_F0D2B1E4 
X-CRM114-Status: GOOD (  10.08  )
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


--z1q5nUGgyyOUCQhx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 04:04:12PM +0100, Yeoreum Yun wrote:
> PR_MTE_STORE_ONLY is used to restrict the MTE tag check for store
> opeartion only.
>=20
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Tested-by: Mark Brown <broonie@kernel.org>

Sorry, that should've been

Reviewed-by: Mark Brown <broonie@kernel.org>

--z1q5nUGgyyOUCQhx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJooYACgkQJNaLcl1U
h9Dzbgf/YGEQLbpkxxNiUEd6pltNKikXu/3VHVIRPWWzDDb5wtSuHFhoIqeN3nYe
WmJpaGNEUQyoVK6kkUh7TTirgED4cKJMG89RKFq6XXFVfd4yZbeKsLUhJwOk+zy4
NYu5zdnoM004pbgzdgaaw2tR2sbKTXu3j3O2dIxfMGUXYbREbsLDFHr4EbGXrUaj
R6ZtqSqrnr+F+Gs+Tu9T3lnbQgBBHUHIb8epsLCBr3rMpJQjmIiX5KfFq8nJ3dqk
gv2Gps01wkUk7KNglhjKuxWYr1kttGldT4Osdcj37Jj5fVK9wVQwbPGrUKARot5h
FVeg9ImfpHiVkxJ2Tyb2E5ts3b8Jig==
=Xip3
-----END PGP SIGNATURE-----

--z1q5nUGgyyOUCQhx--

