Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9BBC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 17:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBiRr8MyVCDx2IHSe1QbON+d3OAAkqPRo1XDBFOzGA4=; b=tvjp1G7dBzgvYJXpWkzsNYwplQ
	c74qN5P50Ae2sn/NWKJOfYN1WeTOrEi4dTMFT4YaIEOJcOz+nNIIZUbnvI7tM3DVFOUST6qvWtZht
	P9IgfQXnv/b+z0XTT6kEfGt/0RZspqh81HRLwyiHhzt/bcFPRoQi3d1qzt2MIKCJGEMfd1zzq5WZe
	UAg9LBd7QgR/kiCa3Q8pttfKQMqfsuEIg3SOq9GXDF+/Lh61Ps7GdL+RPbi3s7/YnzluHMwTUF+sV
	Sd+ZzBTyCLfDL6iaV32BB5Jgz0sVXbBlPD+vBjvCNQLoxxRpLha2uC2Ljbz8FrfvLQVenJwfeS3Bn
	dNiKj0Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRwwt-0000000Awj5-0Jpo;
	Wed, 18 Jun 2025 17:51:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRw3E-0000000AmS5-3QlD;
	Wed, 18 Jun 2025 16:54:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kBiRr8MyVCDx2IHSe1QbON+d3OAAkqPRo1XDBFOzGA4=; b=qJzppYB9CFgAYESThj+icS2K8L
	36qyLxGKKuXI2+iiUgpXEwv1KCC+28DRIkmBCjIfY+SWUtLP+XrwWJhavsXybM8l13aMzEmVgdpzt
	PtCNeiPJaOrMnOdx8IO4iaYZ+UogvWKkkE1UfFGOhb+qSza2sNyWqzBxrdo+bYw2y+GSp5o+M9bL4
	twrD5AKrvGb+9Hwd13JyuPhsZsUtsfBgiHZKIt7+Lv7BoZuKsiLVrKoECS+GCH5N3E4itdqpgBHum
	OnafgyY/sHF5LOjFXul3bpDfVbC3NyG3vEoTkY4kUZbVKPz4RJna0Hb6rIBGztB9Omwk8wS3GlUtM
	tEqBr3Mg==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRw39-00000004Cmn-2cFV;
	Wed, 18 Jun 2025 16:54:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750265645;
	bh=kBiRr8MyVCDx2IHSe1QbON+d3OAAkqPRo1XDBFOzGA4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=AJfsT/wk398JAIgFfr5V6YyaDGkK8LzNxoxZts9xXcxdB8Gy2wod6/9/NvZ/LzwH+
	 YhYF1FGUI6l/uuoiYVfR5uVLkigBmJFAnD7z1MVG0Ke0St9/ZOyxwe2TDZ0CR3cQXb
	 2c7H1Z5zmy5LfpuVQ6sSqSRGgoJyyzcTGCwUr5axQ66KkvD7xm/88GhocP8cKQNM5b
	 Huly3QLWcM5hsJ9Bp/6aknCsKYhf41oEn2SoSXXOkT3UnUERs+C2DdYBQ17ajjU+Se
	 tHABZWkj+HeMuMa20MkSqiC10pNLswp5hXlA6/Q8l2EAfnGCCYWtCu+iJB+z2wcgLw
	 FMxIs4rbA+w8Q==
Received: from [IPv6:2606:6d00:17:b699::5ac] (unknown [IPv6:2606:6d00:17:b699::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9C48D17E06BF;
	Wed, 18 Jun 2025 18:54:03 +0200 (CEST)
Message-ID: <2f63c39a3b9f16c47dfe7f62338ef17839d1b286.camel@collabora.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: iommu: verisilicon: Add binding for
 VSI IOMMU
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Conor Dooley <conor@kernel.org>, Benjamin Gaignard
	 <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
 	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, jgg@ziepe.ca, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, 	kernel@collabora.com
Date: Wed, 18 Jun 2025 12:54:01 -0400
In-Reply-To: <20250618-tighten-morphing-47953075b131@spud>
References: <20250618140923.97693-1-benjamin.gaignard@collabora.com>
	 <20250618140923.97693-3-benjamin.gaignard@collabora.com>
	 <20250618-tighten-morphing-47953075b131@spud>
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-H4420/eJuZI3vRrv3ALH"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_175411_861003_8F08CE3D 
X-CRM114-Status: GOOD (  23.44  )
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


--=-H4420/eJuZI3vRrv3ALH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 18 juin 2025 =C3=A0 16:55 +0100, Conor Dooley a =C3=A9crit=C2=
=A0:
> On Wed, Jun 18, 2025 at 04:09:11PM +0200, Benjamin Gaignard wrote:
> > Add a device tree binding for the Verisilicon (VSI) IOMMU.
> > This IOMMU sits in front of hardware encoder and decoder
> > blocks on SoCs using Verisilicon IP, such as the Rockchip RK3588.
> >=20
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > ---
> > changes in version 2:
> > - Add a compatible "rockchip,rk3588-av1-iommu"
> > - Fix clock-names in binding=20
> > - Remove "vsi_mmu" label in binding example.
> >=20
> > =C2=A0.../bindings/iommu/verisilicon,iommu.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
 | 72 +++++++++++++++++++
> > =C2=A01 file changed, 72 insertions(+)
> > =C2=A0create mode 100644 Documentation/devicetree/bindings/iommu/verisi=
licon,iommu.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/iommu/verisilicon,iommu.=
yaml
> > b/Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
> > new file mode 100644
> > index 000000000000..9ae4a45d76f4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
> > @@ -0,0 +1,72 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/iommu/verisilicon,iommu.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Verisilicon IOMMU
> > +
> > +maintainers:
> > +=C2=A0 - Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > +
> > +description: |+
> > +=C2=A0 A Versilicon iommu translates io virtual addresses to physical =
addresses for
> > +=C2=A0 its associated video decoder.
> > +
> > +properties:
> > +=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0 oneOf:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - verisilicon,i=
ommu
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - rockchip,rk35=
88-av1-iommu
>=20
> This isn't right. Firstly, the "oneOf: - enum" construct doesn't do
> anything. oneOf one item is just the item. Secondly this still allows
> verisilicon,iommu in isolation which is not okay. What you actually want
> here is
> items:
> =C2=A0 - const: a
> =C2=A0 - const: b
>=20
> Thirdly, Nicolas mentioned that the version of this iommu is 1.2.0,
> which I would like to see reflected in the compatible.

I believe just 1.2 will be sufficient, the last number is the build number,
the IP is interface is unchanged.

Nicolas


--=-H4420/eJuZI3vRrv3ALH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCaFLvKQAKCRBxUwItrAao
HEIBAJ4+fNWvctsbsGY2hG9WzLfQYcW51QCg2j4bOqlf9fdEsgEh4zPtrR8oLqc=
=SlrU
-----END PGP SIGNATURE-----

--=-H4420/eJuZI3vRrv3ALH--

