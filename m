Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D76D3ABF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 20:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yNH9MUi4qYgXiGu/EuVAhoPFWjEADM5lRSlyLucnBBU=; b=TUiWL/JHzg1ot6UeWx72jY5jIK
	x7jv0idBomLa5TEo29mtHPcvgp8hhYWLm8ugImPXWmOC7aZIwv2ZPjLoPMBbJzdxfLnogeFvvKn11
	Jr7/UsHwb8GzYHGPrtybYpiQwiMBZiPsJ1ddDVpZ1tZh3Z7+ZZRkLw0ZNf1J3t3O2XVCAOkzp3d5O
	ctnEGGxdsj5aQ5kfL4Q3kVkjx8q01wtKJwhERhkwHXJslwmgLWwm3v1TBd6TSh4PdaAGKA4SVp2HL
	ihIDJ9qTLR3fhEIU8reqPovlysVbIoKQwS0xeJW35rpDhe92R80YBs77uxiaWG7BVneNoQ2L3cL4t
	WGjld09A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbB1-00000001DZj-1FCU;
	Mon, 11 Nov 2024 20:38:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAb6w-00000001CuI-35a8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 20:34:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7B333A40849;
	Mon, 11 Nov 2024 20:32:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 270A5C4CECF;
	Mon, 11 Nov 2024 20:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731357249;
	bh=yNH9MUi4qYgXiGu/EuVAhoPFWjEADM5lRSlyLucnBBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CgHTjlKkpDILfn6UqnjXHrvQrZG9RGKG+PLoaoe+90n2yszscZLzFgFmYzVzIRCAx
	 hqgDGpr98WHnW0Id6TFC7P5UV6lxofchF/Fi4/vRe/GJKESFAJDY5DsxR+hmgvCoSz
	 i4+dX8wXHpN/QZPlGQKMpL//1N5waBK/hAIr4wV+IC30y1jLEd5NDVIE+HO5MszH3I
	 CnGE4+AfsdxyXiEMFIpLRWParG7x6nQeFZCHfnb7Lr5FwSHGyqfcuexgB9mzlzff+S
	 chL3IZg2Bai4X5RUBYF/qCPvIM0zO6AFk1fm04JLjEtPKRGCxur06awrwSSKryWf8c
	 6LH6eMO6jHyUg==
Date: Mon, 11 Nov 2024 20:34:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 01/14] dt-bindings: mmc: sunxi: Simplify compatible
 string listing
Message-ID: <20241111-backyard-trilogy-689351a7b7c8@spud>
References: <20241111013033.22793-1-andre.przywara@arm.com>
 <20241111013033.22793-2-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bi9CJ9Ktd17cmVcT"
Content-Disposition: inline
In-Reply-To: <20241111013033.22793-2-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_123410_899575_12D0BBF1 
X-CRM114-Status: GOOD (  10.85  )
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


--bi9CJ9Ktd17cmVcT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 01:30:20AM +0000, Andre Przywara wrote:
> New Allwinner SoCs only occasionally update their MMC IP, leading to many
> pairs of compatible strings, though there are sometimes a number of them
> being compatible with one particular SoC.
>=20
> Collate the compatible string listing in the binding, to group those
> being compatible together. This makes the list more readable, and allows
> for easier addition of new SoC's MMC devices.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--bi9CJ9Ktd17cmVcT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzJqPAAKCRB4tDGHoIJi
0iHXAP9EcNoCqzLUGX5OQORzuun1EQHRd1pLIuOGCnT6MOyAEQD/Vg47EKqZS8A6
ACsoCxmUuDqebYVmgDM0dEE7bBKowgM=
=xb+W
-----END PGP SIGNATURE-----

--bi9CJ9Ktd17cmVcT--

