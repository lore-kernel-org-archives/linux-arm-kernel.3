Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDECC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 13:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DxyaowQgCzB/RpxCJD4jTbjIkQc3JH4ApMNK9WmIFPg=; b=JLbZhmFlDnkmpDkGpETtMKR75o
	3hhM67pRfcAmlr2m9IzRqkshkpuBOV+FqIkAwcKIv535vpO2RnEzZ7Cqf4BF0NJF1xGMemP2XAErq
	AAk00JPJcHyvMnNT+qWbxaK8dceM3jUBM2MVkfKaZwWaY7QutQEdo4uhEppD7hilesXOqOgWZCwzc
	wevSg0hqa9ndS36tLYf4e22aykRnnBJlhVfMproV+fCOaeCvG37VoqSNwSFQ0J3YEGT9fzUp1hPcw
	YhJwDCQjDiep3A53R7ZAy1KqjbiMrBG/cW/NsP+2Br6WCkMAr6juW/GneaGRcCzeC2J3fUZnwqBbP
	6FyAKB4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqXgh-0000000EJjw-06wC;
	Fri, 07 Mar 2025 13:24:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqXf4-0000000EJZY-0ykW;
	Fri, 07 Mar 2025 13:22:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741353763;
	bh=nMdElkX27SYzjIYLE2Nq3THJhnIkeKxIRL8VmbGk6kM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UH30BZtwjumsTG+ymcK82JDw2TOztk6pPaFGRIpxdfLL1yrF5Rmrv9L+JIpB89d94
	 ka7coYAc8FoQpIRTFFbPiKgBC//VrsODHU+kGTJxpx9+Ng0X/71/Ny2kMGDpjBVY+0
	 ODUgWtfT8q1pjxowPX9FiTO3UPu+04ep7laZhiObugs3aPEkCrZr2FrZI6FDCHxv3g
	 BXWuwjjbT9K0PdGHnHZh131bbuZcUHc1yWlKt0ZMbXggm/q6uOk8W3E54qS4BZJvd6
	 mkdlKAI6qFkfL7sDjOm41FPFfpS7Qp7vgQzpDzA3oRd6sKGVbxDXyy2Ac0NupiiBG3
	 9Q96c+BviI4RQ==
Received: from notapiano (unknown [IPv6:2804:14c:1a9:53ee::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A168917E05C1;
	Fri,  7 Mar 2025 14:22:38 +0100 (CET)
Date: Fri, 7 Mar 2025 10:22:36 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, kernel@collabora.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 01/19] dt-bindings: mfd: mediatek: mt6397: Add accdet
 subnode
Message-ID: <cb2820d8-84e8-49ca-b497-1ea815679a3d@notapiano>
References: <20250305-mt6359-accdet-dts-v4-0-e5ffa5ee9991@collabora.com>
 <20250305-mt6359-accdet-dts-v4-1-e5ffa5ee9991@collabora.com>
 <20250306-certain-jasmine-mastiff-fd67ba@krzk-bin>
 <2fa6037d-b5e9-45b2-a5d5-dbc92fb3434b@notapiano>
 <0663e03e-e331-4a06-be95-ce8d9059ed6b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0663e03e-e331-4a06-be95-ce8d9059ed6b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_052246_424021_694BF043 
X-CRM114-Status: GOOD (  18.56  )
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

On Fri, Mar 07, 2025 at 08:11:26AM +0100, Krzysztof Kozlowski wrote:
> On 06/03/2025 13:19, Nícolas F. R. A. Prado wrote:
> >>>    It is interfaced to host controller using SPI interface by a proprietary hardware
> >>>    called PMIC wrapper or pwrap. MT6397/MT6323 PMIC is a child device of pwrap.
> >>> @@ -224,6 +225,30 @@ properties:
> >>>      description:
> >>>        Pin controller
> >>>  
> >>> +  accdet:
> >>> +    type: object
> >>> +    additionalProperties: false
> >>> +    description:
> >>> +      The Accessory Detection module found on the PMIC allows detecting audio
> >>> +      jack insertion and removal, as well as identifying the type of events
> >>> +      connected to the jack.
> >>> +
> >>> +    properties:
> >>> +      compatible:
> >>> +        const: mediatek,mt6359-accdet
> >>
> >> You just removed the other file, no folding happened here. Drop the
> >> accdet node and fold this into parent.
> > 
> > Sorry, I'm still not sure what you mean by folding here then. Right now the
> > accdet is a subnode of the PMIC. If you want me to remove the accdet node, where
> 
> Yes
> 
> > would its compatible and property go?
> 
> compatible: nowhere, because it is close to redundancy.
> 
> property: to the parent pmic node.
> 
>     pmic {
>         compatible = "mediatek,mt6359";
>         interrupt-controller;
>         #interrupt-cells = <2>;
> 
>         mediatek,hp-eint-high;
>     };

I'm not sure that's right. The ACCDET submodule does have some resources, IRQs,
that it registers in its mfd cell, see patch 2 of this series [1]. It also has
its own driver (sound/soc/codecs/mt6359-accdet.c) that probes based on this
compatible and handles those interrupts. Why would it not get its own node like
the other MFD cells?

[1] https://lore.kernel.org/all/20250305-mt6359-accdet-dts-v4-2-e5ffa5ee9991@collabora.com

Thanks,
Nícolas

