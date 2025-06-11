Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2935C7113C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 15:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pb53XUnfjjR6lu6hoIuxvpaaA+sk6sa2o6bpiQWtwic=; b=bFw4RUeXBwyajxLnG7n49AYACC
	ADGHefAtF9vKnfxYm3fpjq51ydXUapfqi6HKHpiSwljgSocPBvxgVqmWj2SlT7pJcaEz9h/SDV8hd
	VlJ+8pTyix3nlEm8stHTNJQCMJbH3VK0pPFeCurQL9IKdNUFJZaGMn3d7/jbsS0jATnXEJNm8qHI9
	RWbHecIC2hwNSzQ4Dma9L6ClPNh7j7EuKzSJqfW3GijUOGyCNgMyg3h/k0iK52slUIH4Hy0IFBj7h
	GLithRu3kRCDjz72qe7q89Q88wuXh1k6OHKCU2zevobGa+ZWpz01spNFM49MnVWCmYmp53eIzr0mh
	+aSHweuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNoy-0000000AW5t-2mgu;
	Wed, 11 Jun 2025 15:57:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKqa-00000009s95-1V7p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 12:46:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 837226154E;
	Wed, 11 Jun 2025 12:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD03C4CEEE;
	Wed, 11 Jun 2025 12:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749645987;
	bh=Pb53XUnfjjR6lu6hoIuxvpaaA+sk6sa2o6bpiQWtwic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sKIDC+ClSzn1Ua1TJS1YKb1AYW8i3qJyUvfyExo3patxL3XW7T+jXh5YussTiFqG2
	 B43K9L8yvRhKp8m+Hep7MpWOK7L+/di665cuzZXcLomtNqckWVFJ4oXZempFM8xgHc
	 QafHD1xrOPpKoKeXYnCbiNrcG/nchqCihZnDEIZPbUXAGVuOqibiX6QtGhJen8UO9b
	 YoRj+EG0UKkMPJy3ueywu2zKBfqekHCeE+IA6LVP5T1riNBuFzZRNVXbm1jZ6mcFul
	 0EbDrV4nrmrLZy4G3QUF8kzjxnoe9j1ULhujl1UGyGDmzZ4xJUHwHd/DDYyByMsZgT
	 JjlepvcpcRamQ==
Date: Wed, 11 Jun 2025 13:46:20 +0100
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
Subject: Re: [PATCH v5 5/7] tools/kselftest: add MTE_STORE_ONLY feature hwcap
 test
Message-ID: <ea71432c-edbf-419a-bb5a-37da5b09caa0@sirena.org.uk>
References: <20250611094802.929332-1-yeoreum.yun@arm.com>
 <20250611094802.929332-6-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N9Jq5vTIEkplfAUq"
Content-Disposition: inline
In-Reply-To: <20250611094802.929332-6-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!
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


--N9Jq5vTIEkplfAUq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 10:48:00AM +0100, Yeoreum Yun wrote:
> add MTE_STORE_ONLY feature hwcap test.

Subject line doesn't match the usual style, otherwise

Reviewed-by: Mark Brown <broonie@kernel.org>

--N9Jq5vTIEkplfAUq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJepsACgkQJNaLcl1U
h9Ds8Af+PUYw26pjKbOjxWOkTwg8nU84B6wNH+uwRAbw+spY9QrvZMFxOQQrAS+8
IqFjS8WTVj4it9uLc8CaLN1vLnu7oCPpaXsEJiZQ4jrVQ1beIkvR+aBa4LPG0QRk
ylsYfQK0L3QcpEOAwV8HelLPqstHExzZc3GAFmbpa9Ml8WMEw+4DnnCzbFO6UWOV
I3Z7viptW8bgJgSXJR3uhhzDXi7hgUvT3TKATRyDgcp+NyWBxpevPnYiVWEhj6XX
sHjHdZXP1JRVPZI9S9oA2yE8yw6B/CoJsHFWDZhAf2FMxwdK8n5iz0DZgzk7HljH
UJZYVKNRSI63CtXo/bEOouObcSDI4A==
=EHzP
-----END PGP SIGNATURE-----

--N9Jq5vTIEkplfAUq--

