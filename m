Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E39D3ABF6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 20:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djMNGaQ/Qm8y7P2WAqMoUhR3bHcJfux22jLxPWnwt7g=; b=ppXIPTX8lOYTqVBhTWvuXm+pvE
	2Z22BUzz1cOQ97vog0gV6OZoS51OywzYNxRc+qIyj2pZMsd9PSQ2sfasuRLE4GX00NcaQc5UUyjhm
	Z9vrsUIWArzPrtwUDhOcuR46Qi+dqrAOGvDVq1eza00/LOnlbih79fA5bvd93adAm3GpZarmXPC4e
	qdY0h2ZrW0y9PTvBTFVLYbVw1DIlI8ATWkka1LS7fx+dG61a2IfzEQiG3G0yK9maMw0xVOrGvRlOW
	ESEgs9rYqvdEi6PRSSGYVXd/yclRSdM/wnYO2Vowq/O1EUqKn2Hn67WFtpbHLSz+M0ywseo0i2QQi
	y4aBGOCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbQy-00000001GDw-0SLp;
	Mon, 11 Nov 2024 20:54:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbBb-00000001DhM-1yyf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 20:39:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 71C3DA40928;
	Mon, 11 Nov 2024 20:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 081E6C4CECF;
	Mon, 11 Nov 2024 20:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731357538;
	bh=djMNGaQ/Qm8y7P2WAqMoUhR3bHcJfux22jLxPWnwt7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lMxx9aEDFsRHFU9J59SLZyiNT8kbHFDn7fUkPmcv9AhkrCy21K6Ioghb7rA7+FRJG
	 3npZalpf22upqrfkQAuAE/+a4jxllgKt0T4GgpqK6p2bpiwQk5cPtLukHIe6Tu9wTk
	 3CdG267m+CXrO5bMZMupxW8ZPo2YgVAy1QFxGbe79i3q+8tGIorvAJ93QrllqlBGUR
	 ioiMEmdRV4EBoPWPh4KmGdudLeB2dj9qpQDP16Oy1mQr/dqNNtiF9bVSx+91lybjzc
	 I5MZzZdkm10U7mdx6ncjxuVRsatijrnYFZoK2OWSwBK8rwv1m3tGgToF5bwIagQ5x5
	 x3IpULG3Or5hA==
Date: Mon, 11 Nov 2024 20:38:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 09/14] dt-bindings: usb: add A523 compatible string for
 EHCI and OCHI
Message-ID: <20241111-trace-pesticide-c305256d66c8@spud>
References: <20241111013033.22793-1-andre.przywara@arm.com>
 <20241111013033.22793-10-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aWiLqKPu1sC87/i7"
Content-Disposition: inline
In-Reply-To: <20241111013033.22793-10-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_123859_596437_623931BC 
X-CRM114-Status: GOOD (  10.44  )
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


--aWiLqKPu1sC87/i7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 01:30:28AM +0000, Andre Przywara wrote:
> The Allwinner A523/T527 feature generic EHCI and OHCI compatible USB-2.0
> host controllers (in addition to an MUSB and an XHCI controller).
>=20
> Add the new name to the list of supported compatible strings.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--aWiLqKPu1sC87/i7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzJrXQAKCRB4tDGHoIJi
0r1+AP9zPitmmB2ZMtnAQQceNFS4HjeZEEtBJfv++JTB1miWJAEAzRrSYoJ5fJw/
zDTa16sR58pG7oExAo6Z0iylP9g0MwE=
=FdHP
-----END PGP SIGNATURE-----

--aWiLqKPu1sC87/i7--

