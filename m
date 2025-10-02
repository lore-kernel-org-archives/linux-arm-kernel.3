Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5ACDCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 09:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LgNwaq1cArlJw7VFexerMtqJ43NiNwuTGI7xunqGqG0=; b=dIsGSbNuvZQVUzXsLoEn6hd/sN
	Q6jM3Cf/et3YheXI4Vk6dDz5Kx1HuhPu8R05xF0zmIDPPcKxdV+sgBGa7LKs/KZi5LiTgecnbznd+
	McY8voUnRVN9AQNJsG52/g9o8UG73Brk2LxM6BRroEJaFTO3WTs2g/wVKCMtkSPoiATLiTQuuILlV
	SyndQsIPLfsmBCBZd2FpwvzMVUs3au0xPmoDllkonkfxAQztuM+5965/xHJF/zIov7V2k3pthIlGw
	/2vyXQk/o10wX11X12GhX1dIfbtXiGi8VYF9Z4Pbzi8clAe+qNwvIIuKz6DuR5iooqtVYvh2zyTvR
	8BVW2H+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Fry-0000000AAtL-2pe0;
	Thu, 02 Oct 2025 09:45:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Frw-0000000AAsg-3xT9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 09:45:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 588944401B;
	Thu,  2 Oct 2025 09:45:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 126F5C4CEF4;
	Thu,  2 Oct 2025 09:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759398300;
	bh=t93drVVKAotBUg+WKPJcU7hqKum1hFKWPlrIcqVBjdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NqUEdovp75uhgWzmgp6wTuN9Y9mvnhMNN2WaUeaQjNCPeMcB6XM6Ma9Gdx0azwuIE
	 xlqI6HZ3NeHVMtnGYQzwu1p0PAJ5RxbyEjHv+bXpHzgZ346/7LcMbVOEk4i/w3byg8
	 W1hCo3mx4xnarWqVkEYjx/RHsohU80NUUgE7/WPzNl38FKTah4ALnaRSpKywcPCblu
	 ivU8th9oludVPFDsuwqaVBJJhi8qLzRi8ca9L/00kEw2XoVaxAHCBUbur1YluydiP5
	 ngtgV2dya5fPZulwn97nOHYIu7usNTZyVmzE3/qTLE7GWkkvSay5xllmE7AUt4sGyk
	 krEKmorLDs0Iw==
Date: Thu, 2 Oct 2025 10:44:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-spi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Jun Guo <Jun.Guo@cixtech.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 2/2] arm64: dts: xilinx: add soc-specific spi
 compatibles for zynqmp/versal-net
Message-ID: <20251002-unloving-unrobed-b35543f729f2@spud>
References: <20251001-basics-grafting-a1a214ef65ac@spud>
 <20251001-cheesy-shucking-c55431bbcae3@spud>
 <101a83ba-cd2b-4080-aaa3-630652c33786@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5l2glOle2OF9pEWG"
Content-Disposition: inline
In-Reply-To: <101a83ba-cd2b-4080-aaa3-630652c33786@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_024501_005000_52C68AA8 
X-CRM114-Status: GOOD (  11.29  )
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


--5l2glOle2OF9pEWG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 02, 2025 at 08:06:47AM +0200, Michal Simek wrote:
> On 10/1/25 20:31, Conor Dooley wrote:
> >   arch/arm64/boot/dts/xilinx/versal-net.dtsi | 4 ++--
> >   arch/arm64/boot/dts/xilinx/zynqmp.dtsi     | 4 ++--
>=20
> Acked-by: Michal Simek <michal.simek@amd.com>
>=20
> Do you expect to go via SPI tree or via SOC tree?

Via SOC would be preferred, there's no functional change and I don't
think the dtbs_check warnings are worth doing something abnormal, as
long as what's in linux-next is clean.

--5l2glOle2OF9pEWG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaN5JlwAKCRB4tDGHoIJi
0h4RAP96k4tDLO0xTAF/l6ozGWzNdANIQavjstn7ipfFMnBx/AEA5qgye2Cic4lt
7ym3em2EmaVuzRaYJRWXVvj0m3vuPQU=
=KW56
-----END PGP SIGNATURE-----

--5l2glOle2OF9pEWG--

