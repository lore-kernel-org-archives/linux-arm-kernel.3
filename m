Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD33AC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 16:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+q2AXnRLzK5aHvJtG93842Ok5qFRiN8TlO7/PVAyCI=; b=p9ejDC4/KX4dAnIgZ3AGhQVGJL
	QJqjvvFamCJCnXie/EfSkvHoloQ++iftYNsMzI9H6ZTuqMy40mk+g9NN12ktBmk9Mkhjj1dDgGxsI
	8Mjl6kNFvZqkimRWATZJEZfwmJXihwb6G2yIc+sK9l4WyXayObsw8qmZR5938e3RJipkDqoO6BbzP
	QZcjtNKb7h+8JB5PGGsa3YwFus+q99piF2TEZWdqt/180hijNj3EZjnfGOECo0hLY/hbTYKOj+MDa
	m2pfq9A/dV3ceUSU+o3pEPwOzJfZEM9LTQA2aNuVTTcABPFyWe6Vr7SAMMm6Esvdz7b9vsYqxXg7w
	3mOEXDbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk3P3-00000001871-07ED;
	Thu, 07 Aug 2025 16:23:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk3E8-000000015in-0grk;
	Thu, 07 Aug 2025 16:12:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 291DF43F58;
	Thu,  7 Aug 2025 16:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A474BC4CEEB;
	Thu,  7 Aug 2025 16:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754583143;
	bh=/+q2AXnRLzK5aHvJtG93842Ok5qFRiN8TlO7/PVAyCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U3T5VzEtIh+hNzmZhjgfrgodQNsfOY/3H5x63x+/3sbJqPd1WSWki9++FG90oi7Bz
	 Nzgdh+EB9lMSZvxDb95HUf37bGE3A2Wars+2ykplCTyGe44EtVP9lz8ndmfM4q6Dmg
	 GcHnb5qDCXPkiXdQCbPKu5B1LeNJR9f1NS0JsKNv+cz3KxGZ/7UtoNxrf0cLNGSiSi
	 /C1f886TtPDq1Mro5sfiYdONzTb36nYXx09rxibt5gIfXJhBUE4Jiz3ZEjepyM2AH8
	 Bne1INAwJeSK6PUvJAvYevY9VQGjf042XU0U5b0rybZSTyJF1woZ36HNZGvZpGDGfM
	 ixdrs684ITpiQ==
Date: Thu, 7 Aug 2025 17:12:17 +0100
From: Conor Dooley <conor@kernel.org>
To: zhengnan chen <zhengnan.chen@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 1/3] dt-bindings: mediatek: mt8189: Add bindings for MM &
 APU & INFRA IOMMU
Message-ID: <20250807-wreckage-lagoon-0751eb9c53e0@spud>
References: <20250807095756.11840-1-zhengnan.chen@mediatek.com>
 <20250807095756.11840-2-zhengnan.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XfGVipfyRV1J9smt"
Content-Disposition: inline
In-Reply-To: <20250807095756.11840-2-zhengnan.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_091224_224379_CB41F21B 
X-CRM114-Status: UNSURE (   9.52  )
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


--XfGVipfyRV1J9smt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2025 at 05:57:46PM +0800, zhengnan chen wrote:
> From: "zhengnan chen" <zhengnan.chen@mediatek.com>
>=20
> There are three iommu in total, namely MM_IOMMU, APU_IOMMU, INFRA_IOMMU,
> Add bindings for them.
>=20
> Signed-off-by: zhengnan chen <zhengnan.chen@mediatek.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--XfGVipfyRV1J9smt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJTQYQAKCRB4tDGHoIJi
0tXRAP9w3SZ+Wbqif+YI4QTQtgl2AqYaAYFFNJG3eEk/UF2fZwEAiE3AAdpOKChr
c7VmkXEwQgqn44SMpM3XoKEhlOX+pAE=
=2DLy
-----END PGP SIGNATURE-----

--XfGVipfyRV1J9smt--

