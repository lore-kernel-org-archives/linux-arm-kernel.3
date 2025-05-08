Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94517C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 15:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oOkN9eTtHAZMv8eJ38WFaxwihMyuyCmS4TLnJR5DMHA=; b=4516Jd90ahz19TWq/nyFK3Kc3Q
	EbxM8r0nSD4ZwxFHMg1Ynm/3AyXtf3aEi4OXFwxFQQuJH8bVW9cF9a+dgNRze5Bhz7A1E6hf4yrJV
	6PHvGwVm2pESE9x+xzGD1y1ecTGxT2TBFks9DtiTzUGKLclm70IAWfd1Ft2KHqLnS6ZEwOukWyxSP
	wsNCu9bJhiyMnW/REqBdMOetatS4dVRZ5Q1jNEumebTCwjhH0NknpxU1zxAw41bgJZAV6FV3BTKRz
	0Cnjd2rjBFli0rH6QrrWKBfvGmGWQnB/yZV7F9hPRdST4YkRCAYIY/OtehQXSTYjHiKYl1r3ydHsj
	Qbh5siqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD30w-000000016ZG-2sUD;
	Thu, 08 May 2025 15:18:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2QD-00000000xic-1s3H;
	Thu, 08 May 2025 14:40:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DD41D60008;
	Thu,  8 May 2025 14:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A055C4CEE7;
	Thu,  8 May 2025 14:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746715224;
	bh=oOkN9eTtHAZMv8eJ38WFaxwihMyuyCmS4TLnJR5DMHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mNa7OPnX0CNUOKdch145DwLMBBih3ivsZMalyTflGD5v8ZZ5mWZ0flgsPMyUIc5Oc
	 /KLeEBbJEsXmQhSA0u/zVVyAoyTtSiyrwrkBEuW87wpHz1edTx9IBUr2wgtQIpVO/j
	 bil1wqHIn4drBTAmODDg3iteAIacLy+1xKEqblmhms419aj4dOSvM4okY4oRj214JQ
	 Pe/QGWGevMKnUhigq5gMyamppHwr8HnRMNFddQMjilB6K5tAULGIjnR0nITYBYDqlT
	 8SQztnBdqDOwC3Iedicxyk/DF4PQaep72gI96JUu4YmLKItcZPAkid/+38+IeCXNry
	 TbJP3A7gdTTuQ==
Date: Thu, 8 May 2025 15:40:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>, Jonas Karlman <jonas@kwiboo.se>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: phy: rockchip: naneng-combphy: Add
 RK3528 variant
Message-ID: <20250508-subprime-maroon-e3563cf5e5b2@spud>
References: <20250508134332.14668-2-ziyao@disroot.org>
 <20250508134332.14668-4-ziyao@disroot.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bPcc+DbOY/gFaVyK"
Content-Disposition: inline
In-Reply-To: <20250508134332.14668-4-ziyao@disroot.org>
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


--bPcc+DbOY/gFaVyK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 08, 2025 at 01:43:30PM +0000, Yao Zi wrote:
> Rockchip RK3528 ships one naneng-combphy which operates in either PCIe
> or USB 3 mode. Document its compatible string.
>=20
> Signed-off-by: Yao Zi <ziyao@disroot.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--bPcc+DbOY/gFaVyK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBzCUgAKCRB4tDGHoIJi
0hLfAPwNSAKLDOq1qwBiOVlwMilxhkuD21shzglKBEL/f5NaYQEA2CiDGljsLFj3
OXBTVzoRp1PjafMIGQle3ENwjj3vyg8=
=kdEO
-----END PGP SIGNATURE-----

--bPcc+DbOY/gFaVyK--

