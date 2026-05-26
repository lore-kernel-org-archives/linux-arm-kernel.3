Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30E8CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 15:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LlI5xgira7s+5pqZZoZR/MaF0ZvnyAOrd36rKkkL928=; b=ipWiPAAIhi1Mdsedl8aEKzYvbu
	9532pz8oIjwQWulyWrGA6JMyq9Jtrc/36laK/rPUxnVYbaiPQq8+EW3s4l5p6kd9dDMrAsGG8vH5M
	9bd6oIuHVf/lRpcsexgQbwTTIcVuFoDC5EHmYWJUE0Ghk7kRkY2bfG3WPVwCIx+K6TewgVYCG45Px
	GGvRP0ZK5VxKra8/BgVMfLfcKEe1x7zIB24RHDdzmYdKXpIPc6KU/D1VTQjUVmLF2wqsYp/ttgUlJ
	VY8ETpoYi737vgru+bkcRny+DD4n7McuNcSM4wojOm5XQIerZXrHLG3XNNr3iBzAh20BJ+0eKXSxH
	J135tqng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtzy-00000002QRY-2Npq;
	Tue, 26 May 2026 15:47:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtzx-00000002QRA-0wtF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 15:47:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F599600AB;
	Tue, 26 May 2026 15:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B1FA1F000E9;
	Tue, 26 May 2026 15:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779810436;
	bh=LlI5xgira7s+5pqZZoZR/MaF0ZvnyAOrd36rKkkL928=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XNrWfGUXbmyn6gOwODChUHBLFtkcy2s2zHOfg9KhQkth36UU/7neANIf+cQnnnG5p
	 gu3m2k/LSc5hC/VauiOg0uPflCERQX8PORWZzJlO3xY2PaZqLvyRxvSreRvTbBix5S
	 kqTjBsZ5LMMlSx6C6u8aqKB8b6is6Txeo1ErISS1QbLjJKZtY7JL774ZhMOEBDKejc
	 dOvr8KU/e3jTiNr/V00QZ2OU637q9PbcjKLC0oo7miWbYoVgmmeji6SyqfzTsTf31w
	 pd3RDRgoApFctCsDf1B1mWBMb0YlfmC8tzQP1WT+2NVqBqdn7UNJod5T0MKAkljbb1
	 H5rC6Z7SYqKUQ==
Date: Tue, 26 May 2026 16:47:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, james.morse@arm.com, maz@kernel.org,
	oupton@kernel.org, tabba@google.com, will@kernel.org
Subject: Re: [PATCH 09/18] arm64: fpsimd: Move sve_get_vl() and sme_get_vl()
 inline
Message-ID: <3bdac1e2-efcd-44ce-a15b-3f20bbcab80c@sirena.org.uk>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-10-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BbKZvTDc7vrTGQ/b"
Content-Disposition: inline
In-Reply-To: <20260521132556.584676-10-mark.rutland@arm.com>
X-Cookie: You are fairminded, just and loving.
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


--BbKZvTDc7vrTGQ/b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 21, 2026 at 02:25:47PM +0100, Mark Rutland wrote:
> The sve_get_vl() and sme_get_vl() functions are wrappers for the RDVL
> and RDSVL instructions respectively. There's no need for those to be
> out-of-line.

Reviewed-by: Mark Brown <broonie@kernel.org>

--BbKZvTDc7vrTGQ/b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoVwH4ACgkQJNaLcl1U
h9AVWwgAg/lBHjYGjFtpVuM2U1cdCV1P9rissPlv6kb++fNc57R+CKIo70W9q+hS
xQJBmkvSsrVmwvKD6VDWAzWKsggvTO0j38wd19IvXQ3qTC58P0mUQ/8Gi4cZaGJO
8Mrxlc7Te4c5U789cic8G+ngsmlSzOGBc7R5KGMY5uwxv+G5lkg/EuDeft1t4jXU
j1jD3UxAs9NOZI4FlgpVlObjR/VT/nuJrhiFTD08XLOi4Slj1vaXPGNxPsIHmud4
Oh6G/HdIr8KvgWHyK3LQ937/ecaifDqF4ZHkYHh0X78qHvHRgNhSvD0W+iaetlz9
IXE/6tvQDpMlMd4XZMeyoINUt+KcYA==
=iTOo
-----END PGP SIGNATURE-----

--BbKZvTDc7vrTGQ/b--

