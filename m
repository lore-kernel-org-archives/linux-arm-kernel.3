Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD42C3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 08:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHkcxL3Y62ikM1d3qC7iYxA+tfz6ICk3Lt28MrW2oio=; b=bFt/0uSH0hLC642cKtWEBMom7W
	HMUcKFrbkphOEhah9KlhBR4YG9U3DrGSXwHtINKjOHu7OOTs+/qtXJAoietHNSXqTsCjYPEfN65Mm
	6mvBobfpaBrU5ZnpgtRzy2yuLbwkxNxypsp88OvCcI/dYbZ6EoNbB+iO9M9KzTf686c5gkqadoPSR
	6sVgF97p76G90J9HRIqSor0JqQjGDDmgM7EKquYVtUKDUDAlfRAV5lKjrYk4oa+DlCOScQYbMR7jo
	F59aLt2buay3Omt8uiAQ4aLC0uPucjw3pqJfr8lInslWIow0qIJRDJV6aaLDYjMV9DAEcpPgjgH5U
	6Ibx5StA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7cr-0000000EWbY-3l7L;
	Wed, 14 May 2025 08:38:05 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7Ez-0000000ESLz-366U;
	Wed, 14 May 2025 08:13:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747210404;
	bh=oHkcxL3Y62ikM1d3qC7iYxA+tfz6ICk3Lt28MrW2oio=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=fPNowCp8+2Wc5dg7WuiJqGnBVHm2WzyPKohjuS9pBe+MyFzvIeiAP2JxTCXhDftzG
	 Uk5t/2BxTzIzFnfGpJYpABQzb9fSO+Ml9b6mS6g/hywuGotXZATD25aUsJVk2JKnfq
	 JcvVX4akRf9oJAnBTwM/g2T3sKFMeztoFcy6PWrigwwUsabjn7zQaf+1xMLWp4Zp90
	 GEJB8wMRjYssM/BA+FaJ6/o8T8HY0lQ3g6czB1z3JNR744pb8BhAjfBQNfbZoQ0O/l
	 ZnSH7VW5I4CPw+Ta12jAsJlRvgt8iZcli5tKKi7Qb3UqTI3/8t086fa/r/zYE49qtj
	 gGEs0c9dDTboQ==
Received: from apertis-1.home (2a01cb0892F2d600c8f85Cf092D4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 36FE817E0FC3;
	Wed, 14 May 2025 10:13:23 +0200 (CEST)
Message-ID: <8cb04f202171821ceab379df78c4801f35443d77.camel@collabora.com>
Subject: Re: [PATCH 2/4] dt-bindings: iommu: mediatek: mt8195 Accept up to 5
 interrupts
From: Julien Massot <julien.massot@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski	 <krzk@kernel.org>, kernel@collabora.com, Sen Chu
 <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Macpaul Lin
 <macpaul.lin@mediatek.com>, Lee Jones	 <lee@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado"	 <nfraprado@collabora.com>, Hui
 Liu <hui.liu@mediatek.com>, Yong Wu	 <yong.wu@mediatek.com>, Joerg Roedel
 <joro@8bytes.org>, Will Deacon	 <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Tinghan Shen	 <tinghan.shen@mediatek.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, iommu@lists.linux.dev
Date: Wed, 14 May 2025 10:13:22 +0200
In-Reply-To: <ff8da58b-9e87-46d9-b4d2-4059ef05780d@collabora.com>
References: <20250505-mt8395-dtb-errors-v1-0-9c4714dcdcdb@collabora.com>
	 <20250505-mt8395-dtb-errors-v1-2-9c4714dcdcdb@collabora.com>
	 <baeae909-4d12-4cbd-a063-7ad165304b96@kernel.org>
	 <ff8da58b-9e87-46d9-b4d2-4059ef05780d@collabora.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_011325_918889_2CD6FEDD 
X-CRM114-Status: GOOD (  16.92  )
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

Hi Krzysztof, Angelo,

On Thu, 2025-05-08 at 10:34 +0200, AngeloGioacchino Del Regno wrote:
> Il 08/05/25 08:03, Krzysztof Kozlowski ha scritto:
> > On 05/05/2025 15:23, Julien Massot wrote:
> > >=20
> > > Fixes: 3b5838d1d82e3 ("arm64: dts: mt8195: Add iommu and smi nodes")
> > > Signed-off-by: Julien Massot <julien.massot@collabora.com>
> > > ---
> > > =C2=A0 Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml | =
3 ++-
> > > =C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.y=
aml
> > > b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> > > index 75750c64157c868725c087500ac81be4e282c829..035941c2db32170e9a69a=
5363d8c05ef767bb251
> > > 100644
> > > --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> > > +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> > > @@ -97,7 +97,8 @@ properties:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> > > =C2=A0=20
> > > =C2=A0=C2=A0=C2=A0 interrupts:
> > > -=C2=A0=C2=A0=C2=A0 maxItems: 1
> > > +=C2=A0=C2=A0=C2=A0 minItems: 1
> > > +=C2=A0=C2=A0=C2=A0 maxItems: 5
> > > =C2=A0=20
> > Every iommu or just some (as described in commit msg) can have 5
> > interrupts? Looks you miss here proper constraints per variant.
> >=20
> Technically, all of the IOMMUs can have more than one interrupt - but it'=
s not
> clear which one and why, as documentation is lacking.
>=20
> Let's restrict this discussion to MT8195 anyway, as it's the only one dec=
laring
> those 5 interrupts...
> ...all of the IOMMUs declare just one, and mediatek,mt8195-iommu-infra de=
clares 5.

Setting 5 interrupts will be restricted to mt8195 infra iommu in the v2.

Regards,
Julien

