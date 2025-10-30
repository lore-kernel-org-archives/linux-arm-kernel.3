Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7EC7CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 18:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CyMqvVzmILxJbVYS3TwbJAWt9vwMiFU9moEhJwXvZoU=; b=zh12I8l4B9THnAz+Z5DhvlZryw
	7qs7MXOX+GTfbOJLZd+RnnjeUDQp1AsX4lj9Qo+tDwvDTcOjffbsnFtQwUDOtDUsBRsqtSWaILHKq
	BY7WyK2qcTx8lbyxmbjJregsyPm0iv89ObIPfXtL28D+WCunOOc5J7OmqOAgBbqFO1IIOR+tSvUFI
	HkkRu5W1WMBnxbaxs8bCO3wRBvXeqt13x9fJyCuK8wyixBdqE1Nv8D3uH0dL0QGnS7GI5EAar+PPS
	E3BGzN5TtdCtlOFPVsipGiARt2LruHr8o2vGyj/pxmQ4QIKdQE7Biy5O3rv/1bgym2JOaUl/N3h0a
	YMPFZ9JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEXS2-00000004cG1-3eJE;
	Thu, 30 Oct 2025 18:32:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEXS0-00000004cFR-0c33;
	Thu, 30 Oct 2025 18:32:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 14C9C409B9;
	Thu, 30 Oct 2025 18:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C0FCC4CEF8;
	Thu, 30 Oct 2025 18:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761849162;
	bh=CyMqvVzmILxJbVYS3TwbJAWt9vwMiFU9moEhJwXvZoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dChJkHGi9P0T/5JCYP6jMztthAdoYUB6mpdAM8dtp3GAzo0MLc3WKBwN9Z6Fuk6dU
	 JGx51adtuWLaIWm60DXn5JujV5qza2Ab8KQbzCGvIw4MGMYCSfmYwu0MWCb6YkfJKV
	 j/CW9bCrUam1iOCBIxLtDZlTPiBnwLABCp2B5g5nM29PUUWQpwAdHu7clPw6wGwWCB
	 wsufbohSRSjXhDpZz8e7V8KOaLbe6PiClajK1T1leU7RC9UIdwf++vr/aV4z2QmXhK
	 2V6OZBWMI5T0M3uxtOsX2oIG7j5i+RJmuvXh0V7uksjHDxeHY9/eDH51hwb+tsqlTr
	 tziFEGVj+RTpg==
Date: Thu, 30 Oct 2025 18:32:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: i2c: i2c-mt65xx: Add compatible for MT8189
 SoC
Message-ID: <20251030-profound-afloat-f3bd79b111d5@spud>
References: <20251030-mt8189-dt-bindings-i2c-v1-1-5b60914c6453@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="szHEQ6Sx+ZZv/65v"
Content-Disposition: inline
In-Reply-To: <20251030-mt8189-dt-bindings-i2c-v1-1-5b60914c6453@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_113244_202887_C9D047EC 
X-CRM114-Status: UNSURE (   9.36  )
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


--szHEQ6Sx+ZZv/65v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 08:56:29AM +0100, Louis-Alexis Eyraud wrote:
> Add compatible string for MT8189 SoC.
> Its multiple I2C controller instances are compatible with the ones
> found in the MT8188 SoC.
>=20
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

pw-bot: not-applicable
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--szHEQ6Sx+ZZv/65v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQOvRgAKCRB4tDGHoIJi
0l/dAP9QPRUrWv16mVU4Ly4FWBzgIeEhsVfpsE4qCySvMSQ1RAEAnbotESMjb6UY
LD7A78dpT+4iygPrnuzENkZIUiF2Nwk=
=U++K
-----END PGP SIGNATURE-----

--szHEQ6Sx+ZZv/65v--

