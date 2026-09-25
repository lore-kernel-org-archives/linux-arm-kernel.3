Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD029C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 13:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JcvwxJfj+wQCvTyKCuDmOvkUWIndsvAdclXPqwL6QjM=; b=lUQqUs5PMURsYrryveoqnNxh/J
	av7PZPvKqOJhoXwDPExBWiVvWPR7tlb2G77PfOHVRkQXq7MYfLDxxqqOGeZkgd5jqnmDBDMD1vzi4
	Zg7HRMoPMf9gq25PsoNa9PBG0psGqYsh92kX+7TsfO6NIxWRt075MVolYQi+CuW1tUip/NkcVqZU7
	6P/6gLIYn6mG3UJsjDit3SlgmLWrrxxRPHbEh2HYbff93Ooojgyi34lNN0SKFugl0MC6gw+cROpKg
	NY5Um/2XDI0L8UXcNnfUZ+mFiVofibfFvrF4aUT2gVyFCDMupPS8IlHUbgtkOXKlljsy41BhtC4Q1
	i/UWlXww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5v3-0000000DQAq-08vZ;
	Fri, 25 Sep 2026 13:24:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5v1-0000000DQAU-3NJT;
	Fri, 25 Sep 2026 13:24:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DAE660230;
	Fri, 25 Sep 2026 13:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF1A11F000FF;
	Fri, 25 Sep 2026 13:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790342690;
	bh=JcvwxJfj+wQCvTyKCuDmOvkUWIndsvAdclXPqwL6QjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GSoaOEXqNZo5+lFu4BWpMyM+JE4KVsAWFxigirREnjn9EsPKMGSXqy6zl+1JRw4dm
	 3U0v1lVUBRas/uYlViba9t+pwZ7GuOvS/CJJXOpFmu1sberKqQygJmySBYCf3ycyp4
	 WvXUDgAxGmgJLJYcldjLPV2k9kmJsPLnVrhrQE5Rgxx1pd1IXH2Ld4PbCi05X3sEMk
	 z7+1KJsjNpR9btN0PPFvJBbcDgR8JadJYt+p7Lus/nPk+0oR55RlDDn0uG8WYtWyj8
	 o6VxOCBheopmhNVFgCDB/Jgjw8GuX14GXG+SzVRHn/ShaPfg2sA9qGq8yuX3XzRRBd
	 tHA2EHtPG0A8A==
Date: Fri, 25 Sep 2026 15:24:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: display: mediatek: dpi: Add
 compatible for mt8167
Message-ID: <20260925-inventive-crystal-firefly-0deffe@quoll>
References: <20260921113914.779393-1-l.scorcia@gmail.com>
 <20260921113914.779393-2-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921113914.779393-2-l.scorcia@gmail.com>
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

On Mon, Sep 21, 2026 at 01:38:55PM +0200, Luca Leonardo Scorcia wrote:
> MediaTek mt8167 SoC has two Digital Parallel Interface (DPI) blocks,
> one can be routed to a DPI display while the other is wired to the HDMI
> block. They are not compatible with any other device, so add a new
> compatible to describe them in the device tree.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml       | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


