Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83ACF54AD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 01:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ga59RPO7UoVbIvrxEty8mgMs3vZyOoOxAvjjLOxPXfQ=; b=xa0dUBnJfOhQkeBUf8RKdmbFGE
	MTmlf9tWV7QKLYcLc/5/XfzP0li0sE6s09v/IIC7iTGsESIM7pk7TO9T9vD8+Cf8PB5eywt/EK2Ig
	PJyMH5l/fZPEJ4L2PftF8cmSTkA3zQzh1GkGu6+gfpg57dzlcZtOhQuBOralpynMyT5UIyK6jCz2A
	DXKacqUGLF9wJggEeB8ez3gqEbS0CGeEZmqSmcqv6q9f0liRLynxiCwFs9lDjVCBhY8s9Vi0h7pLd
	A5R2dbXzGAMsWXsebmyzgOUjX59NX22PTZFxTM7Aia84oXDG5InEw5L5fW9fkCW9IZ4GBedwF48/f
	+p/Ieypg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5CeO-00000002QkO-1HDg;
	Wed, 25 Mar 2026 01:03:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5CeL-00000002Qjx-1WdF;
	Wed, 25 Mar 2026 01:03:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 491B444041;
	Wed, 25 Mar 2026 01:03:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F01C19424;
	Wed, 25 Mar 2026 01:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774400588;
	bh=BCqN1HRfQI85LJqzaOsF30o7yYh99FN5msanyn26A20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K+PpHdgRj8s5v+pumtM0rbqcsEvchYV+F/DJygRrU8X3g5na3v5U0nMGhsDjC4j3K
	 eXENBp569HPoBDcsd8FRCMQKptwcoV8UCY3DYKAP9GpiFoS1uw+NK9VbUcGk9Y2xMm
	 IbEOI1n6OFZl++zMOeRtw1EiPN4AdnbR0kl/69J5eMt3q0E1ILpYQ9sch66XJtgryk
	 jqod+byIm3aFtNwQR4HUEE2Dqd7/N9jjagKXkBDdp9/qluqB7yebM3alw1RMwBGKId
	 /tUJ0ikssc9/gH8WMYiFK9a4NMJXtxoLq20kPY8IwoqCgovnz27xFgccXoiQS0orX5
	 gNOsTrXQ26Jbg==
Date: Tue, 24 Mar 2026 20:03:07 -0500
From: Rob Herring <robh@kernel.org>
To: Jianhua Lin <jianhua.lin@mediatek.com>
Cc: nicolas@ndufresne.ca, mchehab@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	sirius.wang@mediatek.com, vince-wl.liu@mediatek.com,
	jh.hsu@mediatek.com
Subject: Re: [PATCH v4 1/3] dt-bindings: media: mediatek-jpeg-decoder: add
 MT8189 compatible string
Message-ID: <20260325010307.GA2309270-robh@kernel.org>
References: <20260324095455.1437-1-jianhua.lin@mediatek.com>
 <20260324095455.1437-2-jianhua.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324095455.1437-2-jianhua.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_180309_445852_2FC2277A 
X-CRM114-Status: GOOD (  15.87  )
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

On Tue, Mar 24, 2026 at 05:54:53PM +0800, Jianhua Lin wrote:
> Add the compatible string for the JPEG decoder block found in the
> MediaTek MT8189 SoC.
> 
> Compared to previous generation ICs, the MT8189 JPEG decoder requires
> 34-bit IOVA address space support and only needs a single clock
> ("jpgdec") instead of two. Therefore, it is added as a standalone
> compatible string without falling back to older SoCs.
> 
> Update the binding schema to include the new compatible string and add
> an `allOf` block with conditional checks. This enforces the single clock
> requirement for MT8189 while preserving the two-clock requirement
> ("jpgdec-smi", "jpgdec") for older SoCs.
> 
> Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
> ---
>  .../bindings/media/mediatek-jpeg-decoder.yaml | 39 ++++++++++++++++---
>  1 file changed, 34 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> index a4aacd3eb189..91c9b2a4687b 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> @@ -17,13 +17,14 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> -              - mediatek,mt8173-jpgdec
>                - mediatek,mt2701-jpgdec
> +              - mediatek,mt8173-jpgdec
>        - items:
>            - enum:
>                - mediatek,mt7623-jpgdec
>                - mediatek,mt8188-jpgdec
>            - const: mediatek,mt2701-jpgdec
> +      - const: mediatek,mt8189-jpgdec

This goes in the 1st oneOf entry along with 8173.

