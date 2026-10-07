Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09F6CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 10:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ze0pmdyjgRkCyKL63/qNmZFz4TXiGAoe0p+7PuTHRUA=; b=PqWoo7S6x3Hos/ets46P5hZ48v
	Ozb8TaN6Zg8tTI3258zLWFZ8bFUH0f2QtI6pa7NK1EzQPn+n6sBnkoK0xYUIhOfOuxR8uip7HFc11
	TpkJgMq+jxBoqqbr1c8X/95DtXfuM5MVAy7Iwznwv1J95MeV0agVIzH30KXwh0ojRzvb/+X+fvEHh
	++uUMl1pHXErIVao+DrULJhTJO78UFycXnikciv6AqL9lJzgYzuok6vBBistPMjbbO4xwKc1A4WsJ
	fUsE6242ytu1Wu/nKLFca19nvtMaWpW3G42JyvC8qQqKthSMNJ92apUVAqmPFnlw1Z7p8HOAXRh4+
	XOk9Obyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOpb-000000029Ao-3iOX;
	Wed, 07 Oct 2026 10:25:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOpO-0000000299R-0UBD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 10:24:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 68A6960210;
	Wed,  7 Oct 2026 10:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA311F0089B;
	Wed,  7 Oct 2026 10:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791368689;
	bh=ze0pmdyjgRkCyKL63/qNmZFz4TXiGAoe0p+7PuTHRUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W1nGPu37lAD4iItWp6ybwSb8RRV+U7tivGsueqB9V/3uX0Yllqhr4pClwfJJom8Sx
	 X6fnvOoz8cRWvl7/DcBQqiJK9EfwuVItkgiyQRfbPb4wkWoeYYnDo9D00uo+XQvBw5
	 hUZTy1dETwUaOUi0S8VxNoOuFTCbs4AO5OAovQ+TqzS2JIF5xl/KB0k6Yj3cPPynqQ
	 BsLMCaKOQRZL+sYj8VXFFKNz7OgCp+SpG+1AUaCjKEM4U3y5aTDft4vZJrAZHT7uck
	 4qkEindwnin+landYxYv6CJqX/fDJiA0SDcA3zUGFc3O5edr5IfEmSVcm+jwtnuDVD
	 l/GV+yrgFlFIQ==
Date: Wed, 7 Oct 2026 11:24:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Thomas Bourgoin <thomas.bourgoin@foss.st.com>
Subject: Re: [PATCH v2] dt-bindings: nvmem: st,stm32-romem: align
 patternProperties regex on nvmem-deprecated-cells.yaml
Message-ID: <20261007-4fcf53de5de310d92affa63c@squawk>
References: <20261006-stm32-romem-v2-1-f2e156f563c6@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t/M3KmnA6P0SMj4E"
Content-Disposition: inline
In-Reply-To: <20261006-stm32-romem-v2-1-f2e156f563c6@foss.st.com>
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

--t/M3KmnA6P0SMj4E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--t/M3KmnA6P0SMj4E
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasYd7AAKCRB4tDGHoIJi
0oD6AQDxIkvzHjhhwqIsfxRcu6JCKsbMB7R/GDV1eo6YJsPa7AEAyHY+0PgFGMxs
66DEyMYgv6Yx6OHyapOhZAnnCygmIwU=
=cNUN
-----END PGP SIGNATURE-----

--t/M3KmnA6P0SMj4E--

