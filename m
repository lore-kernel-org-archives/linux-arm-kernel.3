Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3124FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 13:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXSIo0uKgCaA9dGNhZ0Opg2XC/JK5S+K0oyVOi7L6G8=; b=hhO8SwOkG3/McH6AVVMLtdQ4oi
	3es8oVYOOpF/PwDU4wDnxHPevj55bhBgWTHOVl6Oj4C0qEjJISuxthvdCb4RUtsfvEY6xL+Bd3LRn
	fPI5+BfRDzn3NuCCLitvnByN3Yhod7gbCSr9SWnfRaeF5QpfchmQ0SKequYtRH/zQaU0jcvFj0kNt
	lu33hhMFSpk58cxEbvLPUEDdWh7dPnH32M0o8KvzE15QDSCD9C7RyVWuZ7MF+8CzqzuxwMkz9pHif
	7zc0rQGXpUmtHskaA+x9x0wM5vTf/TV2/QbnV4joP/EtPKk8FE+fyvNMa7x4Iy6BGY9y+a0iRwJnZ
	9DmNFoIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmrn-00000001LF6-07Gs;
	Mon, 06 Jan 2025 13:09:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmKl-00000001FGM-1Xnt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 12:35:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 796275C451F;
	Mon,  6 Jan 2025 12:35:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4869AC4CED2;
	Mon,  6 Jan 2025 12:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736166949;
	bh=e6r4bgfMSt6jfSpc0BV4h8ov7eRV/zr34+P2Iggsre4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qzhuI2hKZv4kqRyUpVrnaZWJRr5NdjAstnvc3Ab8/4dpEo8ELGFns3C81vjUpyirM
	 NEqR8KrN9Rhk+fRfR1o4oiEEPeWVM5kPeKeTriQpKrsy2L8ghxA58d8IafP2sd4CKa
	 5c13RB73AEXXE5vUrWQDCH/0dcIqU1TMzpjfpJOkDWmBEsOdidPlX3ZkXRI9AN/OpQ
	 Q7LKSybFr7aBwZtNEEfJI4yKNHYKuNw9hSulSB8PoMnB4/9+rDPfypnNJrIZfFzUuR
	 plOXVstRIV2mS2wlJay1dL1lGWHTQ5WL/+133D1uhhBsgFdouj1OCNx52m//+Vst60
	 MtxQQ8ZfBKbpw==
Date: Mon, 6 Jan 2025 12:35:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/4] spi: atmel-quadspi: Fix struct atmel_qspi_pcal
 kerneldoc
Message-ID: <d5c8ebdc-942a-4bb1-80e9-6eb78fb4601c@sirena.org.uk>
References: <20250104205437.184782-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tt8UwXY8YAkoC5VF"
Content-Disposition: inline
In-Reply-To: <20250104205437.184782-1-krzysztof.kozlowski@linaro.org>
X-Cookie: Do not pick the flowers.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_043551_449560_6136E4B1 
X-CRM114-Status: GOOD (  10.54  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, linux-spi@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>, patches@opensource.cirrus.com, Claudiu Beznea <claudiu.beznea@tuxon.dev>, David Rhodes <david.rhodes@cirrus.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--tt8UwXY8YAkoC5VF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jan 04, 2025 at 09:54:34PM +0100, Krzysztof Kozlowski wrote:
> Correct the typo in parameter name for 'struct atmel_qspi_pcal'
> kerneldoc and W=1 warnings:

As mentioned in submitting-patches.rst when submitting a patch series
you should supply a cover letter for that patch series which describes
the overall content of the series.  This helps people understand what
they are looking at and how things fit together.

--tt8UwXY8YAkoC5VF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmd7zh8ACgkQJNaLcl1U
h9Avpwf/VmDQFYkimEztMucINFgvQmgRU4GtcluUB7aCNYIqxtIWpEd4wbxd7TOs
C9tJkZxCIwnRPQ7++omH9um9XYuwj3z+uHSpnd5PzY9rTrQCggnwvVua9Yuxb1+p
lnVaml6kjoKfLGjtSSAgmFq4qZ1Sye1SEjbgS8AHtFRwg74OEf9vI2ckiPbryAsD
6zwe9px/GoZWWjhRsmgnmFl4ETAkZ3E6lEQ+odG4oUMl8mn39mbz0efxlAbhmM3+
jSgghfYLdRcOyafdshmVdZyteaolzYKKPJaUPr5p3i9Q5D0Vq9tClQ/MLSCX9ymY
Cn9EhGZ9VWnwTh5fHOY3n7z4kpMGcw==
=EKsI
-----END PGP SIGNATURE-----

--tt8UwXY8YAkoC5VF--

