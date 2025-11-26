Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C789D10F5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 15:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aAXzGtzKYAGkSDscqzBxfEqNOGOIiaMptw+3k0mw0Co=; b=Pt1iosOHpdpoXMFygyC1Qek10O
	dWIKZW6UygO7Djrf2EVI2uKu1EQQpl3HVUPA3U/xyiMY6ebi9LC+3QBO7B9EpEdecWjRK4Jx4OPp+
	6FZUlTEQs/UkHjxis6LKvLksDDqqCMxYHsTb54yztza22SthAIDrDhDYfTmDcK9AOdylA0BsUr5jw
	lQyHuvbEW+Ggy/+WTXQyAIFlZb+PjPQBX+cwNAeXH8CCoPYqdcAbQULroTDPmRkO4GDBim0mwi1I0
	QObnSsWCdiD6O1srNJkTgWn/Jo6Rl/BbZDydMYkSfAEWlODpSg1CluMufdOf8jK6miAoahKQgjACo
	itQR33qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHTd-0000000FBSv-3hNk;
	Wed, 26 Nov 2025 15:30:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHTc-0000000FBSf-38dv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 15:30:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D9E026020A;
	Wed, 26 Nov 2025 15:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A71CC113D0;
	Wed, 26 Nov 2025 15:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764171039;
	bh=cWNAxYYMlJ5hlWBj+1KaKsCm5HgO/QaekBh3jUhGvR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LOQKjj12rKHrxKvXRLfq9BjbK9W2ch3ArAAYC9S/g/0F6wGUqOIyFJ1O9VbsmdPar
	 AqYSWadNmVot4bE4eh+qrSux+Mw4m47QZOaAcmUuiv1WPxnEV5L2wwm3ykDju0A78+
	 Wd2tqcjrBZJ27Ga2UTrnsXzGQ02jB64ncXvj55jE1oq2SXo6bXS3OlyII4VVkpbAZ7
	 651FWy0P/W9UwQravJMfTKLngVYf9wSB2dw06eEJfp9V4KJpGOFqd67Nsn2ysAsfU5
	 JdpzGipTfMc/HHl4zEiNtfdon0W3YLcOKgjV69DAxkIoDf08NU/zCmmk7FR9MBE/9c
	 2LwP0JGKxTJ+g==
Date: Wed, 26 Nov 2025 09:30:34 -0600
From: Drew Fustini <fustini@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>,
	Paul Walmsley <pjw@kernel.org>,
	ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the risc-v tree with the arm-soc tree
Message-ID: <aScdGuUjxJ3FkwYg@gen8>
References: <20251126094511.07bdf834@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RlElvJGJSVm6EJMd"
Content-Disposition: inline
In-Reply-To: <20251126094511.07bdf834@canb.auug.org.au>
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


--RlElvJGJSVm6EJMd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 09:45:11AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the risc-v tree got a conflict in:
>=20
>   MAINTAINERS
>=20
> between commit:
>=20
>   4de28f1edcfb ("dt-bindings: riscv: Add Tenstorrent Blackhole compatible=
")
>=20
> from the arm-soc tree and commits:
>=20
>   e0ce62cfe3a9 ("drivers: firmware: add riscv SSE support")
>   832fd6c2e55c ("MAINTAINERS: refer to intended files in RISC-V SSE DRIVE=
R")
>=20
> from the risc-v tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc MAINTAINERS
> index aacd4a754dab,6fa1048c248a..000000000000
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@@ -22247,15 -22195,14 +22254,23 @@@ F:	arch/riscv/boot/dts/spacemit
>   N:	spacemit
>   K:	spacemit
>  =20
> + RISC-V SSE DRIVER
> + M:	Cl=E9ment L=E9ger <cleger@rivosinc.com>
> + R:	Himanshu Chauhan <himanshu@thechauhan.dev>
> + L:	linux-riscv@lists.infradead.org
> + S:	Maintained
> + F:	drivers/firmware/riscv/riscv_sbi_sse.c
> + F:	include/linux/riscv_sbi_sse.h
> +=20
>  +RISC-V TENSTORRENT SoC SUPPORT
>  +M:	Drew Fustini <dfustini@oss.tenstorrent.com>
>  +M:	Joel Stanley <jms@oss.tenstorrent.com>
>  +L:	linux-riscv@lists.infradead.org
>  +S:	Maintained
>  +T:	git https://github.com/tenstorrent/linux.git
>  +F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
>  +F:	arch/riscv/boot/dts/tenstorrent/
>  +
>   RISC-V THEAD SoC SUPPORT
>   M:	Drew Fustini <fustini@kernel.org>
>   M:	Guo Ren <guoren@kernel.org>

Thanks for fixing this up. It looks like the correct resolution to me.

Tenstorrent MAINTAINERS patch is in the tag tenstorrent-dt-for-v6.19 [1]
that I used for the 6.19 pull request [2].

Drew

[1] https://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux.git/t=
ag/?h=3Dtenstorrent-dt-for-v6.19
[2] https://lore.kernel.org/all/aPUemXdOFZEdkayE@x1/

--RlElvJGJSVm6EJMd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCaScdFQAKCRDb7CzD2Six
DAlpAP9MEEev3Nsw6UvuNV6ewwCGZ/1J4EvRmRaTGObPhydPpgD9F9R95uB6LoRK
zChI5YQNXgMlHGxKgwkD+QAvgFf5Hw0=
=FM5A
-----END PGP SIGNATURE-----

--RlElvJGJSVm6EJMd--

