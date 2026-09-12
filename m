Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97011C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 11:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EAbRSdXcg/S2Gd9ljR1ho5nMr6869TmN+678kggw2FM=; b=ZD8ei3KaEnSe3e19IHle4LB5/r
	3qWAXcSKd3jUKDLhP60gEt0J9fvHamAIyt73HDhBqFZ6xdj4N/HRXb6RXH8ukxWioGuKW31GVfqkS
	U/raVtQDN0RBSzvBuzeo7rFtywt60ZLrWJlLvmzp0TGS9vDqm3HRKyigBIBahNkVm0JgRKPJGNa0P
	+4ONubkIU6yOABukJcWzXfAXrz9Rqv+ph3BWE1tfo1ghwumwPbk5Xmx7eCz68GY5QaMjMx/Rf9QkN
	f330mwLj5jPF2gr8HAYXKGqSacvXhBYWrCHVAUCpaWLZBt63ozDIoaAXyDCgSZY7awxeb42NMzlVu
	Etx+Q8yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5LYJ-00000000oON-3BC2;
	Sat, 12 Sep 2026 11:05:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5LYH-00000000oOA-2yEm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 11:05:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 19AA440A0E;
	Sat, 12 Sep 2026 11:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C5D91F00898;
	Sat, 12 Sep 2026 11:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789211145;
	bh=EAbRSdXcg/S2Gd9ljR1ho5nMr6869TmN+678kggw2FM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ijT55XBORg6IcAu8uA5SrrBO9H2IAr5Mi+f/7KGqEBE4vH1ow2utu9M+h6Itg4c90
	 YflEtHrnwzYXUBJdkoIgwtOKSqi7QRiBDiAb/48zBZhv0YSNU1LZNcMpjWC3eqx3jl
	 7sM9pqRR8VJgGBfl5HeZKC2vhPL1MhbQIu8oAgs8jeDIIk9VF/g8OZXOT9xMmBrVWo
	 n+JAdK+mDpRMna48QXXL7v0G8NW+pk3H2Mj8/mLdetCWS7U5oEFFUkn23LFwOZlKZN
	 iUAqzzGWz6OE7gvFyPhjKcUYPdEXUHpmUgDdP/cCbtyNTOtBRsQ0hnP9aHoGW0ZCLD
	 rsWomlqCc27Sg==
Date: Sat, 12 Sep 2026 12:05:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Srirangan Madhavan <smadhavan@nvidia.com>
Cc: mark.rutland@arm.com, lpieralisi@kernel.org, sudeep.holla@kernel.org,
	jic23@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	treding@nvidia.com, jonathanh@nvidia.com, bence.csokas@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 2/2] cache: add SMCCC-backed cache invalidate provider
Message-ID: <aqUx9NCdeEr0R86z@squawk>
References: <20260910082142.1522865-1-smadhavan@nvidia.com>
 <20260910082142.1522865-3-smadhavan@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WLLAqGgGEJH6ceCY"
Content-Disposition: inline
In-Reply-To: <20260910082142.1522865-3-smadhavan@nvidia.com>
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

--WLLAqGgGEJH6ceCY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Will/Catalin,

On Thu, Sep 10, 2026 at 08:21:42AM +0000, Srirangan Madhavan wrote:
> Add a cache maintenance provider for the Arm SMCCC cache clean+invalidate
> interface.
>=20
> The provider discovers SMCCC support and attributes at init time,
> serializes firmware calls, handles transient BUSY and RATE_LIMITED
> responses with bounded retries, and registers with the generic cache
> coherency framework used by memregion callers.
>=20
> Signed-off-by: Srirangan Madhavan <smadhavan@nvidia.com>
> Reviewed-by: Jonathan Cameron <jic23@kernel.org>

If yous wanna take this,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--WLLAqGgGEJH6ceCY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqUx9AAKCRB4tDGHoIJi
0tWbAP9pKv18wzUDrEQgGGMSF90ZNqqaF5RwAsn6LafqkcXPPAEAtHRF8XU+X4LP
KmUhJnMv+MSySqjbU/zxJ/LhKruX2AA=
=xoxY
-----END PGP SIGNATURE-----

--WLLAqGgGEJH6ceCY--

