Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4270DC02194
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 12:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7VznLV0JKpcCBTnFQ0aIXrE6/BQhUnAWkkIGKnBzIeY=; b=VXUSuuOp2lJ7xueIe2CXYgoheW
	8G3ONmQFjjt67DnIdUrcH2pGi7p9wJ+Jcbpi6WkkPOqBHqIgf4nO6egGkKM0H4+fgq4vjcZ2o1LvI
	vcfLGAn7FAb/iaN9bdtQ+yxDdXJxkDnDqJ81bttP/pekI1fMU35dtiUMcPreJvkcXjJDv/WjGsKBC
	P9UH8X4t9kal9GJ8VuwdTatC9E0pxWY9TM6F7YsmnPSbSir+uelfuukhOeMHwkyvKpMAIhBttnMLW
	KK2KXAeqY+/SFeweafCEysQVCW/yi4LqYBssFijAajyOzxmKPR+ATwdY6E+2idpeeRz51XV7lmc6l
	l098BU8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teCS3-0000000CH6C-2DSF;
	Sat, 01 Feb 2025 12:18:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teCQi-0000000CGuF-1loP;
	Sat, 01 Feb 2025 12:16:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E7E7CA40A7C;
	Sat,  1 Feb 2025 12:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AD52C4CED3;
	Sat,  1 Feb 2025 12:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738412215;
	bh=QnYD3OHN1APboHaaBk2QkON9NMRe/FRmrahjz9mSLTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qGTpMXaTPcE/N7GIot4YmqlRszV2+5nmFPfqmymkvCZCzVRFuFJeXNatfK3a7oelY
	 4LsqG7Xpf+ohyRG7DalllgjrJqg+l348HCzaDLx9Rgoq/WL0V3n0C9rDffEDaGD0RO
	 DLuU/vKZOq3Fn/NR28SDO79vLUqaafy+N+10rAemlh9nllJBNuU1Zg8ePq6odrN1pi
	 PSmYadC9ZMFXGf9v0+nW7Nlqtq/JcFBFFr0sDkygJRhNMbjLrvIhjD3sXAn0E754mk
	 GmyKrbuyE5fRat6M5G7zwU2jGTXAsKHFSmA0ELvHXDWDZZTVGv7GdU3unfa/vGjmO3
	 nX00SLuhl4Hbg==
Date: Sat, 1 Feb 2025 13:16:52 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: airoha: Add the pbus-csr node for
 EN7581 SoC
Message-ID: <Z54QtFIpX6a1eBm0@lore-desk>
References: <20250115-en7581-pcie-pbus-csr-v1-0-40d8fcb9360f@kernel.org>
 <20250115-en7581-pcie-pbus-csr-v1-1-40d8fcb9360f@kernel.org>
 <20250118-sturgeon-of-incredible-endeavor-73a815@krzk-bin>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xdV9V4QeKacnl1fi"
Content-Disposition: inline
In-Reply-To: <20250118-sturgeon-of-incredible-endeavor-73a815@krzk-bin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_041656_594205_7B8C41CF 
X-CRM114-Status: GOOD (  23.47  )
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


--xdV9V4QeKacnl1fi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, Jan 15, 2025 at 06:32:30PM +0100, Lorenzo Bianconi wrote:
> > This patch adds the pbus-csr document bindings for EN7581 SoC.
>=20
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/sub=
mitting-patches.rst#L95

ack, I will fix it in v2

>=20
> > The airoha pbus-csr block provides a configuration interface for the
> > PBUS controller used to detect if a given address is on PCIE0, PCIE1 or
> > PCIE2.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  .../bindings/arm/airoha,en7581-pbus-csr.yaml       | 41 ++++++++++++++=
++++++++
> >  1 file changed, 41 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/airoha,en7581-pbus-c=
sr.yaml b/Documentation/devicetree/bindings/arm/airoha,en7581-pbus-csr.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..80b237e195cd3607645efe3=
fda1eb6152134481c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/airoha,en7581-pbus-csr.yaml
> > @@ -0,0 +1,41 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/airoha,en7581-pbus-csr.yaml#
>=20
> arm is only top level bindings and ARM stuff. This is soc.

in this case we should create an airoha folder in
'Documentation/devicetree/bindings/soc', correct?

>=20
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Airoha Pbus CSR Controller for EN7581 SoC
> > +
> > +maintainers:
> > +  - Lorenzo Bianconi <lorenzo@kernel.org>
> > +
> > +description:
> > +  The airoha pbus-csr block provides a configuration interface for the=
 PBUS
> > +  controller used to detect if a given address is on PCIE0, PCIE1 or P=
CIE2.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - airoha,en7581-pbus-csr
>=20
> Does not fit standard syscon bindings?

I think standard syscon is fine. In this case we could drop this patch. Agr=
ee?

Regards,
Lorenzo

>=20
> Best regards,
> Krzysztof
>=20

--xdV9V4QeKacnl1fi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ54QtAAKCRA6cBh0uS2t
rGPKAP9AV9aNELAnQMAvN6T3ATp+1UdQqYNuozqYanheocrXTQEA3ANKLoaql0H9
KBX3Imbz0GhzL2vi2MiGUzicgh24HwU=
=Cqhn
-----END PGP SIGNATURE-----

--xdV9V4QeKacnl1fi--

