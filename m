Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5CDC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 16:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHbx8D8WKN6+hpRNEmiKZwqpTFCaWvjmIP7bdWyOoLk=; b=4wwsEHKPADicjS0PZ+wRRVcxG5
	dTWHha/l4rDjcyWsKzm7bkafWw7/eeueEqdFa3lYOpwIbniZpq4YdQZ+64BUAEF1dnNzjUhQEFp2P
	lj/l2Q5QKAsJlQhYntanyGtsbN4apJGa9TXRMhN407agcFRz84Bsq9bBoZGijP+frQTIdxTYn8+sj
	8SqAE9mJl7QHjjnHSJy3uOzpLUbrAevRlOHcbf3ztnIXrWnKceTBiTlzpQ0Q2oiPcA8KImwrN+jxd
	an+IUlGEhd5++MKgpE6+T0W9+IWBqPyHB16SQVRQtg/OFxevHkqTaYvGE3U5f2iZ8onZvqUjrGO8b
	ZXRgXoqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thtT9-00000004aIL-2pj2;
	Tue, 11 Feb 2025 16:50:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thtAp-00000004WZ1-16Ql;
	Tue, 11 Feb 2025 16:31:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F223BA40905;
	Tue, 11 Feb 2025 16:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C19C4CEE6;
	Tue, 11 Feb 2025 16:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739291506;
	bh=WHbx8D8WKN6+hpRNEmiKZwqpTFCaWvjmIP7bdWyOoLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eu+SaWGtRx2DxB5TRikQIrRVEXZdtbv2SAdm+F7jzHTlPPFUw6eIa6qAab/DcbVh0
	 5y4R/ZqyyauUi5Yn6dlugqGJIFIIqfeAIOVylT0UUL9y9cBO/dxOPe5KW7bd2CJDiB
	 s+F6ti0cYo+quULaBGjEHbPRcN2vbH20R2retDttaaZb3B2S4XnXzmPq5ztWmkpiqi
	 kfKu9c9WlICgSEABeRo8IxZDS9Jq7WmKV2MBVDM53eMeMuvXyTyPNd03ZgfmynHHun
	 Of6jP+D8O2nWAkHK99qYzsIFxP+I9HsMmmji/XshKPXdCBoHw7aC6J0Z/UsxQffB9X
	 jJVTGBlbvFWqQ==
Date: Tue, 11 Feb 2025 16:31:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>, kernel@collabora.com,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: gpu: mali-bifrost: Add compatible
 for MT8370 SoC
Message-ID: <20250211-sculpture-kindly-f609a5bfdbd9@spud>
References: <20250211-mt8370-enable-gpu-v4-0-77deb7a75c23@collabora.com>
 <20250211-mt8370-enable-gpu-v4-1-77deb7a75c23@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NPhV4nCHfXvnVdVx"
Content-Disposition: inline
In-Reply-To: <20250211-mt8370-enable-gpu-v4-1-77deb7a75c23@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_083147_364698_EE0A7C95 
X-CRM114-Status: GOOD (  11.91  )
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


--NPhV4nCHfXvnVdVx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 03:13:08PM +0100, Louis-Alexis Eyraud wrote:
> Add a compatible for the MediaTek MT8370 SoC, with an
> integrated ARM Mali G57 MC2 GPU (Valhall-JM, dual core).
> None of the already existing SoC specific compatibles is usable as
> fallback, as those either do not match the number of cores (and number
> of power domains), or are for a different GPU architecture.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--NPhV4nCHfXvnVdVx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6t7bAAKCRB4tDGHoIJi
0i+cAQDYKv1HrAj7IGdLB1J2AnBE7+u3Pb19+VvVkXzP4xD9MQD9ECsECRTHxV1D
II/TJXxFDRi2ikkrxmF2acujkXxITgg=
=KP0z
-----END PGP SIGNATURE-----

--NPhV4nCHfXvnVdVx--

