Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD702C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 17:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxYcUeEcM4f/WwaTldAjO3e7nkHtWW2voiysZRTuWyY=; b=kt3XasQFXva9mmMb8LoStKB7po
	aAdPQd4DG8Aiv6NjG8gh9R4e6snS8tNX2bC7TunvO3Jrrd1jHlve72YOj0lJTIZbPIHKptVw2xshD
	RfsN6LtK1Hgja/3edxD1NulFOalD1YRrRku6FowNW+2txnJpI8fTSat/effvUH8q36F29H9vOvOST
	8cotXBlNZiSV4tRfVE8+rLrLBYEpaN8lH0SU0l5Yc+zh1ehs0qnDcQq4H2WDuRM2iOfZdhIiOHLmQ
	rf/Q17B/6D0dYoCDsgpNd2xLiF+J9V0Hvcm9x3LHsADnhiYR51lji2C7IB6uTLOGBP3jQqwnwfXOo
	04JJMsGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taIEt-00000008VQO-1osX;
	Tue, 21 Jan 2025 17:40:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taICR-00000008V3u-0Dne;
	Tue, 21 Jan 2025 17:38:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C3240A41E7D;
	Tue, 21 Jan 2025 17:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C7DC4CEE8;
	Tue, 21 Jan 2025 17:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737481082;
	bh=qxYcUeEcM4f/WwaTldAjO3e7nkHtWW2voiysZRTuWyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BiqjL3468L/rV/VZWgzE7fFNVBAVmWixEgFEJuO/qHnWZz3k4gsJuoEJ5jKlM0Nmk
	 5Lh4CPGnLppqeV3VxmOw3KGIfUtAGyiaUy2LGc/L9bIgsEQjvaPOo85ytwGEvSLwcR
	 kMsroyU5/dJ7glmsEddr0q5Uiz5tiuNOT3Ux4lMkZT6/wjB8Pq/j+YtggxAFBPG2EA
	 e6IQrHuiwYm7m2dmkipd/v8DUVpyIro7xQtpkcMkd7zPuux5Y0AViGthL3U+axMgT9
	 +raz44MfTfWjRn2d8urRnVgfJ7oGhupX403TL+DzTLbZAEhhl68hpU0K3nJeR2IrU0
	 5Oqp8/mF5j5OA==
Date: Tue, 21 Jan 2025 17:37:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: ASoC: rockchip: Add compatible for
 RK3588 SPDIF
Message-ID: <20250121-spruce-lushness-28295dd0c1ed@spud>
References: <20250120-rk3588-spdif-v1-0-1415f5871dc7@gmail.com>
 <20250120-rk3588-spdif-v1-1-1415f5871dc7@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7Eg+/63bRy/+Kd9J"
Content-Disposition: inline
In-Reply-To: <20250120-rk3588-spdif-v1-1-1415f5871dc7@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_093803_156839_48213C96 
X-CRM114-Status: GOOD (  11.23  )
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


--7Eg+/63bRy/+Kd9J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2025 at 01:01:27PM +0400, Alexey Charkov wrote:
> Add a compatible string for SPDIF on RK3588, which is similar to the
> one on RK3568.
>=20
> Signed-off-by: Alexey Charkov <alchark@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--7Eg+/63bRy/+Kd9J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4/bdQAKCRB4tDGHoIJi
0v6dAQCdiL5ocP5h6iXJYNUPS5M6hVgkmbV3X0Xq5KqJOTTDFgD/WlsZAd3l0r8A
u92LxGktYcLWsvIVxY2tyw5bxiafAQ0=
=MnTB
-----END PGP SIGNATURE-----

--7Eg+/63bRy/+Kd9J--

