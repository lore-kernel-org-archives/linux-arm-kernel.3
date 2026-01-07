Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDF0CD583B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 11:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dn2+c2FoopOCirq4VSlDMFYYIIkVyKutLY5f+zRioxM=; b=a60OwgBkX0bw0LUxhBs8efs5Te
	rlOE2HKfLdRHoQeC6upg4RdglHmf19ktbdeSEtqOuu43KY7WPXwRs/0byUmcAiKOzF4EICqj1Cvwc
	SILCd9qEIG7PO4PN1pljmP/1Fh2hvz2/7PVSWND3boYo4Ss+U6RaURcF4CbCl1OKeylxB3DZfC7qN
	v1BjYZr0rqgKtKLefHCOABTKZlwv6IT8NjsZWxFKm/062x7H8M30wYmitT5msF6srr+r8sFa0NIWo
	kqaip1ffGKnuDyIS6apFYcweihlO5kkuowIFMO8DdFAXPpb7RTe2fPqJswgjgGDAhHreGdoAZ6RyJ
	4Wyh7lOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRdc-0000000EpDK-3ICk;
	Wed, 07 Jan 2026 11:23:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRda-0000000EpDC-3u1b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 11:23:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6EB4F6000A;
	Wed,  7 Jan 2026 11:23:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E9EAC4CEF7;
	Wed,  7 Jan 2026 11:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767785017;
	bh=dn2+c2FoopOCirq4VSlDMFYYIIkVyKutLY5f+zRioxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YSwrZQqSBpYh0wMySfXpKWuVeMacsQxTdE/FO4cNwMqzYRrzeL5lgzq0vN3iBW/iB
	 8vGQn/05f4TeIQONJCr8kvOX+Al8ar0a5F38Z9odHjAWCgTIgBq//bspytddLJDgLc
	 PZzcLPGdo0kpPkpTJ8W5mGnEu73SiWU195V4FLw3NWfCamsRhvqunc9bg2lMaExvQR
	 fa2hKg7vdkzosyNaZMxT/GAauhy6UM7f1mEmKvEopDcMAKOAMMs4XZMoVydFCGml2X
	 gvXzzPpg95htzdzENFWgmdis/QGqzovg/1wQLMgQDT8I637Uio/uR5MxsuLM2XO7hf
	 OugUd3cdbNHKg==
Date: Wed, 7 Jan 2026 11:23:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	tabba@google.com, will@kernel.org
Subject: Re: [PATCH 2/3] KVM: arm64: Shuffle KVM_HOST_DATA_FLAG_* indices
Message-ID: <36fd77fb-362b-455b-8507-f59360153c91@sirena.org.uk>
References: <20260106173707.3292074-1-mark.rutland@arm.com>
 <20260106173707.3292074-3-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wmrKsawYFX++f6+M"
Content-Disposition: inline
In-Reply-To: <20260106173707.3292074-3-mark.rutland@arm.com>
X-Cookie: Is there life before breakfast?
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


--wmrKsawYFX++f6+M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 06, 2026 at 05:37:06PM +0000, Mark Rutland wrote:
> There's a gap in the KVM_HOST_DATA_FLAG_* indices since the removal of
> KVM_HOST_DATA_FLAG_HOST_SVE_ENABLED and
> KVM_HOST_DATA_FLAG_HOST_SME_ENABLED in commits:
>=20
> * 459f059be702 ("KVM: arm64: Remove VHE host restore of CPACR_EL1.ZEN")
> * 407a99c4654e ("KVM: arm64: Remove VHE host restore of CPACR_EL1.SMEN")
>=20
> Shuffle the indices to remove the gap, as Oliver requested at the time of
> the removals:

Reviewed-by: Mark Brown <broonie@kernel.org>

--wmrKsawYFX++f6+M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmleQjMACgkQJNaLcl1U
h9Dlkwf+PzIZ1iMjULrauU21DeSQdSgVk/G/LtZhuHfqa5HZo0nQ+i3mQ9QrlK0a
Y4oXxW9UM2TMruaFCtmP/6IY6+LxjgaDC4vxdb31tInKlqNt8JnCpS3M1kvCJ84W
K+xLBUo0FgmvVPwjTG8WlNN4Q31uAaeAC+TrVwmpiSXBQCSyyd8XwRAMsu4fpQpg
5f0vHHJkMudSdvsIf6SkcsEfOcINARqpLE55+fqUZD0uEj3Ll2pKGTwPDE7duMYR
gwliFxV3LftkKdY1v0RdFkXOegvNcQaJxslMjzDJPSmBszGjknMcBHEFRloKXdRX
TtxGO+yz+ktywVsZrNcrdCxV3QJIsA==
=qbTT
-----END PGP SIGNATURE-----

--wmrKsawYFX++f6+M--

