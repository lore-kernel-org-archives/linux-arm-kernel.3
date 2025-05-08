Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65E9C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 16:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EhxkiRkA/dJEtSpxpXcb2z+sFr0qOmbcUC4g8N7f23M=; b=q5sj2TpY+q1Ig1rNQ22e1GqzEO
	aM9DzcjhzoTZvX88tWC9DNrjiAUciuhyd+hR9Zx90S8I+QTttk9voSBkpOaRLmBrPYdS+RhT7iOrV
	86vvzR2USxil08lIlWRkVciZ3tbvUbynC7VNd36PqP8K44rOUaDQcnMnDB7mX7fwaPrJxf5XgGyll
	JZp6x5yIJ+DajsWzXE/19u2KZkxMr7O2gdhfU+MUJ8zoK7lODILFj4DHrNtzVex/dBekeohCI7gCf
	qbdOeF4kL3Jhmjr6ee/QNtLvCx4GGxeonhIUjeJQ6sXQg3sRgF95uQDndd1Z0Y5FOYmDEtjcjYL35
	Ks6D0wHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD43K-00000001HHZ-1xMM;
	Thu, 08 May 2025 16:24:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2w0-000000015Rq-2ToR;
	Thu, 08 May 2025 15:13:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CE2675C6386;
	Thu,  8 May 2025 15:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6C9C4CEE7;
	Thu,  8 May 2025 15:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746717195;
	bh=EhxkiRkA/dJEtSpxpXcb2z+sFr0qOmbcUC4g8N7f23M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PPnTA1WzHdkvw3r7TKb8RZmnQHLPevPj98fSJybVESgphcCs5vdEdMYDvV0n2wsMu
	 cp3Vj2s+yh9/nYGbgXg2Ah4JcqFdzuyz4j/mok+vr99SZBgPzBF6r5y3M7vDr8ZR/d
	 PIm4ISusC3AMaDZV2mU8IKyBPEK1bb93hQCaiFbwsSA5VtkJNSz3r1dboWivlpI+Mb
	 Fj8Z/7CcBpM9HCtOAuZWRjPexsrNlTowNm6LGRY8NFGQkrkVRTIjMnX9SWsojlvD1a
	 S9oqaLdT/oRaanQKDfYdq7kWOyE8Uo0Esx5kEgVF4RW2qxjTFGzvP1+VexU94yvABx
	 3NTKfGBSdfzgA==
Date: Thu, 8 May 2025 16:13:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: quentin.schulz@cherry.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH 5/6] dt-bindings: arm: rockchip: add PX30-PP1516 boards
 from Theobroma Systems
Message-ID: <20250508-wrongness-alone-0fa99ee91b2c@spud>
References: <20250508150955.1897702-1-heiko@sntech.de>
 <20250508150955.1897702-6-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RygXSkiMF273WoCd"
Content-Disposition: inline
In-Reply-To: <20250508150955.1897702-6-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_081316_668474_5DB535F9 
X-CRM114-Status: UNSURE (   9.26  )
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


--RygXSkiMF273WoCd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 08, 2025 at 05:09:54PM +0200, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
>=20
> PP1516 are Touchscreen devices built around the PX30 SoC and companion
> devices to PX30-Cobra, again with multiple display options.
>=20
> The devices feature an EMMC, OTG port and a 720x1280 display with a
> touchscreen and camera
>=20
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--RygXSkiMF273WoCd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBzKBwAKCRB4tDGHoIJi
0kVgAP9H0qZrqI/23SFHXMeBsME2dzsQGKGhc8nyBgN4GIPRzQD/SvRuXoEC0+lH
tnSDJUIDm/BnABVZNw7/2NFcdCInfgY=
=pPjZ
-----END PGP SIGNATURE-----

--RygXSkiMF273WoCd--

