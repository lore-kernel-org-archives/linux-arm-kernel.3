Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376E6CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 20:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=neGWU7vECFARydWtFvZZfMZV4xCQwz1K7pRfXsgrrok=; b=SJ9t7KqbshcUc8ia5KYRDj2Rc0
	5dPBDvGrJDG204Sh5t1JcvhsRa+O78ROjTXjTamqsOmaaf5Oh4bppATvsLA77nqnbB2BmAwjFVbp7
	8l74rpC33AS82X2FFxJIStLTW4rjZpiO45FXzrpH5CMS/YsxLGQ0EaYZUyDkoTPsr820rJlXQ0HRh
	erhCbCOU8mavfkXY7u1ozlYk9QN+1mHcWqpEVJnQSILJsIF8WcIeS5aT9njZw3qaF91rmmTPnaLST
	BsXOznLY2qSwJEFAC2szlAkx6Bh2RTP8oMmlUJ9+zqWlRV/9ngCbzJ1vSrFaoTE6234pL9nTrRpYQ
	CPHCV0ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umexU-00000000XKT-0wpX;
	Thu, 14 Aug 2025 20:54:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umeqd-00000000WgN-23dw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 20:46:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD4F25C587D;
	Thu, 14 Aug 2025 20:46:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34ED3C4CEED;
	Thu, 14 Aug 2025 20:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755204414;
	bh=neGWU7vECFARydWtFvZZfMZV4xCQwz1K7pRfXsgrrok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P6FBNlZ81uQctGynrhYmjQLIIqw0Xw+00fZB5IrMaeXhhrSRqBtRle4jgRm+/fV2R
	 0KK7v6WJfox3KHjJdVINsGnXLaxXW7AVpyYEe2LIwsZr/DYIcHChmKS+nBMMTT0ioM
	 L8HAVfNlBjZMsL37ZBMU/GMJ0dd7HUrrqu76LNKcZmocl6SYk4RX2OUuOSkxSJg0yS
	 NuKNrX4A+pQ2oqHv0xysbifcm8zJQYvtD9tTzLZF6RKqe2J2mO5onBsFSnuaZVvc6i
	 GvFYicjNzzignsSI5FdJujy6Ix93ridsjRkwbkUt09QnpTbHtFXNaXHojc5pBd27Rj
	 Fx1GmF/uPxLHw==
Date: Thu, 14 Aug 2025 21:46:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Anshul Dalal <anshuld@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/4] dt-bindings: arm: ti: Add binding for AM625 SiP
Message-ID: <20250814-cozily-detoxify-2af8ad2f6aa4@spud>
References: <20250814134531.2743874-1-anshuld@ti.com>
 <20250814134531.2743874-3-anshuld@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1u2YrZR9/qfG23tg"
Content-Disposition: inline
In-Reply-To: <20250814134531.2743874-3-anshuld@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_134655_570042_E63097B5 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
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


--1u2YrZR9/qfG23tg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 07:15:28PM +0530, Anshul Dalal wrote:
> The AM6254atl SiP belongs to the K3 Multicore SoC architecture platform,
> providing AM625 SoC with 512MiB of integrated DDR in the package.
>=20
> For further information about the package check:
> https://www.ti.com/lit/ds/symlink/am625sip.pdf
>=20
> Signed-off-by: Anshul Dalal <anshuld@ti.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--1u2YrZR9/qfG23tg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJ5LOQAKCRB4tDGHoIJi
0jRTAQDG007EXoqZ3YAvhQMuwDFk0hZscgreLteavw7D5mHFDwEAqG5AXct6syKf
dcR5etysIhVtAL2OcqL4xUXkzpyUrgk=
=LZZv
-----END PGP SIGNATURE-----

--1u2YrZR9/qfG23tg--

