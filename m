Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2936EC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 22:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=quVk5JjWgkRkZ11iWAF6diO/aBB5OEX8KIhW0ikR74U=; b=G1gdLcwlxRn+tNvls7B2KesQxK
	SxMlVabCP5d55u/zg+9EHghvD3Eiaa7KQ2A3kH3gJ+zjH1wewWNNGv3v8/+CEvWowpBmDKx1+4zXC
	9Qid2lRS5QGcYuoZ22AVIWmqydZiymrSy8+TC+EXOAtB0KMKtHI4efc1R7JxkGdvhp1oNqHaGMXdU
	zhQyNpnNCo5/DLEbns634VyTovcZpG8gVhANd0dBioEGlBxdcVh1r8dCdDLwwJ871oodvGuIjiX8X
	5Rumw61qYDiFsbPzDwXcIkP+YKDzwHB0791UBTHh1NekxXWfZLhAZCE/6a0QLbNylRYpB9sIa+i1/
	mLGJ6y0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq7N-0000000EjmE-33nM;
	Thu, 12 Jun 2025 22:09:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPkJM-0000000DsZ4-37TT;
	Thu, 12 Jun 2025 15:57:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 20F864A749;
	Thu, 12 Jun 2025 15:57:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9176C4CEEB;
	Thu, 12 Jun 2025 15:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749743872;
	bh=quVk5JjWgkRkZ11iWAF6diO/aBB5OEX8KIhW0ikR74U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lY5L++jNiGKZFHLvrIdSVlmT8ec/OoFT2VgLRb4kvmfn6z3ivgarmCRmHT225XG0H
	 +WVNP4PFdTkTu6uiu/RKlji7vceibTVZR4tHmMBybJxkWIgZkmGv4AZ8C2YcjfClB+
	 Qg2omQZxTJVZ7HSnojxqcxm7Oe+nNO8+B3ba95bX5CYNShBMjs9d+bn4120LG96AN5
	 ITpOGd+nY2CXLukS1ny3jbVxkRurvctoubsdfwmbURzjFAgsphG2HhDGPi5g3XgXdP
	 pkVDtXOXA2azY0TnyzjAMtxLkCgb37T/edvRcV7jc1G4JJ36pXKpHBWjQBnRk7Uqeh
	 BNcxyensoO5KA==
Date: Thu, 12 Jun 2025 16:57:46 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, qii.wang@mediatek.com,
	andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org, jirislaby@kernel.org,
	daniel.lezcano@linaro.org, tglx@linutronix.de,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH 3/3] dt-bindings: i2c: i2c-mt65xx: Add MediaTek
 MT8196/6991 compatibles
Message-ID: <20250612-create-bucktooth-0dea6929bed1@spud>
References: <20250611110800.458164-1-angelogioacchino.delregno@collabora.com>
 <20250611110800.458164-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6t7S44HeCwXqkkfW"
Content-Disposition: inline
In-Reply-To: <20250611110800.458164-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_085752_798053_6F83F776 
X-CRM114-Status: UNSURE (   9.63  )
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


--6t7S44HeCwXqkkfW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 01:08:00PM +0200, AngeloGioacchino Del Regno wrote:
> Add support for the MediaTek MT8196 Chromebook SoC and for its
> close relative, the MediaTek Dimensity 9400 MT6991 SoC.
>=20
> Those chips' multiple I2C controller instances are compatible with
> the ones found in the MT8188 SoC.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--6t7S44HeCwXqkkfW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEr4+gAKCRB4tDGHoIJi
0pOIAP9dL66U4toAAvm8pG50O/bEelGajn9QL/aWOT4gmCa1GgD/Wd7HHHH9Coio
pcRVjnIjZI3dQVcXsuqT+DvShe7jhwU=
=MOtr
-----END PGP SIGNATURE-----

--6t7S44HeCwXqkkfW--

