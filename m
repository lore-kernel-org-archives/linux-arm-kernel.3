Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E12EC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 16:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7X2Q8vkZvMJYGv9ciX4cmhh08fK2Atxda6qD5FINaY=; b=Dog6U6LKboiCfpQkf//FHahp6I
	iLtVuGCgbVphoTM59j/2hKD1UMWnwdiYnhI0KVxW9iTs8uWoYcB8UrGsBIFECJcGbz1VUfjE30bhO
	FhmiOFLA12JEJyxXWRFm1B3kIe2K2M81PeM0TfrhpxyDUaN9ibD1AKE9/+ugfDPAGIBmhsfWOyVdh
	IsHQrthKF9CEPurk2bZq8fA5M//kz09igXfGpDKhAZpVgRJ2Z0fPQ14vn5omrfD74Ym+52NZ8bqj6
	1nEI6ehpZYyd2/BexpXC7AyFcakleW2X38Os8MiVSnYNFsMKPjqjxffsXtC4TIaiNrQS5zl1uzWjN
	JJE0T6Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFbMm-00000001FQr-1yUL;
	Thu, 15 May 2025 16:23:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFbGo-00000001EEK-3Kd9;
	Thu, 15 May 2025 16:17:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 89AA25C552F;
	Thu, 15 May 2025 16:15:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D39FC4CEE7;
	Thu, 15 May 2025 16:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747325837;
	bh=+7X2Q8vkZvMJYGv9ciX4cmhh08fK2Atxda6qD5FINaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ryqXIRZ8aIXBIsQZvIgxJPgFs1PncN+KvVDOmH+uoUHwdtEis7LKTx666Igqb9l2+
	 w1X27KWHDdIFCyQrq+463y+yUdygIWW57hYvVsGtpTLH9SfqD00bTQ+QoqxLVLjOAi
	 nF0KFM5qUzEBkTF1G9hTdIz9B9MyKrNrf4BqVhmtOgzJHC1hqLj69mViwj9Kg0nS+Z
	 YPdbnxJwADXSe5w0jxQygGJzwfP8crEIkwEgIh3m4JMn8a19IflzA6O6W5V2md6HFN
	 MtztHWOafakuUYJawrzRhTHqJv508PJLXBMzBuZ4PC9nD9ZMeGM3PJ4VSbcK9+G4v9
	 GA5OS5DGSlKmA==
Date: Thu, 15 May 2025 17:17:11 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Garmin Chang <garmin.chang@mediatek.com>,
	Friday Yang <friday.yang@mediatek.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: mediatek: Add #reset-cells
 property for MT8188
Message-ID: <20250515-deploy-wiring-5829acc3d82e@spud>
References: <20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com>
 <20250515-dtb-check-mt8188-v1-1-cda383cbeb4f@collabora.com>
 <20250515-playpen-dislodge-80245fb8b7a9@spud>
 <cbd170a3-cbfe-4b4f-a059-efe33fed0e5d@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RlwhVrUT8qkuHwJd"
Content-Disposition: inline
In-Reply-To: <cbd170a3-cbfe-4b4f-a059-efe33fed0e5d@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_091718_880044_FB4E511B 
X-CRM114-Status: GOOD (  19.70  )
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


--RlwhVrUT8qkuHwJd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 05:11:13PM +0200, AngeloGioacchino Del Regno wrote:
> Il 15/05/25 17:03, Conor Dooley ha scritto:
> > On Thu, May 15, 2025 at 03:31:43PM +0200, Julien Massot wrote:
> > > The '#reset-cells' property is required for some of the MT8188
> > > clock controllers, but not listed as a valid property.
> >=20
> > "required for some" but not marked required on those platforms.
> > Why not?
> >=20
>=20
> Yeah now that I read that for the third time, the wording is a bit incorr=
ect.
>=20
> It's not "required", some clock controllers do have reset controllers, bu=
t it
> is facultative to actually use the latter.

I don't think I've ever seen this word before.

> I'm not sure if the ones that do have reset controllers inside should hav=
e the
> #reset-cells property as required...
>=20
> Conor, what do you think?

If "required for some" in the OP was meant as "permitted for some",
change the wording to that and it is fine.

--RlwhVrUT8qkuHwJd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCYThwAKCRB4tDGHoIJi
0norAQDSFIsJjHNXBCFJoJMHtI6qdNl7hLx+3jLSQS7DWgzSaQEA6lRLOyGnQfXt
JBr7hEiXgg6X68diSAm5cGHvgBzY4Ag=
=g5hp
-----END PGP SIGNATURE-----

--RlwhVrUT8qkuHwJd--

