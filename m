Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DCCCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 16:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6NBNxVAl0pM/Z97FGX1zWkhWOJfEOIAJDIWWVsJep4=; b=EP1jT42gvm68wnfE75Lr+9O8ok
	j9L/Lotd5plJeifFbAwH3ILp5gouy13+GuuY5WQMVE5hp9OVhUAXbfAYuZUUbSNiwrG2TJUUPycnR
	/lricYr1oDHjqlNjgODRQVdG74lrbSbW2PeyrF/1WtTvUSBzhsl+v8rU6Eq9wzFIzTXcKBdjL5UOc
	VP1iisn1ey5APwS9XXv25PV6Hyr6/dNylt9qkoNyD9WDBJR+MXIuC+0StwlhSDj1p8i4O8QdaDUFA
	iM9aVWPBhKoXuhmr3ojD7bN9bXxsYwWtY8YeA5YUJqUHqwAU1r0Ph9iI7225xAAFA2BsXGOGQjEN1
	rGfv156w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQR9-0000000EN8J-3Wi4;
	Mon, 27 Oct 2025 16:51:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQR7-0000000EN7X-0Zdt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 16:51:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C612F4573A;
	Mon, 27 Oct 2025 16:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442F4C4CEFD;
	Mon, 27 Oct 2025 16:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761583872;
	bh=+Ikopio+4rlJHw3bTm9z1zPFxyYc7R5jz3S5E7zWu1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qSos1m45Q4MNAIOh/Vvw6zjJEh1YeBOtFms245ejWuHce0vaO/R8D0qeD+vnyQl+m
	 1S55l59YT91+h6PaTYdHlAqgbhZXXqavRmrKI3WUx4OXj47/MnFgUl8AFO692g7b3C
	 /Tz5hFSnOU/uLcYVC04UQCrsIcfdK3Us6RuYmwAlOXQTxiFbwAjIewiLFdrKW/X6MU
	 7HSxa+5QrUBm6/9kvCtuYJHTb6vZaU87nvNDF1Cs6e5n+vniSzFxjnaHaE5DyboR2h
	 Tav4+syDQepGb0xAzewPvwbAngfsGXRtDL+T+TfkkMHPhyWgM4PW9xrlRWqC4/IMRL
	 /uqFj/Ne2CXtA==
Date: Mon, 27 Oct 2025 16:51:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Melissa Wen <mwen@igalia.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Maxime Ripard <mripard@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>, kernel-dev@igalia.com,
	kernel-list@raspberrypi.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: broadcom: rpi: Switch to V3D firmware clock
Message-ID: <10a4ef77-0e70-4ef2-b1df-535b476d256d@sirena.org.uk>
References: <20251005113816.6721-1-wahrenst@gmx.net>
 <9ebda74e-e700-4fbe-bca5-382f92417a9c@sirena.org.uk>
 <a5e1e279-7e20-458d-a75f-787e0adbc9fe@gmx.net>
 <ad07546f-0c2d-4bc2-b794-755b892c7328@sirena.org.uk>
 <a016e7e1-09f7-4056-a855-6cfaa8d51962@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SEkriafkm8cMGXAM"
Content-Disposition: inline
In-Reply-To: <a016e7e1-09f7-4056-a855-6cfaa8d51962@gmx.net>
X-Cookie: How do I get HOME?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_095113_202350_C3A52273 
X-CRM114-Status: GOOD (  14.17  )
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


--SEkriafkm8cMGXAM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 27, 2025 at 05:43:21PM +0100, Stefan Wahren wrote:
> Am 27.10.25 um 13:07 schrieb Mark Brown:

> > No.  This is happening in mainline (was originally reported against
> > pending-fixes) so wasn't affected by all the module breakage, that was
> > separate.

> I think, i got confused because I was only able to reproduce this issue with
> the broken linux-next. So I was going for the wrong cause :-(

> Do you use arm64/defconfig as kernel config?

Yes, it's just plain defconfig.

> Is there a HDMI cable connected?

No, the boards only have ethernet, serial and power connected.

--SEkriafkm8cMGXAM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj/ovgACgkQJNaLcl1U
h9Bi8Af9HJF4gLivbPe/q4aY+lhdEokB01CfSAy4tyT8TEF7Y9/1p+4e4ziTcaps
scwoPjV2rcsUG6TeHSkrXMUzHcmIM8ISIettfZcAeDJpiEZCeMWtHVT3HCXyTUQI
wYL7sMkS23SZ8cLIU0HsQnKu1SkJen64bWHQy377buPjoty8vxjLwKn3u9d7+Db9
iRyCIu88KQktSP/KalViloulz+pN0bWPmcOBVAKZesGqtq18EdEFj8n8XQQ6U/SM
VqoV842V6MLwZzSm5ZJwizev4sbsF/1wkcGVpXDvTJQb8LZq2N9fQthlzFOFer+D
EWzz0pkWqYyS6cHmOoG8vTznqHJLuA==
=kK0M
-----END PGP SIGNATURE-----

--SEkriafkm8cMGXAM--

