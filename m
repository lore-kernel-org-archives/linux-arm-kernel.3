Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE138C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 11:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJyJ7jyIeAMfkphkSNgQEG8wgYNfIHi+6aTP9xuWgv8=; b=XOc7mcXnkC2LVIRUUXr5n3Zm3B
	gC53h9pcwQx4eUjrxxzvRVsQUmpBkM695wmjxdnysluOxaCO79rXpEZPTGrX4YIFfwvc7rS9gdkcR
	xB0HdW3yMU7uKUqeGDPJrdFP4bWLGDc5P+Vpf23PR8PxU6F02NLlu9fg239fsubOlcFJi4/zTi8B8
	skM3scZPCnDhld6lDlxwKaWeCfDnSJ153bSHeGUaZcmuClw4FdoP77mGqNTnn5uK5kpF5IlsWdV00
	FARl15zf12hDM1UCn6V7U2Ct0qQdh9kVwaq9MlEX2tMGUsKPrDIcQ7FBZY17CNr3FdI/ZPWlxepUK
	lmhldn0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGp9-0000000BnqG-0xyD;
	Tue, 06 May 2025 11:50:59 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCF9S-0000000BVN0-3W4e;
	Tue, 06 May 2025 10:03:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746525829;
	bh=bJyJ7jyIeAMfkphkSNgQEG8wgYNfIHi+6aTP9xuWgv8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=EkpS9PDJ/Fh5iHdAM4qMNFDGXu/z7Y4zulpt9PekKugbvg3VZ8WDRGbRC0xh9cH0l
	 q3YBP51512gdwfgnKnbqw1XTN9XeeI1zU1F6NNitqWHFrwzeAJDpbgxsTSep5PccBh
	 PfPd2vWVkH749k/4LmdKmEdZqB6fefI5xFphAw9LzCxRvaQcSkeHXU6R7j2PGMHZUt
	 En6duHN3Sl7zcS94fCuXe1/4ddC91gp5rC7lQ9ABa9CzSOpDVFJFeIqiNZVAaTEejf
	 2ui1sci/X+Fisxkdz4DH751jEIBRLqcJDfgXtXkiGRFm5WDzfh2OxIAgAXegJiLqaP
	 WKpnPFPKFzWCA==
Received: from apertis-1.home (2a01cb0892f2D600c8F85cf092D4aF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2793117E088B;
	Tue,  6 May 2025 12:03:48 +0200 (CEST)
Message-ID: <2d3a8e55105526c999b490a2e92dd448c099faab.camel@collabora.com>
Subject: Re: [PATCH 2/4] dt-bindings: iommu: mediatek: mt8195 Accept up to 5
 interrupts
From: Julien Massot <julien.massot@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	kernel@collabora.com, Sen Chu <sen.chu@mediatek.com>, Sean Wang	
 <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones
	 <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado"	
 <nfraprado@collabora.com>, Hui Liu <hui.liu@mediatek.com>, Yong Wu	
 <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon	
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Tinghan Shen	
 <tinghan.shen@mediatek.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, iommu@lists.linux.dev
Date: Tue, 06 May 2025 12:03:47 +0200
In-Reply-To: <cb715936-3a44-4002-8d64-565f8d31820c@collabora.com>
References: <20250505-mt8395-dtb-errors-v1-0-9c4714dcdcdb@collabora.com>
	 <20250505-mt8395-dtb-errors-v1-2-9c4714dcdcdb@collabora.com>
	 <cb715936-3a44-4002-8d64-565f8d31820c@collabora.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_030351_023395_CE93E903 
X-CRM114-Status: GOOD (  14.06  )
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

Hi Angelo,

On Tue, 2025-05-06 at 10:34 +0200, AngeloGioacchino Del Regno wrote:
> Il 05/05/25 15:23, Julien Massot ha scritto:
> > Some Mediatek IOMMU can have up to five interrupts so increase
> > the 'maxItems' to 5.
> >=20
> > Fix the following dtb-check error:
> >=20
> > mediatek/mt8395-radxa-nio-12l.dtb: infra-iommu@10315000: interrupts:
> > [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 79=
9, 4, 0]] is too long
> >=20
> > Fixes: 3b5838d1d82e3 ("arm64: dts: mt8195: Add iommu and smi nodes")
> > Signed-off-by: Julien Massot <julien.massot@collabora.com>
> > ---
> > =C2=A0 Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml | 3 =
++-
> > =C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yam=
l
> > b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> > index 75750c64157c868725c087500ac81be4e282c829..035941c2db32170e9a69a53=
63d8c05ef767bb251 100644
> > --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> > +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> > @@ -97,7 +97,8 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0 interrupts:
> > -=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +=C2=A0=C2=A0=C2=A0 minItems: 1
>=20
> Isn't minItems already implicitly 1? :-)
>=20
> Looks not, from my understanding if 'minItems' is omitted then
dt-schema is setting it to 'maxItems'.
https://github.com/devicetree-org/dt-schema/blob/v2025.02/dtschema/fixups.p=
y#L129

And you will have an error for a one item interrupts:
Documentation/devicetree/bindings/iommu/mediatek,iommu.example.dtb: iommu@1=
0205000: interrupts: [[0,
139, 8]] is too short

Regards,
Julien

