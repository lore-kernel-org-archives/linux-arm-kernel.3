Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E091D107BCCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSb/WiNQkEyVuXqoR1/RIujXaR4Qcx4XeEfZ1bwORAs=; b=k/vc/BRWeKcpBInbcuxLFcLCdQ
	nsuw6TNkhGltJv1K7L5tVBWC5Het5eS/ZDCLGv0LjN/I3Y6qnZRYaKawbJP2tCGo9IrLpsgITqqS6
	P7XSdAO7p2SVBnh+PzSqkHv4wneXISVAvg1l41hpk7PR0CWTRnnacZ1i4+z8r8wPaLA6svGvfdGbH
	dLSlYJvdB8YBOBs0JSAk7i6pveG1Iwn46i1psJocEPb7wMoRmKUQtxXdpC7CSez4GUhRPrRet0nvE
	Ojtiw+uLEI120oq8RCo4VBjBBLWL86bjuiKuOfzXBuP4veuSfm1q1wTicrkY/6ecFKzXcFSlxjk++
	QAYiN8pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15RC-00000000eYx-3oMh;
	Fri, 13 Mar 2026 16:32:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15RA-00000000eYq-2yMz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 16:32:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8463D6013C;
	Fri, 13 Mar 2026 16:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66C86C2BC87;
	Fri, 13 Mar 2026 16:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773419551;
	bh=CIellapUW1+YjJZ9d2SpELMqrNBmvRAjw1fsXMHuNYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AiuPWHot8SbFapVb3TIecP0Kil02229FoPHuRNl4f+i42vizPrG8N0Mfot5rjsFW6
	 joRLyDy91I1ywpKOXol4RGHrjs5/t/yfQTPKoJnw7s7ZchkI+f6+4XR32wDSKt7jEK
	 UagzNGkvqEXlWRD9Bp/sNMShqP+LSW0Wtf2wR7hvWWTdEFueNWqTNdg+OatyQyEa73
	 l7ehFXvhipdXKNFXm2RcK50hsSnFE119k3/hXhJmt1prXl2Q+xP6KeVtMk1TI2hhgC
	 UVgNK0VInD6ukeFou9G6Ip0fcBINpcjJQkTWUY1G2uUh8Zq1bgobc+g23FiWSis1iS
	 f3QDPMsufA7Gg==
Date: Fri, 13 Mar 2026 16:32:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: aspeedyh <yh_chung@aspeedtech.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	maciej.lawniczak@intel.com
Subject: Re: [PATCH 0/7] soc: aspeed: Add AST2600 eSPI controller support
Message-ID: <903bcc13-5b50-462c-8fa8-051f07748127@sirena.org.uk>
References: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
 <20260313-energy-casket-ca8adc1f1fd1@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F2hu5EuVOUo3uSja"
Content-Disposition: inline
In-Reply-To: <20260313-energy-casket-ca8adc1f1fd1@spud>
X-Cookie: Monitor not included.
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


--F2hu5EuVOUo3uSja
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 04:24:22PM +0000, Conor Dooley wrote:
> On Fri, Mar 13, 2026 at 06:07:35PM +0800, aspeedyh wrote:
> > This series adds initial support for the eSPI controller found on ASPEED
> > AST2600 BMC SoCs.
> >=20
> > The series introduces a eSPI controller framework for ASPEED SoCs under
> > drivers/soc/aspeed/, adds AST2600-specific controller support for
> > peripheral and flash channels, defines the corresponding devicetree=20
> > binding, and adds the AST2600 eSPI controller node to the SoC dtsi.
> >=20
> > The driver is intended to support host-BMC communication over the BMC-s=
ide
> > eSPI slave controller present on AST2600 systems.
>=20
> This all seems to be in the wrong places entirely, shouldn't an eSPI
> driver and bindings go in the spi subsystem? FSL's appears to be there.
> Mark?

As documented in submitting-patches.rst please send patches to the=20
maintainers for the code you would like to change.  The normal kernel
workflow is that people apply patches from their inboxes, if they aren't
copied they are likely to not see the patch at all and it is much more
difficult to apply patches.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--F2hu5EuVOUo3uSja
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm0PBgACgkQJNaLcl1U
h9AAYAf+L1uxDFy0+AOhCEgiEggmR6FDeUbMGbqzgBvrCvnN+F2MpV8AWF7bFJfG
/bUEMAYMn1InW0Xj5aP6ITHk4X4CxIY1K62AEj5kjT/pMIfe7e+ggSATZNwR4kPK
6CHD8Gw40/UsogozFin1KplzPpCjzfXkScCFpT4g0lDWLp/FohmBLC+57+LrjpV+
PAtFlfcxBf+BgROn9ioH6FlSJHpcSxqwCLg0sIo/ZCcGyDlLuySN9zyBpIVwZ9SJ
YasQI1vLbWj+oI9WoxaDEibuKaMeBomWL2MLklbtumzbAB9fLrmwDnH4Q0ZL7swh
oGrz049gojg+z3JNaufDsOtPHZoLRg==
=0yd5
-----END PGP SIGNATURE-----

--F2hu5EuVOUo3uSja--

