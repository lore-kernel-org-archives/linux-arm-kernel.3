Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED58E7BD91
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 11:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eqj4FbKcoPvYRri6Bpbh4qn/QiQgcN7mnJQdrIpMpew=; b=dGgLUj4j6LUWC8DPropk2Yb3zF
	pVU2Fs1csUdzOtw/0iqC5N4OxaSZu3SIz7Bel2U7lT7LZgnmRkI6WA2QnreKmGvYt+c47G5VAfnyf
	wt4xwuIf5zC8l21a5xtj3B9k+QIzzI7J9kKyIgWYtdc63O+7hvAR3WbOrcur4LMsElU7dgXrfOFsX
	Jtx8KCsDTkm82GE83npsYCCAhhuD+KgCDMSKjsNbCQK5kwGakP7MliM3qgjdCO9sqZXXWYcIjxY8n
	z7rR1n/NSKugcThUa66c9oVIfTDjWPX5LqUh9aw1jMMVz5imnIPMG6e1Wjx5VW5AMqTvqz6mNC//j
	f2myCv9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwUE-00000006Q21-1xkV;
	Mon, 16 Feb 2026 11:09:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwUC-00000006Q1N-00lt;
	Mon, 16 Feb 2026 11:09:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771240189;
	bh=7ietRFN+k+TRUno7TzNeMRtjx+kFVY2I1NkiqflKaCU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xi9XsN2XuP/NOMgD8xmsvfAskZ0p1oaCPQqEHR/XUh2U6uvr8WYr3P/QJ3POFiVTt
	 qlQtrr6HjRt5oMOTC2v6SinHAWSTZJ192NsUTms78LmXflEmCzPyUodjfwS5EbrXvH
	 QUJjBwYB1w9inrtcr/9dD7lR4lGGyAJw45NGVteuFX6IVd3Rztf1cmmXGAa8ifxF4b
	 Mlzje39Ida3WYAUnVsHS9qpHpAS3P3Y2D5msTIhA9/4JMrBSz699d30Nc4E3gdO6iL
	 jIiZFceBX4a8FOEvEiKIcVEEzdMwLfVbVvKytm2PYeeb6l3qWD/T2CzWdmzT9CZS1l
	 ebTKR4cERKeSg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AE9F317E12E9;
	Mon, 16 Feb 2026 12:09:48 +0100 (CET)
Message-ID: <02766a04-b777-4e8b-9908-7abfc4ba113c@collabora.com>
Date: Mon, 16 Feb 2026 12:09:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] gpu: drm: mediatek: ovl: add specific entry for
 mt8167
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jitao Shi
 <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
References: <cover.1771144723.git.l.scorcia@gmail.com>
 <b440a9c1972dedc4cfbf29a84366e635b0d7d984.1771144723.git.l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <b440a9c1972dedc4cfbf29a84366e635b0d7d984.1771144723.git.l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_030952_211654_1FD2E4B9 
X-CRM114-Status: GOOD (  13.29  )
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

Il 15/02/26 09:53, Luca Leonardo Scorcia ha scritto:
> From: Val Packett <val@packett.cool>
> 
> While this configuration is otherwise identical to mt8173, according
> to Android kernel sources, this SoC does need smi_id_en.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Okay, sure.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index e0236353d499..97a899e4bd99 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -671,6 +671,16 @@ static const struct mtk_disp_ovl_data mt2701_ovl_driver_data = {
>   	.num_formats = ARRAY_SIZE(mt8173_formats),
>   };
>   
> +static const struct mtk_disp_ovl_data mt8167_ovl_driver_data = {
> +	.addr = DISP_REG_OVL_ADDR_MT8173,
> +	.gmc_bits = 8,
> +	.layer_nr = 4,
> +	.fmt_rgb565_is_0 = true,
> +	.smi_id_en = true,
> +	.formats = mt8173_formats,
> +	.num_formats = ARRAY_SIZE(mt8173_formats),
> +};
> +
>   static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
>   	.addr = DISP_REG_OVL_ADDR_MT8173,
>   	.gmc_bits = 8,
> @@ -742,6 +752,8 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
>   static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
>   	{ .compatible = "mediatek,mt2701-disp-ovl",
>   	  .data = &mt2701_ovl_driver_data},
> +	{ .compatible = "mediatek,mt8167-disp-ovl",
> +	  .data = &mt8167_ovl_driver_data},
>   	{ .compatible = "mediatek,mt8173-disp-ovl",
>   	  .data = &mt8173_ovl_driver_data},
>   	{ .compatible = "mediatek,mt8183-disp-ovl",



