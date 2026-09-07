Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E5EC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 17:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YS2TdENoAkBSs68uAXBLssJx4TGpvPEoYo13GnkLfSw=; b=jop/RKWruSKGiRIEdEM7c8afsB
	fdgi+7snAP76N0KMxVX0bz4kIEPVyg4/6AT07cEiR0fUhc6AzLjXQie89N2tLfjmZ/SCC8TiWuWG0
	sZvOQ6V07naaRCO7rdRoWG3WjROStJZh4Sr7ELRp/ZxJfjb53Vdyp14JUKzu2YtCehF3ubitoMrC4
	AmJ/iO9NTG56meMTETBoUat2HWjdCofqGOo29eVo83xdgAnVCkxPGNY0J9YetR5gaGHXKzquLfv1/
	Zj/zGnU/j5bVPZj2bZVazpDZ2KgLJL6t2/PtBfGWtE2pJ1p8YrebzlZLMutSWYYk42uFXnOzkx+ZP
	IT9PQsQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3dFV-00000007VGv-18Sp;
	Mon, 07 Sep 2026 17:35:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3dFT-00000007VGb-4AsC;
	Mon, 07 Sep 2026 17:35:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A4AC601DE;
	Mon,  7 Sep 2026 17:35:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 185411F00A3A;
	Mon,  7 Sep 2026 17:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788802515;
	bh=YS2TdENoAkBSs68uAXBLssJx4TGpvPEoYo13GnkLfSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eqf9OZdOf7BNxrg1YEyyQKxpWYn74BKR3NjWLU0mTrZ3Jx3HvDUXmoM/b7U78X7rQ
	 R74O0RlSwnQQ37Ix3xz+pWDH2Yq15pQAa/7q6W7UZT3mwrR29uMQQVnmRcPpI46KoK
	 Egxqc7C61d3KJpfpWMi9JlDSuIGP1pYDMvb0UVftkKbhvFjBdUxttb61zkwiesYdia
	 niSbc8cSDdi/64syxlCEP6WGHndoPg/+8+lixW/WB/HaEqzoNd5Eydf2ZWE9BeZ2QE
	 vFSw8mP7mpoK0iL8pdQvNaAdeKE+LcW4MvVNOht9zazAYd3hIhLcE4wbcBBaVSATDm
	 fE+0YFuiCD9/A==
Date: Mon, 7 Sep 2026 18:35:11 +0100
From: Conor Dooley <conor@kernel.org>
To: HystericalDragons@proton.me
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	jensen <jensenhuang@friendlyarm.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi
 R28S
Message-ID: <20260907-skydiver-precise-a8166e576510@spud>
References: <20260905-r28s-upstream-v1-0-f68d5389269a@proton.me>
 <20260905-r28s-upstream-v1-1-f68d5389269a@proton.me>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TzDQ4robxPUrjxZB"
Content-Disposition: inline
In-Reply-To: <20260905-r28s-upstream-v1-1-f68d5389269a@proton.me>
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

--TzDQ4robxPUrjxZB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--TzDQ4robxPUrjxZB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCap71zwAKCRB4tDGHoIJi
0l3IAP9ldhaM0bKPJa+3pR2NXhPp8GBNkm5A4DzJj+I/8b2QEwD/RsOooxRq/Gtg
rDS+bDjKm/bt5Y+eOdqCqAI8j5UPngY=
=AxLq
-----END PGP SIGNATURE-----

--TzDQ4robxPUrjxZB--

