Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C720E65D3A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 09:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJISY0Qp3DpFT5vqFaWzyOjdEgvgZWYGz0dptffo+IU=; b=VxbLWCqYSSa3l3JAvgkjOAy+fp
	RKoCUx4JN5nmsf2laz5VkoShARnpEtjhsajXyN+rnPpSjUBH14qTbTUs9XVvjZPxn5xh60Nh28ej8
	EOwL4Rpc/wyNGtLNDxwHxRv7FLz76w4iiHeGnvxj3uA3Q9t4S85FmpDwtFhcefZK4ko0GrqDcoSZu
	2jFgNhJh5AWomztDTelanCKJM0pQA/5B1ipUCJQVfuctThowNGLRCIbee/DXLLT9tg4xwGAryWY+V
	k4Ge5VIP6Tz2D2GdycUmGVmS2gcKmMajG80w3C2N1px2V5p3uZTkaEEqn4hsP44b1vrALv2O9t4N+
	OsH5035A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPws-000000025uP-0jtm;
	Fri, 22 Nov 2024 09:27:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPqD-000000024Lw-0RzY;
	Fri, 22 Nov 2024 09:20:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C8FF75C59BC;
	Fri, 22 Nov 2024 09:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA2AFC4CECE;
	Fri, 22 Nov 2024 09:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732267240;
	bh=TJISY0Qp3DpFT5vqFaWzyOjdEgvgZWYGz0dptffo+IU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KME/Hl2eBbCHhY0v0AERmlO4znWAAU34qQDMEbCw7PhvXfSeVYbO+oQvKVDNyamM1
	 AVRD3oJbaJmD4nZeLB7Mkla6Ukzja/tclzHLbkaUA0XFukUx8LdeZBmofRrcOewkHS
	 jPWpjaAoMH38m00bAHypUBbGW8Vuhrl2l0vVEN+sxNt0yQ/locP9l2A/Sp2HfRLj/w
	 +cYS1MgwSrxkwVgrbDYAp/Fqk2S6Co4GEnEVBkFQ0Rw0u1wU3OIhxNjCE1DA1xVKwt
	 y3QwWIUapP4xaPxeHupKheer/zrNwfmKnKqxs6vk8lFeoVOJ50PavLMPXcczHpOMiT
	 YPgbER5kBZ1IQ==
Date: Fri, 22 Nov 2024 10:20:37 +0100
From: Maxime Ripard <mripard@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	ck.hu@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 7/7] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
Message-ID: <20241122-cobra-of-authentic-discourse-e2c5b6@houat>
References: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
 <20241120124512.134278-8-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="3dic3xjywnt7kqn4"
Content-Disposition: inline
In-Reply-To: <20241120124512.134278-8-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_012041_187761_D7E4B039 
X-CRM114-Status: GOOD (  11.00  )
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


--3dic3xjywnt7kqn4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 7/7] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
MIME-Version: 1.0

Hi,

On Wed, Nov 20, 2024 at 01:45:12PM +0100, AngeloGioacchino Del Regno wrote:
> Add support for the newer HDMI-TX (Encoder) v2 and DDC v2 IPs
> found in MediaTek's MT8195, MT8188 SoC and their variants, and
> including support for display modes up to 4k60 and for HDMI
> Audio, as per the HDMI 2.0 spec.
>=20
> HDCP and CEC functionalities are also supported by this hardware,
> but are not included in this commit.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Just a heads-up, you should really be using the new HDMI helpers, it'll
remove a lot of boilerplate and potential bugs.

Maxime

--3dic3xjywnt7kqn4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0BM5QAKCRAnX84Zoj2+
doq3AYCWl8KXP/adtoZQh37W4KQ0qJZyU0dQnXyzmC0rmSXysoIv/perb0JAwCnN
EmwWeE0BgIVw4QDM9RrCyqMR8CGn/NICh9ybOvi4UXzG1UZ/sFYYIoevlH2+U4+7
PHNpqZlw+g==
=Qlnv
-----END PGP SIGNATURE-----

--3dic3xjywnt7kqn4--

