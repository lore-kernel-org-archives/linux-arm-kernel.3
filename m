Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E03D3ABF4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 21:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftDw5gj4OX0ZX2AWggS6ZGbu3W01ORpuvQpfE7Hwv6I=; b=z4JDhegrjMyUcXPeWTNvgD6mKd
	DpDAQ1uD5mtrTEmBebBgau+HMIZjMnkqNaoLa+5k8LpHxRXlnL14ySsBP20EXUKsPOrWSTf3nmVdD
	XzczcPfgf1xxYvXLmsL1L0gQoEwR87B39rps3mR6E1PgVTAVKZQsJci7YM0MDNBJDovevT2CasCRC
	rKuHpBz/nQIFoKDoYCbEAsFskT3XpZTmH+mtGRcwF/CGSy46jS3cYepmkstiGnjcnvLS3KrP+ZzQV
	0n4sRWHDetyaECix21x2qc6JOB6S4exC76unY6hDzcE/Hjd84hROADbJcEJhtq0zASwyTS2Q21yi5
	NKjYDtVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbWP-00000001Hdf-0RFY;
	Mon, 11 Nov 2024 21:00:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbCQ-00000001Dr2-1F3A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 20:39:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0E2B5A402AF;
	Mon, 11 Nov 2024 20:37:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9668C4CECF;
	Mon, 11 Nov 2024 20:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731357589;
	bh=ftDw5gj4OX0ZX2AWggS6ZGbu3W01ORpuvQpfE7Hwv6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QN881zKSy8AnevXU94HIdRkWlYDZ1ubm2eedwnzzcUzinFFF/CFsd7RiA5RUeVnjV
	 FGYB/eAc1wY8LIXwsO4h84ITzTbJS8dfAa+3ksQgjWZyTtgUMlw0EEHx9ofUqU8ruv
	 PK9kBZGae5+ufWhNGEPcSLJ28sVurdhz8nTw9F/FsGJrp2JFEEAeoRja0eRBH29KHV
	 pect20WQttAh0pJ9yE7clknWmGIIvSz7oB2m7QLf0uk7ODSNcudxD4htyWbIOnCb8U
	 J+/8wY1+NZXEuC62Agn6VtoDH9E75a24OPrAk4htmZfRQGsD79Xx9gNEoHUaDSvAYv
	 bnpRqKAJxq/Ww==
Date: Mon, 11 Nov 2024 20:39:44 +0000
From: Conor Dooley <conor@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/14] dt-bindings: arm: sunxi: Add Avaota A1 board
Message-ID: <20241111-unflawed-nativity-f5c25cb3889b@spud>
References: <20241111013033.22793-1-andre.przywara@arm.com>
 <20241111013033.22793-14-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FQrGi8tboct4VcBk"
Content-Disposition: inline
In-Reply-To: <20241111013033.22793-14-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_123950_414686_3ECB6A6F 
X-CRM114-Status: GOOD (  10.62  )
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


--FQrGi8tboct4VcBk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 01:30:32AM +0000, Andre Przywara wrote:
> The Avaota A1 is an Open Source hardware router board using the
> Allwinner T527 SoC.
>=20
> Add its compatible name to the list.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--FQrGi8tboct4VcBk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzJrkAAKCRB4tDGHoIJi
0gs0AQDcHH0lqvHvvyzDj2HN8e60RgpmVUImioduTNl3J/oMNwD9GfcJxYVrSAz0
k05tYZzb0T1k0tRsTAVWuIroTF3IbgU=
=DZjw
-----END PGP SIGNATURE-----

--FQrGi8tboct4VcBk--

