Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3ABD6B6B7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 18:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dzCjBAxUY2pK1bJOtgQKzITvTFuPan828m+br/F97IU=; b=XyfYRzShFIqAhUzjdl0OR56CIT
	iFnfsIyEpmHdNwBiruqvxkZXo1SVcSM5IyaqQTFE4no3BpT/1mvOy+M9GnxTfvw+kULHRJBBj5Au8
	V/5wxA/DzRRlNElwkfwmKFrgIaqYolzjGtithkscRNUJul+RhUMTpYfvCOKdZh3CpKlFI2LYsyLDy
	Qx85+27WIf87SsMcVCpVPiZuxa02kQuuEdRF3xpjpB7IOhqxacXQYdX670p+pTJL76qONZng1bNms
	DRK12B05zYPhx/DH8CcVZ2u/7PYI6CGz+cK1395t3S0OYEeCDQT17xwwNJTTM/FJKQ1nRMZYqZY3H
	PFvV/RWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6DDb-00000001PWw-0uJD;
	Wed, 30 Oct 2024 18:14:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6D9O-00000001Ng9-2ZnP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 18:10:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E8A6AA42FB5;
	Wed, 30 Oct 2024 18:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C10ABC4CED1;
	Wed, 30 Oct 2024 18:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730311833;
	bh=PUSWypS9RPlliztjPuKrypjSxl4XFZNOoSoJofJ+sX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gZFKIJMnYVyNIvUEnvLYifNu+y+jzl1Wz0YI1ofnDId92z1griWtJC43eteIaDLVd
	 maGJzQud9s7pIMOyLHkWMJWebPOlHO8TVSbKBIv9Wm4LUHy+JHMeBcDwruRzJzPZor
	 OrEJ2wIdc7W2NJ1zxf6TQycLUvScYtXwMrUzxK3SBi+GZV//1iWVjzECrK9C46xoDK
	 /yaamwjW+q0JnuCZU9YbYLoJzZdBueCTrN3FGhPVHDSDNMfZ9zB3yPSA8xnw1xw5yr
	 iYvtoh0fpbEKrCqLF1SRBRD5FcrUl5eYP0VHLmw4935aPBOE3RH+juVn4iDuQt1FTp
	 7hu8QbRH1Lhxg==
Date: Wed, 30 Oct 2024 18:10:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Andre.Przywara@arm.com
Subject: Re: [PATCH] arm64/signal: Avoid corruption of SME state when
 entering signal handler
Message-ID: <618074b8-c685-40bb-b7d3-f309b30cd25a@sirena.org.uk>
References: <20241023-arm64-fp-sme-sigentry-v1-1-249ff7ec3ad0@kernel.org>
 <ZyJuEBC1wFPrTLAS@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tzY2Rc5DUyHGb0DA"
Content-Disposition: inline
In-Reply-To: <ZyJuEBC1wFPrTLAS@J2N7QTR9R3>
X-Cookie: I feel partially hydrogenated!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_111034_845194_186BBDAE 
X-CRM114-Status: GOOD (  27.46  )
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


--tzY2Rc5DUyHGb0DA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2024 at 05:34:16PM +0000, Mark Rutland wrote:

> I originally just had a few comments on the commit message, but I
> believe I've found a logic issue in this patch, and more general issue
> throughout our FPSIMD/SVE/SME manipulation -- more details below.

I'm fairly sure there's at least one other issue lurking somewhere with
TIF_SVE tearing, yes.  I've not been able to get that to reproduce, and
I've probably stared at this code too much to see it by pure inspection
however it looks like you might've spotted the issue here.

> On Wed, Oct 23, 2024 at 10:31:24PM +0100, Mark Brown wrote:

> It would be nice to have the signature of the failure as well, e.g.

> | This is intermittently detected by the fp-stress test, which
> | intermittently reports "ZA-VL-*-*: Bad SVCR: 0".

That's a common one for timing reasons, but it does also manifest with
other outputs (eg, if we turn off ZA while trying to execute
instructions that access ZA).

> I don't think this is correct in the TIF_FOREIGN_FPSTATE case. We don't
> unbind the saved state from another CPU it might still be resident on,
> and so IIUC there's a race whereby the updates to the saved state can
> end up discarded:

=2E..

> ... and either:

> * A subsequent return to userspace will see TIF_FOREIGN_FPSTATE is
>   clear and not restore the in-memory state.

> * A subsequent context-switch will see TIF_FOREIGN_FPSTATE is clear an=20
>   save the (stale) HW state again.

> It looks like we have a similar pattern all over the place, e.g.  in
> do_sve_acc():

Yes, indeed - I think that's a separate bug caused by the recalcuation
of TIF_FOREIGN_FPSTATE.

> This is going to need a careful audit and a proper series of
> fixes that can be backported to stable.

It feels like a separate thing at any rate.  We can do a simple and
robust but performance impacting fix by having fpsimd_thread_switch()
only ever set TIF_FOREIGN_FPSTATE, never clear it.  That'd cause extra
reloads in the case where we switch to a thread but stay in kernel mode
which probably happens often enough to be palatable.

Otherwise I'm not sure it's *too* hard, TIF_FOREIGN_FPSTATE is a bit of
a giveaway for places that could have issues.

--tzY2Rc5DUyHGb0DA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcidpQACgkQJNaLcl1U
h9DgCQf/aKq9znkcNdaaX99tyQKmAGH0Ab+cyf8R0/hXJzUa13y5F+gTf+/NDjYO
Z94a5ttBE5fllSBD/GpqF3OOGXqKlfW4BBVLEU1LCgpprvXfb9TtUna6gIxIQKwE
78yNEk7yd08AKgvUbAoUsUsG/L+0tSB4PMcAE9KisCueQAsikV/zMenetiwOQ4MS
XdsJ0VYLpFarFB2wie+UTaMeuwtNCWlWzrkO9oL0YTbiUB8OWXgSuzhsRXNY+aKq
b1hHEifXqMThHgXH8napkaDP95yRHV+97X+pgZjPyOnZnvBXs9cxepoKbFo+ZLJ0
JMf0C4jXPRlsMcyLz238xdpuE1XJow==
=mZzF
-----END PGP SIGNATURE-----

--tzY2Rc5DUyHGb0DA--

