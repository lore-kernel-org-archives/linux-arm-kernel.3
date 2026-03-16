Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528F1F4644D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 11:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2DIone3jg6s/bvR9xvorp3oQLfBJ8sNQo4lvx+TrKzY=; b=kFLgobP8tfRoe3KYmKZl7oJqtc
	lfY5JFpXqZaRFbvTmpjDIWdqR1fSXcC34+3CtyrvvTuR/xQAiZk12XvOCVZEaoJd8UL1df2YarSW1
	36mif7KP5gSPViwtFOOsTDM5gxfSbdpERa6HsenKsKttYulCfo4A4PhVFBfMAFTXTSHX5LLdAZhhH
	bS/N7XqGRK6t61iEpceXPX2QwqeSVLebRyq+zurS0gZGaH7uiv5gtYcYXI+cFsZFYSSJTCA9U2Sgn
	6YRV/bNdr9g7U0rKnrUmFq8SAnkrMgSLxrLmDBT1R3qSF68xVbOkQ58TR+yvYxnI/NlCDXRoF62vx
	Uh6k8wtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w25kM-00000003n0J-483h;
	Mon, 16 Mar 2026 11:04:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w25kL-00000003n0A-3oWB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 11:04:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0295A60008;
	Mon, 16 Mar 2026 11:04:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D827CC19421;
	Mon, 16 Mar 2026 11:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773659068;
	bh=2DIone3jg6s/bvR9xvorp3oQLfBJ8sNQo4lvx+TrKzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sKVsIZQwQUkISgece+I9dQn2bEqF6SxAOS8CimszXHO3ZXbp/wiOzSLPhYnsjg+7a
	 WXPU0ADwtHw8PqCLm92kwNE4q2rmWW46Rc80FWihrvECJDjVm+UCCQOV2TakQyDDfj
	 4c04rluUfBwrsDec+TRoirdcI8X45mfq49AnY7UICRJK95QROJSh4MCTdq2yDe3uCO
	 NiZtH1VigmmzkLkTICfG2Gee/Smgiwd+HSnxmlCIlG/1orpvNrKCUvcmXNGOzxRBa9
	 aeNZiTW1p44E9yM1hFoRsiK6TmX2O+PUQDcIOiMrII3CTN0hIB9UcUx+DNfzBPKmwZ
	 22HXK/JNG5rgw==
Date: Mon, 16 Mar 2026 11:04:23 +0000
From: Conor Dooley <conor@kernel.org>
To: YH Chung <yh_chung@aspeedtech.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"maciej.lawniczak@intel.com" <maciej.lawniczak@intel.com>
Subject: Re: [PATCH 1/7] dt-bindings: soc: aspeed: Add AST2600 eSPI controller
Message-ID: <20260316-moustache-sleep-0a355de2fc8e@spud>
References: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
 <20260313-upstream_espi-v1-1-9504428e1f43@aspeedtech.com>
 <3f2d964a-4e82-414c-b373-af0d531b0fcd@kernel.org>
 <KL1PR0601MB4276A4B81C2E2DB02BE8F2059040A@KL1PR0601MB4276.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p0eyabYdCPkKrMr8"
Content-Disposition: inline
In-Reply-To: <KL1PR0601MB4276A4B81C2E2DB02BE8F2059040A@KL1PR0601MB4276.apcprd06.prod.outlook.com>
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


--p0eyabYdCPkKrMr8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 08:17:48AM +0000, YH Chung wrote:
> Hi Krzysztof,
>=20
> > On 13/03/2026 11:07, aspeedyh wrote:
> > > Introduce the device-tree bindings for the Enhanced Serial
> > > Peripheral Interface (eSPI) controller found on AST2600
> > > BMC SoCs.
> > >
> > > The controller operates as the BMC-side eSPI slave and provides the
> > > peripheral, virtual wire, out-of-band, and flash channels used for
> > > host-BMC communication.
> > >
> > > Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>
> >=20
> > Please use your full name. Semi-anonymous contributions are not accepte=
d.
> >=20
> > Best regards,
> > Krzysztof
>=20
> Thanks for the reminder.
> Would you prefer that I resend this series with the corrected sign-off, o=
r would it be fine to update it in the next version?

Next version, when the discussion on the cover letter concludes, please.

--p0eyabYdCPkKrMr8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabfjtwAKCRB4tDGHoIJi
0sE8AP94P3za5WQ9N90Wd1Vz+WrRp0x1izasFrcHhDExJwDpTAEAt7w0yx0NVBph
WxM/X/bio4Z/JwcJG/5q7nB/qMRalgY=
=Oz5W
-----END PGP SIGNATURE-----

--p0eyabYdCPkKrMr8--

