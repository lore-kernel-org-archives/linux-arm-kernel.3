Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0DCE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 16:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BpWfeIfcxxaNUbn2U8tKvdEkHK2FsMtBU4eTLwJnl7I=; b=a+dGK2v/MUX0O5Lah8emGJ91VV
	hbDUHFIp6rEbUPFkCwS47OKawAEEEQDx1XN/AcclSpkTomsD87jwxqhvDJRL4vXRgDmD4WmqG718H
	s7U5ajB1r14dWvHhvtt1gQIHYTOltbz4hxyUOkWBQqpchOwr0LsexD1SBPspdIqxahyNkXp6f02XR
	mH2Btrgxl9rNk/o0Nj+2e0l5exp3n67Ujk79Gv7RJ8qUn+KO5upa+sNflg4w4OGZVKQNKmsBANTpC
	5jhhn3Easde/O+3rC+fhfM0UuAKWtCv+w4rS3yQHUXV+bp81ospYKZwyIr4EdmwhxHgc5AXvp0ai0
	ZPuCzEsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbSR-00000002E99-3wC7;
	Fri, 06 Dec 2024 16:45:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbIp-00000002Bcf-1zbW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 16:35:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D5BA2A4439C;
	Fri,  6 Dec 2024 16:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C80C4CEDC;
	Fri,  6 Dec 2024 16:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733502938;
	bh=BpWfeIfcxxaNUbn2U8tKvdEkHK2FsMtBU4eTLwJnl7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QuGYt4olh5TgvxpQcRl9PsFUBVax8yi9s7islv/y9OlAhdA+vMfaT6D+ES2NY8iqU
	 AgGeGQsq7HZdd+l3d7QxeCUn8u8uyr2+2subSrnL+Zl7WM3RHjjEl+14YNPzkT7yeZ
	 9J+e/vl7MoYGWnFG3dUkcR6kQPZ2xH0gJ62LJHfdzEsy8wGTwszUHXNeRh0+PgP77g
	 hJK9GFhd32id039IqfSeHBOohpEM1+bHCIoZ8HYnwLRRIoSUOCqjx2ZpFA/iePQVnO
	 Y3WCoPFi///8rDq9toJijZtrRNsKL1AG5mBT8FGpaKqebQII1RyBhOrZB4CohOG8Fy
	 t60/s+ezsWQ5w==
Date: Fri, 6 Dec 2024 16:35:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Ken Sloat <ksloat@cornersoftsolutions.com>
Cc: =?iso-8859-1?Q?Am=E9lie?= Delaunay <amelie.delaunay@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: dma: st-stm32-dmamux: Add description
 for dma-cell values
Message-ID: <20241206-placard-hesitate-626fd285dfe6@spud>
References: <20241206115018.1155149-1-ksloat@cornersoftsolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rLkrVVLioLF61Rl/"
Content-Disposition: inline
In-Reply-To: <20241206115018.1155149-1-ksloat@cornersoftsolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_083539_571588_0890EC3E 
X-CRM114-Status: GOOD (  12.28  )
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


--rLkrVVLioLF61Rl/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2024 at 06:50:18AM -0500, Ken Sloat wrote:
> The dma-cell values for the stm32-dmamux are used to craft the DMA spec
> for the actual controller. These values are currently undocumented
> leaving the user to reverse engineer the driver in order to determine
> their meaning. Add a basic description, while avoiding duplicating
> information by pointing the user to the associated DMA docs that
> describe the fields in depth.
>=20
> Signed-off-by: Ken Sloat <ksloat@cornersoftsolutions.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--rLkrVVLioLF61Rl/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ1Mn1QAKCRB4tDGHoIJi
0ufIAP9eSd/XJsTC82uOXaiS9+VsdB9msrVYPoh9A6R9d6eBIQD+Jz2f3eV4SOv7
heJ+59ODd2/vb4Rz4ypHMaY7cXXBFgg=
=7nq5
-----END PGP SIGNATURE-----

--rLkrVVLioLF61Rl/--

