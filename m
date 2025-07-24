Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B19C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GH8sHgoP9Qih0bCdB62CfXXvFay+SN+L0/LTCqd+3GI=; b=UrGA/i5ar0/5Y6PLVPbe8U6Eok
	NQAnRl/Yw6V9vITnaGv4M1oslh5g+NLGERKrOkc1reFIpUQhTL1TrNmzKAVRI3TJFY/g8WxDpBV/a
	x757Xvjkk4D1b5lt1sVC9iT2LH0t7rcfBKeuA0EhpoXkCOKYbMAWfzTxRnRUBTgd9olnhAx4/OFwl
	IXKdpTHgG5UQgsNWriRlJQ8vswzEKiiO/IjVp68O/dv4ScmXkhnBkuff4/E4x8EHPb2kgv3V0T5Ix
	PKHBd/q9UdSDmt6+kl+f3dnJDTUNpYO8md/rg9J3ibDrddg+R6tCsz9X2kgsWty7sHrBUYPDL5BWJ
	L0MxnDOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewPB-00000007ctM-2LMW;
	Thu, 24 Jul 2025 13:54:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uevAd-00000007QNK-1Ld5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 12:35:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D5385A561F8;
	Thu, 24 Jul 2025 12:35:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1145CC4CEED;
	Thu, 24 Jul 2025 12:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753360533;
	bh=r+ZX3Es5yVhtnwa0qN+J3zKdrHltGFF3te0S2kpbSmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ofEmwhS9Ugx7wxJO1zhgyrAfVPef58C7fkmlZaC94qqXoPe8mkhudepD1Mzm4a5Wy
	 uF1Ca58XZM9+xPIoPeB6iJga3GX1Cfsd2qK1VzKcxpG1AzipUzLzx5+4LF3aIgW9E7
	 1ijfw6oms1mt8/2oae1sgGCNoMIXQphjhbgiF1N7OL2qS+yLR/4Oe1XmRtIuFL0eTI
	 6gH/yridgg3QksGtuO2BCYToU7hUmm7EVvksJ6vfgtZZChVcNAc9lPaTGoWnGnfn0L
	 fReI8aGF0PYC7Y8szvE0nP10H3+Ag7CZjKHKZnKizNs20GvtNb750LcIjc57BshCQE
	 4WWjnI5Nkin/w==
Date: Thu, 24 Jul 2025 13:35:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Varshini.Rajendran@microchip.com
Cc: claudiu.beznea@tuxon.dev, Andrei.Simion@microchip.com,
	lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Nicolas.Ferre@microchip.com,
	alexandre.belloni@bootlin.com, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: atmel,at91-ssc: add
 microchip,sam9x7-ssc
Message-ID: <68996241-d49d-4680-863c-38e30e403bac@sirena.org.uk>
References: <20250610065005.64070-1-varshini.rajendran@microchip.com>
 <7989c547-2346-4e1e-8327-0c085885faf9@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GMCgj9FRHPHzUIgs"
Content-Disposition: inline
In-Reply-To: <7989c547-2346-4e1e-8327-0c085885faf9@microchip.com>
X-Cookie: Did I say 2?  I lied.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_053535_420273_3B5E54E2 
X-CRM114-Status: GOOD (  13.11  )
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


--GMCgj9FRHPHzUIgs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2025 at 05:26:22AM +0000, Varshini.Rajendran@microchip.com =
wrote:
> Hi,
>=20
> Gentle reminder to merge this patch.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--GMCgj9FRHPHzUIgs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiCKI8ACgkQJNaLcl1U
h9Bt9Qf+Jror8xXrRp6GCl/0eJcVWRMzPkxTLvGzSnt10RAB7m5ivevvZcYq5FAV
VJOozlsvMXpskkSyilo1gWpI8C/P0su943W6j7JP+vvrA6zeut9Mq6nnSuQuVq7h
DiTeCXC9lS4g4xGYms25dLpMNd/hb/I1LbCCZcoyRklbVb4QpS+XwJvP47b+h5bI
x0yXHh7nQMpeLlJdQRZejOy1CKGu6ViVtZ3ZuLV8hQu/l72jYSGJiwYeZvY9dOZL
cZXLTWBYjBFvBXWSopSdl+oB1fNhrjKyLXBX++hxIzYg8ntVtqCEtFpVDBs9ivaM
cSQcqvLcvIzGftir3L8A+J+A8nwegw==
=pK06
-----END PGP SIGNATURE-----

--GMCgj9FRHPHzUIgs--

