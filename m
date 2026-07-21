Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EA6C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 15:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOFAAzRRFh/mKIX89cKyT2kHZtBd3YUWIOOHfRn6cD0=; b=wyqPvG/vGJN7c4RyYZH1tPWVqv
	qSoc2zu7A8af+fI/WJTICIco+sgdimU8fbd26RTtwr/MYhBEp6N4o9kElGV8zhSqEws+FopAZ5ydt
	wqDyLgtotD22TGuPEcVDauXkWQMFBUuXozj/iI4yMTEIZ8VdSUzdoVVgtN/baesZ9wv7vE+NphtjE
	zgCYMo0/RyOE+1hVSKvUKvO6zaLkvJQew37a152b9Y+XMbX3+3c+xYIWGyQsAieLovUCRocdFV7Gv
	ddmZet1yElIhqRDCVuBK231r7jdWNqMe0sJzZypAQDEEe7ahjRQvhpkAxVgaJxhAJcxXnjbGJMp7j
	Xm4Mi0dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmC2g-00000009jjl-3HWk;
	Tue, 21 Jul 2026 15:05:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmC2f-00000009jjU-1QQI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 15:05:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B6F240EFD;
	Tue, 21 Jul 2026 15:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00BC81F000E9;
	Tue, 21 Jul 2026 15:05:54 +0000 (UTC)
Date: Tue, 21 Jul 2026 16:05:52 +0100
From: Mark Brown <broonie@debian.org>
To: "Shih-Yuan Lee (FourDollars)" <fourdollars@debian.org>
Cc: Lukas Wunner <lukas@wunner.de>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 5/7] spi: pxa2xx: disable DMA for Apple MacBook8,1
Message-ID: <f7449a69-98e3-41c0-b535-847b8c520e10@sirena.org.uk>
References: <20260720162117.32304-1-fourdollars@debian.org>
 <20260720162117.32304-6-fourdollars@debian.org>
 <al81PmK1UMr2g8p-@wunner.de>
 <CAAT15mPuO71WbbS2ZpWjceCVj3FUTqHLi3wbbeV7B33JHbPRsQ@mail.gmail.com>
 <CAAT15mPrwAqLmFVF730G+iJugzNzaT=HDj_7G5-wXbhBNU7ANg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s+v5GOHrlcTy1tFO"
Content-Disposition: inline
In-Reply-To: <CAAT15mPrwAqLmFVF730G+iJugzNzaT=HDj_7G5-wXbhBNU7ANg@mail.gmail.com>
X-Cookie: Love America -- or give it back.
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


--s+v5GOHrlcTy1tFO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 10:34:20PM +0800, Shih-Yuan Lee (FourDollars) wrote:
> On Tue, Jul 21, 2026 at 5:26=E2=80=AFPM Shih-Yuan Lee (FourDollars)
> > On Tue, Jul 21, 2026 at 5:18=E2=80=AFPM Lukas Wunner <lukas@wunner.de> =
wrote:

> > > It would seem better to fix up the incorrect interrupt number in a qu=
irk,
> > > rather than disabling DMA wholesale.

> > I appreciate the comment. Based on the Bugzilla feedback regarding the
> > incorrect interrupt assignment, it seems fixing the IRQ value via a
> > quirk is indeed a better approach than disabling DMA wholesale. While
> > I am not certain this will resolve the issue entirely, it looks very
> > promising. I will investigate the IRQ mis-assignment problem further.

> 1. DMAR/IOMMU Validation Failure (Error -22)
> On modern kernels with Interrupt Remapping (DMAR) enabled, overriding
> pdev->irq to 21 causes the dw_dmac_pci driver probe to fail with
> -EINVAL (-22) during request_irq(). This is because the
> DMAR/IOMMU strictly validates the PCI Requester ID (source ID) against
> the GSI mapping defined in the ACPI _PRT table. Forcing a device
> mapped to GSI 20 (00:15.0) to register on GSI 21 triggers a
> source ID mismatch check, which the kernel rejects.

That really seems like something we ought to be able to do, though I
think the idiom here is to patch the ACPI tables so they are correct
rather than quirk things in C code.  ICBW about the preferred approach
there.

BTW, if you're using a LLM to assist with analysis please don't just
paste the output into mail.  Instead make sure you understand what the
LLM is saying and write up the salient bits.

--s+v5GOHrlcTy1tFO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpfis8ACgkQJNaLcl1U
h9A/Jwf/eYHpxryTrHCddTrFIUNz7LvUUxhGxZ4knGvwVXrcgJ23YkKhjWGu7jdo
0NHBbeiGzMapATOMDU9uDCvNaaAU1ZFEv2PMR32qH1spfW8JfAvFlp2OD8hMV/pT
4gJBi7rQKlF6e4P06WVbhK2eT4A5s50JrXHGsgb0bvA/mGlDSZasW5MGsP4jeuye
Kd4obEoDBzyJGSa9mIujWriMgzx7eQtVf3eQf+iPBme4Ob43Sq9d7L1U9hMyXnAj
mOk9WGotauzsGtOwg8VF5CJ3Wa+9CE8zKb2MAjAFcY1SSaC7sU+AU/C79FbtuM3t
n0Ya1PeYfqC+UtjmKH+9hZYQ8cFO6A==
=xz7r
-----END PGP SIGNATURE-----

--s+v5GOHrlcTy1tFO--

