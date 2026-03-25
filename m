Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08898FEC0F4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 01:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BV3XYgZxuT+5SsT9GcGm6w69EULEtAqJy0dkEnbZ10c=; b=ygqilz+iZRtCNtZ9Hgmn/l2/P6
	wGPGQ90X5YxeIKgFeQvJmHEf4wkJgkdKNsYq7M03WwLYZIOpHt80B98TWeN8FUn6Tj1E5DqFGdzPv
	UZerAlKO+8GkRp8N4DBthqrHnD2YZVEmsGbt7wDTccKvL6sJUjsJhufnZ8XHi1Uz0/rfGpZZNS1Eb
	wP0GKvZx0JmsmMO5LJPeIsJBmWFfl6VJsJky+S6BWdg1uPFCVo3tFzuvYXlR+KpHukWmw02XzvYC4
	XMc1DMfMZARcbHfjU5YUnW1WIETyGQ2A+wAJI/HvbAisPS+oCtNeK6Q2oWv9crrUMT5Yg6KM7G7Pz
	xXcWufbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Cf6-00000002Qqp-1f0w;
	Wed, 25 Mar 2026 01:03:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Cf4-00000002QqZ-2ufb;
	Wed, 25 Mar 2026 01:03:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CD7DA600AC;
	Wed, 25 Mar 2026 01:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD7EC19424;
	Wed, 25 Mar 2026 01:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774400633;
	bh=Ec30pFjGpNIPtSM6yzZYTFlRdMVgyF721FSkvUyNkaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LEqtVdKP4amwdek/+3Ktf7X09C5MDfeZBY0wiy5GoJTq1delYyze+d/0JQcLR05jb
	 ftJ3y4UM5R1aQeKdLwSIgqtf7h13I2is9hulQsIXxMe+wdbbcmCAbqjc4IAVBMcO8s
	 7y7rjcQuOH+4EnhKnvBp8WRWBld+JEGMNofJ4irYs6YKYWVbtjIgwTrLaOJlVG58Bb
	 nOGqS6+kdBcUJbohlt09G/7OMBNmdxziHmfk6mV+o7Ajy3hNaVHTfB8yBzzHcoX5/V
	 YR3+J5eoVji3IcQir4IbIVfCOGBiy7d6J9FTMRQQ+7nK0+boLNE22d+EhWItMVrsXb
	 PQAouLEGOKrWg==
Date: Tue, 24 Mar 2026 20:03:52 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jianhua Lin <jianhua.lin@mediatek.com>
Cc: krzk+dt@kernel.org, vince-wl.liu@mediatek.com,
	linux-mediatek@lists.infradead.org,
	angelogioacchino.delregno@collabora.com, nicolas@ndufresne.ca,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	mchehab@kernel.org, linux-kernel@vger.kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
	linux-media@vger.kernel.org, sirius.wang@mediatek.com,
	jh.hsu@mediatek.com
Subject: Re: [PATCH v4 2/3] dt-bindings: media: mediatek-jpeg-encoder: add
 MT8189 compatible string
Message-ID: <177440063161.2317367.2319748600784024525.robh@kernel.org>
References: <20260324095455.1437-1-jianhua.lin@mediatek.com>
 <20260324095455.1437-3-jianhua.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324095455.1437-3-jianhua.lin@mediatek.com>
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


On Tue, 24 Mar 2026 17:54:54 +0800, Jianhua Lin wrote:
> Add the compatible string for the JPEG encoder block found in the
> MediaTek MT8189 SoC.
> 
> Unlike some previous SoCs, the MT8189 JPEG encoder requires 34-bit IOVA
> address space support. Therefore, it is added as a standalone compatible
> string without falling back to the generic "mediatek,mtk-jpgenc" to
> ensure the driver applies the correct hardware-specific configurations.
> 
> Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
> ---
>  .../bindings/media/mediatek-jpeg-encoder.yaml | 20 ++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


