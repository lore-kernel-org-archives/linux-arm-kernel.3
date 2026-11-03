Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B900B606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 14:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d18cYmce;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B1wJYL+r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vTlnNEQ1e/DnnkJZD/UM4I5H/oOL2m7zM+85wVmZ05M=; b=d18cYmceKci8p8BsWTT4vEXH4a
	w2SoIKg3SSe0endpqAyI9GnrzriAm7Jr2vZ1x6vaYHDly+djfWDJhKBiTskKU2pAFhkqZk0RT/H7V
	BPoHF5ezQN3Z9+SgWO0U3NeumS7L+poRLAlpI4t0dMl5Atz4jiROttj8pGBqaHxSs/NZf52XxFejB
	W2wWt5B0MnOKIn7ZYbnyP+acPrmiAF89TWC/lEinlJuuVwItpdc7lkARz0z8gIu2fbBkSeEImlpGk
	PqaAugXHe/imLNKB9k6I4Lu9f3vKIvxWvcr84vaclBxh1qfATg2G819mmaE4ZtDrMbULRvIN++a+i
	YHpOUIMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFWL-00000002ioM-3KYI;
	Tue, 03 Nov 2026 14:29:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFWL-00000002ioG-0bdx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 14:29:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B8DF43EF7;
	Tue,  3 Nov 2026 14:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56B2B1F00A1C;
	Tue,  3 Nov 2026 14:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793716192;
	bh=vTlnNEQ1e/DnnkJZD/UM4I5H/oOL2m7zM+85wVmZ05M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B1wJYL+rTF8jE507ir+j1B+QlcLWmrv6V6O2tHZxiALqDuVzpaeKoNxrM6o/J1vi9
	 kh2iMcHUkSOj41JcuCgH0AiU8Roz3fkMx+/2rlGKY7C9akhm6e3MbAyuH9JNLJIbB+
	 Ezi2x0fgOSnAS7PKXAHCmWmmNsP7vuQxmvXE8SPO/whyCCxMB4BQAYiloOEjMF7lkN
	 ehNU6sTfD5zP7q/HL5AkOhCwbMyQHFlo96E/Wf7UJGKZSCy0/cI3JqV1X6HdiKmKqW
	 1GqP1gsKt3yYdxjCoH+asDmcIWlJXD8ZxyB5UF0UbakQikLbp0KZDk3t34TzXivnS7
	 Wj+p9qSezVdxQ==
Date: Tue, 3 Nov 2026 14:29:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org
Subject: Re: [PATCH 2/3] arm64: ptrace: Simplify sve_set_common() SME-only
 logic
Message-ID: <dd318b83-ae43-429c-8de5-2d511af21b4a@sirena.org.uk>
References: <20261103121346.1858305-1-mark.rutland@arm.com>
 <20261103121346.1858305-3-mark.rutland@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Quuxd7lG6C4vSL78"
Content-Disposition: inline
In-Reply-To: <20261103121346.1858305-3-mark.rutland@arm.com>
X-Cookie: Small is beautiful.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--Quuxd7lG6C4vSL78
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 03, 2026 at 12:13:45PM +0000, Mark Rutland wrote:

> (2) sve_set_common() always rejects writes to NT_ARM_SME in FPSIMD
>     format, and returns -EINVAL. This has been the case since commit:

This should be NT_ARM_SSVE.

--Quuxd7lG6C4vSL78
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrp79wACgkQJNaLcl1U
h9BAwgf8DpRIj50TwbObnJMOiFF8a1QEBAvMGOr2+CGJ/3kuC5qbMZuwmJZ9iJa9
Ug1mjYOewKDYpqP77p7zU4HAv9YaEyKGzMmT53ZSeC4yaR4Z6gwEeiGOTBuhdI3m
4cb4CcNED6h8daqNlCFxmKGH6m4F0hdljE0NdEz/Ms4PZo1mthkaZVcEkjahC9CI
RVnOrAjKt9vboEJEdtUEuwmGswGBqbJiEN7aMJQ50/BzilMhEqPWX/iSA+vprTiO
gdrxzkKsjh5tJS2dkensVDNVoyd3ZKeQiKKBLGATlbZGjHkyXC3cX5LF8owm8NL4
4HKno3iKpPylUtv7EiaJvCgkoLhDkA==
=3zTI
-----END PGP SIGNATURE-----

--Quuxd7lG6C4vSL78--

