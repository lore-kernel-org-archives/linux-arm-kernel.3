Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A4CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 13:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tfGlVxdDMEF8ekVP37PfhXIwB0jjQao+AQW5Dp+nK3k=; b=KSTcVg2Rel0c7al6LRA7fLcPS7
	xktByer+ywSo0cgta243v39BWPEtT4MvipNANRrSg61IzXHsAMF1ZLc0DrMoIyBl2jgEE2gM6gIbm
	WuS4P8HEE4G/+aij/D0nKnkTn/cjcZqsYEiekwNYQkG4/8il0yQTmEXdgeQqIqbUgA3F8kn2NYRqR
	xy72BxqgDfxITUfSc8DPhZxz5xofk5oXz/KLoe8bVH87PPDO6B8BOMxpG2GvtoZnu2ssMbBy+bd1L
	Lwd4MGE/Ii2u6aCMBQuqut10OZwSTbU5G/1U1f3YVIh8b+o4mLVnSFUd4gdZ0pm3mkIvmsbiipbi6
	rMSgXUmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFX0-0000000FYKl-1rBX;
	Fri, 10 Jan 2025 13:58:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFSu-0000000FXTg-2d0I;
	Fri, 10 Jan 2025 13:54:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6AB9DA41F1A;
	Fri, 10 Jan 2025 13:52:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE1BC4CEE0;
	Fri, 10 Jan 2025 13:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736517259;
	bh=NBTIZIQ0O8n49LLcohw3ZpYmgZsM/wfukba/u1zNx2g=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=jrEHq1aYppMBXRT4k44Tx7XWe+sLU2aKhaiDX/HF1l+MTSrATFzayIePg7vLaDIT3
	 yW8Uu/cBxhuUynb7dl+6VsE9ZXzQ+6EQaKeuB3Bsn6NeSh3+1xXoOLgw+EBQSTT3N0
	 vNRQ+xiCX503ypXSFQTOVbtnE9e/9Aw/6vbkCObxtORB5VHXfAa5tAKwuE2ts+x6lI
	 fsQ3/L+Mj6v9QsRhjNprjqhdwKYe2WidYwaYjvQv/RXmhVEV/3kTdfUn91Anf/JJ7C
	 +huh9DYFOVdbk7VDJMJbXthDr1RanUSjT9xC4nr1SF97g4f57hDPgU0gKgSkU0AIbc
	 gmH3/3UDj2W4g==
Date: Fri, 10 Jan 2025 07:54:18 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: p.zabel@pengutronix.de, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-arm-kernel@lists.infradead.org, xiandong.wang@mediatek.com, 
 linux-mediatek@lists.infradead.org, singo.chang@mediatek.com, 
 chunkuang.hu@kernel.org, sirius.wang@mediatek.com, matthias.bgg@gmail.com, 
 treapking@chromium.org, angelogioacchino.delregno@collabora.com, 
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org, sunny.shen@mediatek.com, 
 jason-jh.lin@mediatek.com, nancy.lin@mediatek.com, 
 dri-devel@lists.freedesktop.org, fshao@chromium.org, conor+dt@kernel.org, 
 devicetree@vger.kernel.org
To: "paul-pl.chen" <paul-pl.chen@mediatek.com>
In-Reply-To: <20250110123835.2719824-6-paul-pl.chen@mediatek.com>
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
 <20250110123835.2719824-6-paul-pl.chen@mediatek.com>
Message-Id: <173651725426.2671695.7661340219497308695.robh@kernel.org>
Subject: Re: [PATCH 04/12] dt-bindings: display: mediatek: add BLENDER yaml
 for MT8196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_055420_730415_AE436864 
X-CRM114-Status: GOOD (  12.44  )
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


On Fri, 10 Jan 2025 20:34:00 +0800, paul-pl.chen wrote:
> From: "Paul-pl.Chen" <paul-pl.chen@mediatek.com>
> 
> Add mediatek,blender.yaml to support BLENDER for MT8196.
> 
> Signed-off-by: Paul-pl.Chen <paul-pl.chen@mediatek.com>
> ---
> The header used in examples:
> #include <dt-bindings/clock/mt8196-clk.h>
> is not upstreamed yet.
> It will be sent by related owner soon.
> ---
>  .../display/mediatek/mediatek,blender.yaml    | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,blender.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250110123835.2719824-6-paul-pl.chen@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


