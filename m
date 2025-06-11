Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB42C71141
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 21:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTJIITTplyv4FcYHewTxdOSYivTAZ/UZlffGa52vJhI=; b=NLfXpIPTkDE4GaZ2IONFowdHj+
	aYf2/lMJOvAiefu4CvESmMZnpgm7teqBv3uALTNTY/n+hes9G3kpUkECsIF5kFm4V13AY6WYBZffw
	HOjrHrlXTdas3AgSZhVM+tvJHbRHTSNvH9PbPFnawwqKmnIzQcLKOe3uO+de6qBeCz6A3iUjq0IhN
	XNAkV4FDXfAmP5dOw2qvNYr6EtMHYvPG7Dl9P7m+cW6719+L+lc8qvHLLS3jHm5hnpSwQtrUzhMb9
	35xRYaUA470dONt/mMursP0uf64i1TRrPQI1hynQ684wWnEwpd8dBFHTMppReGaBKFFflGck8wHlV
	Hcq7oZvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPSoD-0000000BGOT-1VuW;
	Wed, 11 Jun 2025 21:16:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO90-0000000AaXR-27cD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 16:17:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A6D89A51955;
	Wed, 11 Jun 2025 16:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F0DFC4CEE3;
	Wed, 11 Jun 2025 16:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749658661;
	bh=FraoX4V3TAqQuBkvIAxSNPXL4fMoaDR64I9fTU/5cwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TiCb9CKKjnJWcrc+xA/1bEw5YOdWPb2cv1RC46vyQy/X9cUVZXYVrcZqBB7R08Ntc
	 Q6ohhw6Ulx+0D3GMsjRQX0xJL1DHPu595b5Azao9iu6h2Sv6wrS4Sa/62oVyDdMygm
	 WCN4bnJrZ9BOQkakZ+GxBA6ciFmpMWUcdZeubY6F5TObW3w27gXoljQxMzdT0oiFqb
	 KPycUteZSos5uewBlje973p3ib74oIRVG5w+x/pE64NSZqXOrgp4RSbGzl47uZKEtP
	 4uwE+EkT/GM20qgkL3bvG2/9YE9HXBksfPQfqTzXEPEUkMyhIqxzNHj/hAJrGwKpWF
	 0OD9N2Zeaal2Q==
Date: Wed, 11 Jun 2025 17:17:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 2/9] arm64: report address tag when
 FEAT_MTE_TAGGED_FAR is supported
Message-ID: <d93452bf-7296-47fc-9d48-44c390cb5080@sirena.org.uk>
References: <20250611135818.31070-1-yeoreum.yun@arm.com>
 <20250611135818.31070-3-yeoreum.yun@arm.com>
 <9a78c058-2aeb-43d8-94f8-987507a1a9a3@sirena.org.uk>
 <aEmg9cNGAzqsrTd1@e129823.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AcPDYuBXDOqguWX5"
Content-Disposition: inline
In-Reply-To: <aEmg9cNGAzqsrTd1@e129823.arm.com>
X-Cookie: No skis take rocks like rental skis!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_091742_611057_ACBB786C 
X-CRM114-Status: GOOD (  18.48  )
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


--AcPDYuBXDOqguWX5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 04:29:57PM +0100, Yeoreum Yun wrote:
> Hi Mark.
> > On Wed, Jun 11, 2025 at 02:58:11PM +0100, Yeoreum Yun wrote:

> > >  	 * The architecture specifies that bits 63:60 of FAR_EL1 are UNKNOWN
> > >  	 * for tag check faults. Set them to corresponding bits in the untagged
> > > -	 * address.
> > > +	 * address if ARM64_MTE_FAR isn't supported.
> > > +	 * Otherwise, bits 63:60 of FAR_EL1 are KNOWN.

> > Should that be "are UNKNOWN"?

> Otherwise in here mentions the case when ARM64_MTE_FAR is supported,
> So the bits 63:60 of FAR_EL1 are "not UNKNOWN" but I write it with
> KNOWN.

Ah, I see - KNOWN looks like one of the specially defined architectural
terms from the glossary of the ARM since it's all caps but KNOWN isn't
one of those words which was confusing me.

> Do you want to change this to "not UNKNOWN"?
> or Am I missing something?

DDI0487L.a D24.2.43 does use the term "not UNKNOWN" for that case so
that'd work like you suggest, or some other rewrite to use less formal
terms.  Like I say it was specifically the use of caps.

--AcPDYuBXDOqguWX5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJrB4ACgkQJNaLcl1U
h9BYHgf+Iit2rwd3yHK5WEV9aQ3ItTDeP7YyFQrmZUxPDi9M1hxYKXvHUsLtyaWf
WYnwjrzkM8ykmhzQonLE+ecQDd1wEk5Z08CBZHH0ut4EmVt6hjf333uXFF/s7jKY
YPxMmtGvzK3hoeqXUvKKnaRZ/3ZDYOjFTUGLDCf6SuZDCF5/J2KlXNkM4WgNn+T6
dDXllbnC/+SU5PBk9fEYG43hyEjsnkT/qAAdgomLTyzg/eddrXWSX3E0xEHOU/Hk
fGSSBTKZB/uKky6wHF+pVF6Gs65UyZ5NFj1bnJAN+AoOIU6GHrifwPvknwinIiUv
GKv0mQwOeqGrzaLeRineWNxPckGr3A==
=QnsX
-----END PGP SIGNATURE-----

--AcPDYuBXDOqguWX5--

