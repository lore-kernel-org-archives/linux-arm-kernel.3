Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511A7C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 20:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gXcXnEEQKwt82BiQQRFOAUnBOg0OtnV4sbu1CPhfbtM=; b=KfK/cWuBlxngIv6g0boDph9Itv
	sAkFJO3GckRePLlIE4uBtGvg7V825oLNP0n4c0eEsj4HqF0kYs7+7QKOlAE2frVFJTeWNE/y038Oi
	adFvjIEJZq2MGl4ct2smIQKJikgjdKESVe2eyMLpHpkHFwYrtjPBoNFtabAPY+3IWHecmLRZ6+lL6
	XgXacfDGT7JkY1eT5HtoCt3OJ7BHmjl4WEIJKUfIjTAPRvpoSBYy/WbkmvBS7mCENK5GMBoTydATs
	eRKRRTcjUF6QjKYt1dqU+mZXL1OYsMtgqmn+yHjdCyQ9p2Ihy8i7GB7FeLGNY9elS+3Hegoe9uXls
	yg3V3+Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug8Al-0000000DEOy-0noV;
	Sun, 27 Jul 2025 20:40:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug866-0000000DDMb-23R4;
	Sun, 27 Jul 2025 20:35:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5BCD3A5473E;
	Sun, 27 Jul 2025 20:35:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFB62C4CEEB;
	Sun, 27 Jul 2025 20:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753648553;
	bh=aToYMpoxnweoMVQRODB1CfY6b8LZU7AvPLEabYZkP0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RGB7oZ2GguJv1ih1YwbsnR0rL0qWzypXINzoRKF3X/RHcmAvsd2h7MqRyHEpfcJ4S
	 AVw3vtOJU6gM6CTSxyQrOo5l2k/Qk8rPGvZ9yJ4i7gMp/tLjFrHY/xtU/1J9ir/S4I
	 tCSfHLPRtATZPvRrsRlQWfKnzNNte6ZLABbhbJ+G5BCUoGfFEVjTlHNI/rXI6FVCd0
	 flh+PSNFRwsNlLuCVgt8NVaPvdVngVtlsx3gyfjdwWc1b61Kb4ELAc3Ht6PDXzAQ4q
	 Sm7SHBMCOymbSD3JFHiXC+tv/FrOj8u/i5PQi9iYLvIfgeKupSxcw+Y3w3FCmPuqII
	 UAV0bUVg0AMAQ==
Date: Sun, 27 Jul 2025 15:35:52 -0500
From: Rob Herring <robh@kernel.org>
To: Jay Liu <jay.liu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>, CK Hu <ck.hu@mediatek.com>,
	Yongqiang Niu <yongqiang.niu@mediatek.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 5/7] dt-bindings: display: mediatek: ccorr: Add
 support for MT8196
Message-ID: <20250727203552.GA12324-robh@kernel.org>
References: <20250727071609.26037-1-jay.liu@mediatek.com>
 <20250727071609.26037-6-jay.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250727071609.26037-6-jay.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_133554_599389_3F3EBB7D 
X-CRM114-Status: GOOD (  14.72  )
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

On Sun, Jul 27, 2025 at 03:15:55PM +0800, Jay Liu wrote:
> Add a compatible string for the CCORR IP found in the MT8196 SoC.
> Each CCORR IP of this SoC is fully compatible with the ones found
> in MT8192.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Jay Liu <jay.liu@mediatek.com>
> Signed-off-by: 20220315152503 created <jay.liu@mediatek.com>

????

> ---
>  .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml     | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> index fca8e7bb0cbc..581003aa9b9c 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> @@ -32,6 +32,7 @@ properties:
>                - mediatek,mt8186-disp-ccorr
>                - mediatek,mt8188-disp-ccorr
>                - mediatek,mt8195-disp-ccorr
> +              - mediatek,mt8196-disp-ccorr
>            - const: mediatek,mt8192-disp-ccorr
>  
>    reg:
> -- 
> 2.46.0
> 

