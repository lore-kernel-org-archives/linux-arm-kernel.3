Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6B7D65C5F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 15:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWAUocOjmX8RJzDte38DNjzOa+sOAtQ5U7ZJs5L21mc=; b=VhP7TJVKM5znTzwJCFCiMk8bbH
	xufdui8h6ieJKorJYRpeU7elw1jtPjmlQgDc2mtu90rLvs/bGschJTOUv+x48Nzx7ihCztaOnr3rE
	U3zPDEkBHnu0OsaKyiMDSTbyS48UF416IIyr+qVpKPl3BPca5jmQcdo+/TlJ16tUnWOP39E3HQdZi
	YbLdmIekqjJNhyGc5WBibfhfItQEYeeIE81NER+0jDvHJWsVaBv4s2OQ5hGpYrXxgSWlgbHjWSukE
	bUbRWhGDJXh7kdXxtXlJso07ugh5GOCksgrxZaTrBU5+wvZ6NsmowafEDTCXxO/zemCnD1Ncfg1bE
	rFH9CtsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVtA2-00000006zUr-0RgG;
	Wed, 17 Dec 2025 15:09:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVt9y-00000006zUF-3vF0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 15:09:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D849240488;
	Wed, 17 Dec 2025 15:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99209C4CEF5;
	Wed, 17 Dec 2025 15:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765984188;
	bh=6FtIgWzhG4H478GuifMJD7OISTfw+RtajUUUI+7ws5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RkfyormIr+NBiwfq1bd4BhDlNdk23ZV36Am3pdY5KeY9jOowLZObclyxR66GS7r/s
	 3b2uOxeirySIPKCHM0+mptBZZV49HS6cwvquqHeXe4gfv9V3kU7skNqdFmkgTP7oyf
	 8UVIgWPgQ2B7ljviAVmnYBUa5crQPWyYFr9sODL/J6/rge5pKFf4iT9qfDFP+JWR1h
	 yN+9LFEkN0WGKeVgUhtxtlOZlHzJUsp8S+Jz0mG/yFF9gaScumPyLzV7Bj6+Yc7/9x
	 t7zigp3VG4OTb2MqWFWwIp2bJInQb4VKN0Gxz27J77lGiR8DI00jNOT4X/OL/oeqxE
	 MGwCuhHLiGlLw==
Date: Wed, 17 Dec 2025 15:09:44 +0000
From: Mark Brown <broonie@kernel.org>
To: "He, Guocai (CN)" <Guocai.He.CN@windriver.com>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"nm@ti.com" <nm@ti.com>, "afd@ti.com" <afd@ti.com>
Subject: Re: [BUG][RT][ti-j72xx] spi: cadence-quadspi: boot failed with
 rtmutex deadlock detected
Message-ID: <8bc899ad-9fd8-428c-8c56-97e56e8e45b9@sirena.org.uk>
References: <CO6PR11MB558695EFB87C578370014430CDABA@CO6PR11MB5586.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yRDzFvO9bnkRCfas"
Content-Disposition: inline
In-Reply-To: <CO6PR11MB558695EFB87C578370014430CDABA@CO6PR11MB5586.namprd11.prod.outlook.com>
X-Cookie: Big book, big bore.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_070950_991025_11D522ED 
X-CRM114-Status: GOOD (  14.89  )
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


--yRDzFvO9bnkRCfas
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 08:21:19AM +0000, He, Guocai (CN) wrote:

> Kernel:
>   v6.1/standard/preempt-rt/ti-sdk-6.1/ti-j7xxx
>   (based on Linux v6.1.159 PREEMPT_RT)

v6.1 is pretty old.

> It is ok at da3c5173c55f=EF=BC=8Cbut it is bad at 7083c6620486.
> I revert the commit(2c914aac952) which merged from stable release,  it al=
so ok at 18db8c7f20a6.
> Maybe it is a compatibility issue between v6.1/standard/preempt-rt/ti-sdk=
-6.1/ti-j7xxx and the stable release.

> if this is an known issue ?=20

This isn't something I've heard about before, and there are no fixes for
that commit in -next.  It's entirely plausible that whatever issue this
is also exists in mainline, looking at the patch it's likely there were
problems before this with the locking just not happening properly at all.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--yRDzFvO9bnkRCfas
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlCx7gACgkQJNaLcl1U
h9D/hQgAgro0Aid5Slst3JqgkZKn1ROB9habf2ZJLRBBjig3cHyD75+ZnICgHD9T
9imbrWd4S3lXKpDhLVywRIpqeK3oT+c6aYwV+cgeKO/nA9AgjAi+jI4MSfLieAUV
dbfaS1lodkwql+xR7NlYeE/Im4tOH0YdeBOP8UXjIMawT75wqR/fSVB0ospHHTXU
j+MooUOnUxBW5+ttXze5MSiGSva94LbPUctoh5XWOKWS/pzXYaTBAtqxLQMU3n4R
QAOVmj0w7Tr/o32Tfa74EjsYdUZIWgQbLGTq8WQZxx1+Fm23Z08Vxh6nIo39LCI1
pq9zvLbQN0mKffIS9QeN70kXl8+yZw==
=1MRQ
-----END PGP SIGNATURE-----

--yRDzFvO9bnkRCfas--

