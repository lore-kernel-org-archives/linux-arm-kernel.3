Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6099C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 16:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8X65+RUP9ijQfOhLiXOSXvS9V0fxs4tYYcwm99KjsTQ=; b=YYxpymDr+DVZJmjBSWuFWP24PN
	BlwiPllprvqcQ3hY7b+PzxWkrDZb5eJ7vSJJegykuEDxQ/hnM96OZjQb9Sr+232P0krl8J4LvLG/B
	vUAdJWjWU6iDM1nmlu8ldsvxHNlfCfxf9T6ASuhL1EDzt5s8yWF/JRRgl67l3a5frVOZIur1cFNYA
	99qe3TNzHLrxW4QdOIZMX61/ElS2knjvzPehkewcKm7JIlkzamz1vhko79ahOXr7XN8A7VOVi9EwW
	O8eD77oLvkL8ienoxLcZljbJMWMptFv2JSXGrZVRZRbJjiNagsNy2G+inJh25GvH5Dn/TreZ6rAHh
	muBz/ztw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKftl-0000000G9Nx-1LrM;
	Thu, 29 May 2025 16:14:29 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKfZQ-0000000G7yG-06lA;
	Thu, 29 May 2025 15:53:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748534005;
	bh=gpaKs8nDRKUL3IKkyljnJJf6SvliLquwp0sCaRjiIX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JEVtj9sJaIntHKm0eT3W+hHGiFjw4FjMyaLlOju9jajYO4VeHMdi2Tjvg/lCgGXah
	 UThWegoLWpeqmmvUYgaj0+4ZpiajwGziCtU+Ufppe166JLv128Ol8yj7norkXV0sDk
	 nobDXMcUJhUvU/kecHYToukrJE2sjv4kggAYDA6Xy8HEVNXN3w6+URJMKtBmdLlwb4
	 HtIz+vFgWt0xRC+Dw6OT6jQEBSZIVE/e64UNVroO1fRgEPfRkKJwpf7BLZwwxTsreN
	 L2UUPx7hUJH+ewUXx/xNMA8S9hG5dkdeoovbhMVIG3Wab/34v4kMmWNoTsZYWe5Y/O
	 hUHvBhg40+MIQ==
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:9400:99d:464c:62e0:2118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 03B0B17E0415;
	Thu, 29 May 2025 17:53:20 +0200 (CEST)
Date: Thu, 29 May 2025 11:53:08 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hui Liu <hui.liu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, iommu@lists.linux.dev
Subject: Re: [PATCH v2 1/3] dt-bindings: mfd: mediatek: mt6397: Add
 #sound-dai-cells property
Message-ID: <cee1e8bc-f4b0-49b9-a67b-2f54382c3d8e@notapiano>
References: <20250514-mt8395-dtb-errors-v2-0-d67b9077c59a@collabora.com>
 <20250514-mt8395-dtb-errors-v2-1-d67b9077c59a@collabora.com>
 <20250522-independent-ginger-bullfrog-4552d1@kuoka>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250522-independent-ginger-bullfrog-4552d1@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_085328_239704_B9CDE8D7 
X-CRM114-Status: GOOD (  20.23  )
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

On Thu, May 22, 2025 at 09:52:07AM +0200, Krzysztof Kozlowski wrote:
> On Wed, May 14, 2025 at 10:19:56AM GMT, Julien Massot wrote:
> > The 'mt6359.dtsi' file already uses the '#sound-dai-cells' property.
> > Add the corresponding property to the binding to fix the following
> > dtb-check error:
> > 
> > mediatek/mt8395-radxa-nio-12l.dtb: pmic: '#sound-dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
> > from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
> 
> If this is a random drive-by, would be fine, but if that's your platform
> which you should know, then I expect this to be a real reason instead
> something which can easily be rejected with: what if DTS is wrong?
> 
> I could not find the ASoC driver for that compatible and quick glance to
> MFD shown me no usage of dai cells, so you need proper explanation here.
> 
> Especially, that there is a subnode audio-codec, so adding dai cells to
> the parent node feels just wrong. One is wrong - either subnode or
> parent is a codec.

The driver is sound/soc/codecs/mt6359.c, which defines 2 DAIs. It's currently
probed by the MFD through the driver name, hence the parent MFD device is the
one used to register the audio component.

The right fix would probably be to add the compatible both to the ASoC and the
MFD drivers, and then move the dai-cells to the sound subnode in DT.

Thanks,
Nícolas

