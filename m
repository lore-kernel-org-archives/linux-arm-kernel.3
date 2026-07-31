Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF53FC55174
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 20:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YwfwtYedoAYnXW3RFF0QQ984O9NKILCL29Vuw4RagBI=; b=uVhgJMVsOUK7cKgXz/sCsWRMMJ
	kQBrpWWq7/cYzc72mtXQdh8WMqkD/KlAGYPjAXh0RHtfXjnNsEY+BleEJdtq87BpCCN1mTuh/HT1C
	Rr8tOIKGV+HtT/GjaRM/NT2mf2GWjNYpha03vPVg2ICmjziBC6kIeapH1FY5x73EVAK4tPru9FW53
	3OHw74tPfKg4FA2sFWceaxdf8nFf3MN1Z6mzsnaP3amRWT5G/6cn80YPcDtDj5qXxsg42CCvWD93C
	odTE5yfuCTTTabhcpw9AafWE/BHgcbW5gaFe8vPj4F9eiVePcqPrfwTVV4xaDCUCO58LQXHsbrilf
	scVnx1OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptqG-0000000DYNQ-2wrq;
	Fri, 31 Jul 2026 20:28:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptqF-0000000DYN8-1KjS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 20:28:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F39B2600C3;
	Fri, 31 Jul 2026 20:28:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B46341F00AC4;
	Fri, 31 Jul 2026 20:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785529703;
	bh=YwfwtYedoAYnXW3RFF0QQ984O9NKILCL29Vuw4RagBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RocqfHZ4DdmBRsHm0GYmpWyjw3R2lD2KQ3rujjOaUt+3YXjFAmK/ehdX/+kZw0BNc
	 yn3JnvxAJt0IhCyFSSbTwDcxhojvaq83/WaANL++PXuQfxAlcpycaPD/uchKxQgBaR
	 3LNa71E2G+h9Tc3ALO7YjTH4BxR3C87QI9bxVAetjZ47R/q8AAAY5MRTIf9zjSQpdD
	 vkFD6/XtYtacAMhVrZe7XyCBgCYI2G2m4mdvpaZ/zgr470MFztOUSr4i4/aq+9qNPF
	 QGGxIpZy6PIaSz0e3Q036Byhdt1rv/YRo4PVSaZGyiuvdeM5uB2DFWVOvAFmp/o5Rx
	 yu7FdbDZZkzgg==
Date: Fri, 31 Jul 2026 21:28:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: spi: nuvoton,ma35d1-qspi: Add
 Nuvoton MA35D1 QSPI
Message-ID: <5769eae0-1b40-419f-8311-0d919bf619fa@sirena.org.uk>
References: <20260731023818.1626075-1-cwweng.linux@gmail.com>
 <20260731023818.1626075-2-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Cs5fTReg+qQ322w5"
Content-Disposition: inline
In-Reply-To: <20260731023818.1626075-2-cwweng.linux@gmail.com>
X-Cookie: No shirt, no shoes, no service.
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


--Cs5fTReg+qQ322w5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 10:38:17AM +0800, Chi-Wen Weng wrote:
> From: Chi-Wen Weng <cwweng@nuvoton.com>
>=20
> Add a devicetree binding for the Quad SPI controller found in
> Nuvoton MA35D1 SoCs.

This leaves the generic binding's support for GPIO chip selects enabled
but the driver doesn't set use_gpio_descriptors so they don't actually
work.  Either the binding or the driver needs an update.  Otherwise
things seem mostly OK so I'll apply, please send an incremental patch
for this.

--Cs5fTReg+qQ322w5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmptBWIACgkQJNaLcl1U
h9Bvdwf+IyO6Hu9Z5099OlvPR/gx0z5P+A2YPrWyLLDOKaffMb1GC8evhY20FanO
e/xY0SsVy0K4M5UwbfvOBfK4eBfMujZO48FaFx/7eSWrs9H2pHytLSdJfN6DXrFr
93XpW0f0gafiU8vxRMu2mY7fnqR3B7VtdhsjIW09gCG44LxWi3YbIE4s/IQVCQT1
QnUB6DSjDB6e7YNDha19LVEqjdp/vxZgmpsEt43xs9TvZqC5iyOn3Ycuuxy7/eLm
y66Vr4vMVCTkkQ9jbR0orEdJzKY5I1QKcrJUc0+0/kX1FTrXPp5QcxCH2/ex6yGk
UWID0/HT7/b3Vv5M3v3M3QyVljIl2A==
=GnHY
-----END PGP SIGNATURE-----

--Cs5fTReg+qQ322w5--

