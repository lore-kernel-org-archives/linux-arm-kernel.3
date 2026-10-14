Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FB7CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 10:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DqLYzY4atgfX3uWZ/8Aq3s3d3o9UsbAJp9fr0fPezio=; b=xJbYfQjkS9JLn0cLguVYx0U2sq
	J9n/a97HXjClsgGGKQ8ufNh1xPfqJK426NIbyi2WV2BWi4pry9MWasc7EkyOwsMAX0oUlI7xR/His
	OKeZAb/w/WmpEGVDWycfstJxv6k1pQe2GUD6psLagdK4bhQlkwCUoMOEm+zDmncz3OrARBzUkE/14
	Z6qzRNzYoMDFABRKUR4ZfuRuycl4vxeLmevKmrFLJE+8mLh2bJkzSlofDNSSnUXZ5ElqOO3LdTU2S
	imNo7Qz4CIK8oEqVWB+BTdnGllqBo083z4zA6rrsjGNx4oG+MT8PKH1VpafjPt4cuG2cWfPLENUUl
	Q0vWwGtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwHV-0000000FDal-06WY;
	Wed, 14 Oct 2026 10:32:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwHT-0000000FDad-2vP4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 10:32:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D356960218;
	Wed, 14 Oct 2026 10:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63A61F00893;
	Wed, 14 Oct 2026 10:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791973938;
	bh=DqLYzY4atgfX3uWZ/8Aq3s3d3o9UsbAJp9fr0fPezio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h1lWXUzNdpqN9TB0VXJKLjdtvJvwomuDCpDmn4NEI9eOnoga2JGdjGUhcMZGJq+8z
	 n/I1++2y6IJlCb7f0KTiCEKmPWSdUxwrv2XEKnqeDvMg5hYwT6CzWBOwLBBhhzUFZg
	 k3bNPnKfiWeKl042igEg6xIM7U5Hl2wgwZeEtbMp7RawTBTL7Gq0gE4QtjY1YQT3In
	 vPPz9VkB+fkp7oVcP5ZZ35JzlNUFMbUWJDlaQTXFMaEWb4aA827P3CtcZJHUGANzcO
	 x9HrcV+x1llSLY12Z1uJKcw+4WKeYP+XYnhXIx6KTpMza/wHi1w4fIRXr0STsZQMFD
	 pzxzYbfQ739SQ==
Date: Wed, 14 Oct 2026 11:32:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: Re: [PATCH v8 0/3] KVM: selftests: arm64: Improve diagnostics from
 set_id_regs
Message-ID: <eaf18ff1-2316-427f-87ef-c4ab164bff3a@sirena.org.uk>
References: <20260929-kvm-arm64-set-id-regs-aarch64-v8-0-58aabe2c2fac@kernel.org>
 <as8x38o9taXgKZym@sm-arm-grace07>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/+RMc89oHuCjE/gH"
Content-Disposition: inline
In-Reply-To: <as8x38o9taXgKZym@sm-arm-grace07>
X-Cookie: Live free or die.
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


--/+RMc89oHuCjE/gH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 04:40:15PM +0900, Itaru Kitayama wrote:

> I=E2=80=99ve reproduced the set_id_regs failure under QEMU with kvm-arm.m=
ode=3Dnested on=20
> a host that supports AArch32. KVM advertises the NV-capable L1 vCPU as AA=
rch64-only,=20
> but aa32_id_visibility() still permits the inner KVM to expose ID_DFR0_EL=
1.CopDbg =3D 0xa=20
> to the selftest vCPU. The test expects zero because it skips setting expe=
cted=20
> values for AArch32 ID registers.

> In v6 you mentioned preferring an in-kernel solution. What did you have i=
n mind,=20
> given that changing the value returned by GET_ONE_REG may affect the user=
space ABI?

I think the idea would be to force the 32 bit ID registers to 0 like we
already do for aarch64 only hosts.

--/+RMc89oHuCjE/gH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrPWiwACgkQJNaLcl1U
h9C5tAf/YwpI3krDb44ug+WWjgx6koa2aUTW4ZTyIaefJL+81P9TOKAmYy+ZInOO
LZuT8d63HxiL1XIgBUyJSrS2l0dCt6+Qiv/bsPayO1bWUeJwrq03njgtOqjqkimZ
jDVTEInZM8m7ZvETpxsGw2T99oJpQ4LgCvGN2UL0FfeXqouoGG/AKCOtM3P2nQYm
w4cFQxN+kkt3Ae6wf7MoZII9/CwFMj4mZ0lRy7+wZhx9MTmDzKlx3nvZRwDMeO1e
jwfkvZ/QMpE/BDJFaccM7dO3qMT8ZfHYMiZ+fGT7sZQQoq3J1MeDtUK8gtwHzvUr
B33dIuBDPDvj0U+80ceWlgMp+XUR5Q==
=joOW
-----END PGP SIGNATURE-----

--/+RMc89oHuCjE/gH--

