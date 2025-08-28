Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3109CCA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 18:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDaqq8dNgAjqw8Urynd4ZHZ1ObaUUmBl/jazIJqboxM=; b=nvAfQdF47HestuOK9hloh9eMIY
	Q7LJajA8ttjNst/J1KgrNfwXAxxNflngnL387gIaHH0b9IjFKpR/kSHl9MiGWyRhziVikl3nLJwSS
	5mpHlP9GfnBgvulO6WEbps+nNh3AoeHOTLhPO1qgplpSiuQhWm8gAI0D+bhCHBw1n4T8fQdZrzn75
	k7/NcOlES07sFyDUPlslKWIx6/Pq7H4JBI76zu7sAdhCdHnqcj8eTmXCPSy8wMrwSCf7ule4JmCR5
	Ry+vVfaSPxsqehr+Gj1ZzFjx0IYk1zwstDfzqdGVzy3JJOO0MI5Mf+t5sU/jdcbHIY+jt7cwofu+I
	oEuWyOwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhWO-00000002oGo-3DYp;
	Thu, 28 Aug 2025 18:38:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urchw-00000001kMz-2KwD;
	Thu, 28 Aug 2025 13:30:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4000D434A7;
	Thu, 28 Aug 2025 13:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0467BC4CEEB;
	Thu, 28 Aug 2025 13:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756387827;
	bh=Pp+mUIl9DaMYLcizWDp98QlTF7nc4qrOwFHsc6v7+TQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=TwweZqITjVRYZRGj/vPSwPYU+UtXXfCd7962Xofky57MrVDYEefi6ytNHNM/1pMAr
	 gS91QN2ZgTy1WqjajoriR9lBkyVMZhy5B1qonweQHmhRxQJTCh4uINMC6WjdGy2h5G
	 yuQqN1G1TpGQwjg6Rj1krDl1hHHMBncEzOzu20RzOJJoQHvzZam5AERan/IwNloBsJ
	 DSORi/1S7rGER8QbPP7/KkrRLJ54G5t4n9iklDI9tLBfhW4nWkeMn0ShjrhvaIVM8t
	 ZWKB+pjIT2PBGMkhZ984seK9kn+1q8MfFSousLJm5EvZYwt2Te0Yy1hpX/aCn9V/l6
	 LSDmscGzpEqoA==
Date: Thu, 28 Aug 2025 08:30:26 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: xiandong.wang@mediatek.com, angelogioacchino.delregno@collabora.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 dri-devel@lists.freedesktop.org, p.zabel@pengutronix.de, 
 devicetree@vger.kernel.org, krzk+dt@kernel.org, sunny.shen@mediatek.com, 
 linux-arm-kernel@lists.infradead.org, singo.chang@mediatek.com, 
 linux-kernel@vger.kernel.org, chunkuang.hu@kernel.org, conor+dt@kernel.org, 
 linux-mediatek@lists.infradead.org, sirius.wang@mediatek.com, 
 jason-jh.lin@mediatek.com, matthias.bgg@gmail.com, nancy.lin@mediatek.com, 
 fshao@chromium.org, treapking@chromium.org
To: Paul Chen <paul-pl.chen@mediatek.com>
In-Reply-To: <20250828080855.3502514-4-paul-pl.chen@mediatek.com>
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
 <20250828080855.3502514-4-paul-pl.chen@mediatek.com>
Message-Id: <175638709894.1370676.14730988453056252892.robh@kernel.org>
Subject: Re: [PATCH v4 03/19] dt-bindings: display: mediatek: add EXDMA
 yaml for MT8196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_063028_615649_DA1C74D9 
X-CRM114-Status: GOOD (  12.40  )
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


On Thu, 28 Aug 2025 16:06:58 +0800, Paul Chen wrote:
> From: Paul-pl Chen <paul-pl.chen@mediatek.com>
> 
> Add mediatek,exdma.yaml to support EXDMA for MT8196.
> The MediaTek display overlap extended DMA engine, namely
> OVL_EXDMA or EXDMA, primarily functions as a DMA engine
> for reading data from DRAM with various DRAM footprints
> and data formats.
> 
> Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
> ---
>  .../bindings/dma/mediatek,exdma.yaml          | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/mediatek,exdma.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/mediatek,exdma.example.dtb: dma-controller@32850000 (mediatek,mt8196-exdma): 'mediatek,larb' is a required property
	from schema $id: http://devicetree.org/schemas/dma/mediatek,exdma.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250828080855.3502514-4-paul-pl.chen@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


