Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4492FD11707
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 16:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vG2wrlhq5wKUSwHmyIwnfoWawFsA5uIOOuaBsWPfNmA=; b=NjkMDKAy5NjnV21pQSSrr6luD7
	asJfT47Qv1Qu1joG+0fxkEJD0q4iPd5cgqQhZDWuDCwMX5DC0soJ18DNNIdzWOXUrZJZ7LlCZqSeJ
	t05ZITJUZF4k3AhOKKdve91AumUpo0LXQVMHapQ7E5MldI2rd/7DNXRQBVFadpoXnVDWENWE2GCM0
	OMa8RwojMDibKxVraFF6TxKAc6CnjTtG8ON+tDuVdOufLAmNbkdqi9PMypciH4hPpirPoC6EN6Ivc
	B9n/eMl7LoWyg/8KO10T6SLa3vOkbqX373fsD4bCoAljo6ZpWeTxhMaZeTEYX58REncbQPa1jo2+U
	bW6jvCYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQTEv-00000005cTw-3w5E;
	Tue, 02 Dec 2025 16:28:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQTEu-00000005cTa-10gm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 16:28:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A9F1843997;
	Tue,  2 Dec 2025 16:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF294C4CEF1;
	Tue,  2 Dec 2025 16:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764692910;
	bh=bMdsKnyhcJs9VfP6ltjW1PuLp0n8+YA6JBJWKjztIQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YTeaHskcMr7V4e4oRUflCmsQK79rRG0s4+sy/HW0MYk+5wuws6jJk/nX1K4ZNUal8
	 sX2gRP/K6zrkRdU3qW0AdVk2NCCGwePDaOfXFmQbzNozXcVJ1C6e/cIE3NvDwyn2Fk
	 PRFF7H7wg/8QGBIi2vWIb2ndLyujNNrfRWyFdpn0l61LgVsTEcabQyE7cX8lS2GaEN
	 48Gp+JnsKznxNE0pXVF5j+mYwDOcOoBLCIeZvD5y9pTEE2Dhg2jAnDmNAv7R46lW8T
	 yq73BGj+Naw8v1nyx+EgMFZvdlEuUZV7taJNh5y8ySmV/P7zW2RxXj2MTge1dMZq9m
	 4lWSxj3PEdzCw==
Date: Tue, 2 Dec 2025 16:28:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, a-dutta@ti.com,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH] spi: cadence-quadspi: Fix cqspi_probe() error handling
 for runtime pm
Message-ID: <5f288d65-4209-41cd-8f1a-3690f38da7ef@sirena.org.uk>
References: <20251119152545.2591651-1-s-vadapalli@ti.com>
 <20251201072844.GA6785@francesco-nb>
 <20251201074320.GA8737@francesco-nb>
 <dfbbd5ce209fac9a556c200748d8c521d0d4f450.camel@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aG5bUVWmZOfsZcU4"
Content-Disposition: inline
In-Reply-To: <dfbbd5ce209fac9a556c200748d8c521d0d4f450.camel@ti.com>
X-Cookie: Beware the new TTY code!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_082832_319168_61C8F163 
X-CRM114-Status: GOOD (  22.38  )
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


--aG5bUVWmZOfsZcU4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 01, 2025 at 06:08:07PM +0530, Siddharth Vadapalli wrote:
> On Mon, 2025-12-01 at 08:43 +0100, Francesco Dolcini wrote:
> > On Mon, Dec 01, 2025 at 08:28:44AM +0100, Francesco Dolcini wrote:

> > > > The error is due to the second invocation of 'clk_disable_unprepare=
()' on
> > > > 'cqspi->clk' in the error handling within 'cqspi_probe()', with the=
 first
> > > > invocation being within 'cqspi_runtime_suspend()'.

> > > [    8.648915] cadence-qspi fc40000.spi: No flash device declared
> > > [    8.675671] cadence-qspi fc40000.spi: failed to setup flash parame=
ters -19

> Could you please check if the driver's suspend callback has executed befo=
re
> the above? The patch intended to fix the very issue being reported.
> Therefore, the commit corresponding to the current patch might still
> trigger the issue. Ideally, reverting the commit for the current patch and
> the commit under Fixes (f1eb4e792bb1 ("spi: spi-cadence-quadspi: Enable pm
> runtime earlier to avoid imbalance"))
> should prevent the issue.

Given the above log we've failed at cqspi_setup_flash() so we shouldn't
have got as far as the code you changed for handling direct mode - I
think the actual issue is likely Anurag's earlier change f1eb4e792bb1
(spi: spi-cadence-quadspi: Enable pm runtime earlier to avoid imbalance)
that you mention, it means we've done a pm_runtime_get_noresume()
previously.  That shouldn't have done a clock enable due to the
noresume, but the get() being there will confuse pm_runtime_disable()
and cause it to invoke the suspend callback as Francesco identified.
This will have been failing previously if controller registration
failed, but it's now happening in more situations.

This is all very annoying since runtime PM can be configured off so we
can't rely on it's callbacks actually happening.  I *think* something
like the below ought to DTRT (I'd expect it should avoid the reported
error at least):

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-qu=
adspi.c
index af6d050da1c8..0833b6f666d0 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -1985,7 +1985,6 @@ static int cqspi_probe(struct platform_device *pdev)
 		pm_runtime_enable(dev);
 		pm_runtime_set_autosuspend_delay(dev, CQSPI_AUTOSUSPEND_TIMEOUT);
 		pm_runtime_use_autosuspend(dev);
-		pm_runtime_get_noresume(dev);
 	}
=20
 	ret =3D cqspi_setup_flash(cqspi);
@@ -2012,6 +2011,7 @@ static int cqspi_probe(struct platform_device *pdev)
 	}
=20
 	if (!(ddata && (ddata->quirks & CQSPI_DISABLE_RUNTIME_PM))) {
+		pm_runtime_get_noresume(dev);
 		pm_runtime_mark_last_busy(dev);
 		pm_runtime_put_autosuspend(dev);
 	}

Unfortunately none of my testing appears to show the issue.

--aG5bUVWmZOfsZcU4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkvE6kACgkQJNaLcl1U
h9BD0wf/SeW9/3pIxTUbxozYkm7XeHw06XMSrVru1LRh53CJqmPp/CK3yLWHXDZD
tBkYtKDcyYERihgoqLGUdk3HfETJDoRsnlScHMXeXIiB9ARKkv4CJZ9vS2BE7qYo
LB6QvkLLyZ4HYM80g3Ty/S/xMoAZwaLK2k5ZQ8eJvf6XP4oDdl2YY9gzeGjydY3U
bAeF8w1wUsTeaPMLn5wusn6q8hq+taSyjFChkt7HTMImDl8OePN3hURwpi65xX8S
GIF5nKlxvnHAwifLa6WKXJ+CoRTTs+ZcZ/nL7Yu9RtRciW3vj9hVn1wv7l54GPUL
SRgRfILunELe5SLkPZGeJ5GL1gFqjw==
=K6gR
-----END PGP SIGNATURE-----

--aG5bUVWmZOfsZcU4--

