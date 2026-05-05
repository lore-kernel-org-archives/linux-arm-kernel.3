Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD1ECD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQus+btv25ras34bobUCWOVBVzfiLA69SAYN+cm89K8=; b=Kt0fa6OcksAriZzyeOXxZgkKY+
	Q7Pl+CKOM+MgF2MiEzrLno3GYToPFj5l9Eq+sHCSkrWt51tzJiYBTztVyGqgY17cYH5IUFYHD7mJB
	KqH85HAl0rfKxGf4xKC8hoDox7co4yFUsb3UJRDQidoEovps6SUJZxyfjK7HCOLgbXzDN0p282n5Z
	ErdKOXqBLtil7cq/r4NP9wCvFtawVCHJLZWgNMyAXJcJzanjEB4tRX7YrW0zC5Gh+XAYC1R0j/MxW
	PAug5is6N0E2R8MPO6FltnY/bQZNkAXzebEKKb3SKhkKUmiKVAAm+lRvBCFyzbe3j08Uy9KV0RgiL
	xuS1CVUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIq1-0000000GviX-3Xrj;
	Tue, 05 May 2026 16:41:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIpz-0000000GvhR-19yN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:41:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CDD8C41A30;
	Tue,  5 May 2026 16:41:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D3CC2BCF4;
	Tue,  5 May 2026 16:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777999294;
	bh=XQus+btv25ras34bobUCWOVBVzfiLA69SAYN+cm89K8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QSIaigtIAGZF9G9yk+DR8fsY+Iz9+EhhoNqTZB4I6P/pdgL9i7X7N8/f7pme1RNhI
	 rr22AmlX2mxaiaWWwSbpxkusE2Zd+xWBbd2zqhpkxq0ySVniiKc13ivjc6J2fODm9u
	 XkNbcTCM1WZV/mCDbHIRXM3aScWZAA5Rx+Y+hsf4A2/sf470xdwPMxZX5KzZg4UKrp
	 EJ34fC+zeY2+7El0XJ4VGg5D1ZFSIsZmpFsZFmBpJaoiSSxNRxCS97BwcXd5th7qoG
	 ogyjpMxlYeNE/H6EdMfE49C8fegNCrCCaY0sEYOKW54W5PooO4JdGE2xNGqiQc2SKK
	 6Xd2yNndYisxw==
Date: Tue, 5 May 2026 17:41:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Shenzhen Baijie
 Technology Co., Ltd.
Message-ID: <20260505-crucial-deepen-996f7a025510@spud>
References: <20260503191842.2736130-1-alexander.sverdlin@gmail.com>
 <20260503191842.2736130-2-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xpCcXftr8fukYDDS"
Content-Disposition: inline
In-Reply-To: <20260503191842.2736130-2-alexander.sverdlin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_094135_897638_E55075F5 
X-CRM114-Status: GOOD (  10.10  )
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


--xpCcXftr8fukYDDS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 03, 2026 at 09:18:36PM +0200, Alexander Sverdlin wrote:
> Shenzhen Baijie Technology Co., Ltd. focuses on R&D and production of
> embedded products as well as customization of embedded solutions.
>=20
> Link: https://szbaijie.com/
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--xpCcXftr8fukYDDS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafodugAKCRB4tDGHoIJi
0mK6AP46w4swwHaimdw+OKGuIcNCEYAhY/30IYVA9SUgHzExsQD/X57jj1pNcUYy
NM+us9A2zs7E7q5J4N/HoVQxBq1TjQY=
=vGw/
-----END PGP SIGNATURE-----

--xpCcXftr8fukYDDS--

