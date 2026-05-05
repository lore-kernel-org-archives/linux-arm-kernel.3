Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A63FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3PUsEhxiyv0MVCPjH1f+nJYAM60mYlApLVeqBXtLlk=; b=l5BwrYCuoUgeEORXHUZVpUfUmV
	A19bvyyxUxqJJqlaVUgPf4AB/dXzVhk583f3gPo5xogTPAEtm0sEoozItpKAweU7NrfRghxGEeFjF
	gnQKez+4pTUkzQmV+roM6kHgLQlQfq3zcfBcGlSU9kpF8EDaWl1nZcKR0Oc2QMaaBEk/Hzo7aHoJe
	2HB2Paubk1rFK6FpMtyB8NAFx3/pWUMoWzalA7lxCs/KcSnvEexXYshvDC/DrML7qY96pp1kGXkTe
	nYnIHRsRDEeSc8GeIvESfYSka8rChTLA/ehMOPnJJLWBMtrKqftizFGoCH62d/MN5fs9P8Ch3PDzn
	UHPEkIkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIaK-0000000GsBr-0R8w;
	Tue, 05 May 2026 16:25:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIaJ-0000000GsBD-05ZS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:25:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE26860252;
	Tue,  5 May 2026 16:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80061C2BCF5;
	Tue,  5 May 2026 16:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777998321;
	bh=P3PUsEhxiyv0MVCPjH1f+nJYAM60mYlApLVeqBXtLlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YsdVYyQYtQM6np3dFH11uwV6G7629W81Acc5Aa/jC1laJ6HtyxornDPLKpkz9n3tn
	 l6cbWBKdb+G3t3/1e+z1tQe14bofctaiuYfofAoDjqGwiM9HypyyqJaz42CHpnTBa+
	 0eHDpDylvC69XTPGQFs4YpI+VXvbZGs1nzqan7bNuWMJ3aivvv67msnJiNqU+rh/Uj
	 a5Tf91KZwbqx1NAcjiGCohb96ITlBifSdW9PXAqjy81Eg7k8bQzRSEFHWCVcfRMY6s
	 WjxVWSZFZkpmhynV2imqu3dGE39tRL4ECs13/wwfSML9WDM16wP62i6k3FHGQzZig3
	 RJI22RucIcCSA==
Date: Tue, 5 May 2026 17:25:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Swark Yang <syang@axiado.com>
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: cadence: Add Axiado AX3000
Message-ID: <20260505-eggplant-little-87b6134a95ba@spud>
References: <20260504-axiado-ax3000-cadence-i2c-support-v1-0-97ed2fdc0b7b@axiado.com>
 <20260504-axiado-ax3000-cadence-i2c-support-v1-1-97ed2fdc0b7b@axiado.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SnZyNtcB4rZeJFCl"
Content-Disposition: inline
In-Reply-To: <20260504-axiado-ax3000-cadence-i2c-support-v1-1-97ed2fdc0b7b@axiado.com>
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


--SnZyNtcB4rZeJFCl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 04, 2026 at 11:26:43PM -0700, Swark Yang wrote:
> The Axiado AX3000 SoC integrates the Cadence I2C controller.
> Add a specific compatible string "axiado,ax3000-i2c" to support
> its hardware features, including SMBus Quick command capability.
>=20
> Signed-off-by: Swark Yang <syang@axiado.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--SnZyNtcB4rZeJFCl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafoZ7QAKCRB4tDGHoIJi
0rlUAQD+nb4X/sN7660Y9aXpeiu8qfjC2cP3Djl/gh68JLcFswD9G966+as4y2ZW
WY7GCArjHENU9Xu82cwWyEnS+8g6WQA=
=eHFt
-----END PGP SIGNATURE-----

--SnZyNtcB4rZeJFCl--

