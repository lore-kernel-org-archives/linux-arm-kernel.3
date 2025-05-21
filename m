Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFE8C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 07:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cvG+k6bPpoOmtbVvF2CIXt7noTysWUU+ULQx0HyXOEA=; b=hP1A3Ziyl4xjQKSa3FykTUWyGb
	5/eGJ2qMjWOYucSStuK0OUBaFbdi9u5sIVFSKK3A+w7IXLy/MPxAAyPeyANd2rgKB85OanANmE2px
	Xo1no/WO+b0+li5271YujBDT5WrgUSe/vBzTAYQ1WDldmxd8wrGfN9oNMu0uZy+0KlofyMb7hOtah
	uKHDXiqPG9yz5gMq3oKqUY+Arqe/IZpfEdsFriaHwbbAhDyvPQ7QPTJ8lkv+g5I99FofK01ttkBH7
	73aYZQYuqjlM5b/VwGxPco2cAGw+6T6qvIyfaN5nTTeJWYuw3R3CypP5lm+0e1RfS95J+HhFL4etU
	tqD98ogw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHdiW-0000000F2pa-25as;
	Wed, 21 May 2025 07:18:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHdVa-0000000F0ir-25ZB;
	Wed, 21 May 2025 07:04:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3700F4360E;
	Wed, 21 May 2025 07:04:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D201C4CEEB;
	Wed, 21 May 2025 07:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747811098;
	bh=3WyxaI7kOIbqwbUBNGQKfpf2rboaU9CMQfWTBnce4gM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HX/Xe6teP17NbDLbbn6o4ACl9/mOPm4fZAiU5uUkw51WDT1RRPyogO2dqn8nd780B
	 gMneD4I9yN1G3DDNl38Osg9WOY5jwGnv7PiF3LPVyHNwruBJ8BlQZg62EVKqJVlgV5
	 7NQuYLY0L2VxUjjfYqIgGrWX2MEJ1/2Id+FFyE7zmtiEV0cnNcondaYGs3mn6DAJsT
	 CZ9LlmgFongU+ekVRBEu3ohhvVuKE9uKS9j64pfAuNM6NkiNdmoniundRoNUedZIt2
	 rjHeGSWgOLdJcKtHtUNaqKf+GKCSYO4p7fVb2iKjlRmAXmNLBRkJuBJ12d2nvzM2lP
	 iWK9waSnZVgLw==
Date: Wed, 21 May 2025 09:04:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 02/12] media: dt-bindings: mediatek,jpeg: Add
 mediatek, mt8196-jpgenc compatible
Message-ID: <20250521-handsome-primitive-goose-1cbbab@kuoka>
References: <20250521022322.27576-1-kyrie.wu@mediatek.com>
 <20250521022322.27576-3-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250521022322.27576-3-kyrie.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_000458_559633_36FCAA37 
X-CRM114-Status: GOOD (  12.12  )
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

On Wed, May 21, 2025 at 10:23:12AM GMT, Kyrie Wu wrote:
> Compared to the previous generation IC, the MT8196 uses SMMU
> instead of IOMMU and supports features such as dynamic voltage
> and frequency scaling. Therefore, add "mediatek,mt8196-jpgenc"
> compatible to the binding document.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
>  .../bindings/media/mediatek,mt8195-jpegenc.yaml           | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


