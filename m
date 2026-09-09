Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F60AC79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 10:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zU/6Na4dqA0J2BYOCLRIkJqexaaO4GxOSZKrPedaYjk=; b=PZlyqi9KZOa1YpatNgNqFkAtdX
	ARMa2C7gnqAHJb5zyLhtpsRAiyeBI56IYo8/GjfPKxA4UBwnVKljd88fWG8mzMOIkA+6tPesua8M0
	ZrYyV/G+3T8Azs6WyvRUbW2o2OoT3KCVsNk3R8YAGwP0Nmk9w6OQVkLfS3LN1om6ZvDUaUUIRvwTd
	YQoAbaONAtYXKKMmJCJN81OJxKfJig277fVD4Izf4eASJueoXYBVPO0aarcDxG3Y6wvAcmK9eoAUu
	yJ9CBilvMYv5sqAMbSdyB8gBeP7YkTCM8P0MEPAHBzxUIfmt21FyfbuH654Z4WhgbNSmf6Z5RdzOC
	K9JFwLpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FoT-0000000BT9J-1OxN;
	Wed, 09 Sep 2026 10:45:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FoR-0000000BT8i-42LI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 10:45:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B6576020C;
	Wed,  9 Sep 2026 10:45:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016461F00A3A;
	Wed,  9 Sep 2026 10:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788950754;
	bh=zU/6Na4dqA0J2BYOCLRIkJqexaaO4GxOSZKrPedaYjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hIkjTtUO5cFe3pq3/3ludV47z1AdJSEyKwsTrj4d+cY669joSijwpJsaNSE/ONJTh
	 C+MoAhZmn2dceL8rxbzoNw4pbmFOZx9UmxiRM6+EUQifV+57wWqxfbPDiro9+fty8k
	 7uwjbtvdWfxEZflWsxJc+uor9byX8RlATyZa0tTh+E35jcRMdhFFvoXPawl5zqvYH2
	 JSciQvP3+DGEuTpKp8MJYY6u48f+hP85JJhr1hhSIg8zPhi3fqo6TSt632CCQWUM8r
	 Jt+Tm/t8ymVHtsD21LpcLyfW4CprpZ9XJj32QpBfEqtL9z1/Eb3WmDKeboygFxVIN7
	 1bzEOShfKSPVQ==
Date: Wed, 9 Sep 2026 11:45:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	Frank.Li@kernel.org, robin.murphy@arm.com,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/5] dt-bindings: dma: Add CIX Sky1 DMA-350 integration
Message-ID: <aqE42NzerAiD2U1E@squawk>
References: <20260907-retorted-unfasten-e985a6d4f26f@spud>
 <20260909060512.3524983-1-Jelly.Jia@cixtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iS2/TDiTYr3NoP2p"
Content-Disposition: inline
In-Reply-To: <20260909060512.3524983-1-Jelly.Jia@cixtech.com>
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

--iS2/TDiTYr3NoP2p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2026 at 02:05:12PM +0800, Jelly Jia wrote:
> Hi Conor,
>=20
> Thanks for the review.
>=20
> > I cannot really speak to whether this is a correct thing to do with a
> > dma-350, but it seems to me like something that should be resolved with
> > a device specific comaptible in the dma-350 node. Someone more familar
> > with the IP will have to comment on that.
>=20
> The wrapper is there to keep the platform integration bits (clocks,
> resets, interrupt routing) out of the generic driver: the arm-dma-350
> child stays plain so the existing driver binds to it unchanged. I don't
> know whether other dma350 integrations need the same resources, so I
> did not want to push them into the generic node.

Don't worry about this, given the limited extent of the wrapper driver,
at worst you will end up with a different probe function. The specific
compatible that you'll use will prevent the code relating to these
resources running on other platforms.

Thanks,
Conor.

>=20
> > However I would like to know how this impacts the existing dma-350 in he
> > sky1 devicetree.
>=20
> Patch 5 converts the existing FCH node to this form: the register window
> and the eight GIC interrupts are unchanged, the arm-dma-350 controller
> becomes the dma-controller@0 child, and the SCMI clock feeding the
> instance is added. The AUDSS instance is new. I'll describe this
> conversion in the patch 5 commit message in v2.
>=20
> Best regards,
> Jelly

--iS2/TDiTYr3NoP2p
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqE42AAKCRB4tDGHoIJi
0mo0AP4kPtLTFrpjSRLG2RYgU/IfafjOKjTpdvgvhwgA249n0AD/TYV6bJ1cMdC8
IDbJBAKvwxNQmda76KdU7osiKS364Q4=
=o2Gy
-----END PGP SIGNATURE-----

--iS2/TDiTYr3NoP2p--

